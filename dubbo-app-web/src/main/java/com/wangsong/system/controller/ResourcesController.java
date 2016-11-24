package com.wangsong.system.controller;



import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wangsong.common.controller.BaseController;
import com.wangsong.common.util.UserUtil;
import com.wangsong.system.model.Resources;
import com.wangsong.system.model.User;
import com.wangsong.system.service.ResourcesService;



@Controller
@RequestMapping("/system/resources")
public class ResourcesController extends BaseController {
	@Autowired
	private ResourcesService resourcesService;
	
	@RequestMapping(value="/toList")
	public String toList() {
		return "system/resources/list";
	}
	
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd(String pid) {
		ModelAndView mav= new ModelAndView("system/resources/add");
		mav.addObject("pid", pid);
		return mav;
	}
	
	@RequiresPermissions("/system/resources/add")
	@RequestMapping(value="/add")
	@ResponseBody
	public Object add(Resources resources) {
			
		Map<String, Object>	map=new HashMap<>();
		resourcesService.insert(resources);
		return map;
	}
	
	@RequiresPermissions("/system/resources/delete")
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(String[] id) {
		Map<String, Object>	map=new HashMap<>();
		resourcesService.delete(id);
		return map;
	}
	
	@RequestMapping(value="/toUpdate")
	public ModelAndView toUpdate(String id) {
		ModelAndView mav= new ModelAndView("system/resources/update");
		mav.addObject("id", id);
		return mav;
	}
	
	@RequiresPermissions("/system/resources/update")
	@RequestMapping(value="/update")
	@ResponseBody
	public Object update(Resources mresources) {
		Map<String, Object>	map=new HashMap<>();
		resourcesService.updateByPrimaryKey(mresources);
		return map;
	}
	
	@RequiresPermissions("/system/resources/list")
	@RequestMapping(value="/list")
	@ResponseBody
	public Object list() {
		return resourcesService.findResources();
	}
	

	@RequestMapping(value="/findResourcesEMUByResources")
	@ResponseBody
	public Object findResourcesEMUByResources() {
		
		return resourcesService.findResourcesEMUByResources((User)UserUtil.getUser());
	}
	
	@RequestMapping(value="/selectByPrimaryKey")
	@ResponseBody
	public Object selectByPrimaryKey(String id) {
		return resourcesService.selectByPrimaryKey(id);
	}
	
}
