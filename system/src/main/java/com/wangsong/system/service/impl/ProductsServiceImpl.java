package com.wangsong.system.service.impl;

import cn.hutool.core.collection.ListUtil;
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
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
    private ProductsESRepository productsRepository;
    @Autowired
    private ProductsRedisSupport productsRedisSupport;

    @Autowired
    private AmqpTemplate template;
    //添加商品
    @Override
    @Transactional
    public void add(Products products) {
        save(products);
        template.convertAndSend("products", products);
    }


    //商品列表
    @Override
    public HashMap<String, Object> lists(Products productsPage) {

        HashMap<String, Object> map = new HashMap<>();
        //IPage<ProductsES> page = new Page<>(productsPage.getPage(), productsPage.getRows());
        //QueryWrapper queryWrapper = new QueryWrapper();
        NativeSearchQueryBuilder nativeSearchQueryBuilder = new NativeSearchQueryBuilder();
        if (StrUtil.isNotBlank(productsPage.getName())) {
            //queryWrapper.eq("name", productsPage.getName());
            nativeSearchQueryBuilder.withQuery(QueryBuilders.matchPhraseQuery("name",
                    productsPage.getName()));
        }


        NativeSearchQuery build = nativeSearchQueryBuilder.build();
        Page<ProductsES> search = productsRepository.search(build);


        //IPage<ProductsES> page1 = page(page, queryWrapper);
        List<ProductsES> content = search.getContent();

        List<String> list = new ArrayList<>();

        for (ProductsES productsES : content) {
            list.add(productsES.getId());
        }

        Iterable<ProductsRedis> productsRedisList = productsRedisSupport.findAllById(list);

        ArrayList<ProductsRedis> productsRedis1 = ListUtil.toList(productsRedisList);

        String s = JSONObject.toJSONString(productsRedis1);


        List<Products> productsList = JSONObject.parseArray(s, Products.class);

        map.put("list", productsList);
        return map;
    }
}
