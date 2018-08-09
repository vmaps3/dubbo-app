package com.wangsong.system.controller;

import com.wangsong.common.controller.BaseController;
import com.wangsong.system.service.LoginService;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;


@Controller
@ControllerAdvice
public class LoginController extends BaseController implements ErrorController{
	
	private final static String ERROR_PATH = "/error";
	
	@Autowired
	private LoginService loginService;
  
    @RequestMapping(value = "/index")
    @ResponseBody
    public Object index() {
    	return loginService.index();
    }

    @RequestMapping(value = "/login")
    @ResponseBody
    public Object loginPost(String username, String password) {
    	return loginService.loginPost(username,password);
    }
    
    @RequestMapping(value = "/logoutJSON")
    @ResponseBody
    public Object logoutJSON() {
    	return loginService.logoutJSON();
    }
    
    @RequestMapping(value = ERROR_PATH)
    @ResponseBody
    public Object getStatus(HttpServletRequest request) {
        return  loginService.getStatus(request);
    }

    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }
    
    @ExceptionHandler(value = UnauthorizedException.class) 
	@ResponseBody
	public Object unauth()  { 
	   
	     return loginService.unauth(); 
	  } 
}
