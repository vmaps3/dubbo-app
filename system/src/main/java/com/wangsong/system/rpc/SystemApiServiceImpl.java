package com.wangsong.system.rpc;


import org.apache.dubbo.config.annotation.Service;

@Service
public class SystemApiServiceImpl implements SystemApiService {


    @Override
    public String add(String text) {
        return text;
    }
}