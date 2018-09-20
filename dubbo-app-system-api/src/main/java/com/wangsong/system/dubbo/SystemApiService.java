package com.wangsong.system.dubbo;

import com.wangsong.common.model.Result;
import com.wangsong.system.model.Resources;
import com.wangsong.system.model.User;

import java.util.List;


public interface SystemApiService {

    public Result<User> findUserByUser(User user);

    public Result<List<Resources>> findResourcesByResources(Resources resources);
}
