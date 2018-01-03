package com.wangsong.system.service;

import java.util.List;

import com.wangsong.common.model.Result;
import com.wangsong.system.model.Dict;
import com.wangsong.system.model.DictPage;

public interface DictService {

	Object findTByPage(DictPage dict);

	Result insertDict(Dict dict);

	Result updateByPrimaryKeyDict(Dict dict);

	Result deleteByPrimaryKeyDict(String[] id);

	Dict selectByPrimaryKey(String id);

	List<Dict> findTByT(Dict dict);	
}
