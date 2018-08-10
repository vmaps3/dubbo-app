package com.wangsong.system.controller;

import com.wangsong.common.controller.BaseController;
import com.wangsong.common.model.CodeEnum;
import com.wangsong.common.model.Result;
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
public class LoginController extends BaseController implements ErrorController {

    private final static String ERROR_PATH = "/error";

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/index")
    @ResponseBody
    public Result index() {
        return new Result(CodeEnum.INDEX.getCode(), null);
    }

    @RequestMapping(value = "/login")
    @ResponseBody
    public Object loginPost(String username, String password) {
        return new Result(loginService.loginPost(username, password), null);
    }

    @RequestMapping(value = "/logoutJSON")
    @ResponseBody
    public Result logoutJSON() {
        loginService.logoutJSON();
        return new Result(CodeEnum.SUCCESS.getCode(), null);

    }

    @RequestMapping(value = ERROR_PATH)
    @ResponseBody
    public Object getStatus(HttpServletRequest request) {
        return new Result(loginService.getStatus(request), null);
    }

    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }

    @ExceptionHandler(value = UnauthorizedException.class)
    @ResponseBody
    public Result unauth() {
        return new Result(CodeEnum.UNAUTH.getCode(), null);
    }

    @ExceptionHandler(value = IllegalArgumentException.class)
    @ResponseBody
    public Result illegalArgumentException(IllegalArgumentException e) {
        return new Result(e.getMessage(), null);
    }

}
