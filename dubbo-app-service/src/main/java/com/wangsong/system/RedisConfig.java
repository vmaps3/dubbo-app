package com.wangsong.system;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import com.wangsong.common.mybatis.RedisCacheTransfer;

@Configuration
public class RedisConfig {
	@Value(value = "${mybatis_redis_cache}")
	private int expire;
	
    @Bean
    JedisConnectionFactory jedisConnectionFactory() {
        return new JedisConnectionFactory();
    }

    @Bean
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<String, Object> template = new RedisTemplate<String, Object>();
        template.setConnectionFactory(jedisConnectionFactory());
        template.setKeySerializer(new StringRedisSerializer());
        template.setValueSerializer(new JdkSerializationRedisSerializer());
        return template;
    }
   
    @Bean
    public RedisCacheTransfer redisCacheTransfer(RedisTemplate<String,Object> redisTemplate) {
    	RedisCacheTransfer redisCacheTransfer=new RedisCacheTransfer();
    	redisCacheTransfer.setExpire(expire);
    	redisCacheTransfer.setRedisTemplate(redisTemplate);
        return redisCacheTransfer;
    }
    

}
