package com.wangsong.activiti.service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangsong.activiti.model.Leave;
import com.wangsong.common.service.BaseService;
import com.wangsong.common.service.impl.BaseServiceImpl;
import com.wangsong.common.util.UserUtil;



/**
 * 字典service
 * @author ty
 * @date 2015年1月13日
 */

public interface LeaveService extends BaseService<Leave>{
	public void save(Leave leave) ;
}
