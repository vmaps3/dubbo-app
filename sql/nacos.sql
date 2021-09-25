-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.24-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 nacos 的数据库结构
CREATE DATABASE IF NOT EXISTS `nacos` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `nacos`;

-- 导出  表 nacos.config_info 结构
CREATE TABLE IF NOT EXISTS `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';

-- 正在导出表  nacos.config_info 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES
	(1, 'system-dev.properties', 'DEFAULT_GROUP', 'server.port = 8083\r\nspring.datasource.password = root\r\nspring.datasource.username = root\r\nspring.datasource.driver-class-name = com.mysql.jdbc.Driver\r\nspring.datasource.url = jdbc:mysql://localhost:3306/dubbo-app?useUnicode=true&characterEncoding=utf-8\r\nspring.datasource.druid.initial-Size = 5\r\nspring.datasource.druid.min-Idle = 5\r\nspring.datasource.druid.max-Active = 20\r\nspring.datasource.druid.max-Wait = 60000\r\nspring.datasource.druid.time-Between-Eviction-Runs-Millis = 60000\r\nspring.datasource.druid.min-Evictable-Idle-Time-Millis = 300000\r\nspring.datasource.druid.validation-Query = SELECT 1 FROM DUAL\r\nspring.datasource.druid.test-While-Idle = true\r\nspring.datasource.druid.test-On-Borrow = false\r\nspring.datasource.druid.test-On-Return = false\r\nspring.datasource.druid.filters = stat,wall,logback\r\nspring.redis.port = 6379\r\nspring.redis.host = 127.0.0.1\r\nspring.redis.password =\r\nconfigLocation = classpath:mybatis-config.xml\r\nmybatis.mapper-locations = classpath:mapping/*/*.xml\r\nshiro_redis_cache = 600000\r\nshiro_redis_session = 600000\r\n\r\n\r\ndubbo.provider.filter = providerFilter\r\n\r\ndubbo.scan.base-packages=com.wangsong\r\ndubbo.protocol.name=dubbo\r\ndubbo.protocol.port=-1\r\ndubbo.registry.address=spring-cloud://localhost\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\nspring.cloud.sentinel.transport.dashboard=localhost:8080\r\n\r\nspring.cloud.sentinel.datasource.ds.nacos.server-addr=localhost:8848\r\nspring.cloud.sentinel.datasource.ds.nacos.dataId=${spring.application.name}-sentinel\r\nspring.cloud.sentinel.datasource.ds.nacos.groupId=DEFAULT_GROUP\r\nspring.cloud.sentinel.datasource.ds.nacos.rule-type=flow', '265922ff3437e1c63fade60b5b2cec8c', '2020-04-10 20:22:05', '2020-04-10 22:50:58', NULL, '127.0.0.1', '', '', 'null', 'null', 'null', 'text', 'null'),
	(9, 'system-sentinel', 'DEFAULT_GROUP', '[\r\n    {\r\n        "resource": "/system/resources/findResourcesEMUByResources",\r\n        "limitApp": "default",\r\n        "grade": 1,\r\n        "count": 5,\r\n        "strategy": 0,\r\n        "controlBehavior": 0,\r\n        "clusterMode": false\r\n    }\r\n]', '5d74cc83772a8918aff5192e2e23528e', '2020-04-10 22:03:26', '2020-04-10 22:09:56', NULL, '127.0.0.1', '', '', 'null', 'null', 'null', 'json', 'null'),
	(11, 'gateway-dev.properties', 'DEFAULT_GROUP', 'server.port = 1101\r\n\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\n\r\nspring.cloud.gateway.discovery.locator.enabled=true\r\nspring.cloud.gateway.discovery.locator.lowerCaseServiceId=true\r\n', 'fadcbc76e53144b9b8ca575b2602e5e8', '2020-04-10 22:25:51', '2020-04-10 22:25:51', NULL, '127.0.0.1', '', '', NULL, NULL, NULL, 'text', NULL),
	(12, 'order-dev.properties', 'DEFAULT_GROUP', 'server.port = 8085\r\nspring.datasource.password = root\r\nspring.datasource.username = root\r\nspring.datasource.driver-class-name = com.mysql.jdbc.Driver\r\nspring.datasource.url = jdbc:mysql://localhost:3306/dubbo-app?useUnicode=true&characterEncoding=utf-8\r\nspring.datasource.druid.initial-Size = 5\r\nspring.datasource.druid.min-Idle = 5\r\nspring.datasource.druid.max-Active = 20\r\nspring.datasource.druid.max-Wait = 60000\r\nspring.datasource.druid.time-Between-Eviction-Runs-Millis = 60000\r\nspring.datasource.druid.min-Evictable-Idle-Time-Millis = 300000\r\nspring.datasource.druid.validation-Query = SELECT 1 FROM DUAL\r\nspring.datasource.druid.test-While-Idle = true\r\nspring.datasource.druid.test-On-Borrow = false\r\nspring.datasource.druid.test-On-Return = false\r\nspring.datasource.druid.filters = stat,wall,logback\r\nconfigLocation = classpath:mybatis-config.xml\r\nmybatis.mapper-locations = classpath:mapping/*/*.xml\r\n\r\nspring.redis.host = 127.0.0.1\r\nspring.redis.password =\r\nspring.redis.port = 6379\r\nshiro_redis_session = 600000\r\nmybatis_redis_cache = 600000\r\nshiro_redis_cache = 600000\r\n\r\n\r\ndubbo.scan.basePackages = com.wangsong\r\ndubbo.protocol.name=dubbo\r\ndubbo.protocol.port=-1\r\ndubbo.registry.address=spring-cloud://localhost\r\ndubbo.cloud.subscribed-services=system\r\nspring.main.allow-bean-definition-overriding=true\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\nspring.cloud.sentinel.transport.dashboard=localhost:8080\r\n\r\nspring.cloud.sentinel.datasource.ds.nacos.server-addr=localhost:8848\r\nspring.cloud.sentinel.datasource.ds.nacos.dataId=${spring.application.name}-sentinel\r\nspring.cloud.sentinel.datasource.ds.nacos.groupId=DEFAULT_GROUP\r\nspring.cloud.sentinel.datasource.ds.nacos.rule-type=flow\r\n', 'e14b86ef1a150f8051b448bd43614821', '2021-09-25 20:20:04', '2021-09-25 20:20:04', NULL, '127.0.0.1', '', '', NULL, NULL, NULL, 'text', NULL);
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;

-- 导出  表 nacos.config_info_aggr 结构
CREATE TABLE IF NOT EXISTS `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';

-- 正在导出表  nacos.config_info_aggr 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;

-- 导出  表 nacos.config_info_beta 结构
CREATE TABLE IF NOT EXISTS `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';

-- 正在导出表  nacos.config_info_beta 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;

-- 导出  表 nacos.config_info_tag 结构
CREATE TABLE IF NOT EXISTS `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';

-- 正在导出表  nacos.config_info_tag 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;

-- 导出  表 nacos.config_tags_relation 结构
CREATE TABLE IF NOT EXISTS `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';

-- 正在导出表  nacos.config_tags_relation 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;

-- 导出  表 nacos.group_capacity 结构
CREATE TABLE IF NOT EXISTS `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

-- 正在导出表  nacos.group_capacity 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;

-- 导出  表 nacos.his_config_info 结构
CREATE TABLE IF NOT EXISTS `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';

-- 正在导出表  nacos.his_config_info 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`) VALUES
	(0, 1, 'order-dev.properties', 'DEFAULT_GROUP', '', 'server.port = 8085\r\nspring.datasource.password = root\r\nspring.datasource.username = root\r\nspring.datasource.driver-class-name = com.mysql.jdbc.Driver\r\nspring.datasource.url = jdbc:mysql://localhost:3306/dubbo-app?useUnicode=true&characterEncoding=utf-8\r\nspring.datasource.druid.initial-Size = 5\r\nspring.datasource.druid.min-Idle = 5\r\nspring.datasource.druid.max-Active = 20\r\nspring.datasource.druid.max-Wait = 60000\r\nspring.datasource.druid.time-Between-Eviction-Runs-Millis = 60000\r\nspring.datasource.druid.min-Evictable-Idle-Time-Millis = 300000\r\nspring.datasource.druid.validation-Query = SELECT 1 FROM DUAL\r\nspring.datasource.druid.test-While-Idle = true\r\nspring.datasource.druid.test-On-Borrow = false\r\nspring.datasource.druid.test-On-Return = false\r\nspring.datasource.druid.filters = stat,wall,logback\r\nconfigLocation = classpath:mybatis-config.xml\r\nmybatis.mapper-locations = classpath:mapping/*/*.xml\r\n\r\nspring.redis.host = 127.0.0.1\r\nspring.redis.password =\r\nspring.redis.port = 6379\r\nshiro_redis_session = 600000\r\nmybatis_redis_cache = 600000\r\nshiro_redis_cache = 600000\r\n\r\n\r\ndubbo.scan.basePackages = com.wangsong\r\ndubbo.protocol.name=dubbo\r\ndubbo.protocol.port=-1\r\ndubbo.registry.address=spring-cloud://localhost\r\ndubbo.cloud.subscribed-services=system\r\nspring.main.allow-bean-definition-overriding=true\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\nspring.cloud.sentinel.transport.dashboard=localhost:8080\r\n\r\nspring.cloud.sentinel.datasource.ds.nacos.server-addr=localhost:8848\r\nspring.cloud.sentinel.datasource.ds.nacos.dataId=${spring.application.name}-sentinel\r\nspring.cloud.sentinel.datasource.ds.nacos.groupId=DEFAULT_GROUP\r\nspring.cloud.sentinel.datasource.ds.nacos.rule-type=flow\r\n', 'e14b86ef1a150f8051b448bd43614821', '2021-09-25 20:20:04', '2021-09-25 20:20:04', NULL, '127.0.0.1', 'I', ''),
	(3, 2, 'schedule-dev.properties', 'DEFAULT_GROUP', '', 'server.port = 8085\r\nspring.datasource.password = root\r\nspring.datasource.username = root\r\nspring.datasource.driver-class-name = com.mysql.jdbc.Driver\r\nspring.datasource.url = jdbc:mysql://localhost:3306/dubbo-app?useUnicode=true&characterEncoding=utf-8\r\nspring.datasource.druid.initial-Size = 5\r\nspring.datasource.druid.min-Idle = 5\r\nspring.datasource.druid.max-Active = 20\r\nspring.datasource.druid.max-Wait = 60000\r\nspring.datasource.druid.time-Between-Eviction-Runs-Millis = 60000\r\nspring.datasource.druid.min-Evictable-Idle-Time-Millis = 300000\r\nspring.datasource.druid.validation-Query = SELECT 1 FROM DUAL\r\nspring.datasource.druid.test-While-Idle = true\r\nspring.datasource.druid.test-On-Borrow = false\r\nspring.datasource.druid.test-On-Return = false\r\nspring.datasource.druid.filters = stat,wall,logback\r\nconfigLocation = classpath:mybatis-config.xml\r\nmybatis.mapper-locations = classpath:mapping/*/*.xml\r\n\r\nspring.redis.host = 127.0.0.1\r\nspring.redis.password =\r\nspring.redis.port = 6379\r\nshiro_redis_session = 600000\r\nmybatis_redis_cache = 600000\r\nshiro_redis_cache = 600000\r\n\r\n\r\ndubbo.scan.basePackages = com.wangsong\r\ndubbo.protocol.name=dubbo\r\ndubbo.protocol.port=-1\r\ndubbo.registry.address=spring-cloud://localhost\r\ndubbo.cloud.subscribed-services=system\r\nspring.main.allow-bean-definition-overriding=true\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\nspring.cloud.sentinel.transport.dashboard=localhost:8080\r\n\r\nspring.cloud.sentinel.datasource.ds.nacos.server-addr=localhost:8848\r\nspring.cloud.sentinel.datasource.ds.nacos.dataId=${spring.application.name}-sentinel\r\nspring.cloud.sentinel.datasource.ds.nacos.groupId=DEFAULT_GROUP\r\nspring.cloud.sentinel.datasource.ds.nacos.rule-type=flow\r\n', 'e14b86ef1a150f8051b448bd43614821', '2021-09-25 20:20:10', '2021-09-25 20:20:11', NULL, '127.0.0.1', 'D', '');
/*!40000 ALTER TABLE `his_config_info` ENABLE KEYS */;

-- 导出  表 nacos.permissions 结构
CREATE TABLE IF NOT EXISTS `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(512) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nacos.permissions 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- 导出  表 nacos.roles 结构
CREATE TABLE IF NOT EXISTS `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nacos.roles 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`username`, `role`) VALUES
	('nacos', 'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- 导出  表 nacos.tenant_capacity 结构
CREATE TABLE IF NOT EXISTS `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';

-- 正在导出表  nacos.tenant_capacity 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;

-- 导出  表 nacos.tenant_info 结构
CREATE TABLE IF NOT EXISTS `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';

-- 正在导出表  nacos.tenant_info 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;

-- 导出  表 nacos.users 结构
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nacos.users 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
	('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
