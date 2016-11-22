package com.wangsong.system.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangsong.common.controller.BaseController;
import com.wangsong.system.service.UserService;



@Controller
public class LoginController  extends BaseController {
	
	
	
	@RequestMapping(value = "/")
    public String index() {
        return "index";
    }

  
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
      
        if (SecurityUtils.getSubject().isAuthenticated()) {
            return "redirect:/";
        }
        return "login";
    }

  
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Object loginPost(String username, String password) {
    	Subject user = SecurityUtils.getSubject();
    	UsernamePasswordToken token = new UsernamePasswordToken(username, DigestUtils.md5Hex(password).toCharArray());
    	Map<String, Object>	map=new HashMap<>();
        try {
            user.login(token);
        } catch (UnknownAccountException e) {
        	e.printStackTrace();
        	map.put("msg", "账号不存在");
        } catch (DisabledAccountException e) {
        	e.printStackTrace();
        	map.put("msg", "账号未启用");
        } catch (IncorrectCredentialsException e) {
        	e.printStackTrace();
        	map.put("msg", "密码错误");
        } catch (RuntimeException e) {
        	e.printStackTrace();
        	map.put("msg", "未知错误,请联系管理员");
        }
        return map;
    }

    @RequestMapping(value = "/logout")
    public String logout() {
    	Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "login";
    }
}
