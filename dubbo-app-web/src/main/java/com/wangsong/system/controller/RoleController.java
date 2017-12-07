package com.wangsong.system.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangsong.common.controller.BaseController;
import com.wangsong.system.groups.RoleAdd;
import com.wangsong.system.groups.RoleUpdate;
import com.wangsong.system.model.RoleAddModel;
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
	public Object add(@Validated({RoleAdd.class})  RoleAddModel role,BindingResult bindingResult) {
		return roleService.insertRole(role);
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
	public Object update(@Validated({RoleUpdate.class})  RoleAddModel mrole,BindingResult bindingResult) {
		return 	roleService.updateRole(mrole);
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
