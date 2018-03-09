package com.wangsong.system.dao;

import java.util.List;

import com.wangsong.system.model.Resources;

public interface ResourcesMapper{
	int deleteByPrimaryKey(String id);

    int insert(Resources record);

    Resources selectByPrimaryKey(String id);

    List<Resources> selectAll();
    
    List<Resources> selectByResources(Resources record);

    int updateByPrimaryKey(Resources record);

	void deleteBy(String[] id);
	

}