package com.wangsong.activiti.controller;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.wangsong.common.util.ByteToInputStream;

/**
 * 字典controller
 * @author ty
 * @date 2015年1月13日
 */
@Controller
@RequestMapping("activiti/processDefinition")
public class ProcessDefinitionController extends BaseController{
	
	@Autowired
	private ActivitiService processDefinitionService;
	
	/**
	 * 默认页面
	 */
	@RequestMapping(value="/toList")
	public String list() {
		return "activiti/processDefinition/list";
	}

	/**
	 * 获取字典json
	 */
	@RequestMapping(value="/list")
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request) {
		Page<Map<String,Object>> page = getPage(request);	
		page= processDefinitionService.findProcessDefinitionList(page);
		return getEasyUIData(page);
	}
	
	/**
	 * 添加字典跳转
	 * 
	 * @param model
	 */
	@RequestMapping(value = "/toViewImage")
	public String toViewImage(String deploymentId,String diagramResourceName,Model model) {
		model.addAttribute("deploymentId", deploymentId);
		model.addAttribute("diagramResourceName",diagramResourceName);
		return "activiti/processDefinition/viewImage";
	}
	
	/**
	 * 查看流程图
	 * @throws Exception 
	 */
	@RequestMapping(value="/viewImage")
	public void viewImage(String deploymentId,String diagramResourceName,HttpServletResponse response) throws Exception{
	
		//2：获取资源文件表（act_ge_bytearray）中资源图片输入流InputStream
		byte[] bt = processDefinitionService.findImageInputStream(deploymentId,diagramResourceName);
		InputStream in =ByteToInputStream.byte2Input(bt);
		//3：从response对象获取输出流
		OutputStream out = response.getOutputStream();
		//4：将输入流中的数据读取出来，写到输出流中
		for(int b=-1;(b=in.read())!=-1;){
			out.write(b);
		}
		out.close();
		in.close();
		//将图写到页面上，用输出流写
	}

}
