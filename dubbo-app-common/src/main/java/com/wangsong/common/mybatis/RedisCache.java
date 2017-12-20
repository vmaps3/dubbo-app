package com.wangsong.common.mybatis;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.ibatis.cache.Cache;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReadWriteLock;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

public final class RedisCache implements Cache {
	private static final Logger log = 
		LoggerFactory.getLogger(RedisCache.class);

	private String id;
	private static RedisTemplate<String, Object> redisTemplate;
	private static ValueOperations<String, Object> valueOperations;
	private static int expire;
	/**
	 * construct cache 
	 * @param id cache id
	 */
	public RedisCache(String id) {
		if (id == null) {
			throw new IllegalArgumentException(
				"Cache Instance ID Could Not Be Null");
		}
		log.info("Create Redis Cache [{}].", id);
		this.id = id;
		
	}

	/**
	 * {@inheritDoc}
	 */
	public String getId() {
		return id;
	}

	/**
	 * {@inheritDoc}
	 */
	public int getSize() {
		log.debug("Get Cache [{}] Size.", id);
		return redisTemplate.keys(prefixedKey("*")).size();
	}

	/**
	 * {@inheritDoc}
	 */
	public void putObject(final Object key, final Object value) {
		log.debug("Put Object Key [{}], Value [{}].", key, value);
		valueOperations.set(prefixedKey(key), 
			value, expire, TimeUnit.MILLISECONDS);
	}
	
	/**
	 * {@inheritDoc}
	 */
	public Object getObject(final Object key) {
		Object value = valueOperations.get(prefixedKey(key));
		log.debug("Get Object Key [{}], Value [{}].", key, value);
		return value;
	}
	
	/**
	 * {@inheritDoc}
	 */
	public Object removeObject(final Object key) {
		log.debug("Remove Object Key [{}].", key);
		redisTemplate.delete(prefixedKey(key));
		return 1;
	}
	
	/**
	 * {@inheritDoc}
	 */
	public void clear() {
		log.debug("Clear Cache Key [{}].", id);
		redisTemplate.delete(redisTemplate.keys(prefixedKey("*")));
	}
	
	/**
	 * {@inheritDoc}
	 */
	@Override
	public ReadWriteLock getReadWriteLock() {
		return null;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public String toString() {
		return "Redis Cache [" + id + "]";
	}

	// --
	// private methods

	/**
	 * return prefixed cache key
	 * @param key cache key
	 * @return prefixed key
	 */
	String prefixedKey(Object key) {
		return prefix() + String.valueOf(key);
	}

	/**
	 * @return cache prefix
	 */
	String prefix() {
		return "mybatis_redis_cache:"+id + ":";
	}

	public static void setRedisTemplate(RedisTemplate<String,Object> redisTemplate) {
		RedisCache.redisTemplate = redisTemplate;
		valueOperations = redisTemplate.opsForValue();
		
	}

	public static void setExpire(int expire) {
		RedisCache.expire=expire;
	}

	
}
