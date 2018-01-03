package com.wangsong.system.model;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import com.wangsong.system.groups.UserAdd;
import com.wangsong.system.groups.UserUpdate;



public class User implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = -7484136779753770396L;
	@NotNull(groups = { UserUpdate.class }, message = "id不能为空")  
	private String id;
	@NotNull(groups = { UserUpdate.class,UserAdd.class  }, message = "username不能为空")  
    private String username;
	@NotNull(groups = { UserUpdate.class,UserAdd.class }, message = "password不能为空")  
    private String password;

	public User(String id, String username, String password) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
	}
	public User(){
		
	}
	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + "]";
	}


}