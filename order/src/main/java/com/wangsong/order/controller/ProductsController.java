package com.wangsong.order.controller;


import com.wangsong.common.model.CodeEnum;
import com.wangsong.common.model.Result;
import com.wangsong.order.entity.Products;
import com.wangsong.order.entity.ProductsES;
import com.wangsong.order.service.IProductsService;
import com.wangsong.order.vo.ProductsPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.wangsong.common.controller.BaseController;

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
@RequestMapping("/order/products")
public class ProductsController extends BaseController {
    @Autowired
    private IProductsService productsService;

    @PostMapping(value = "/add")
    public Result add(Products products) {
        productsService.add(products);

        return new Result(CodeEnum.SUCCESS.getCode(), null);
    }

    @PostMapping(value = "/update")
    public Result update(Products products) {
        productsService.updates(products);
        return new Result(CodeEnum.SUCCESS.getCode(), null);
    }

    @GetMapping(value = "/list")
    public Result list(ProductsPage productsPage) {
        HashMap<String, Object> lists = productsService.lists(productsPage);
        return new Result(CodeEnum.SUCCESS.getCode(), lists);
    }

    @GetMapping(value = "/selectByPrimaryKey")
    public Result selectByPrimaryKey(Long id) {
        Products products= productsService.selectByPrimaryKey(id);
        return new Result(CodeEnum.SUCCESS.getCode(), products);
    }

}