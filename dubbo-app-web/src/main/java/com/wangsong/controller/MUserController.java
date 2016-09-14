package com.wangsong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.serializer.UUIDCodec;
import com.wangsong.model.MUser;
import com.wangsong.service.MUserServiceI;
import com.wangsong.service.MMessageServiceI;

@Controller
@RequestMapping("/muserController")
public class MUserController {
	@Autowired
	private MUserServiceI muserService;
	@Autowired
	private MMessageServiceI mmessageService;
	
	@Resource
	private RedisTemplate<String, String> redisTemplate;
	
	
	
	@RequestMapping(value="/listUser")
	public String listUser(HttpServletRequest request) {
		
		List <MUser> list = muserService.getAll();
		request.setAttribute("userlist", list);
		return "listUser";
	}
	
	@RequestMapping(value="/addUser")
	public String addUser(MUser muser) {
			
		String id = UUID.randomUUID().toString();
		muser.setId(id);
		muserService.insert(muser);
		return "redirect:/muserController/listUser.do";
	}
	
	@RequestMapping(value="/deleteUser")
	public String deleteUser(String id) {
		
		muserService.delete(id);
		return "redirect:/muserController/listUser.do";
	}
	
	@RequestMapping(value="/updateUserUI")
	public String updateUserUI(String id, HttpServletRequest request) {
		
		MUser muser = muserService.selectByPrimaryKey(id);
		request.setAttribute("user", muser);
		return "updateUser";
	}

	@RequestMapping(value="/updateUser")
	public String updateUser(MUser muser) {
		
		muserService.update(muser);
		return "redirect:/muserController/listUser.do";
	}
	
	@RequestMapping(value="/redisTest")
	@ResponseBody  
	public Map<String,Object> redisTest(MUser muser) {
		Map<String, Object> map=new HashMap<>();
		System.out.println("redis保存");
		redisTemplate.opsForValue().set("1", "1");
		System.out.println("redis查询"+redisTemplate.opsForValue().get("1"));
		System.out.println("redis删除");
		redisTemplate.delete("1");
		return map;
	}
	

	@RequestMapping(value="/activemq")
	@ResponseBody  
	public Map<String,Object> activemq(MUser muser) {
		Map<String, Object> map=new HashMap<>();
		muser.setName(UUID.randomUUID().toString());
		mmessageService.activemq(muser);
		return map;
	}
	
}
