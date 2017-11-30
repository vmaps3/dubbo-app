package com.wangsong.system.controller;



import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangsong.common.controller.BaseController;
import com.wangsong.system.model.Resources;
import com.wangsong.system.service.ResourcesService;



@Controller
@RequestMapping("/system/resources")
public class ResourcesController extends BaseController {
	@Autowired
	private ResourcesService resourcesService;
	
	@RequiresPermissions("/system/resources/add")
	@RequestMapping(value="/add")
	@ResponseBody
	public Object add( Resources resources) {
		return resourcesService.insertResources(resources);
	}
	
	@RequiresPermissions("/system/resources/delete")
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(String[] id) {
		return resourcesService.deleteResources(id);
	}
	
	
	
	@RequiresPermissions("/system/resources/update")
	@RequestMapping(value="/update")
	@ResponseBody
	public Object update( Resources resources) {
		return resourcesService.updateResources(resources);
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
		return resourcesService.findResourcesEMUByResources((String)SecurityUtils.getSubject().getPrincipal());
	}
	
	
	@RequestMapping(value="/selectByPrimaryKey")
	@ResponseBody
	public Object selectByPrimaryKey(String id) {
		return resourcesService.selectByPrimaryKey(id);
	}
	
}
