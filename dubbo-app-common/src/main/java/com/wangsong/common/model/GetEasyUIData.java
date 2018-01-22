package com.wangsong.common.model;

import java.io.Serializable;

public class GetEasyUIData implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Object rows;
	private int total;
	public Object getRows() {
		return rows;
	}
	public void setRows(Object rows) {
		this.rows = rows;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public GetEasyUIData(Object rows, int total) {
		super();
		this.rows = rows;
		this.total = total;
	}
	public GetEasyUIData(){
		
	}
}
