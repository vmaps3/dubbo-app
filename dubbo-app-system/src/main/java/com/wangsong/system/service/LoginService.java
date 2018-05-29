package com.wangsong.system.service;

import javax.servlet.http.HttpServletRequest;

import com.wangsong.common.model.Result;

public interface LoginService {
	Result loginPost(String username, String password);

	Result logoutJSON();

	Result index();

	Result unauth();

	Result getStatus(HttpServletRequest request);
}
