package com.wangsong.user.listener;


import com.wangsong.user.service.IProductsService;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ConsumerListener {

    @Autowired
    private IProductsService productsService;


    //队列接受 binglog写入缓存
    @RabbitListener(queues = "products")
    public void test(String string) {
        productsService.mq(string);
    }


    //超时进入死信
    @RabbitListener(queues = "user.order.receive_queue")
    public void consumeMessage(String string) {

        productsService.mqTimeout(string);
    }
}  