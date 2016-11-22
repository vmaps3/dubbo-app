package com.wangsong.system.model;

import java.io.Serializable;

public class Role  implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 3582588209589180635L;

	private String id;

    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}