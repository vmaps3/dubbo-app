package com.wangsong.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangsong.common.controller.BaseController;
import com.wangsong.system.service.LoginService;
import com.wangsong.system.service.UserService;



@Controller
public class LoginController  extends BaseController {
	
	
	@Autowired
	private LoginService loginService;
	
    @RequestMapping(value = "/index")
    @ResponseBody
    public Object index() {
    	return loginService.index();
    }

  
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Object loginPost(String username, String password) {
    	return loginService.loginPost(username,password);
    }

 
    

    @RequestMapping(value = "/logoutJSON")
    @ResponseBody
    public Object logoutJSON() {
    	return loginService.logoutJSON();
    }
    
    
    @RequestMapping(value = "/unauth")
    @ResponseBody
    public Object unauth() {
        return loginService.unauth();
    }
    
}
