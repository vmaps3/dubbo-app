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
 * 瀛楀吀service
 * @author ty
 * @date 2015骞�1鏈�13鏃�
 */
@Service("leaveService")
@Transactional(readOnly=true)
public class LeaveServiceImpl extends BaseServiceImpl<Leave> implements LeaveService{
	@Autowired
	private LeaveMapper leaveMapper;
	
	@Autowired
	private ActivitiServiceImpl workflowService;
	
	
	/**鏇存柊璇峰亣鐘舵�侊紝鍚姩娴佺▼瀹炰緥锛岃鍚姩鐨勬祦绋嬪疄渚嬪叧鑱斾笟鍔�*/
	@Transactional(readOnly = false)
	public void save(Leave leave,User user) {
		leave.setId(UUID.randomUUID().toString());
		leaveMapper.insert(leave);
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("inputUser2", user.getId().toString());// 琛ㄧず鎯熶竴鐢ㄦ埛
		workflowService.startProcessInstanceByKey(leave.getClass().getSimpleName(), leave.getId(),variables);
	}
}
