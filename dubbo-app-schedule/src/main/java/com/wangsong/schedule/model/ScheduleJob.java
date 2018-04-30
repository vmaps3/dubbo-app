package com.wangsong.schedule.model;

import java.io.Serializable;

/**
 * 定时任务pojo
 * @author ty
 * @date 2015年1月13日
 */
public class ScheduleJob implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7443454565979676171L;
	private String name;	//任务名
	private String group;	//任务组
	private String cronExpression;	//cron表达式
	private String status;	//状态
	private String className;	//要执行的任务类路径名
	private String previousFireTime;
	private String nextFireTime;
	
	
	
	public String getPreviousFireTime() {
		return previousFireTime;
	}

	public void setPreviousFireTime(String previousFireTime) {
		this.previousFireTime = previousFireTime;
	}

	public String getNextFireTime() {
		return nextFireTime;
	}

	public void setNextFireTime(String nextFireTime) {
		this.nextFireTime = nextFireTime;
	}

	public ScheduleJob() {
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCronExpression() {
		return cronExpression;
	}

	public void setCronExpression(String cronExpression) {
		this.cronExpression = cronExpression;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

}
