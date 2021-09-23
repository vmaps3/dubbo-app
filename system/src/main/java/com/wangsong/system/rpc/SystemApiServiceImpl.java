package com.wangsong.system.rpc;


import com.wangsong.common.model.Result;
import com.wangsong.system.service.IUserService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

@Service
public class SystemApiServiceImpl implements SystemApiService {

    @Autowired
    private IUserService userService;



    @Override
    public com.wangsong.common.model.Result<UserDetails> getUser(String user) {
        UserDetails userDetails = userService.loadUserByUsername(user);
        return new Result("",userDetails);
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        return null;
    }
}
