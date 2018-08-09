package com.wangsong.system.model;

import java.io.Serializable;


public class RoleAddModel extends Role implements Serializable {

    private String[] resourcesId;


    public String[] getResourcesId() {
        return resourcesId;
    }

    public void setResourcesId(String[] resourcesId) {
        this.resourcesId = resourcesId;
    }


}