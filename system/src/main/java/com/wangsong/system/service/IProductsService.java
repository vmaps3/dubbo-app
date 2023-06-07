package com.wangsong.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wangsong.system.entity.Products;

import java.util.List;

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

    Long productsStockDecrement(Long id);

    Long productsStockAdd(Long id);

    List<Products> lists(Products productsPage);

    void mqToES(Products products);

    void deleteESAll();

    Products getProductsById(Long id);

    void updateProductsById(Products products);
}
