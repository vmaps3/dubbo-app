package com.wangsong;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@MapperScan("com.wangsong.*.mapper")
@EnableDiscoveryClient
public class SystemApplication {

    public static void main(String[] args) {

        SpringApplication.run(SystemApplication.class, args);

    }

}