package com.wangsong.user.service.impl;

import cn.hutool.core.lang.UUID;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.wangsong.user.rpc.UserApiService;
import com.wangsong.user.service.IProductsService;
import org.apache.dubbo.config.annotation.Reference;
import org.redisson.api.*;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author jobob
 * @since 2021-09-25
 */
@Service
public class ProductsServiceImpl implements IProductsService {


    @Reference(check = false)
    private UserApiService systemApiService;

    @Autowired
    private RedissonClient redissonClient;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private AmqpTemplate template;

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
    public void semaphore(String uuid) {
        RSemaphore semaphore = redissonClient.getSemaphore(uuid);

        //使用
        boolean b = semaphore.tryAcquire();//获得一个许可
        if (!b) {
            throw new RuntimeException("redis防重提交");

        }
    }

    @Override
    public Object productsCache() {
        RBucket<Object> products1 = redissonClient.getBucket("productsBucket");
        if (products1.isExists()) {
            return products1.get();
        }
        RLock lock = redissonClient.getLock("productsLock");
        try {
            lock.lock();
            products1 = redissonClient.getBucket("productsBucket");
            if (!products1.isExists()) {
                String test = "test";
                products1.set(test);
                return test;
            }

            return products1.get();
        } finally {
            lock.unlock();
        }

    }

    @Override
    public void productsCacheDelete() {
        RLock lock = redissonClient.getLock("productsLock");
        try {
            lock.lock();
            RBucket<Object> products1 = redissonClient.getBucket("productsBucket");
            products1.delete();
        } finally {
            lock.unlock();
        }
    }


    @Override
    public void productsStock(Integer integer) {

        RAtomicLong productsAtomicLong = redissonClient.getAtomicLong("productsAtomicLong");
        productsAtomicLong.getAndAdd(integer);

    }

    @Override
    public Long productsStockDecrement() {
        RLock lock = redissonClient.getLock("productsStockLock");
        try {
            lock.lock();
            RAtomicLong productsAtomicLong = redissonClient.getAtomicLong("productsAtomicLong");
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
    public Long productsStockIncrement() {
        RLock lock = redissonClient.getLock("productsStockLock");
        try {
            lock.lock();
            RAtomicLong productsAtomicLong = redissonClient.getAtomicLong("productsAtomicLong");
            return productsAtomicLong.getAndIncrement();
        } finally {
            lock.unlock();
        }
    }

    //发送mq
    @Override
    public void toMQ(String string) {
        template.convertAndSend("products", string);
        template.convertAndSend("user.order.delay_exchange", "user.order.delay_key", string, message -> {
            message.getMessageProperties().setExpiration("10000");
            return message;
        });
    }

    //mq接收
    @Override
    public void mq(String string) {

        System.out.println(string);

    }

    @Override
    public void mqTimeout(String string) {
        System.out.println(string);
    }


}
