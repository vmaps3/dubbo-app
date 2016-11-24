package com.wangsong.activiti.service.impl;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.history.HistoricTaskInstanceQuery;
import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentQuery;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.wangsong.activiti.service.ActivitiService;
import com.wangsong.activiti.service.LeaveService;
import com.wangsong.common.model.Page;
import com.wangsong.common.util.ByteToInputStream;
import com.wangsong.common.util.DateUtils;
import com.wangsong.common.util.UserUtil;
import com.wangsong.system.model.User;
import com.wangsong.system.service.UserService;



/**
 * 瀛楀吀service
 * 
 * @author ty
 * @date 2015骞�1鏈�13鏃�
 */
@Service("activitiService")
@Transactional(readOnly=true)
public class ActivitiServiceImpl implements ActivitiService{
	@Autowired
	private RepositoryService repositoryService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private FormService formService;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private HistoryService historyService;
	@Autowired
	private UserService userService;

	// 閫氳繃娴佺▼瀹氫箟ID鏌ヨ瀵硅薄
	public ProcessDefinition findProcessDefinitionByprocessDefinitionId(String processDefinitionId) {
		return repositoryService.createProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult();
	}

	public Task findTaskByTaskId(String taskId) {
		return taskService.createTaskQuery().taskId(taskId).singleResult();

	}

	// 閫氳繃businessKey鑾峰彇浠诲姟瀵硅薄
	public Task findTaskBybusinessKey(String businessKey) {
		return taskService.createTaskQuery().processInstanceBusinessKey(businessKey).singleResult();
	}

	// 閫氳繃businessKey鑾峰彇浠诲姟瀵硅薄
	public ProcessInstance findProcessInstanceByProcessInstanceId(String processInstanceId) {
		return runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
	}

	public HistoricTaskInstance findHistoricTaskInstanceByTaskId(String taskId) {
		return historyService.createHistoricTaskInstanceQuery().taskId(taskId).singleResult();
	}

	public HistoricProcessInstance findHistoricProcessInstanceByProcessInstanceId(String processInstanceId) {
		return historyService.createHistoricProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
	}

	public ProcessInstance findProcessInstanceByTaskId(String taskId) {
		HistoricTaskInstance historicTaskInstance = findHistoricTaskInstanceByTaskId(taskId);
		return findProcessInstanceByProcessInstanceId(historicTaskInstance.getProcessInstanceId());
	}

	public HistoricProcessInstance findHistoricProcessInstanceByBusinessKey(String businessKey) {
		return historyService.createHistoricProcessInstanceQuery().processInstanceBusinessKey(businessKey).singleResult();
	}

	/** 閮ㄧ讲娴佺▼瀹氫箟 */
	@Transactional(readOnly = false)
	public void saveNewDeploye(byte[] file, String filename) {
		try {
			// 2锛氬皢File绫诲瀷鐨勬枃浠惰浆鍖栨垚ZipInputStream娴�
			
			repositoryService.createDeployment()// 鍒涘缓閮ㄧ讲瀵硅薄
					.name(filename)// 娣诲姞閮ㄧ讲鍚嶇О
					.addZipInputStream(  new ZipInputStream(new ByteArrayInputStream(file)))//
					.deploy();// 瀹屾垚閮ㄧ讲
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 娴佺▼閮ㄧ讲鏌ヨ
	public Page<Map<String, Object>> findDeploymentList(Page<Map<String, Object>> page) {
		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
		DeploymentQuery deploymentQuery = repositoryService.createDeploymentQuery();// 鍒涘缓閮ㄧ讲瀵硅薄鏌ヨ

		page.setTotalCount(deploymentQuery.count());
		List<Deployment> list = deploymentQuery.orderByDeploymenTime().asc()//
				.listPage(page.getFirst(), page.getPageSize());

		for (int i = 0; i < list.size(); i++) {
			Deployment d = list.get(i);
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("id", d.getId());
			m.put("name", d.getName());
			m.put("deploymentTime", d.getDeploymentTime());
			m.put("category", d.getCategory());
			m.put("tenantId", d.getTenantId());
			mapList.add(m);
		}
		page.setResult(mapList);
		return page;
	}
	
	// 寮哄埗鍒犻櫎娴佺▼瀹氫箟
		@Transactional(readOnly = false)
		public void deleteProcessDefinitionByDeploymentId(String id) {
			repositoryService.deleteDeployment(id, true);
		}

	
	/** 鏌ヨ娴佺▼瀹氫箟鐨勪俊鎭紝瀵瑰簲琛紙act_re_procdef锛� */

	public Page<Map<String, Object>> findProcessDefinitionList(Page<Map<String, Object>> page) {
		ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery();// 鍒涘缓娴佺▼瀹氫箟鏌ヨ
		page.setTotalCount(processDefinitionQuery.count());
		List<ProcessDefinition> list = processDefinitionQuery.orderByProcessDefinitionVersion().asc()//
				.listPage(page.getFirst(), page.getPageSize());
		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < list.size(); i++) {
			ProcessDefinition p = list.get(i);
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("id", p.getId());
			m.put("name", p.getName());
			m.put("key", p.getKey());
			m.put("category", p.getCategory());
			m.put("deploymentId", p.getDeploymentId());
			m.put("description", p.getDescription());
			m.put("diagramResourceName", p.getDiagramResourceName());
			m.put("resourceName", p.getResourceName());
			m.put("tenantId", p.getTenantId());
			m.put("version", p.getVersion());
			mapList.add(m);
		}
		page.setResult(mapList);
		return page;
	}

	/** 浣跨敤閮ㄧ讲瀵硅薄ID鍜岃祫婧愬浘鐗囧悕绉帮紝鑾峰彇鍥剧墖鐨勮緭鍏ユ祦 
	 * @throws IOException */
	public byte[]  findImageInputStream(String deploymentId, String imageName) throws IOException {
		return ByteToInputStream.input2byte(repositoryService.getResourceAsStream(deploymentId, imageName));
	}

	// 淇濆瓨浠诲姟
	@Transactional(readOnly = false)
	public void startProcessInstanceByKey(String name, String id,Map<String,Object>variables) {
		String businessKey = name + "." + id;
		runtimeService.startProcessInstanceByKey(name,businessKey , variables);
	}
	// 鍔炵悊浠诲姟
	@Transactional(readOnly = false)
	public void complete(String name, String id, Map<String, Object> variables, String message,User user) {
		String businessKey = name + "." + id;
		// 浣跨敤浠诲姟ID锛屾煡璇换鍔″璞★紝鑾峰彇娴佺▼娴佺▼瀹炰緥ID
		Task task = findTaskBybusinessKey(businessKey);
		// 鑾峰彇娴佺▼瀹炰緥ID
		String processInstanceId = task.getProcessInstanceId();
		if(message!=null){
			Authentication.setAuthenticatedUserId(user.getId().toString());
			taskService.addComment(task.getId(), processInstanceId, message);
		}
		taskService.complete(findTaskBybusinessKey(businessKey).getId(), variables);

	}
	
	// 閫氳繃浠诲姟ID鑾峰彇娴佺▼鍥句腑琛ㄥ崟URL
		public String findTaskFormKeyByTaskId(String taskId) {
			TaskFormData formData = formService.getTaskFormData(taskId);
			// 鑾峰彇Form key鐨勫��
			String url = formData.getFormKey();
			return url;
		}

	/** 2锛氫娇鐢ㄥ綋鍓嶇敤鎴峰悕鏌ヨ姝ｅ湪鎵ц鐨勪换鍔¤〃锛岃幏鍙栧綋鍓嶄换鍔＄殑闆嗗悎List<Task> */

	public Page<Map<String, Object>> findTaskListByUserId(final Page<Map<String, Object>> page, String userId) {
		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
		TaskQuery taskQuery = taskService.createTaskQuery().taskAssignee(userId);
		page.setTotalCount(taskQuery.count());
		List<Task> list = taskQuery.orderByTaskCreateTime().asc().listPage(page.getFirst(), page.getPageSize());

		for (int i = 0; i < list.size(); i++) {
			Task d = list.get(i);
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("assignee", d.getAssignee());
			m.put("category", d.getCategory());
			m.put("createTime", DateUtils.formatDateTime(d.getCreateTime()));
			m.put("delegationState", d.getDelegationState());
			m.put("description", d.getDescription());
			m.put("dueDate", d.getDueDate());
			m.put("executionId", d.getExecutionId());
			m.put("formKey", d.getFormKey());
			m.put("id", d.getId());
			m.put("name", d.getName());
			m.put("owner", d.getOwner());
			m.put("parentTaskId", d.getParentTaskId());
			m.put("priority", d.getPriority());
			m.put("processDefinitionId", d.getProcessDefinitionId());
			m.put("processInstanceId", d.getProcessInstanceId());
			m.put("processVariables", d.getProcessVariables());
			m.put("taskDefinitionKey", d.getTaskDefinitionKey());
			m.put("taskLocalVariables", d.getTaskLocalVariables());
			m.put("tenantId", d.getTenantId());
			ProcessDefinition processDefinition = findProcessDefinitionByprocessDefinitionId(
					d.getProcessDefinitionId());
			m.put("processDefinitionName", processDefinition.getName());
			mapList.add(m);
		}

		page.setResult(mapList);
		return page;
	}

	public Page<Map<String, Object>> findHistoryTaskListByUserId(Page<Map<String, Object>> page,
			String userId) {
		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
		HistoricTaskInstanceQuery histTaskQuery = historyService.createHistoricTaskInstanceQuery().taskAssignee(userId)
				.finished();

		page.setTotalCount(histTaskQuery.count());
		List<HistoricTaskInstance> histList = histTaskQuery.includeProcessVariables()
				.orderByHistoricTaskInstanceEndTime().desc().listPage(page.getFirst(), page.getPageSize());
		for (int i = 0; i < histList.size(); i++) {
			HistoricTaskInstance historicTaskInstance = histList.get(i);
			Map<String, Object> map = new HashMap<>();
			map.put("assignee", historicTaskInstance.getAssignee());
			map.put("category", historicTaskInstance.getCategory());
			map.put("claimTime", historicTaskInstance.getClaimTime());
			map.put("createTime", DateUtils.formatDateTime(historicTaskInstance.getCreateTime()));
			map.put("deleteReason", historicTaskInstance.getDeleteReason());
			map.put("description", historicTaskInstance.getDescription());
			map.put("dueDate", historicTaskInstance.getDueDate());
			map.put("durationInMillis", historicTaskInstance.getDurationInMillis());
			map.put("endTime", historicTaskInstance.getEndTime());
			map.put("executionId", historicTaskInstance.getExecutionId());
			map.put("formKey", historicTaskInstance.getFormKey());
			map.put("id", historicTaskInstance.getId());
			map.put("name", historicTaskInstance.getName());
			map.put("owner", historicTaskInstance.getOwner());
			map.put("priority", historicTaskInstance.getParentTaskId());
			map.put("priority", historicTaskInstance.getPriority());
			map.put("processDefinitionId", historicTaskInstance.getProcessDefinitionId());
			map.put("processInstanceId", historicTaskInstance.getProcessInstanceId());
			map.put("processVariables", historicTaskInstance.getProcessVariables());
			map.put("startTime", historicTaskInstance.getStartTime());
			map.put("taskDefinitionKey", historicTaskInstance.getTaskDefinitionKey());
			map.put("taskLocalVariables", historicTaskInstance.getTaskLocalVariables());
			map.put("tenantId", historicTaskInstance.getTenantId());
			map.put("time", historicTaskInstance.getTime());
			map.put("workTimeInMillis", historicTaskInstance.getWorkTimeInMillis());
			ProcessDefinition processDefinition = findProcessDefinitionByprocessDefinitionId(
					historicTaskInstance.getProcessDefinitionId());
			map.put("processDefinitionName", processDefinition.getName());
			mapList.add(map);

		}

		page.setResult(mapList);
		return page;
	}

	/** 1锛氳幏鍙栦换鍔D锛岃幏鍙栦换鍔″璞★紝浣跨敤浠诲姟瀵硅薄鑾峰彇娴佺▼瀹氫箟ID锛屾煡璇㈡祦绋嬪畾涔夊璞� */
	public ProcessDefinition findProcessDefinitionByTaskId(String taskId) {
		// 浣跨敤浠诲姟ID锛屾煡璇换鍔″璞�
		Task task = findTaskByTaskId(taskId);
		// 鑾峰彇娴佺▼瀹氫箟ID
		String processDefinitionId = task.getProcessDefinitionId();
		return findProcessDefinitionByprocessDefinitionId(processDefinitionId);
	}

	/** 1锛氳幏鍙栦换鍔D锛岃幏鍙栦换鍔″璞★紝浣跨敤浠诲姟瀵硅薄鑾峰彇娴佺▼瀹氫箟ID锛屾煡璇㈡祦绋嬪畾涔夊璞� */
	public ProcessDefinition findHistoryProcessDefinitionByTaskId(String taskId) {
		// 浣跨敤浠诲姟ID锛屾煡璇换鍔″璞�
		HistoricTaskInstance task = findHistoricTaskInstanceByTaskId(taskId);
		// 鑾峰彇娴佺▼瀹氫箟ID
		String processDefinitionId = task.getProcessDefinitionId();
		return findProcessDefinitionByprocessDefinitionId(processDefinitionId);
	}

	// 閫氳繃浠诲姟ID鑾峰彇瀹炰緥ID
	public String findIdByTaskId(String taskId) {
		// 2锛氫娇鐢ㄤ换鍔″璞ask鑾峰彇娴佺▼瀹炰緥ID
		String processInstanceId = findTaskByTaskId(taskId).getProcessInstanceId();
		// 3锛氫娇鐢ㄦ祦绋嬪疄渚婭D锛屾煡璇㈡鍦ㄦ墽琛岀殑鎵ц瀵硅薄琛紝杩斿洖娴佺▼瀹炰緥瀵硅薄
		ProcessInstance pi = runtimeService.createProcessInstanceQuery()//
				.processInstanceId(processInstanceId)// 浣跨敤娴佺▼瀹炰緥ID鏌ヨ
				.singleResult();
		// 4锛氫娇鐢ㄦ祦绋嬪疄渚嬪璞¤幏鍙朆USINESS_KEY
		String buniness_key = pi.getBusinessKey();
		String id = null;
		if (buniness_key != null) {
			// 鎴彇瀛楃涓诧紝鍙朾uniness_key灏忔暟鐐圭殑绗�2涓��
			id = buniness_key.split("\\.")[1];
		}
		return id;
	}

	public String findHistoryIdByTaskId(String processInstanceId) {
		// 3锛氫娇鐢ㄦ祦绋嬪疄渚婭D锛屾煡璇㈡鍦ㄦ墽琛岀殑鎵ц瀵硅薄琛紝杩斿洖娴佺▼瀹炰緥瀵硅薄
		HistoricProcessInstance historicProcessInstance = findHistoricProcessInstanceByProcessInstanceId(
				processInstanceId);

		// 4锛氫娇鐢ㄦ祦绋嬪疄渚嬪璞¤幏鍙朆USINESS_KEY
		String buniness_key = historicProcessInstance.getBusinessKey();
		String id = null;
		if (buniness_key != null) {
			// 鎴彇瀛楃涓诧紝鍙朾uniness_key灏忔暟鐐圭殑绗�2涓��
			id = buniness_key.split("\\.")[1];
		}
		return id;
	}

	/**
	 * 浜岋細鏌ョ湅褰撳墠娲诲姩锛岃幏鍙栧綋鏈熸椿鍔ㄥ搴旂殑鍧愭爣x,y,width,height锛屽皢4涓�煎瓨鏀惧埌Map<String,Object>涓�
	 * map闆嗗悎鐨刱ey锛氳〃绀哄潗鏍噚,y,width,height map闆嗗悎鐨剉alue锛氳〃绀哄潗鏍囧搴旂殑鍊�
	 */
	public Map<String, Object> findCoordingByTaskId(String taskId) {
		
		// 浣跨敤浠诲姟ID锛屾煡璇换鍔″璞�
		Task task = findTaskByTaskId(taskId);
		// 鑾峰彇娴佺▼瀹氫箟鐨処D
		String processDefinitionId = task.getProcessDefinitionId();
		String processInstanceId = task.getProcessInstanceId();
		return findcoordingByProcessDefinitionIdProcessInstanceId(processDefinitionId,processInstanceId);
	}

	public Map<String, Object> findHistoryCoordingByTaskId(String taskId) {
		// 浣跨敤浠诲姟ID锛屾煡璇换鍔″璞�
		HistoricTaskInstance historicTaskInstance = findHistoricTaskInstanceByTaskId(taskId);
		// 鑾峰彇娴佺▼瀹氫箟鐨処D
		String processDefinitionId = historicTaskInstance.getProcessDefinitionId();
		String processInstanceId = historicTaskInstance.getProcessInstanceId();
		return findcoordingByProcessDefinitionIdProcessInstanceId(processDefinitionId,processInstanceId);
	}
	
	
	public Map<String , Object> findcoordingByProcessDefinitionIdProcessInstanceId(String processDefinitionId,String processInstanceId){
		// 瀛樻斁鍧愭爣
		Map<String, Object> map = new HashMap<String, Object>();
		// 鑾峰彇娴佺▼瀹氫箟鐨勫疄浣撳璞★紙瀵瑰簲.bpmn鏂囦欢涓殑鏁版嵁锛�
		ProcessDefinitionEntity processDefinitionEntity = (ProcessDefinitionEntity) repositoryService
				.getProcessDefinition(processDefinitionId);
		// 娴佺▼瀹炰緥ID
		
		// 浣跨敤娴佺▼瀹炰緥ID锛屾煡璇㈡鍦ㄦ墽琛岀殑鎵ц瀵硅薄琛紝鑾峰彇褰撳墠娲诲姩瀵瑰簲鐨勬祦绋嬪疄渚嬪璞�
		ProcessInstance pi = findProcessInstanceByProcessInstanceId(processInstanceId);// 浣跨敤娴佺▼瀹炰緥ID鏌ヨ
		// 鑾峰彇褰撳墠娲诲姩鐨処D
		String activityId = pi.getActivityId();
		// 鑾峰彇褰撳墠娲诲姩瀵硅薄
		ActivityImpl activityImpl = processDefinitionEntity.findActivity(activityId);// 娲诲姩ID
		// 鑾峰彇鍧愭爣
		map.put("x", activityImpl.getX());
		map.put("y", activityImpl.getY());
		map.put("width", activityImpl.getWidth());
		map.put("height", activityImpl.getHeight());
		return map;
	}

	/** 鑾峰彇鎵规敞淇℃伅锛屼紶閫掔殑鏄綋鍓嶄换鍔D锛岃幏鍙栧巻鍙蹭换鍔D瀵瑰簲鐨勬壒娉� */

	public List<Map<String, Object>> findCommentByBusinessKey(String businessKey) {

		// 浣跨敤褰撳墠鐨勪换鍔D锛屾煡璇㈠綋鍓嶆祦绋嬪搴旂殑鍘嗗彶浠诲姟ID
		// 浣跨敤褰撳墠浠诲姟ID锛岃幏鍙栧綋鍓嶄换鍔″璞�
		Task task = findTaskBybusinessKey(businessKey);
		// 鑾峰彇娴佺▼瀹炰緥ID
		String processInstanceId = task.getProcessInstanceId();
		return findHistoryCommentByProcessInstanceId(processInstanceId);
	}

	/** 浣跨敤璇峰亣鍗旾D锛屾煡璇㈠巻鍙叉壒娉ㄤ俊鎭� */

	public List<Map<String, Object>> findHistoryCommentByBusinessKey(String businessKey) {

		/** 1:浣跨敤鍘嗗彶鐨勬祦绋嬪疄渚嬫煡璇紝杩斿洖鍘嗗彶鐨勬祦绋嬪疄渚嬪璞★紝鑾峰彇娴佺▼瀹炰緥ID */
		HistoricProcessInstance hpi = findHistoricProcessInstanceByBusinessKey(businessKey);
		// 娴佺▼瀹炰緥ID
		String processInstanceId = hpi.getId();
		
		return findHistoryCommentByProcessInstanceId(processInstanceId);
	}
	public  List<Map<String, Object>> findHistoryCommentByProcessInstanceId(String processInstanceId){
		List<Comment> list = taskService.getProcessInstanceComments(processInstanceId);
		List<Map<String, Object>> mapList = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			Comment comment = list.get(i);
			Map<String, Object> map = new HashMap<>();
			map.put("fullMessage", comment.getFullMessage());
			map.put("id", comment.getId());
			map.put("processInstanceId", comment.getProcessInstanceId());
			map.put("taskId", comment.getTaskId());
			map.put("time", DateUtils.formatDateTime(comment.getTime()));
			map.put("type", comment.getType());
			map.put("userId", comment.getUserId());
			User user=new User();
			user.setId(comment.getUserId());
			map.put("userName", userService.findTByTOne(user).getUsername());
			mapList.add(map);
		}
		return mapList;
		
	}

}
