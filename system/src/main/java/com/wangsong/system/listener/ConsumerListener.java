package com.wangsong.system.listener;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import com.wangsong.system.entity.Products;
import com.wangsong.system.entity.ProductsES;
import com.wangsong.system.entity.ProductsRedis;
import com.wangsong.system.mapper.ProductsESRepository;
import com.wangsong.system.mapper.ProductsRedisSupport;
import com.wangsong.system.service.IProductsService;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;

@Component
public class ConsumerListener {

    @Autowired
    private ProductsESRepository productsRepository;
    @Autowired
    private IProductsService productsService;
    @Autowired
    private ProductsRedisSupport productsRedisSupport;


    //队列接受 binglog写入缓存
    @RabbitListener(queues = "products")
    public void test(Products products) {
        String str = JSONObject.toJSONString(products);
        ProductsES productsES = JSONObject.parseObject(str,ProductsES.class);
        ProductsRedis productsRedis = JSONObject.parseObject(str,ProductsRedis.class);



        productsRepository.save(productsES);
        productsRedisSupport.save(productsRedis);

    }
}  