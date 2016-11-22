package com.wangsong.system.service.impl;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangsong.common.service.impl.BaseServiceImpl;
import com.wangsong.system.model.Dict;
import com.wangsong.system.service.DictService;

@Service("dictService")
@Transactional
public class DictServiceImpl extends BaseServiceImpl<Dict> implements DictService{

}
