package com.wangsong.system.controller;


import com.wangsong.common.controller.BaseController;
import com.wangsong.common.model.CodeEnum;
import com.wangsong.common.model.Result;
import com.wangsong.system.model.Resources;
import com.wangsong.system.service.ResourcesService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/system/resources")
public class ResourcesController extends BaseController {
    @Autowired
    private ResourcesService resourcesService;

    @RequiresPermissions("/system/resources/add")
    @RequestMapping(value = "/add")
    @ResponseBody
    public Result add(Resources resources) {
        resourcesService.insertResources(resources);
        return new Result(CodeEnum.SUCCESS.getCode(), null);
    }

    @RequiresPermissions("/system/resources/delete")
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Result delete(String[] id) {
        resourcesService.deleteResources(id);
        return new Result(CodeEnum.SUCCESS.getCode(), null);
    }


    @RequiresPermissions("/system/resources/update")
    @RequestMapping(value = "/update")
    @ResponseBody
    public Result update(Resources resources) {
        resourcesService.updateResources(resources);
        return new Result(CodeEnum.SUCCESS.getCode(), null);

    }

    @RequiresPermissions("/system/resources/list")
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list() {
        return resourcesService.findResources();
    }


    @RequestMapping(value = "/findResourcesEMUByResources")
    @ResponseBody
    public Object findResourcesEMUByResources() {
        return resourcesService.findResourcesEMUByResources();
    }


    @RequestMapping(value = "/selectByPrimaryKey")
    @ResponseBody
    public Object selectByPrimaryKey(String id) {
        return resourcesService.selectByPrimaryKey(id);
    }

}
