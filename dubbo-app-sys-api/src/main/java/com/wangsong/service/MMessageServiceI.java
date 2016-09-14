package com.wangsong.service;

import java.util.List;

import com.wangsong.model.MUser;

public interface MMessageServiceI {

	List<MUser> getAll();
	
	MUser selectByPrimaryKey(String id);
	
    int insert(MUser muser);
    
    int update(MUser muser);
    
    int delete(String id);
    
    void activemq(MUser muser);
}
