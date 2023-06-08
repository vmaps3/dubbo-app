package com.wangsong.user.service;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author jobob
 * @since 2021-09-25
 */
public interface IProductsService {

    //防重复提交
    String getSemaphore();

    //提交订单
    void semaphore(String uuid);

    Object productsCache();

    void productsCacheDelete();

    void productsStock(Integer integer);

    Long productsStockDecrement();

    Long productsStockIncrement();

    void toMQ(String string);

    void mq(String string);

    void mqTimeout(String string);
}
