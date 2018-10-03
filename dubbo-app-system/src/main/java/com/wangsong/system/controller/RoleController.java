package com.wangsong.system.controller;


import com.wangsong.common.controller.BaseController;
import com.wangsong.common.model.CodeEnum;
import com.wangsong.common.model.Result;
import com.wangsong.system.model.RoleAddModel;
import com.wangsong.system.model.RolePage;
import com.wangsong.system.service.RoleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/system/role")
public class RoleController extends BaseController {
    @Autowired
    private RoleService roleService;


    @RequiresPermissions("/system/role/list")
    @RequestMapping(value = "/list")
    @ResponseBody
    public Result list(HttpServletRequest request, RolePage role) {
        return new Result(CodeEnum.SUCCESS.getCode(), roleService.findTByPage(role));
    }


    @RequiresPermissions("/system/role/add")
    @RequestMapping(value = "/add")
    @ResponseBody
    public Result add(RoleAddModel role) {
        roleService.insertRole(role);
        return new Result(CodeEnum.SUCCESS.getCode(), null);

    }

    @RequiresPermissions("/system/role/delete")
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Result delete(String[] id) {
        roleService.deleteRole(id);
        return new Result(CodeEnum.SUCCESS.getCode(), null);
    }

    @RequiresPermissions("/system/role/update")
    @RequestMapping(value = "/update")
    @ResponseBody
    public Result update(RoleAddModel mrole) {
        Assert.notNull(mrole.getId(), CodeEnum.NO_NULL.getCode());
        roleService.updateRole(mrole);
        return new Result(CodeEnum.SUCCESS.getCode(), null);
    }

    @RequestMapping(value = "/listAll")
    @ResponseBody
    public Result listAll() {
        return new Result(CodeEnum.SUCCESS.getCode(), roleService.selectAll());
    }

    @RequestMapping(value = "/selectByPrimaryKey")
    @ResponseBody
    public Result selectByPrimaryKey(String id) {
        return new Result(CodeEnum.SUCCESS.getCode(), roleService.selectByPrimaryKey(id));
    }

}
