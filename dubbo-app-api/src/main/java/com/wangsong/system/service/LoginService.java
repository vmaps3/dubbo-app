package com.wangsong.system.service;

import com.wangsong.common.model.Result;
import com.wangsong.system.model.DictPage;

public interface LoginService {
	Result loginPost(String username, String password);

	Result logoutJSON();
}
