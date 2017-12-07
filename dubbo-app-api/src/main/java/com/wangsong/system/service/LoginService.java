package com.wangsong.system.service;

import com.wangsong.common.model.Result;

public interface LoginService {
	Result loginPost(String username, String password);

	Result logoutJSON();

	Result index();

	Result unauth();
}
