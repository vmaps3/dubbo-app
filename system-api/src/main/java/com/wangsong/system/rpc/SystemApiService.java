package com.wangsong.system.rpc;


import com.wangsong.common.model.Result;
import com.wangsong.system.model.UserDO;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.math.BigDecimal;
import java.util.List;

public interface SystemApiService extends UserDetailsService {
    Result<UserDetails> getUser(String user);

    Result<UserDO> getUser(UserDO userDO);

    Result updateUser(List<UserDO> userDOs);

    Result saveUserAmountHistory(Long userId,
                                 BigDecimal amount);
}
