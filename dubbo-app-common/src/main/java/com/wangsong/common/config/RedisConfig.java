package com.wangsong.common.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import com.wangsong.common.mybatis.RedisCache;

@Configuration
public class RedisConfig {
	@Value(value = "${mybatis_redis_cache}")
	private int expire;

	@Autowired
	private RedisConnectionFactory redisConnectionFactory;

    @Bean
    public RedisTemplate<String, Object> redisTemplate() {
        RedisTemplate<String, Object> template = new RedisTemplate<String, Object>();
        template.setConnectionFactory(redisConnectionFactory);
        template.setKeySerializer(new StringRedisSerializer());
        template.setValueSerializer(new JdkSerializationRedisSerializer());
        redisCacheTransfer(template);
        return template;
    }
   
    private void redisCacheTransfer(RedisTemplate<String,Object> redisTemplate) {
    	RedisCache.setExpire(expire);
    	RedisCache.setRedisTemplate(redisTemplate);
    }
    

}
