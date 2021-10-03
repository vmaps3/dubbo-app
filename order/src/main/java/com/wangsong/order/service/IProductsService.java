package com.wangsong.order.service;

import com.wangsong.order.entity.Products;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wangsong.order.vo.ProductsPage;

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

    void updates(Products products);

    HashMap<String, Object> lists(ProductsPage productsPage);

    Products selectByPrimaryKey(Long id);
}
