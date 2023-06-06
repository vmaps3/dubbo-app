package com.wangsong.config;


import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class SenderConf {


    /**
     * 死信接收交换机
     *
     * @return
     */
    @Bean
    public DirectExchange productsDirectExchange() {
        return new DirectExchange("products");
    }

    /**
     * 死信接收队列
     *
     * @return
     */
    @Bean
    public Queue productsQueue() {
        return new Queue("products");
    }

    /**
     * 死信交换机绑定消费队列
     *
     * @return
     */
    @Bean
    public Binding productsBinding() {
        return BindingBuilder.bind(productsQueue()).to(productsDirectExchange()).with("products");
    }

}

