package com.wangsong.activiti.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wangsong.activiti.service.ActivitiService;
import com.wangsong.common.controller.BaseController;
import com.wangsong.common.model.Page;

/**
 * 字典controller
 * @author ty
 * @date 2015年1月13日
 */
@Controller
@RequestMapping("activiti/deployment")
public class DeploymentController extends BaseController{
	
	@Autowired
	private ActivitiService workflowService;
	
	/**
	 * 默认页面
	 */
	@RequestMapping(value="toList")
	public String list() {
		return "activiti/deployment/list";
	}

	/**
	 * 获取字典json
	 */
	@RequestMapping(value="list")
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request) {
		Page<Map<String,Object>> page = getPage(request);
		//1:查询部署对象信息，对应表（act_re_deployment）
		page = workflowService.findDeploymentList(page);
		//2:查询流程定义的信息，对应表（act_re_procdef）
		
		return getEasyUIData(page);
	}
	
	/**
	 * 添加字典跳转
	 * 
	 * @param model
	 */
	@RequestMapping(value = "/toAdd")
	public String createForm(Model model) {
		return "activiti/deployment/add";
	}

	/**
	 * 添加字典
	 * 
	 * @param dict
	 * @param model
	 * @throws IOException 
	 */
	@RequestMapping(value = "/add")
	@ResponseBody
	public String create(MultipartFile file,String filename, Model model) throws IOException {
		
		workflowService.saveNewDeploye(file.getBytes()  ,filename);
		return "success";
	}

	
	
	/**
	 * 删除字典
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	public String delete(String id) {
		
		workflowService.deleteProcessDefinitionByDeploymentId(id);
		return "success";
	}
}
