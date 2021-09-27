package com.wangsong.order.service.impl;

import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.convert.Convert;
import com.wangsong.common.model.Result;
import com.wangsong.order.entity.Order;
import com.wangsong.order.entity.Products;
import com.wangsong.order.mapper.OrderMapper;
import com.wangsong.order.service.IOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangsong.order.service.IProductsService;
import com.wangsong.system.model.UserDO;
import com.wangsong.system.rpc.SystemApiService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author jobob
 * @since 2021-09-25
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements IOrderService {


    @Reference(check = false)
    private SystemApiService systemApiService;

    @Autowired
    private IProductsService productsService;

    @Override
    @Transactional
    public void pay(Long[] productsIds, String username) {
        //买家信息
        UserDO userDO1 = new UserDO();
        userDO1.setUsername(username);
        Result<UserDO> userResult1 = systemApiService.getUser(userDO1);
        UserDO user1 = userResult1.getData();

        //订单批量
        List<Order> orderList = new ArrayList();
        List<UserDO> userDOs = new ArrayList();
        List<Map> userAmountHistorys = new ArrayList();

        //总价
        BigDecimal amount = new BigDecimal(0);

        //购买商品列表
        List<Products> products = productsService.listByIds(ListUtil.toList(productsIds));

        for (Products product : products) {
            //商品库存不足报错
            if (product.getStock() < 1) {
                throw new RuntimeException("库存不足");
            }
            //产品库存减一
            product.setStock(product.getStock() - 1);

            //总金额累加
            amount.add(product.getAmount());

            //组装订单
            Order order = new Order();
            order.setProductsId(product.getId());
            order.setUserId(user1.getId());
            order.setState(0);
            orderList.add(order);

            //卖家信息
            UserDO userDO2 = new UserDO();
            userDO2.setId(product.getUserId());
            Result<UserDO> userResult2 = systemApiService.getUser(userDO2);
            UserDO user2 = userResult2.getData();

            //卖家增加金额
            user2.setAmount(user2.getAmount().add(product.getAmount()));
            userDOs.add(user2);

            Map<String, Object> map = new HashMap<>();
            map.put("userId", user2.getId());
            map.put("amount", product.getAmount());
            userAmountHistorys.add(map);
        }

        //检查买家余额
        if (amount.compareTo(user1.getAmount()) == -1) {
            throw new RuntimeException("余额不足");
        }

        //买家减金额
        user1.setAmount(user1.getAmount().subtract(amount));
        //更新买家用户
        systemApiService.updateUser(ListUtil.toList(user1));
        //更新卖家用户
        systemApiService.updateUser(userDOs);

        //买家金额记录
        systemApiService.saveUserAmountHistory(user1.getId(), amount.multiply(new BigDecimal(-1)));

        //卖家金额记录
        for (Map<String, Object> map : userAmountHistorys) {
            systemApiService.saveUserAmountHistory(Convert.toLong(map.get("userId")), Convert.toBigDecimal(map.get("amount")));

        }

        //订单
        saveBatch(orderList);

        //更新产品库存
        productsService.updateBatchById(products);
    }
}
