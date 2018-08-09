package com.wangsong.system.service;

import javax.servlet.http.HttpServletRequest;

public interface LoginService {

    String loginPost(String username, String password);

    void logoutJSON();

    String getStatus(HttpServletRequest request);
}
