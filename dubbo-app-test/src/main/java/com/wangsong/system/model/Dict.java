package com.wangsong.system.model;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import com.wangsong.system.groups.DictAdd;
import com.wangsong.system.groups.DictUpdate;



public class Dict  implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 3138060792826655366L;
	@NotNull(groups = { DictUpdate.class }, message = "id不能为空")  
	private String id;
	@NotNull(groups = { DictUpdate.class,DictAdd.class }, message = "name不能为空")  
    private String name;
	@NotNull(groups = { DictUpdate.class,DictAdd.class }, message = "type不能为空")  
    private String type;
	@NotNull(groups = { DictUpdate.class,DictAdd.class  }, message = "code不能为空")  
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