package com.wangsong.common.mybatis;


import org.springframework.data.redis.core.RedisTemplate;


public class RedisCacheTransfer {

    public void setRedisTemplate(RedisTemplate<String,Object> redisTemplate) {
        RedisCache.setRedisTemplate(redisTemplate);
    }
	
	public void setExpire(int expire) {
		RedisCache.setExpire(expire);
	}

    
	
	
}
