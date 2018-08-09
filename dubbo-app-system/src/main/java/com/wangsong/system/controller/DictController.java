package com.wangsong.system.controller;

import com.wangsong.common.controller.BaseController;
import com.wangsong.common.model.CodeEnum;
import com.wangsong.common.model.GetEasyUIData;
import com.wangsong.common.model.Result;
import com.wangsong.system.model.Dict;
import com.wangsong.system.model.DictPage;
import com.wangsong.system.service.DictService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/system/dict")
public class DictController extends BaseController {
    @Autowired
    private DictService dictService;

    @RequiresPermissions("/system/dict/list")
    @RequestMapping(value = "/list")
    @ResponseBody
    public GetEasyUIData list(DictPage dict) {
        return dictService.findTByPage(dict);
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
    public List<Dict> findDictByDict(Dict dict) {
        return dictService.findTByT(dict);
    }

    @RequestMapping(value = "/selectByPrimaryKey")
    @ResponseBody
    public Dict selectByPrimaryKey(String id) {
        return dictService.selectByPrimaryKey(id);
    }

}
