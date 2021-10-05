package com.wangsong.order.mapper;

import com.wangsong.order.entity.ProductsRedis;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * <p> RedisSupport </p>
 * <p> Description : RedisSupport </p>
 * <p> Author : qianmoQ </p>
 * <p> Version : 1.0 </p>
 * <p> Create Time : 2019-11-05 10:20 </p>
 * <p> Author Email: <a href="mailTo:shichengoooo@163.com">qianmoQ</a> </p>
 */
@Repository
public interface ProductsRedisSupport extends CrudRepository<ProductsRedis, String> {
}
