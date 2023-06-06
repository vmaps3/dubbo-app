package com.wangsong.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wangsong.system.entity.Products;

import java.util.HashMap;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author jobob
 * @since 2021-09-25
 */
public interface IProductsService extends IService<Products> {

    void add(Products products);

    HashMap<String, Object> lists(Products productsPage);
}
