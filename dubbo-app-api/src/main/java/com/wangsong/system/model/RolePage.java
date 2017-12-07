package com.wangsong.system.model;

import java.io.Serializable;



public class RolePage  implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 3582588209589180635L;
	private String id;
	
    private String name;
    private int page;
    private int rows;
    private int first;
	
    public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

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