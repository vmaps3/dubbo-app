package com.wangsong.common.util;

import org.apache.shiro.SecurityUtils;

public class UserUtil {
	/**
	 * 获取当前用户对象shiro
	 * @return shirouser
	 */
	public static Object getUser(){
		Object user=SecurityUtils.getSubject().getPrincipal();
		return user;
	}
	

}
 