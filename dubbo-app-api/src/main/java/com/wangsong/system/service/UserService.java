package com.wangsong.system.service;

import java.util.List;

import com.wangsong.common.service.BaseService;
import com.wangsong.system.model.User;
import com.wangsong.system.model.UserRole;

public interface UserService extends BaseService<User>{
	
	User selectByKey(String id);
	
    int insert(User muser, String[] roleId);
    
    int update(User muser, String[] roleId);
    
    int delete(String[] id);
    
    List<UserRole> findUserRoleByUser(User user);


	
}
