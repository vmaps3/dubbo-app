package com.wangsong.system.service;

import com.wangsong.common.model.Result;

import javax.servlet.http.HttpServletRequest;

public interface LoginService {
	Result loginPost(String username, String password);

	Result logoutJSON();

	Result index();

	Result unauth();

	Result getStatus(HttpServletRequest request);
}
