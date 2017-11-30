package com.wangsong.system.dao;

import java.util.List;

import com.wangsong.system.model.RoleResources;
import com.wangsong.system.model.User;
import com.wangsong.system.model.UserPage;
import com.wangsong.system.vo.UserVO;

public interface UserMapper{
	int deleteByPrimaryKey(String id);

    int insert(User record);

    User selectByPrimaryKey(String id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);
    
	List<User> findTByPage(UserPage user);

	int findTCountByT(UserPage user);

	void deleteBy(String[] id);

	User findTByT(User user);

	User findTByTOne(User user);

	void updateNoPasswordByPrimaryKey(User user);

	UserVO selectVOByPrimaryKey(String id);

}