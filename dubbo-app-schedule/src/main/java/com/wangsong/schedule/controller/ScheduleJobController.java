package com.wangsong.schedule.controller;


import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
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


    /**
     * 获取定时任务 json
     */
    @RequiresPermissions("888")
    @RequestMapping("/list")
    @ResponseBody
    public Object getAllJobs() {

        return new HashMap<>();
    }

    @RequestMapping(value = "/test3list")
    @ResponseBody
    @Cacheable(value = "test3", key = "#id")
    public Object test3list(String id) {
        System.out.println(id);
        return id;
    }

    @RequestMapping(value = "/test3del")
    @ResponseBody
    @CacheEvict(value = "test3", key = "#id")
    public Object test3del(String id) {
        System.out.println(id);
        return id;
    }

    @RequestMapping(value = "/test3add")
    @ResponseBody
    @CachePut(value = "test3", key = "#id")
    public Object test3add(String id) {
        System.out.println(id);
        return id;
    }
}
