package com.wangsong.system.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wangsong.common.controller.BaseController;
import com.wangsong.common.model.Page;
import com.wangsong.system.model.Dict;
import com.wangsong.system.service.DictService;

@Controller
@RequestMapping("/haha")
public class HahaController extends BaseController{
	
	
	@RequestMapping(value="/haha")
	@ResponseBody
	public Object haha(String username) {
		Map<String,Object> map=new HashMap<>();
		if("123123".equals(username)){
			map.put("key", "1");
		}else{
			map.put("key", "0");
		}
		return map;
	}
	
	@RequestMapping(value="/tozhuce")
	public String tozhuce() {
		
		return "system/haha/zhuce"; 
	}
	
	@RequestMapping(value="/zhuce")
	public String zhuce() {
		//ahahhaah
		return "redirect:http://127.0.0.1:8081/spring-app/haha/yewu.do"; 
	}
	
	@RequestMapping(value="/yewu")
	@ResponseBody
	public String yewu(HttpServletRequest httpServletRequest) {
		
		return "yewu"; 
	}
	
}
