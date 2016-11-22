package com.wangsong.system.model;

import java.io.Serializable;

public class RoleResources  implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 2814639517974791520L;

	private String id;

    private String resourcesId;

    private String roleId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getResourcesId() {
        return resourcesId;
    }

    public void setResourcesId(String resourcesId) {
        this.resourcesId = resourcesId == null ? null : resourcesId.trim();
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}