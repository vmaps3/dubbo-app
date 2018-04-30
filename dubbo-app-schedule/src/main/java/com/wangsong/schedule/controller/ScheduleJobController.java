package com.wangsong.schedule.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangsong.schedule.model.ScheduleJob;
import com.wangsong.schedule.service.ScheduleJobService;






/**
 * 定时任务 controller
 * @author ty
 * @date 2015年1月14日
 */
@Controller
@RequestMapping("/schedule/schedule")
public class ScheduleJobController {
	
	@Autowired
	private ScheduleJobService scheduleJobService;
	
	
	
	/**
	 * 获取定时任务 json
	 */
	@RequestMapping("/list")
	@ResponseBody
	public Object getAllJobs(){
		return scheduleJobService.getAllScheduleJob();
	}
	
	
	/**
	 * 添加
	 * @param user
	 * @param model
	 */
	@RequestMapping(value = "/add")
	@ResponseBody
	public Object create(ScheduleJob scheduleJob) {
		return  scheduleJobService.add(scheduleJob);
	}
	
	/**
	 * 暂停任务
	 */
	@RequestMapping("/stop")
	@ResponseBody
	public Object stop(String[] name,String[] group) {
		return scheduleJobService.stopJob(name,group);
	}

	/**
	 * 删除任务
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(String[] name,String[] group) {
		return scheduleJobService.delJob(name,group);
	}

	/**
	 * 修改表达式
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Object update(ScheduleJob scheduleJob) {
		return scheduleJobService.modifyTrigger(scheduleJob);
	}

	/**
	 * 立即运行一次
	 */
	@RequestMapping("/startNow")
	@ResponseBody
	public Object stratNow(String[] name,String[] group) {
		return scheduleJobService.startNowJob(name,group);
	}

	/**
	 * 恢复
	 */
	@RequestMapping("/resume")
	@ResponseBody
	public Object resume(String[] name,String[] group) {
		return scheduleJobService.restartJob(name,group);
	}

	
}
