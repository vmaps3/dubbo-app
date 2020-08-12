# spring-cloud-alibaba-rbac

## 系统介绍

- spring-cloud-alibaba-rbac 是J2EE集群分布式基础开发平台，技术栈包括：spring-cloud-alibaba,dubbo、nacos，zuul、SpringBoot，MyBatis、Spring-Security业务模块包括：用户管理，角色管理、权限管理，字典管理，定时任务。

## 业务功能

- 1.用户管理：用户增删改查与角色关系
- 2.角色管理：角色增删改查与权限关系
- 3.菜单管理：菜单增删改查（树形结构）
- 4.字典管理：字典增删改查

## 技术栈

- dubbo 服务治理 
- nacos 注册中心
- zuul 网关中心
- spring-Boot 依赖注入，切面
- mybatis ORM  
- Spring-Security 权限

## 部署

- 1.导入数据库脚本sql下sql文件
- 2.启动nacos
- 3.启动system
- 4.启动zuul
- 5.访问http://127.0.0.1:1101/html/login.html

## qq交流群

- 74745979
