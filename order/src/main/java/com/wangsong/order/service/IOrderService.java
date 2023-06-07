package com.wangsong.order.service;

import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author jobob
 * @since 2021-09-25
 */
public interface IOrderService {

    String getSemaphore();

    void send(Long id, String uuid);

    void pay(Long id);

    void callback(Long id);

    void timeout(Long id);

}
