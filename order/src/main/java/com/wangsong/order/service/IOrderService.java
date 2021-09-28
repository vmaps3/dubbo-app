package com.wangsong.order.service;

import com.wangsong.order.entity.Order;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author jobob
 * @since 2021-09-25
 */
public interface IOrderService extends IService<Order> {

    @Transactional
    void pay(Long[] productsIds, String username);

    void callback(Long id);
}
