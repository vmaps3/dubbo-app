package com.wangsong.system.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangsong.common.controller.BaseController;
import com.wangsong.system.model.Role;
import com.wangsong.system.model.RolePage;
import com.wangsong.system.service.RoleService;



@Controller
@RequestMapping("/system/role")
public class RoleController  extends BaseController{
	@Autowired
	private RoleService roleService;
	

	@RequiresPermissions("/system/role/list")
	@RequestMapping(value="/list")
	@ResponseBody
	public Object list(HttpServletRequest request,RolePage role) {
		return roleService.findTByPage(role);
	}
	

	
	@RequiresPermissions("/system/role/add")
	@RequestMapping(value="/add")
	@ResponseBody
	public Object add( Role role,String[] resourcesId) {
		return roleService.insertRole(role,resourcesId);
	}
	
	@RequiresPermissions("/system/role/delete")
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(String[] id) {
		return roleService.deleteRole(id);

	}
	
	@RequiresPermissions("/system/role/update")
	@RequestMapping(value="/update")
	@ResponseBody
	public Object update( Role mrole,String[] resourcesId) {
		return 	roleService.updateRole(mrole,resourcesId);
	}
	
	@RequestMapping(value="/listAll")
	@ResponseBody
	public Object listAll() {
		return roleService.selectAll();
	}
	
	@RequestMapping(value="/selectByPrimaryKey")
	@ResponseBody
	public Object selectByPrimaryKey(String id) {
		return roleService.selectByPrimaryKey(id);
	}
	
}
