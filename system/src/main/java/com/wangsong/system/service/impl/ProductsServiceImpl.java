package com.wangsong.system.service.impl;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.wangsong.system.entity.Products;
import com.wangsong.system.entity.ProductsES;
import com.wangsong.system.entity.ProductsRedis;
import com.wangsong.system.mapper.ProductsESRepository;
import com.wangsong.system.mapper.ProductsMapper;
import com.wangsong.system.mapper.ProductsRedisSupport;
import com.wangsong.system.rpc.SystemApiService;
import com.wangsong.system.service.IProductsService;
import org.apache.dubbo.config.annotation.Reference;
import org.elasticsearch.index.query.QueryBuilders;
import org.redisson.api.RAtomicLong;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author jobob
 * @since 2021-09-25
 */
@Service
public class ProductsServiceImpl extends ServiceImpl<ProductsMapper, Products> implements IProductsService {


    @Reference(check = false)
    private SystemApiService systemApiService;

    @Autowired
    private RedissonClient redissonClient;
    @Autowired
    private ProductsESRepository productsRepository;
    @Autowired
    private ProductsRedisSupport productsRedisSupport;

    @Autowired
    private AmqpTemplate template;

    //添加商品
    @Override
    public void add(Products products) {
        save(products);

        RAtomicLong productsAtomicLong = redissonClient.getAtomicLong("ProductsAtomicLong" + products.getId());
        productsAtomicLong.getAndAdd(products.getStock());

        template.convertAndSend("products", products);


    }


    @Override
    public void mqToES(Products products) {
        RLock lock = redissonClient.getLock("products" + products.getId());
        try {
            lock.lock();
            String str = JSONObject.toJSONString(products);
            ProductsES productsES = JSONObject.parseObject(str, ProductsES.class);
            productsRepository.delete(productsES);
            productsRepository.save(productsES);

            ProductsRedis productsRedis = JSONObject.parseObject(str, ProductsRedis.class);

            productsRedisSupport.delete(productsRedis);
        } finally {
            lock.unlock();
        }


    }

    @Override
    public Long productsStockDecrement(Long id) {
        RLock lock = redissonClient.getLock("products" + id);
        try {
            lock.lock();
            RAtomicLong productsAtomicLong = redissonClient.getAtomicLong("ProductsAtomicLong" + id);
            long l = productsAtomicLong.get();
            if (l == 0) {
                return 0L;
            }
            return productsAtomicLong.getAndDecrement();
        } finally {
            lock.unlock();
        }
    }

    @Override
    public Long productsStockAdd(Long id) {
        RLock lock = redissonClient.getLock("products" + id);
        try {
            lock.lock();
            RAtomicLong productsAtomicLong = redissonClient.getAtomicLong("ProductsAtomicLong" + id);
            return productsAtomicLong.getAndIncrement();
        } finally {
            lock.unlock();
        }
    }


    //商品列表
    @Override
    public List<Products> lists(Products productsPage) {
        NativeSearchQueryBuilder nativeSearchQueryBuilder = new NativeSearchQueryBuilder();
        if (StrUtil.isNotBlank(productsPage.getName())) {
            nativeSearchQueryBuilder.withQuery(
                    QueryBuilders.matchPhraseQuery("name",
                    productsPage.getName()));
        }
        NativeSearchQuery build = nativeSearchQueryBuilder.build();
        Page<ProductsES> search = productsRepository.search(build);
        List<ProductsES> content = search.getContent();

        List<Products> list = new ArrayList<>();

        for (ProductsES productsES : content) {
            Products products = getProductsById(Long.valueOf(productsES.getId()));
            list.add(products);
        }

        return list;
    }


    @Override
    public void deleteESAll() {
        productsRepository.deleteAll();
    }

    @Override
    public Products getProductsById(Long id) {
        Optional<ProductsRedis> byId = productsRedisSupport.findById(String.valueOf(id));
        if (!byId.isPresent()) {
            String str = JSONObject.toJSONString(byId.get());
            Products products = JSONObject.parseObject(str, Products.class);
            return products;
        }
        RLock lock = redissonClient.getLock("products" + id);
        try {
            lock.lock();
            byId = productsRedisSupport.findById(String.valueOf(id));
            if (byId.isPresent()) {
                Products products = getById(id);
                String str = JSONObject.toJSONString(products);
                ProductsRedis productsRedis = JSONObject.parseObject(str, ProductsRedis.class);
                productsRedisSupport.save(productsRedis);
                return products;
            }
            String str = JSONObject.toJSONString(byId.get());
            Products products = JSONObject.parseObject(str, Products.class);
            return products;
        } finally {
            lock.unlock();
        }

    }

    //5 4
    //4 5
    @Override
    public void updateProductsById(Products products) {
        updateById(products);

        template.convertAndSend("products", products);


    }
}
