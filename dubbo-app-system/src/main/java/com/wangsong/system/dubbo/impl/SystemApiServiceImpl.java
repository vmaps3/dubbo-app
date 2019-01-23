package com.wangsong.system.dubbo.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.wangsong.system.dubbo.SystemApiService;

@Service
public class SystemApiServiceImpl implements SystemApiService {


    @Override
    public String add(String text) {
        return text;
    }
}
