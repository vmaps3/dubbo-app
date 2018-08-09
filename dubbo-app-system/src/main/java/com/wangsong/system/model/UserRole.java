package com.wangsong.system.model;

import java.io.Serializable;


public class UserRole implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = -2146055323640680310L;
    private String id;
    private String userId;
    private String roleId;

    public UserRole(String id, String userId, String roleId) {
        super();
        this.id = id;
        this.userId = userId;
        this.roleId = roleId;
    }

    public UserRole() {
        super();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }
}