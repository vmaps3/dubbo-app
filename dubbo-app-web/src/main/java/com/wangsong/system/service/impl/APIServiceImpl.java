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
import com.wangsong.system.model.Resources;
import com.wangsong.system.model.User;
import com.wangsong.system.service.APIService;
import com.wangsong.system.service.DictService;
import com.wangsong.system.service.ResourcesService;
import com.wangsong.system.service.UserService;

@Service("apiService")
@Transactional
public class APIServiceImpl implements APIService{
	@Autowired
	private UserService userService;

	@Autowired
	private ResourcesService resourcesService;
	
	@Override
	public User findUserByUser(User user){
		return userService.findTByT(user);
	}
	
	@Override
	public List<Resources> findResourcesByResources(Resources resources){
		return resourcesService.findTByT(resources);
	}


	
}
