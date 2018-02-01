package com.wangsong.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ShiroLifecycleConfig {
	@Bean
    public ShiroLifecycleConfig lifecycleBeanPostProcessor(){
        return new ShiroLifecycleConfig();
    }
}
