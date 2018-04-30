package com.wangsong.common.config;

import java.io.IOException;
import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

/**
 * @Copyright: Copyright (c) 2016,${year},
 * @Description: ${todo}
 */

@Configuration
public class ScheduleConfig {

    @Autowired
    private DataSource datasource;
    
    public static String applicationContextKey="applicationContextKey";

    /**
     * config Scheduler
     *
     * @return
     */
    @Bean
    public SchedulerFactoryBean scheduler() {

        SchedulerFactoryBean factoryBean = new SchedulerFactoryBean();
        factoryBean.setQuartzProperties(quartzProperties());
        factoryBean.setDataSource(datasource);
        factoryBean.setApplicationContextSchedulerContextKey("applicationContextKey");
        return factoryBean;
    }

    public Properties quartzProperties(){
        PropertiesFactoryBean propertiesFactoryBean = new PropertiesFactoryBean();
        propertiesFactoryBean.setLocation(new ClassPathResource("classpath:quartz.properties"));
        try {
            propertiesFactoryBean.afterPropertiesSet();
            return propertiesFactoryBean.getObject();
        } catch (IOException e) {
//            e.printStackTrace();
        }
        return null;
    }
}
