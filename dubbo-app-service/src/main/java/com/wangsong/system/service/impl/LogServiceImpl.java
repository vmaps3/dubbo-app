package com.wangsong.system.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangsong.common.service.impl.BaseServiceImpl;
import com.wangsong.system.model.Log;
import com.wangsong.system.service.LogService;

@Service("logService")
@Transactional
public class LogServiceImpl extends BaseServiceImpl<Log> implements LogService{
	
}
