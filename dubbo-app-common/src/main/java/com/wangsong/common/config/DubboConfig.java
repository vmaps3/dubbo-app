package com.wangsong.common.config;

import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;  
  
@Configuration
@ImportResource({ "classpath:spring-dubbo.xml" })  
public class DubboConfig {  
  
}  