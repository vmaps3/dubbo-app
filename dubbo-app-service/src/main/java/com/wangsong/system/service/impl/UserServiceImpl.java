package com.wangsong.system.service.impl;

import java.util.List;
import java.util.UUID;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangsong.common.service.impl.BaseServiceImpl;
import com.wangsong.system.dao.UserMapper;
import com.wangsong.system.dao.UserRoleMapper;
import com.wangsong.system.model.User;
import com.wangsong.system.model.UserRole;
import com.wangsong.system.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	
	
	
	@Override
	public List<UserRole> findUserRoleByUser(User user) {	
		UserRole userRole=new UserRole();
		userRole.setUserId(user.getId());
		return userRoleMapper.findTByT(userRole);
	}

	@Override
	public int insert(User user,String[] roleId) {
		String id = UUID.randomUUID().toString();
		user.setId(id);
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		if(roleId!=null){
			for(int i=0;i<roleId.length;i++){
				UserRole userRole=new UserRole();
				userRole.setId(UUID.randomUUID().toString());
				userRole.setUserId(id);
				userRole.setRoleId(roleId[i]);
				userRoleMapper.insert(userRole);
			}
		}
		return userMapper.insert(user);
	}

	@Override
	public int update(User user,String[] roleId) {
		if(!"".equals(user.getPassword())){
			user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		}
		UserRole userRole2=new UserRole();
		userRole2.setUserId(user.getId());
		userRoleMapper.deleteByT(new UserRole[]{userRole2});
		if(roleId!=null){
			for(int i=0;i<roleId.length;i++){
				UserRole userRole=new UserRole();
				userRole.setId(UUID.randomUUID().toString());
				userRole.setUserId(user.getId());
				userRole.setRoleId(roleId[i]);
				userRoleMapper.insert(userRole);
			}
		}
		return userMapper.updateByPrimaryKey(user);
	}

	@Override
	public int delete(String[] id) {
		UserRole[] u=new UserRole[id.length];
		for(int i=0;i<id.length;i++){
			UserRole user=new UserRole();
			user.setUserId(id[i]);
			u[i]=user;
		}
		userRoleMapper.deleteByT(u);
		userMapper.deleteByPrimaryKey(id);
		
		return 0;
	}

	@Override
	public User selectByKey(String id){
		User u=userMapper.selectByPrimaryKey(id);
		u.setPassword("");
		return u;
	}
}
