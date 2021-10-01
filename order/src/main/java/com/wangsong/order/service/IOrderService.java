package com.wangsong.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wangsong.common.model.GetEasyUIData;
import com.wangsong.common.model.Page;
import com.wangsong.order.entity.OrderInfo;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author jobob
 * @since 2021-09-25
 */
public interface IOrderService extends IService<OrderInfo> {

    void send(Long id, String username);

    @Transactional
    void pay(Long id, String username);

    void callback(Long id);

    @Transactional
    void timeout(Long id);

    GetEasyUIData lists(Page page);
}
