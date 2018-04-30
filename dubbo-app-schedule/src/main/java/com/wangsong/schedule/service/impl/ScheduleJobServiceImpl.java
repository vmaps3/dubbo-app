package com.wangsong.schedule.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.quartz.impl.matchers.GroupMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wangsong.common.model.GetEasyUIData;
import com.wangsong.common.model.Result;
import com.wangsong.common.util.DateUtils;
import com.wangsong.schedule.model.ScheduleJob;
import com.wangsong.schedule.service.ScheduleJobService;







/**
 * 定时任务 service
 * @author ty
 * @date 2015年1月13日
 */
@Service
public class ScheduleJobServiceImpl implements ScheduleJobService{
	private static Logger log = Logger.getLogger(ScheduleJobServiceImpl.class);
	@Autowired
	private Scheduler scheduler;
	
	/**
	 * 添加定时任务
	 * @param ScheduleJob
	 * @return 
	 */
	public Result add(ScheduleJob scheduleJob){
		@SuppressWarnings("rawtypes")
		Class job = null;
		try {
			job = Class.forName(scheduleJob.getClassName());
		} catch (ClassNotFoundException e1) {
			log.warn("出现异常"+e1);
		}
		@SuppressWarnings("unchecked")
		JobDetail jobDetail = JobBuilder.newJob(job).withIdentity(scheduleJob.getName(), scheduleJob.getGroup()).build(); 
		//表达式调度构建器（可判断创建SimpleScheduleBuilder）
		CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(scheduleJob.getCronExpression());
		jobDetail.getJobDataMap().put("scheduleJob", scheduleJob);
		//按新的cronExpression表达式构建一个新的trigger
		CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(scheduleJob.getName(), scheduleJob.getGroup()).withSchedule(scheduleBuilder).build();
		try {
			scheduler.scheduleJob(jobDetail, trigger);
		} catch (SchedulerException e) {
			log.warn("出现异常"+e);
		}
		return  new Result("success",null);
	}

	
	/**
	 * 获取所有计划中的任务
	 * @return 结果集合
	 */
	public GetEasyUIData getAllScheduleJob(){
		List<ScheduleJob> scheduleJobList=new ArrayList<ScheduleJob>();
		GroupMatcher<JobKey> matcher = GroupMatcher.anyJobGroup();
		try {
			Set<JobKey> jobKeys = scheduler.getJobKeys(matcher);
			for (JobKey jobKey : jobKeys) {
			    List<? extends Trigger> triggers = scheduler.getTriggersOfJob(jobKey);
			    for (Trigger trigger : triggers) {
			        ScheduleJob scheduleJob = new ScheduleJob();
			        scheduleJob.setName(jobKey.getName());
			        scheduleJob.setGroup(jobKey.getGroup());
			        if(trigger.getPreviousFireTime()!=null){
			        	 scheduleJob.setPreviousFireTime(DateUtils.formatDateTime(trigger.getPreviousFireTime())); 
			        }
			        if(trigger.getNextFireTime()!=null){
			        	scheduleJob.setNextFireTime(DateUtils.formatDateTime(trigger.getNextFireTime()));
			        }
			        Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
			        scheduleJob.setStatus(triggerState.name());
			        //获取要执行的定时任务类名
			        JobDetail jobDetail=scheduler.getJobDetail(jobKey);
				    scheduleJob.setClassName(jobDetail.getJobClass().getName());
				  
					if (trigger instanceof CronTrigger) {
						CronTrigger cron = (CronTrigger) trigger;
						scheduleJob.setCronExpression(cron.getCronExpression());
					}
			        scheduleJobList.add(scheduleJob);
			    }
			}
		} catch (Exception e) {
			log.warn("出现异常"+e);
		}
		
		return new GetEasyUIData(scheduleJobList,scheduleJobList.size());
	}
	

	/**
	 * 恢复任务
	 * @param name 任务名
	 * @param group 任务组
	 * @return 
	 */
	public Result restartJob(String[] name,String[] group){
		for(int i=0;i<name.length;i++){
			JobKey key = new JobKey(name[i], group[i]);
			try {
				scheduler.resumeJob(key);
			} catch (SchedulerException e) {
				log.warn("出现异常"+e);
			}
		}
		return  new Result("success",null);
	}
	
	/**
	 * 立马执行一次任务
	 * @param name 任务名
	 * @param group 任务组
	 * @return 
	 */
	public Result startNowJob(String[] name,String[] group){
		for(int i=0;i<name.length;i++){
			JobKey jobKey = JobKey.jobKey(name[i], group[i]);
			try {
				scheduler.triggerJob(jobKey);
			} catch (SchedulerException e) {
				log.warn("出现异常"+e);
			}
		}
		return  new Result("success",null);
	}
	
	/**
	 * 删除任务
	 * @param name 任务名
	 * @param group 任务组
	 * @return 
	 */
	public Result delJob(String[] name,String[] group){
		for(int i=0;i<name.length;i++){
			JobKey key = new JobKey(name[i], group[i]);
			try {
				scheduler.deleteJob(key);
			} catch (SchedulerException e) {
				log.warn("出现异常"+e);
			}
		}
		return  new Result("success",null);
	}
	
	/**
	 * 修改触发器时间
	 * @param name 任务名
	 * @param group 任务组
	 * @param cron cron表达式
	 * @return 
	 */
	public Result modifyTrigger(ScheduleJob scheduleJob){
		try {  
            TriggerKey key = TriggerKey.triggerKey(scheduleJob.getName(), scheduleJob.getGroup());  
            //Trigger trigger = scheduler.getTrigger(key);  
              
            CronTrigger newTrigger = (CronTrigger) TriggerBuilder.newTrigger()  
                    .withIdentity(key)  
                    .withSchedule(CronScheduleBuilder.cronSchedule(scheduleJob.getCronExpression()))  
                    .build();  
            scheduler.rescheduleJob(key, newTrigger);  
        } catch (SchedulerException e) {  
        	log.warn("出现异常"+e);
        }  
		return  new Result("success",null);
	}

	/**
	 * 暂停任务
	 * @param name 任务名
	 * @param group 任务组
	 * @return 
	 */
	public Result stopJob(String[] name,String[] group){
		for(int i=0;i<name.length;i++){
			JobKey key = new JobKey(name[i], group[i]);
			try {
				scheduler.pauseJob(key);
			} catch (SchedulerException e) {
				log.warn("出现异常"+e);
			}
		}
		return  new Result("success",null);
	}
}
