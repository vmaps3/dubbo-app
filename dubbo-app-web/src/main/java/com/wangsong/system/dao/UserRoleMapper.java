package com.wangsong.system.dao;

import java.util.List;

import com.wangsong.system.model.User;
import com.wangsong.system.model.UserRole;

public interface UserRoleMapper {
	int deleteByPrimaryKey(String id);

    int insert(UserRole record);

    UserRole selectByPrimaryKey(String id);

    List<UserRole> selectAll();

    int updateByPrimaryKey(User record);

	void deleteByT(UserRole[] u);

	List<UserRole> findTByT(UserRole userRole);

}