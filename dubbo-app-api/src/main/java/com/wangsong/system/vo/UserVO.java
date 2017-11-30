package com.wangsong.system.vo;

import java.io.Serializable;
import java.util.List;

import com.wangsong.system.model.UserRole;

public class UserVO implements Serializable{
	String Password;
	List<UserRole> UserRoleList;
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public List<UserRole> getUserRoleList() {
		return UserRoleList;
	}
	public void setUserRoleList(List<UserRole> userRoleList) {
		UserRoleList = userRoleList;
	}
	
}
