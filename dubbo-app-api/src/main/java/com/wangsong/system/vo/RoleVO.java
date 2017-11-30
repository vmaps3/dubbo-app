package com.wangsong.system.vo;

import java.io.Serializable;
import java.util.List;

import com.wangsong.system.model.RoleResources;

public class RoleVO implements Serializable{
	List<RoleResources> roleResourcesList;

	public List<RoleResources> getRoleResourcesList() {
		return roleResourcesList;
	}

	public void setRoleResourcesList(List<RoleResources> roleResourcesList) {
		this.roleResourcesList = roleResourcesList;
	}
	
}
