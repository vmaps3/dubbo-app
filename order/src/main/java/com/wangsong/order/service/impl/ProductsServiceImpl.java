package com.wangsong.order.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wangsong.common.model.GetEasyUIData;
import com.wangsong.order.entity.Products;
import com.wangsong.order.entity.ProductsHistory;
import com.wangsong.order.mapper.ProductsMapper;
import com.wangsong.order.service.IOrderService;
import com.wangsong.order.service.IProductsHistoryService;
import com.wangsong.order.service.IProductsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangsong.order.vo.ProductsPage;
import com.wangsong.system.rpc.SystemApiService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.HashMap;

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
        IPage<Products> page = new Page<>(productsPage.getPage(), productsPage.getRows());
        QueryWrapper queryWrapper = new QueryWrapper();
        if (StrUtil.isNotBlank(productsPage.getName())) {
            queryWrapper.eq("name", productsPage.getName());
        }
        IPage<Products> page1 = page(page, queryWrapper);
        GetEasyUIData getEasyUIData = new GetEasyUIData(page1.getRecords(), page1.getTotal());
        map.put("list", getEasyUIData);
        map.put("uuid", semaphore);
        return map;
    }

    @Override
    public Products selectByPrimaryKey(Long id) {
        return getById(id);
    }
}
