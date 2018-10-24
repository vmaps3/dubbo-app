package com.wangsong.system.controller;

import com.wangsong.common.controller.BaseController;
import com.wangsong.common.model.CodeEnum;
import com.wangsong.common.model.Result;
import com.wangsong.common.util.JWTUtil;
import com.wangsong.system.model.User;
import com.wangsong.system.service.LoginService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

@Api(value = "登录相关")
@Controller
@ControllerAdvice
public class LoginController extends BaseController implements ErrorController {

    private final static String ERROR_PATH = "/error";
    @Value("${shiro_redis_session}")
    private String shiro_redis_session;

    @Autowired
    private LoginService loginService;

    @ApiOperation(value = "默认页", httpMethod = "POST")
    @RequestMapping(value = "/index")
    @ResponseBody
    public Result index() {
        return new Result(CodeEnum.INDEX.getCode(), null);
    }

    @ApiOperation(value = "登录", httpMethod = "POST" )
    @RequestMapping(value = "/login")
    @ResponseBody
    public Result loginPost(@ModelAttribute User user) throws UnsupportedEncodingException {
        String str= JWTUtil.sign(user.getUsername(), DigestUtils.md5Hex(user.getPassword()),shiro_redis_session);
        return new Result(loginService.loginPost(str), str);
    }

    @ApiOperation(value = "退出", httpMethod = "POST")
    @RequestMapping(value = "/logoutJSON")
    @ResponseBody
    public Result logoutJSON() {
        loginService.logoutJSON();
        return new Result(CodeEnum.SUCCESS.getCode(), null);

    }

    @ApiOperation(value = "容器错误页", httpMethod = "POST")
    @RequestMapping(value = ERROR_PATH)
    @ResponseBody
    public Result getStatus(HttpServletRequest request) {
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
