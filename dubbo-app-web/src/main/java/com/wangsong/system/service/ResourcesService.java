package com.wangsong.system.service;

import java.util.List;

import com.wangsong.common.model.JsonTreeData;
import com.wangsong.common.model.Result;
import com.wangsong.system.model.Resources;

public interface ResourcesService {

	Result deleteResources(String[] id);
	
	Result insertResources(Resources resources);
	
	List<JsonTreeData> findResources();

	Result updateResources(Resources resources);

	List<Resources> findTByT(Resources resources);

	Resources selectByPrimaryKey(String id);

	List<JsonTreeData> findResourcesEMUByResources(String id);
	
}
