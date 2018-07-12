package com.wangsong.common.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@Configuration
@ImportResource({"classpath:spring-elastic-job.xml"})
public class ElasticJobConfig {

}  