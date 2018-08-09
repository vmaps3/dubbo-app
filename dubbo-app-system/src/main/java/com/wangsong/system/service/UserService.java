package com.wangsong.system.service;

import com.wangsong.common.model.GetEasyUIData;
import com.wangsong.system.model.User;
import com.wangsong.system.model.UserAddModel;
import com.wangsong.system.model.UserPage;
import com.wangsong.system.model.UserRole;
import com.wangsong.system.vo.UserVO;

public interface UserService {

    User selectByPrimaryKey();

    void insertUser(UserAddModel muser);

    void updateUser(UserAddModel muser);

    void deleteUser(String[] id);

    void updatePassword(UserAddModel u);

    GetEasyUIData findTByPage(UserPage user);

    UserVO selectByPrimaryKey(String id);

    User findTByT(User user);

    void deleteByT(UserRole[] u);


}
