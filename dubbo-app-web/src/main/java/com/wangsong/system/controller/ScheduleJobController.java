package com.wangsong.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.quartz.CronExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wangsong.system.model.ScheduleJob;
import com.wangsong.system.service.ScheduleJobService;


/**
 * 定时任务 controller
 * @author ty
 * @date 2015年1月14日
 */
@Controller
@RequestMapping("system/scheduleJob")
public class ScheduleJobController {
	
	@Autowired
	private ScheduleJobService scheduleJobService;
	
	@RequestMapping(value="/toList")
	public String toList() {
		return "system/scheduleJob/list";
	}
	
	@RequestMapping(value="/toAdd")
	public String toAdd() {
		return "system/scheduleJob/add";
	}
	
	@RequestMapping(value="/cron")
	public String cron() {
		return "system/scheduleJob/cron";
	}
	
	
	
	@RequestMapping(value="/toUpdate")
	public ModelAndView toUpdate(ScheduleJob scheduleJob) {
		ModelAndView mav= new ModelAndView("system/scheduleJob/update");
		mav.addObject("scheduleJob", scheduleJob);
		return mav;
	}
	
	/**
	 * 获取定时任务 json
	 */
	@RequestMapping("/list")
	@ResponseBody
	public Map<String, Object> getAllJobs(){
		List<ScheduleJob> scheduleJobs = scheduleJobService.getAllScheduleJob();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", scheduleJobs);
		map.put("total", scheduleJobs.size());
		return map;
	}
	
	
	/**
	 * 添加
	 * @param user
	 * @param model
	 */
	@RequestMapping(value = "/add")
	@ResponseBody
	public String create(ScheduleJob scheduleJob) {
		scheduleJobService.add(scheduleJob);
		return "success";
	}
	
	/**
	 * 暂停任务
	 */
	@RequestMapping("/stop")
	@ResponseBody
	public String stop(String[] name,String[] group) {
		scheduleJobService.stopJob(name,group);
		return "success";
	}

	/**
	 * 删除任务
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(String[] name,String[] group) {
		scheduleJobService.delJob(name,group);
		return "success";
	}

	/**
	 * 修改表达式
	 */
	@RequestMapping("/update")
	@ResponseBody
	public String update(ScheduleJob scheduleJob) {
		//验证cron表达式
		if(CronExpression.isValidExpression(scheduleJob.getCronExpression())){
			scheduleJobService.modifyTrigger(scheduleJob);
			return "success";
		}else{
			return "Cron表达式不正确";
		}
	}

	/**
	 * 立即运行一次
	 */
	@RequestMapping("/startNow")
	@ResponseBody
	public String stratNow(String[] name,String[] group) {
		scheduleJobService.startNowJob(name,group);
		return "success";
	}

	/**
	 * 恢复
	 */
	@RequestMapping("/resume")
	@ResponseBody
	public String resume(String[] name,String[] group) {
		scheduleJobService.restartJob(name,group);
		return "success";
	}

	
}
