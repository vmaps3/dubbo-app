package com.wangsong.order.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wangsong.common.model.GetEasyUIData;
import com.wangsong.common.model.Result;
import com.wangsong.order.entity.Products;
import com.wangsong.order.entity.ProductsHistory;
import com.wangsong.order.mapper.ProductsMapper;
import com.wangsong.order.service.IProductsHistoryService;
import com.wangsong.order.service.IProductsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangsong.order.vo.ProductsPage;
import com.wangsong.system.model.UserDO;
import com.wangsong.system.rpc.SystemApiService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    @Override
    @Transactional
    public void add(Products products, String userDetails) {
        UserDO userDO = new UserDO();
        userDO.setUsername(userDetails);
        Result<UserDO> userId = systemApiService.getUser(userDO);
        products.setUserId(userId.getData().getId());
        save(products);
        ProductsHistory productsHistory = new ProductsHistory();
        productsHistory.setProductsId(products.getId());
        productsHistory.setStock(products.getStock());
        productsHistoryService.save(productsHistory);
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

    }

    @Override
    public GetEasyUIData lists(ProductsPage productsPage) {
        IPage<Products> page = new Page<>(productsPage.getPage(), productsPage.getRows());
        QueryWrapper queryWrapper = new QueryWrapper();
        if (StrUtil.isNotBlank(productsPage.getName())) {
            queryWrapper.eq("name", productsPage.getName());
        }
        IPage<Products> page1 = page(page, queryWrapper);
        return new GetEasyUIData(page1.getRecords(), page1.getTotal());
    }

    @Override
    public Products selectByPrimaryKey(Long id) {
        return getById(id);
    }
}
