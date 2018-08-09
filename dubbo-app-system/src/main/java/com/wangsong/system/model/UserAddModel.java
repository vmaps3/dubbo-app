package com.wangsong.system.model;

import java.io.Serializable;


public class UserAddModel extends User implements Serializable {

    private String[] roleId;

    public String[] getRoleId() {
        return roleId;
    }

    public void setRoleId(String[] roleId) {
        this.roleId = roleId;
    }
}