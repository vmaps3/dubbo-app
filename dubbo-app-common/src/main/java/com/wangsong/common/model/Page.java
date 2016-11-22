
package com.wangsong.common.model;

import java.io.Serializable;
import java.util.List;

import com.google.common.collect.Lists;

public class Page<T> implements Serializable{


	//-- 分页参数 --//
	protected int pageNo = 1;
	protected int pageSize = -1;


	//-- 返回结果 --//
	protected  List<?> result = Lists.newArrayList();
	protected long totalCount = -1;

	protected int first;
	
	protected T t;
	
	public Page(int pageNo,int pageSize){
		this.pageNo=pageNo;
		this.pageSize=pageSize;
		this.first=(pageNo - 1) * pageSize;
	}

	

	public int getPageNo() {
		return pageNo;
	}



	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}



	public int getPageSize() {
		return pageSize;
	}



	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	
	
	public long getTotalCount() {
		return totalCount;
	}



	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}



	public List<?> getResult() {
		return result;
	}



	public void setResult(List<?> result) {
		this.result = result;
	}



	public T getT() {
		return t;
	}



	public void setT(T t) {
		this.t = t;
	}



	public int getFirst() {
		return first;
	}



	public void setFirst(int first) {
		this.first = first;
	}
	
	
}
