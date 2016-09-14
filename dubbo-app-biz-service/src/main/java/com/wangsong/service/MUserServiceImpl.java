package com.wangsong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangsong.model.MUser;
import com.wangsong.service.MUserServiceI;
import com.wangsong.dao.MUserMapper;

@Service("muserService")
public class MUserServiceImpl implements MUserServiceI{
	@Autowired
	private MUserMapper muserMapper;
	
	@Override
	public List<MUser> getAll() {
		return muserMapper.getAll();
	}
	@Transactional
	@Override
	public int insert(MUser muser) {
		int i = muserMapper.insert(muser);
		if(muser.getName().equals("1")){
			throw new RuntimeException();
		}
		return i;
	}

	@Override
	public int update(MUser muser) {
		
		return muserMapper.updateByPrimaryKey(muser);
	}

	@Override
	public int delete(String id) {
	
		return muserMapper.deleteByPrimaryKey(id);
	}

	@Override
	public MUser selectByPrimaryKey(String id) {
		
		return muserMapper.selectByPrimaryKey(id);
	}

}
