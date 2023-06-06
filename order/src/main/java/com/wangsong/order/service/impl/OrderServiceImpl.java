package com.wangsong.order.service.impl;

import cn.hutool.core.lang.UUID;
import com.wangsong.order.entity.OrderInfo;
import com.wangsong.order.mapper.OrderMapper;
import com.wangsong.order.service.IOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangsong.system.dto.ProductsDTO;
import com.wangsong.system.rpc.SystemApiService;
import org.apache.dubbo.config.annotation.Reference;
import org.redisson.api.RSemaphore;
import org.redisson.api.RedissonClient;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
public class OrderServiceImpl extends ServiceImpl<OrderMapper, OrderInfo> implements IOrderService {


    @Reference(check = false)
    private SystemApiService systemApiService;

    @Autowired
    private AmqpTemplate template;

    @Autowired
    private RedissonClient redissonClient;

    //防重复提交
    @Override
    public String getSemaphore() {
        String uuid = UUID.randomUUID().toString();
        RSemaphore semaphore = redissonClient.getSemaphore(uuid);
        semaphore.addPermits(1);
        return uuid;
    }

    //提交订单
    @Override
    public void send(Long id, String username, String uuid) {
        RSemaphore semaphore = redissonClient.getSemaphore(uuid);

        //使用
        boolean b = semaphore.tryAcquire();//获得一个许可
        if (!b) {
            return;
        }

        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("id", id);
        hashMap.put("username", username);
        template.convertAndSend("queue", hashMap);

    }

    //异步下单
    @Override
    @Transactional
    public void pay(Long id, String username) {


        //购买商品列表

        ProductsDTO product = systemApiService.getById(id);


        //商品库存不足报错
        if (product.getStock() < 1) {
            throw new RuntimeException("库存不足");
        }
        //产品库存减一
        product.setStock(product.getStock() - 1);


        //组装订单
        OrderInfo order = new OrderInfo();
        order.setProductsId(product.getId());
        order.setUserId(Long.valueOf(username));
        order.setState(1);


        //订单
        save(order);

        //更新产品库存
        systemApiService.updateById(product);

        template.convertAndSend("user.order.delay_exchange", "user.order.delay_key", order.getId(), message -> {
            message.getMessageProperties().setExpiration("10000");
            return message;
        });

    }

    //支付回调
    @Override
    @Transactional
    public void callback(Long id) {

        OrderInfo order = getById(id);
        order.setState(2);

        updateById(order);

    }

    //死信队列 超时
    @Override
    @Transactional
    public void timeout(Long id) {
        OrderInfo order = getById(id);

        if (order.getState() == 2) {
            return;
        }

        order.setState(3);

        ProductsDTO products = systemApiService.getById(order.getProductsId());

        products.setStock(products.getStock() + 1);

        //卖家金额记录
        //systemApiService.updatePlatformAmount(products.getAmount());


        updateById(order);
        systemApiService.updateById(products);

    }
}
