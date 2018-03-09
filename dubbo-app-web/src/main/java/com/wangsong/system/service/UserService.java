package com.wangsong.system.service;

import java.util.List;

import com.wangsong.common.model.Result;
import com.wangsong.system.model.User;
import com.wangsong.system.model.UserAddModel;
import com.wangsong.system.model.UserPage;
import com.wangsong.system.model.UserRole;
import com.wangsong.system.vo.UserVO;

public interface UserService {
	
	User toUpdatePassword(String principal);
	
	Result insertUser(UserAddModel muser);
    
    Result updateUser(UserAddModel muser);
    
    Result deleteUser(String[] id);
    
    Result updatePassword(UserAddModel u);

	Object findTByPage(UserPage user);

	UserVO selectByPrimaryKey(String id);

	User findTByT(User user);

	void deleteByT(UserRole[] u);

	List<UserRole> findByUserRole(UserRole userRole);
}
