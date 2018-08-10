package com.wangsong.system.service.impl;


import com.wangsong.common.model.CodeEnum;
import com.wangsong.system.service.LoginService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service("loginService")
public class LoginServiceImpl implements LoginService {


    @Override
    public String loginPost(String username, String password) {
        Subject user = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, DigestUtils.md5Hex(password).toCharArray());
        try {
            user.login(token);
            return CodeEnum.SUCCESS.getCode();
        } catch (RuntimeException e) {
            return CodeEnum.LOGIN_EXCEPTION.getCode();//未知错误,请联系管理员
        }

    }


    @Override
    public void logoutJSON() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
    }

    @Override
    public String getStatus(HttpServletRequest request) {
        return request.getAttribute("javax.servlet.error.status_code").toString();
    }

}


