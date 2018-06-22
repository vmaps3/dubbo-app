package com.wangsong.config;

import com.wangsong.system.model.Resources;
import com.wangsong.system.model.User;
import com.wangsong.system.service.SystemApiService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ShiroDbRealm extends AuthorizingRealm {

	@Autowired
	private SystemApiService systemApiService;

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		User user = systemApiService.findUserByUser(new User(null,token.getUsername(),null));
		// 认证缓存信息
		return new SimpleAuthenticationInfo(user.getId(), user.getPassword().toCharArray(), getName());
	}

	/**
	 * 
	 * Shiro权限认证
	 * 
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String shiroUser =(String) principals.getPrimaryPrincipal();
		List<Resources> roleList = systemApiService.findResourcesByResources(new Resources(shiroUser,null,null,null,"2",null));
		Set<String> urlSet = new HashSet<String>();
		for (Resources roleId : roleList) {
			urlSet.add(roleId.getUrl());
		}
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.addStringPermissions(urlSet);
		return info;
	}

}
