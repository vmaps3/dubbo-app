package com.wangsong.system;

import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.redis.core.RedisTemplate;

import com.wangsong.common.shiro.RedisCacheManager;
import com.wangsong.common.shiro.RedisSessionDAO;


@Configuration
public class ShiroConfig {
	@Autowired
	private RedisTemplate<String, Object> redisTemplate;
	@Value(value = "${shiro_redis_session}")
	private int shiro_redis_session;
	@Value(value = "${shiro_redis_cache}")
	private int shiro_redis_cache;
    @Bean
    public ShiroFilterFactoryBean shirFilter(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        //拦截器.
        Map<String,String> filterChainDefinitionMap = new LinkedHashMap<String,String>();
        // 配置不会被拦截的链接 顺序判断
        //配置退出 过滤器,其中的具体的退出代码Shiro已经替我们实现了
        filterChainDefinitionMap.put("/login.do", "anon");
        //<!-- 过滤链定义，从上向下顺序执行，一般将/**放在最为下边 -->:这是一个坑呢，一不小心代码就不好使了;
        //<!-- authc:所有url都必须认证通过才可以访问; anon:所有url都都可以匿名访问-->
        filterChainDefinitionMap.put("/**", "authc");
        // 如果不设置默认会自动寻找Web工程根目录下的"/login.jsp"页面
        shiroFilterFactoryBean.setLoginUrl("/index.do");
       

        //未授权界面;
        shiroFilterFactoryBean.setUnauthorizedUrl("/unauth.do");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilterFactoryBean;
    }

    @Bean
    public ShiroDbRealm myShiroRealm(){
    	ShiroDbRealm myShiroRealm = new ShiroDbRealm();
        return myShiroRealm;
    }
    /**
     * EhCacheManager，缓存管理，用户登陆成功后，把用户信息和权限信息缓存起来，
     * 然后每次用户请求时，放入用户的session中，如果不设置这个bean，每个请求都会查询一次数据库。
     * 
     * @return
     */
    @Bean
    public RedisCacheManager redisCacheManager() {
    	RedisCacheManager cacheManager = new RedisCacheManager();
    	cacheManager.setRedisTemplate(redisTemplate);
    	cacheManager.setExpire(shiro_redis_cache);
        return cacheManager;
    }
    
    @Bean
    public RedisSessionDAO redisSessionDAO() {
    	RedisSessionDAO sessionDAO = new RedisSessionDAO();
    	sessionDAO.setRedisTemplate(redisTemplate);
    	sessionDAO.setExpire(shiro_redis_session);
        return sessionDAO;
    }
  
    
    @Bean
    public DefaultWebSessionManager sessionManager() {
    	DefaultWebSessionManager defaultWebSessionManager = new DefaultWebSessionManager();
    	defaultWebSessionManager.setSessionDAO(redisSessionDAO() );
    	defaultWebSessionManager.setSessionIdCookie(sessionIdCookie());
        return defaultWebSessionManager;
    }
    
    @Bean
    public SimpleCookie sessionIdCookie() {
    	SimpleCookie simpleCookie = new SimpleCookie("shiroSessionId");
        return simpleCookie;
    }
    
    
    @Bean
    public DefaultWebSecurityManager securityManager(){
        DefaultWebSecurityManager securityManager =  new DefaultWebSecurityManager();
        securityManager.setRealm(myShiroRealm());
     // <!-- 用户授权/认证信息Cache, 采用EhCache 缓存 -->
        securityManager.setSessionManager(sessionManager());
        securityManager.setCacheManager(redisCacheManager());
        return securityManager;
    }
    
    /**
     * 开启Shiro的注解(如@RequiresRoles,@RequiresPermissions),需借助SpringAOP扫描使用Shiro注解的类,并在必要时进行安全逻辑验证
     * 配置以下两个bean(DefaultAdvisorAutoProxyCreator(可选)和AuthorizationAttributeSourceAdvisor)即可实现此功能
     * @return
     */
    @Bean
    public DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator(){
        DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        advisorAutoProxyCreator.setProxyTargetClass(true);
        return advisorAutoProxyCreator;
    }
    
    
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(@Qualifier("securityManager") SecurityManager manager) {
        AuthorizationAttributeSourceAdvisor advisor=new AuthorizationAttributeSourceAdvisor();
        advisor.setSecurityManager(manager);
        return advisor;
    }
}