package com.wangsong.order.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;

import java.math.BigDecimal;

@RedisHash(value = "products")
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ProductsRedis {

    @Id
    private String id;
    private String name;

    private Integer stock;
    private BigDecimal amount;
}