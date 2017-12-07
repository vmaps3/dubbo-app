package com.wangsong.system.vo;

import java.io.Serializable;
import java.util.List;

import com.wangsong.system.model.RoleResources;

public class RoleVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<RoleResources> roleResourcesList;
	private String id;
    private String name;
	public List<RoleResources> getRoleResourcesList() {
		return roleResourcesList;
	}

	public void setRoleResourcesList(List<RoleResources> roleResourcesList) {
		this.roleResourcesList = roleResourcesList;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
