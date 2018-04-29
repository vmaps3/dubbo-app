# dubbo-app

## 系统介绍

- dubbo-app 是J2EE集群分布式基础开发平台，架构设计包括（分布式，分布式事务，高可用集群，缓存集群，会话集群，动静分离），技术栈包括（dubbo、zookeeper、SpringBoot、MyBatis、Shiro、redis、easyui），业务模块包括：用户管理，角色管理、权限管理，字典管理。

## 核心流程概要
- 用户->nginx->HTML->具体服务（必须引入SHIRO权限）->zookeeper注册中心->核心服务（SHIRO权限认证授权）->REDIS/MYSQL
- 外部通信,方式HTTP,协议HTTP,权限SHIRO
- 内部通信,方式dubbo,协议RPC,权限无

## 业务功能

- 1.用户管理：用户是系统操作者，该功能主要完成系统用户配置。
- 2.角色管理：角色菜单权限分配。
- 3.菜单管理：配置系统菜单，操作权限，按钮权限标识等。
- 4.字典管理：对系统中经常使用的一些较为固定的数据进行维护，如：是否、男女、类别、级别等。

## 技术栈

- 分布式中间件 dubbo
- 注册中心 zookeeper
- 核心 springBoot 
- MVC springmvc 
- ORM mybatis 
- 会话 shiro 
- 验证 hibernate-validation
- 缓存 redis
- mybatis二级缓存集群 mybatis-redis
- shiro会话集群，缓存集群 shiro-redis
- 连接池 druid
- 页面UI easyui
- 构建 maven
- 容器 tomcat
- 数据库 mysql

## 部署

- 1.导入数据库脚本dubbo-app.sql
- 2.安装nginx配置参考nginx.txt
- 3.启动zookeeper
- 4.启动redis
- 5.启动dubbo-app-web位置com.wangsong.Application
- 6.访问nginx端口/dubbo-app-html

## qq交流群

- 74745979