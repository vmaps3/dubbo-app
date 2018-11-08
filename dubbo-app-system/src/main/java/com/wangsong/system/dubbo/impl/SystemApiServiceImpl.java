package com.wangsong.system.dubbo.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.wangsong.common.model.CodeEnum;
import com.wangsong.common.model.Result;
import com.wangsong.system.dubbo.SystemApiService;
import com.wangsong.system.model.Resources;
import com.wangsong.system.model.User;
import com.wangsong.system.service.ResourcesService;
import com.wangsong.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class SystemApiServiceImpl implements SystemApiService {
    @Autowired
    private UserService userService;

    @Autowired
    private ResourcesService resourcesService;

    @Override
    public Result<User> findUserByUser(User user) {
        return new Result(CodeEnum.SUCCESS.getCode(), userService.findTByT(user));
    }

    @Override
    public Result<List<Resources>> findResourcesByResources(Resources resources) {
        return new Result(CodeEnum.SUCCESS.getCode(), resourcesService.findTByT(resources));
    }


}
