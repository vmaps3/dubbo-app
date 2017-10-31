# dubbo-app

## 系统介绍

- dubbo-app 是J2EE分布式开发基础平台，使用经典技术组合（dubbo、zookeeper、Spring、SpringMVC、MyBatis、Shiro、redis、easyui），包括核心模块如：角色用户、权限授权。
## 业务功能
- 1.用户管理：用户是系统操作者，该功能主要完成系统用户配置。
- 2.角色管理：角色菜单权限分配。
- 3.菜单管理：配置系统菜单，操作权限，按钮权限标识等。
- 4.字典管理：对系统中经常使用的一些较为固定的数据进行维护，如：是否、男女、类别、级别等。
- 5.日志管理：系统正常操作日志记录和查询；系统异常信息日志记录和查询。

## 技术栈

 分布式中间件 dubbo
- 核心 spring 
- MVC springmvc 
- ORM mybatis 
- 权限 shiro 
- 缓存 redis 
- mybatis二级缓存 mybatis-redis 
- shiro集群 shiro-redis 
- shiro单机 shiro-ehcahce
- 连接池 druid
- 页面UI easyui
- 构建 maven
- 容器 tomcat
- 数据库 mysql
- 注册中心 zookeeper

## 部署方法

- 1.使用maven导入工程项目
- 2.导入数据库文件dubbo-app.sql
- 3.更改配置文件相关参数config.properties

## 预览

![](http://git.oschina.net/uploads/images/2016/1116/164543_5571d631_420150.png "登录")
![](http://git.oschina.net/uploads/images/2016/1116/164618_99cd6105_420150.png "角色权限树")
![](http://git.oschina.net/uploads/images/2016/1116/164633_6dd5c2e9_420150.png "权限右键操作树")
![](http://git.oschina.net/uploads/images/2016/1116/164643_80af2995_420150.png "定时器")
![](http://git.oschina.net/uploads/images/2016/1116/164653_4314a4a8_420150.png "工作流")
## qq交流群
- 74745979