package com.wangsong.activiti.service;

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

import com.wangsong.common.model.Page;
import com.wangsong.system.model.Dict;
import com.wangsong.system.model.User;
import com.wangsong.system.service.UserService;

/**
 * 字典service
 * 
 * @author ty
 * @date 2015年1月13日
 */
public interface ActivitiService {

	// 通过流程定义ID查询对象
	public ProcessDefinition findProcessDefinitionByprocessDefinitionId(String processDefinitionId);

	public Task findTaskByTaskId(String taskId);

	// 通过businessKey获取任务对象
	public Task findTaskBybusinessKey(String businessKey);

	// 通过businessKey获取任务对象
	public ProcessInstance findProcessInstanceByProcessInstanceId(String processInstanceId);

	public HistoricTaskInstance findHistoricTaskInstanceByTaskId(String taskId);

	public HistoricProcessInstance findHistoricProcessInstanceByProcessInstanceId(String processInstanceId);

	public ProcessInstance findProcessInstanceByTaskId(String taskId);

	public HistoricProcessInstance findHistoricProcessInstanceByBusinessKey(String businessKey);

	public void saveNewDeploye(MultipartFile file, String filename);

	// 流程部署查询
	public Page<Map<String, Object>> findDeploymentList(Page<Map<String, Object>> page);

	// 强制删除流程定义
	public void deleteProcessDefinitionByDeploymentId(String id);

	/** 查询流程定义的信息，对应表（act_re_procdef） */

	public Page<Map<String, Object>> findProcessDefinitionList(Page<Map<String, Object>> page);

	/** 使用部署对象ID和资源图片名称，获取图片的输入流 */
	public InputStream findImageInputStream(String deploymentId, String imageName);

	// 保存任务
	public void startProcessInstanceByKey(String name, String id, Map<String, Object> variables);

	// 办理任务
	public void complete(String name, String id, Map<String, Object> variables, String message);

	// 通过任务ID获取流程图中表单URL
	public String findTaskFormKeyByTaskId(String taskId);

	/** 2：使用当前用户名查询正在执行的任务表，获取当前任务的集合List<Task> */

	public Page<Map<String, Object>> findTaskListByUserId(final Page<Map<String, Object>> page, String userId);

	public Page<Map<String, Object>> findHistoryTaskListByUserId(Page<Map<String, Object>> page, String userId);

	/** 1：获取任务ID，获取任务对象，使用任务对象获取流程定义ID，查询流程定义对象 */
	public ProcessDefinition findProcessDefinitionByTaskId(String taskId);

	/** 1：获取任务ID，获取任务对象，使用任务对象获取流程定义ID，查询流程定义对象 */
	public ProcessDefinition findHistoryProcessDefinitionByTaskId(String taskId);

	// 通过任务ID获取实例ID
	public String findIdByTaskId(String taskId);

	public String findHistoryIdByTaskId(String processInstanceId);

	/**
	 * 二：查看当前活动，获取当期活动对应的坐标x,y,width,height，将4个值存放到Map<String,Object>中
	 * map集合的key：表示坐标x,y,width,height map集合的value：表示坐标对应的值
	 */
	public Map<String, Object> findCoordingByTaskId(String taskId);

	public Map<String, Object> findHistoryCoordingByTaskId(String taskId);

	public Map<String, Object> findcoordingByProcessDefinitionIdProcessInstanceId(String processDefinitionId,String processInstanceId);

	/** 获取批注信息，传递的是当前任务ID，获取历史任务ID对应的批注 */

	public List<Map<String, Object>> findCommentByBusinessKey(String businessKey);

	/** 使用请假单ID，查询历史批注信息 */

	public List<Map<String, Object>> findHistoryCommentByBusinessKey(String businessKey);

	public List<Map<String, Object>> findHistoryCommentByProcessInstanceId(String processInstanceId);

}
