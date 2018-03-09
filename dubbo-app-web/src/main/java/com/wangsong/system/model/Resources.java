package com.wangsong.system.model;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import com.wangsong.system.groups.ResourcesAdd;
import com.wangsong.system.groups.ResourcesUpdate;



public class Resources  implements Serializable,Comparable<Resources>{
    /**
	 * 
	 */
	private static final long serialVersionUID = 4125580367922291000L;
	@NotNull(groups = { ResourcesUpdate.class }, message = "id不能为空")  
	private String id;
	@NotNull(groups = { ResourcesUpdate.class,ResourcesAdd.class }, message = "pid不能为空")  
    private String pid;
	@NotNull(groups = { ResourcesUpdate.class,ResourcesAdd.class }, message = "name不能为空")  
    private String name;
	@NotNull(groups = { ResourcesUpdate.class,ResourcesAdd.class }, message = "url不能为空")  
    private String url;
	@NotNull(groups = { ResourcesUpdate.class,ResourcesAdd.class }, message = "type不能为空")  
    private String type;
	@NotNull(groups = { ResourcesUpdate.class,ResourcesAdd.class }, message = "sort不能为空")  
    private String sort;
    
    public Resources(String id, String pid, String name, String url, String type, String sort) {
		super();
		this.id = id;
		this.pid = pid;
		this.name = name;
		this.url = url;
		this.type = type;
		this.sort = sort;
	}

	public String getType() {
		return type;
	}
	public Resources(){
		
	}
	public void setType(String type) {
		 this.type = type == null ? null : type.trim();
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid == null ? null : pid.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		 this.sort = sort == null ? null : sort.trim();	
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((pid == null) ? 0 : pid.hashCode());
		result = prime * result + ((sort == null) ? 0 : sort.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		result = prime * result + ((url == null) ? 0 : url.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Resources other = (Resources) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (pid == null) {
			if (other.pid != null)
				return false;
		} else if (!pid.equals(other.pid))
			return false;
		if (sort == null) {
			if (other.sort != null)
				return false;
		} else if (!sort.equals(other.sort))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		if (url == null) {
			if (other.url != null)
				return false;
		} else if (!url.equals(other.url))
			return false;
		return true;
	}
	
	

	@Override
	public int compareTo(Resources o) {
        return Integer.parseInt(this.sort==null?"0":this.sort) - Integer.parseInt(o.getSort()==null?"0":o.getSort());//如果年龄相等了再用分数进行排序   
	}  
}