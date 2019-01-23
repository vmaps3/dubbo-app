package com.wangsong.schedule.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.wangsong.system.dubbo.SystemApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;


/**
 * 定时任务 controller
 *
 * @author ty
 * @date 2015年1月14日
 */
@Controller
@RequestMapping("/schedule/schedule")
public class ScheduleJobController {

    @Reference(check = false)
    private SystemApiService systemApiService;
    /**
     * 获取定时任务 json
     */
    @PreAuthorize("hasAuthority('/system/dict/list')")
    @RequestMapping("/list")
    @ResponseBody
    public Object getAllJobs() {

        return new HashMap<>();
    }

    @RequestMapping("/add")
    @ResponseBody
    public Object add(String text) {

        return systemApiService.add(text);
    }


}
