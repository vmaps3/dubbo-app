package com.wangsong.system.model;

import java.io.Serializable;

public class Dict  implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 3138060792826655366L;

	private String id;

    private String name;

    private String type;
    
    private String code;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code == null ? null : code.trim();
	}
    
    
}