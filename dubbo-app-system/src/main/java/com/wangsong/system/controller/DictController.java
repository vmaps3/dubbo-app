package com.wangsong.system.controller;

import com.wangsong.common.controller.BaseController;
import com.wangsong.common.model.CodeEnum;
import com.wangsong.common.model.Result;
import com.wangsong.system.model.Dict;
import com.wangsong.system.model.DictPage;
import com.wangsong.system.service.DictService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/system/dict")
public class DictController extends BaseController {
    @Autowired
    private DictService dictService;

    @RequiresPermissions("/system/dict/list")
    @RequestMapping(value = "/list")
    @ResponseBody
    public Result list(DictPage dict) {
        return new Result(CodeEnum.SUCCESS.getCode(), dictService.findTByPage(dict));
    }

    @RequiresPermissions("/system/dict/add")
    @RequestMapping(value = "/add")
    @ResponseBody
    public Result add(Dict dict) {
        dictService.insertDict(dict);
        return new Result(CodeEnum.SUCCESS.getCode(), null);
    }

    @RequiresPermissions("/system/dict/update")
    @RequestMapping(value = "/update")
    @ResponseBody
    public Result update(Dict dict) {
        Assert.notNull(dict.getId(), CodeEnum.NO_NULL.getCode());
        dictService.updateByPrimaryKeyDict(dict);
        return new Result(CodeEnum.SUCCESS.getCode(), null);

    }

    @RequiresPermissions("/system/dict/delete")
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Result delete(String[] id) {
        dictService.deleteByPrimaryKeyDict(id);
        return new Result(CodeEnum.SUCCESS.getCode(), null);

    }

    @RequestMapping(value = "/findDictByDict")
    @ResponseBody
    public Result findDictByDict(Dict dict) {
        return new Result(CodeEnum.SUCCESS.getCode(),dictService.findTByT(dict));
    }

    @RequestMapping(value = "/selectByPrimaryKey")
    @ResponseBody
    public Result selectByPrimaryKey(String id) {
        return new Result(CodeEnum.SUCCESS.getCode(), dictService.selectByPrimaryKey(id));
    }

}
