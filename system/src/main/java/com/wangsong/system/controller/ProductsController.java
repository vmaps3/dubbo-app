package com.wangsong.system.controller;


import com.wangsong.system.entity.Products;
import com.wangsong.system.service.IProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.HashMap;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author jobob
 * @since 2021-09-25
 */
@RestController
@RequestMapping("/products")
public class ProductsController {
    @Autowired
    private IProductsService productsService;

    //127.0.0.1:1101/system/products/add?name=111&stock=30&amount=5
    @GetMapping(value = "/add")
    public String add(Products products) {
        productsService.add(products);

        return "1";
    }
    //http://127.0.0.1:1101/system/products/list?name=111
    @GetMapping(value = "/list")
    public HashMap<String, Object> list(Products products) {
        HashMap<String, Object> lists = productsService.lists(products);
        return lists;
    }

}
