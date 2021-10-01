package com.wangsong.order.service.impl;

import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangsong.common.model.GetEasyUIData;
import com.wangsong.common.model.Page;
import com.wangsong.common.model.Result;
import com.wangsong.order.entity.OrderInfo;
import com.wangsong.order.entity.Products;
import com.wangsong.order.entity.ProductsHistory;
import com.wangsong.order.mapper.OrderMapper;
import com.wangsong.order.service.IOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangsong.order.service.IProductsHistoryService;
import com.wangsong.order.service.IProductsService;
import com.wangsong.system.model.UserDO;
import com.wangsong.system.rpc.SystemApiService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
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
public class OrderServiceImpl extends ServiceImpl<OrderMapper, OrderInfo> implements IOrderService {


    @Reference(check = false)
    private SystemApiService systemApiService;

    @Autowired
    private IProductsService productsService;

    @Autowired
    private IProductsHistoryService productsHistoryService;

    @Override
    @Transactional
    public void pay(Long id, String username) {
        //买家信息
        UserDO userDO1 = new UserDO();
        userDO1.setUsername(username);
        Result<UserDO> userResult1 = systemApiService.getUser(userDO1);
        UserDO user1 = userResult1.getData();


        //购买商品列表
        Products product = productsService.getById(id);


        //商品库存不足报错
        if (product.getStock() < 1) {
            throw new RuntimeException("库存不足");
        }
        //产品库存减一
        product.setStock(product.getStock() - 1);


        //组装订单
        OrderInfo order = new OrderInfo();
        order.setProductsId(product.getId());
        order.setUserId(user1.getId());
        order.setState(1);


        //订单
        save(order);

        //更新产品库存
        productsService.updateById(product);


    }

    @Override
    @Transactional
    public void callback(Long id) {

        OrderInfo order = getById(id);
        order.setState(2);

        Products products = productsService.getById(order.getProductsId());


        //卖家金额记录
        systemApiService.updatePlatformAmount(products.getAmount());


        updateById(order);

        ProductsHistory productsHistory = new ProductsHistory();
        productsHistory.setProductsId(order.getProductsId());
        productsHistory.setStock(-1);
        productsHistoryService.save(productsHistory);
    }

    @Override
    @Transactional
    public void timeout(Long id) {

        OrderInfo order = getById(id);
        order.setState(3);

        Products products = productsService.getById(order.getProductsId());
        products.setStock(products.getStock() + 1);

        //卖家金额记录
        //systemApiService.updatePlatformAmount(products.getAmount());


        updateById(order);
        productsService.updateById(products);

        ProductsHistory productsHistory = new ProductsHistory();
        productsHistory.setProductsId(products.getId());
        productsHistory.setStock(1);
        productsHistoryService.save(productsHistory);
    }

    @Override
    public GetEasyUIData lists(Page page) {
        IPage<OrderInfo> page2 = new com.baomidou.mybatisplus.extension.plugins.pagination.Page<>(
                page.getPage(), page.getRows());
        QueryWrapper<OrderInfo> queryWrapper = new QueryWrapper();

        IPage<OrderInfo> page1 = page(page2,queryWrapper);
        return new GetEasyUIData(page1.getRecords(), page1.getTotal());
    }
}
