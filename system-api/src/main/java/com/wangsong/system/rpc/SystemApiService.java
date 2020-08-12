package com.wangsong.system.rpc;


import com.wangsong.common.model.Result;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface SystemApiService extends UserDetailsService {
    Result<UserDetails> getUser(String user);

}
