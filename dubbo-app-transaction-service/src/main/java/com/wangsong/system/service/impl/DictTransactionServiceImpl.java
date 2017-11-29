package com.wangsong.system.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangsong.common.service.impl.BaseServiceImpl;
import com.wangsong.system.model.Dict;
import com.wangsong.system.model.DictTransaction;
import com.wangsong.system.model.DictTransaction2;
import com.wangsong.system.model.User;
import com.wangsong.system.service.DictTransaction2Service;
import com.wangsong.system.service.DictTransactionService;
import com.wangsong.system.service.UserService;

@Service("dictTransactionService")
@Transactional
public class DictTransactionServiceImpl extends BaseServiceImpl<DictTransaction> implements DictTransactionService{
	@Autowired
	private DictTransaction2Service dictTransaction2Service;
	
	@Override
	public int inset2() {
		DictTransaction dict2=new DictTransaction();
		int z=insert(dict2);
		DictTransaction2 dict=new DictTransaction2();
		int f=dictTransaction2Service.insert(dict);
		if(f==1){
			throw new RuntimeException();
		}
		return z;
		
		
	}
}
