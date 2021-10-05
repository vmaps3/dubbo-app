package com.wangsong.order.service.impl;

import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSONObject;
import com.wangsong.common.model.GetEasyUIData;
import com.wangsong.order.entity.Products;
import com.wangsong.order.entity.ProductsES;
import com.wangsong.order.entity.ProductsHistory;
import com.wangsong.order.entity.ProductsRedis;
import com.wangsong.order.mapper.ProductsMapper;
import com.wangsong.order.mapper.ProductsESRepository;
import com.wangsong.order.mapper.ProductsRedisSupport;
import com.wangsong.order.service.IOrderService;
import com.wangsong.order.service.IProductsHistoryService;
import com.wangsong.order.service.IProductsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangsong.order.vo.ProductsPage;
import com.wangsong.system.rpc.SystemApiService;
import org.apache.dubbo.config.annotation.Reference;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
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
    @Autowired
    private IProductsHistoryService productsHistoryService;

    @Reference(check = false)
    private SystemApiService systemApiService;
    @Autowired
    private IOrderService orderService;
    @Autowired
    private ProductsESRepository productsRepository;
    @Autowired
    private ProductsRedisSupport productsRedisSupport;

    @Override
    @Transactional
    public void add(Products products) {
        save(products);
        ProductsHistory productsHistory = new ProductsHistory();
        productsHistory.setProductsId(products.getId());
        productsHistory.setStock(products.getStock());
        productsHistoryService.save(productsHistory);

        systemApiService.updatePlatformAmount(products.getAmount().
                multiply(new BigDecimal(-1).
                        multiply(new BigDecimal(products.getStock()))));
    }

    @Override
    @Transactional
    public void updates(Products products) {
        Products productsOld = getById(products.getId());
        updateById(products);
        ProductsHistory productsHistory = new ProductsHistory();
        productsHistory.setProductsId(products.getId());
        productsHistory.setStock(products.getStock() - productsOld.getStock());
        productsHistoryService.save(productsHistory);
        BigDecimal subtract = products.getAmount().multiply(new BigDecimal(products.getStock()))
                .subtract(productsOld.getAmount().multiply(new BigDecimal(productsOld.getStock())));
        systemApiService.updatePlatformAmount(subtract.multiply(new BigDecimal(-1)));

    }


    @Override
    public HashMap<String, Object> lists(ProductsPage productsPage) {
        String semaphore = orderService.getSemaphore();

        HashMap<String, Object> map = new HashMap<>();
        //IPage<ProductsES> page = new Page<>(productsPage.getPage(), productsPage.getRows());
        //QueryWrapper queryWrapper = new QueryWrapper();
        NativeSearchQueryBuilder nativeSearchQueryBuilder = new NativeSearchQueryBuilder();
        if (StrUtil.isNotBlank(productsPage.getName())) {
            //queryWrapper.eq("name", productsPage.getName());
            nativeSearchQueryBuilder.withQuery(QueryBuilders.matchPhraseQuery("name",
                    productsPage.getName()));
        }


        NativeSearchQuery build = nativeSearchQueryBuilder.withPageable(PageRequest.of(
                productsPage.getPage() - 1,
                productsPage.getRows()))
                .build();
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


        GetEasyUIData getEasyUIData = new GetEasyUIData(productsList, search.getTotalElements());


        map.put("list", getEasyUIData);
        map.put("uuid", semaphore);
        return map;
    }

    @Override
    public Products selectByPrimaryKey(Long id) {
        return getById(id);
    }
}
