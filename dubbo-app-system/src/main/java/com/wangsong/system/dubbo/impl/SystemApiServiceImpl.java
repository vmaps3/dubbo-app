package com.wangsong.system.dubbo.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.wangsong.system.model.CustomUserDetails;
import com.wangsong.system.dubbo.SystemApiService;
import com.wangsong.system.model.Resources;
import com.wangsong.system.model.User;
import com.wangsong.system.service.ResourcesService;
import com.wangsong.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.List;

@Service
public class SystemApiServiceImpl implements SystemApiService {


    @Override
    public String add(String text) {
        return text;
    }
}
