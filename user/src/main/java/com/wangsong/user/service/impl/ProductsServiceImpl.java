package com.wangsong.user.service.impl;


import com.wangsong.user.rpc.UserApiService;
import com.wangsong.user.service.IProductsService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author jobob
 * @since 2021-09-25
 */
@Service
public class ProductsServiceImpl implements IProductsService {


    @Reference(check = false)
    private UserApiService systemApiService;


}
