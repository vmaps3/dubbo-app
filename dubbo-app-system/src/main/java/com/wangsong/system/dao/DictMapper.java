package com.wangsong.system.dao;

import java.util.List;

import com.wangsong.system.model.Dict;
import com.wangsong.system.model.DictPage;

public interface DictMapper{

	int deleteByPrimaryKey(String id);

    int insert(Dict record);

    Dict selectByPrimaryKey(String id);

    List<Dict> selectAll();

    int updateByPrimaryKey(Dict record);
	
	List<Dict> findTByPage(DictPage dict);

	int findTCountByT(DictPage dict);

	void deleteBy(String[] id);

	List<Dict> findTByT(Dict dict);	
}