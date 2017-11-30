package com.wangsong.system.service;

import java.util.List;

import com.wangsong.common.model.Result;
import com.wangsong.system.model.User;
import com.wangsong.system.model.UserPage;
import com.wangsong.system.model.UserRole;
import com.wangsong.system.vo.UserVO;

public interface UserService {
	
	User toUpdatePassword(String principal);
	
	Result insertUser(User muser, String[] roleId);
    
    Result updateUser(User muser, String[] roleId);
    
    Result deleteUser(String[] id);
    
    Result updatePassword(User u);

	Object findTByPage(UserPage user);

	Result index();

	Result unauth();

	UserVO selectByPrimaryKey(String id);

	User findTByT(User user);
}
