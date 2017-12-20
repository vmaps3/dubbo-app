package com.wangsong.common.config;

import org.springframework.context.annotation.Configuration;  
import org.springframework.context.annotation.ImportResource;  
import org.springframework.context.annotation.PropertySource;  
  
@Configuration  
@ImportResource({ "classpath:spring-dubbo.xml" })  
public class DubboConfig {  
  
}  