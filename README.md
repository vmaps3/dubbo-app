# dubbo-app

## 系统介绍

- dubbo-app 是J2EE集群分布式基础开发平台，技术栈包括：dubbo、zookeeper，apollo，xxljob、redis、nginx、SpringBoot，MyBatis、Shiro、hibernate-validation，easyui，业务模块包括：用户管理，角色管理、权限管理，字典管理，定时任务。

## 核心流程概要

- 用户->nginx->HTML->具体服务（必须引入SHIRO权限）->zookeeper注册中心->核心服务（SHIRO权限认证授权）->REDIS/MYSQL
- 外部通信,方式HTTP,协议HTTP,权限SHIRO
- 内部通信,方式dubbo,协议RPC,权限无

## 业务功能

- 1.用户管理：用户增删改查与角色关系
- 2.角色管理：角色增删改查与权限关系
- 3.菜单管理：菜单增删改查（树形结构）
- 4.字典管理：字典增删改查
- 5.定时器管理：定时器添加删除暂停，更改表达式

## 技术栈

- dubbo 服务治理 
- zookeeper 注册中心 
- apollo 配置中心
- xxljob 定时任务
- redis 集群会话，shiro缓存，mybatis二级缓存 
- springBoot 依赖注入，切面
- mybatis ORM  
- shiro 权限 
- hibernate-validation 验证 
- easyui 页面UI 


## 部署

- 1.导入数据库脚本dubbo-app.sql
- 2.安装nginx配置参考nginx.txt
- 3.启动zookeeper
- 4.启动redis
- 5.启动apollo（详细参考官方）
- 6.启动xxljob（详细参考官方）
- 7.启动dubbo-app-web位置com.wangsong.Application
- 8.访问nginx端口/dubbo-app-html

## qq交流群

- 74745979