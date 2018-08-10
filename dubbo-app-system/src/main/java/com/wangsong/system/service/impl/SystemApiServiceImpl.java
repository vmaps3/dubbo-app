package com.wangsong.system.service.impl;

import com.wangsong.system.model.Resources;
import com.wangsong.system.model.User;
import com.wangsong.system.service.ResourcesService;
import com.wangsong.system.service.SystemApiService;
import com.wangsong.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("systemApiService")
public class SystemApiServiceImpl implements SystemApiService {
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
