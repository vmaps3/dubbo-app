package com.wangsong.system.service.impl;


import com.wangsong.common.model.Result;
import com.wangsong.system.service.LoginService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;

@Service("loginService")
@Transactional
public class LoginServiceImpl implements LoginService{
	

	@Override
	public Result loginPost(String username, String password) {
		Subject user = SecurityUtils.getSubject();
    	UsernamePasswordToken token = new UsernamePasswordToken(username, DigestUtils.md5Hex(password).toCharArray());
        try {
            user.login(token);
        	return new Result("success",null);
        } catch (UnknownAccountException e) {
        	return new Result("1001",null);//账号不存在
        } catch (DisabledAccountException e) {
        	return new Result("1002",null);//账号未启用
        } catch (IncorrectCredentialsException e) {
        	return new Result("1003",null);//密码错误
        } catch (RuntimeException e) {
        	return new Result("1004",null);//未知错误,请联系管理员
        }
		
	}


	@Override
	public Result logoutJSON() {
		Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return new Result("success",null);
	}
	
	@Override
	public Result index() {
		return new Result("index",null);
	}


	@Override
	public Result unauth() {
		 return new Result("unauth",null);
	}


	@Override
	public Result getStatus(HttpServletRequest request) {
		return new Result(request.getAttribute("javax.servlet.error.status_code").toString(),null);
	}

}


