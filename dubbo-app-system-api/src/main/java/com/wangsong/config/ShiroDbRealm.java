package com.wangsong.config;

import com.alibaba.dubbo.config.annotation.Reference;
import com.wangsong.common.model.JWTToken;
import com.wangsong.common.util.JWTUtil;
import com.wangsong.system.model.Resources;
import com.wangsong.system.model.User;
import com.wangsong.system.dubbo.SystemApiService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.io.UnsupportedEncodingException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ShiroDbRealm extends AuthorizingRealm {

	@Reference(check = false)
	private SystemApiService systemApiService;
	/**
	 * 大坑！，必须重写此方法，不然Shiro会报错
	 */
	@Override
	public boolean supports(AuthenticationToken token) {
		return token instanceof JWTToken;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		String token = (String) authcToken.getCredentials();
		// 解密获得username，用于和数据库进行对比
		String username = JWTUtil.getUsername(token);
		User user = systemApiService.findUserByUser(new User(null,username,null)).getData();
		try {
			if (!JWTUtil.verify(token, username, user.getPassword())) {
				throw new AuthenticationException("密码不对");
			}
		} catch (UnsupportedEncodingException e) {
			throw new AuthenticationException("密码不对");
		}
		// 认证缓存信息
		return new SimpleAuthenticationInfo(user.getId(), token, getName());
	}

	/**
	 * 
	 * Shiro权限认证
	 * 
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String shiroUser =(String)principals.getPrimaryPrincipal();
		List<Resources> roleList = systemApiService.findResourcesByResources(new Resources(shiroUser,null,null,null,"2",null)).getData();
		Set<String> urlSet = new HashSet<String>();
		for (Resources roleId : roleList) {
			urlSet.add(roleId.getUrl());
		}
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.addStringPermissions(urlSet);
		return info;
	}

}
