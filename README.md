# dubbo-app

## 系统介绍

- dubbo-app 是J2EE集群分布式基础开发平台，技术栈包括：dubbo、zookeeper，zuul，apollo，ElasticJob、redis、nginx、SpringBoot，MyBatis、Shiro、JWT，swagger，lombok业务模块包括：用户管理，角色管理、权限管理，字典管理，定时任务。

## 核心流程概要

- 用户->nginx->HTML->zuul网关中心-->具体服务（必须引入SHIRO权限）->zookeeper注册中心->核心服务（SHIRO权限认证授权）->REDIS/MYSQL
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
- ElasticJob 定时任务
- apollo 配置中心
- zuul 网关中心
- redis shiro缓存
- springBoot 依赖注入，切面
- mybatis ORM  
- shiro 权限 
- JWT 会话 
- swagger api
- lombok 代码优化

## 部署

- 1.导入数据库脚本dubbo-app-sql下sql文件（包含配置中心配置）
- 2.安装nginx配置参考nginx.txt
- 3.启动apollo（详情参考官方）
- 4.启动zookeeper
- 5.启动redis
- 6.下载https://gitee.com/vmaps/app-ui 更改对应include.js
- 7.启动dubbo-app-system位置com.wangsong.Application
- 8.启动dubbo-app-zuul
- 9.访问nginx端口/html

## qq交流群

- 74745979