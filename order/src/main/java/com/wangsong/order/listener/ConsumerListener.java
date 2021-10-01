package com.wangsong.order.listener;


import cn.hutool.core.convert.Convert;
import com.wangsong.order.service.IOrderService;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;

@Component
public class ConsumerListener {
    @Autowired
    private IOrderService orderService;


    @RabbitListener(queues = "queue")    //监听器监听指定的Queue
    public void processC(HashMap<String, Object> hashMap) {
        Long id = Convert.toLong(hashMap.get("id"));
        String username = Convert.toStr(hashMap.get("username"));
        orderService.pay(id, username);
    }
}  