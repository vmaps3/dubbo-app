package com.wangsong.user.rpc;


import com.wangsong.user.service.IProductsService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class UserApiServiceImpl implements UserApiService {
    @Autowired
    private IProductsService productsService;

    @Override
    public String rpc(String string) {
        return string;
    }


}
