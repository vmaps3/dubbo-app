package com.wangsong.activiti.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangsong.activiti.dao.LeaveMapper;
import com.wangsong.activiti.model.Leave;
import com.wangsong.activiti.service.LeaveService;
import com.wangsong.common.service.impl.BaseServiceImpl;
import com.wangsong.common.util.UserUtil;
import com.wangsong.system.model.User;
import com.wangsong.system.service.DictService;



/**
 * 字典service
 * @author ty
 * @date 2015年1月13日
 */
@Service("leaveService")
@Transactional(readOnly=true)
public class LeaveServiceImpl extends BaseServiceImpl<Leave> implements LeaveService{
	@Autowired
	private LeaveMapper leaveMapper;
	
	@Autowired
	private ActivitiServiceImpl workflowService;
	
	
	/**更新请假状态，启动流程实例，让启动的流程实例关联业务*/
	@Transactional(readOnly = false)
	public void save(Leave leave) {
		leave.setId(UUID.randomUUID().toString());
		leaveMapper.insert(leave);
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("inputUser2", ((User)UserUtil.getUser()).getId().toString());// 表示惟一用户
		workflowService.startProcessInstanceByKey(leave.getClass().getSimpleName(), leave.getId(),variables);
	}
}
