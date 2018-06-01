package com.wangsong.system.service;

import java.util.List;

import com.wangsong.system.model.Resources;
import com.wangsong.system.model.User;



public interface SystemApiService {
	
	public User findUserByUser(User user);
	public List<Resources> findResourcesByResources(Resources resources);
}
