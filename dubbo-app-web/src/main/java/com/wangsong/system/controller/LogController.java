package com.wangsong.system.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangsong.common.controller.BaseController;
import com.wangsong.common.model.Page;
import com.wangsong.system.model.Log;
import com.wangsong.system.service.LogService;

@Controller
@RequestMapping("/system/log")
public class LogController extends BaseController{
	@Autowired
	private LogService logService;
	
	@RequestMapping(value="/toList")
	public String toList() {
		return "system/log/list";
	}
	
	@RequiresPermissions("/system/log/list")
	@RequestMapping(value="/list")
	@ResponseBody
	public Object list(HttpServletRequest request,Log log) {
		Page<Log> page = getPage(request);
		page = logService.findTByPage(page,log);
		return getEasyUIData(page);
	}

	@RequiresPermissions("/system/log/delete")
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(String[] id) {
		Map<String, Object>	map=new HashMap<>();
		logService.deleteByPrimaryKey(id);
		return map;
	}
}