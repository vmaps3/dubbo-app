package com.wangsong.system.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangsong.common.model.GetEasyUIData;
import com.wangsong.common.model.Result;
import com.wangsong.system.dao.DictMapper;
import com.wangsong.system.model.Dict;
import com.wangsong.system.model.DictPage;
import com.wangsong.system.service.DictService;

@Service("dictService")
@Transactional
public class DictServiceImpl implements DictService{
	@Autowired
	private DictMapper dictMapper;
	@Override
	public GetEasyUIData findTByPage(DictPage dict) {
		dict.setFirst((dict.getPage() - 1) * dict.getRows());
		return new GetEasyUIData(dictMapper.findTByPage(dict)
				,dictMapper.findTCountByT(dict));
	}
	@Override
	public Result insertDict(Dict dict) {
		dict.setId(UUID.randomUUID().toString());
		dictMapper.insert(dict);
		return new Result("success",null);
	}
	@Override
	public Result updateByPrimaryKeyDict(Dict dict) {
		dictMapper.updateByPrimaryKey(dict);
		return new Result("success",null);
	}
	@Override
	public Result deleteByPrimaryKeyDict(String[] id) {
		dictMapper.deleteBy(id);
		return new Result("success",null);
	}
	@Override
	public Dict selectByPrimaryKey(String id) {
		return dictMapper.selectByPrimaryKey(id);
	}
	@Override
	public List<Dict> findTByT(Dict dict) {
		return dictMapper.findTByT(dict);
	}

	
}
