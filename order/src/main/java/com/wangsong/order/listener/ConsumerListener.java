package com.wangsong.order.listener;


import cn.hutool.core.convert.Convert;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.wangsong.order.entity.ProductsES;
import com.wangsong.order.entity.ProductsRedis;
import com.wangsong.order.mapper.ProductsESRepository;
import com.wangsong.order.mapper.ProductsRedisSupport;
import com.wangsong.order.service.IOrderService;
import com.wangsong.order.service.IProductsService;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;

@Component
public class ConsumerListener {
    @Autowired
    private IOrderService orderService;
    @Autowired
    private ProductsESRepository productsRepository;
    @Autowired
    private IProductsService productsService;
    @Autowired
    private ProductsRedisSupport productsRedisSupport;

    @RabbitListener(queues = "queue")    //监听器监听指定的Queue
    public void processC(HashMap<String, Object> hashMap) {
        Long id = Convert.toLong(hashMap.get("id"));
        String username = Convert.toStr(hashMap.get("username"));
        orderService.pay(id, username);
    }

    //监听消息队列
    @RabbitListener(queues = "user.order.receive_queue")
    public void consumeMessage(Long id) {
        orderService.timeout(id);
    }

    @RabbitListener(queues = "products")
    public void test(byte[] message) {
        System.out.println(JSONObject.parse(message));
        JSONObject parse = (JSONObject) JSONObject.parse(message);

        if (parse.getString("table").equals("products")) {
            JSONArray jsonArray = parse.getJSONArray("data");

            if(jsonArray==null){
                return;
            }
            for (int i = 0; i < jsonArray.size(); i++) {
                String jsonObject = jsonArray.getString(i);
                ProductsES productsES = JSONObject.parseObject(jsonObject, ProductsES.class);
                ProductsRedis productsRedis = JSONObject.parseObject(jsonObject, ProductsRedis.class);
                productsRepository.delete(productsES);
                productsRepository.save(productsES);
                productsRedisSupport.delete(productsRedis);
                productsRedisSupport.save(productsRedis);
            }


        }
    }
}  