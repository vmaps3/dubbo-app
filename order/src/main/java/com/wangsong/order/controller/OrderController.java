package com.wangsong.order.controller;


import com.wangsong.order.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author jobob
 * @since 2021-09-25
 */
@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private IOrderService orderService;
    //http://127.0.0.1:1101/order/order/getSemaphore
    @GetMapping(value = "/getSemaphore")
    public String getSemaphore() {
        return orderService.getSemaphore();
    }

    //http://127.0.0.1:1101/order/order/pay?id=商品id&userId=1&uuid=信号量
    @GetMapping(value = "/pay")
    public String update(Long id, String uuid) {
        orderService.send(id,uuid);
        return "1";
    }

    //http://127.0.0.1:1101/order/order/callback?id=订单号
    @GetMapping(value = "/callback")
    public String callback(Long id) {
        orderService.callback(id);
        return "1";
    }
}
