package com.wangsong.activiti.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangsong.activiti.model.Leave;
import com.wangsong.activiti.service.ActivitiService;
import com.wangsong.activiti.service.LeaveService;
import com.wangsong.common.controller.BaseController;
import com.wangsong.common.util.UserUtil;
import com.wangsong.system.model.User;

/**
 * 字典controller
 * @author ty
 * @date 2015年1月13日
 */
@Controller
@RequestMapping("/activiti/leave")
public class LeaveController extends BaseController{
	
	@Autowired
	private LeaveService leaveService;
	@Autowired
	private ActivitiService workflowService;
	

	@RequestMapping(value = "/toAdd")
	public String createForm(Model model) {		
		return "activiti/leave/add";
	}

	@RequestMapping(value = "/add")
	@ResponseBody
	public String create(Leave leave, Model model) {
		leaveService.save(leave,(User)UserUtil.getUser());
		return "success";
	}
	
	@RequestMapping(value="/selectByPrimaryKey")
	@ResponseBody
	public Object selectByPrimaryKey(String id) {
		return leaveService.selectByPrimaryKey2(id);
	}
	
	@RequestMapping(value = "/toExamine")
	public String updateForm(String id,  String display,Model model) {
		model.addAttribute("businessKey",new Leave().getClass().getSimpleName()+"."+id);
		model.addAttribute("id",id);
		if(display.equals("yes")){
			return "activiti/leave/examine";
		}else{
			return "activiti/leave/history";
		}	
	}

	@RequestMapping(value = "/examine", method = RequestMethod.POST)
	@ResponseBody
	public String examine(@ModelAttribute @RequestBody Leave leave,Model model,String buttonValue,String message) {
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("message", buttonValue);
		variables.put("inputUser", ((User)UserUtil.getUser()).getId().toString());
		workflowService.complete(leave.getClass().getSimpleName(), leave.getId(),variables,message,(User)UserUtil.getUser());
		return "success";
	}
	
	@RequestMapping(value = "/toUpdate")
	public String update(String id,  String display,Model model) {
		model.addAttribute("businessKey",new Leave().getClass().getSimpleName()+"."+id);
		model.addAttribute("id",id);
		if(display.equals("yes")){
			return "activiti/leave/update";
		}else{
			return "activiti/leave/history";
		}
	
	}
	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public String update(Leave leave,Model model,String buttonValue,String message) {
		leaveService.updateByPrimaryKey(leave);
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("message", buttonValue);
		variables.put("inputUser", ((User)UserUtil.getUser()).getId().toString());
		workflowService.complete(leave.getClass().getSimpleName(), leave.getId(),variables,message,(User)UserUtil.getUser());
		return "success";
	}


	

}
