package com.wangsong.system.rpc;


import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.wangsong.common.model.Result;
import com.wangsong.system.entity.User;
import com.wangsong.system.entity.UserAmountHistory;
import com.wangsong.system.model.UserDO;
import com.wangsong.system.service.IUserAmountHistoryService;
import com.wangsong.system.service.IUserService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class SystemApiServiceImpl implements SystemApiService {

    @Autowired
    private IUserService userService;

    @Autowired
    private IUserAmountHistoryService userAmountHistoryService;

    @Override
    public Result<UserDetails> getUser(String user) {
        UserDetails userDetails = userService.loadUserByUsername(user);
        return new Result("", userDetails);
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        return null;
    }

    @Override
    public Result<UserDO> getUser(UserDO userDO) {
        QueryWrapper queryWrapper = new QueryWrapper();
        if (ObjectUtil.isNotEmpty(userDO.getId())) {
            queryWrapper.eq("id", userDO.getId());
        }

        if (StrUtil.isNotBlank(userDO.getUsername())) {
            queryWrapper.eq("username", userDO.getUsername());

        }
        User userDetails = userService.getOne(queryWrapper);
        UserDO userDO2 = new UserDO();
        BeanUtils.copyProperties(userDetails, userDO2);
        return new Result("", userDO2);
    }

    @Override
    public Result updateUser(List<UserDO> userDOs) {

        List<User> users = new ArrayList<>();
        for (UserDO userDO : userDOs) {
            User user = new User();
            BeanUtils.copyProperties(userDO, user);
            users.add(user);
        }

        userService.updateBatchById(users);
        return new Result("", null);
    }

    @Override
    public Result saveUserAmountHistory(Long userId,
                                        BigDecimal amount) {
        UserAmountHistory userAmountHistory = new UserAmountHistory();
        userAmountHistory.setUserId(userId);
        userAmountHistory.setAmount(amount);
        userAmountHistoryService.save(userAmountHistory);
        return new Result("", null);
    }
}
