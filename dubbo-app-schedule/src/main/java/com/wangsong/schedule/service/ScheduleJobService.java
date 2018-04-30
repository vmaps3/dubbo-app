package com.wangsong.schedule.service;

import com.wangsong.common.model.GetEasyUIData;
import com.wangsong.common.model.Result;
import com.wangsong.schedule.model.ScheduleJob;

public interface ScheduleJobService{
	public Result add(ScheduleJob scheduleJob);
	public GetEasyUIData getAllScheduleJob();	
	public Result modifyTrigger(ScheduleJob scheduleJob);
	
	public Result restartJob(String[] name,String[] group);
	public Result startNowJob(String[] name,String[] group);
	public Result delJob(String[] name,String[] group);
	public Result stopJob(String[] name,String[] group);
}
