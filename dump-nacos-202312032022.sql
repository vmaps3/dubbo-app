-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: nacos
-- ------------------------------------------------------
-- Server version	5.7.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `config_info`
--

DROP TABLE IF EXISTS `config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info` (
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info`
--

LOCK TABLES `config_info` WRITE;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
INSERT INTO `config_info` VALUES (11,'gateway-dev.properties','DEFAULT_GROUP','server.port = 1101\r\n\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\n\r\nspring.cloud.gateway.discovery.locator.enabled=true\r\nspring.cloud.gateway.discovery.locator.lowerCaseServiceId=true\r\n','fadcbc76e53144b9b8ca575b2602e5e8','2020-04-10 22:25:51','2020-04-10 22:25:51',NULL,'127.0.0.1','','',NULL,NULL,NULL,'text',NULL),(12,'order-dev.properties','DEFAULT_GROUP','server.port = 8085\r\n\r\n\r\ndubbo.scan.basePackages = com.wangsong\r\ndubbo.protocol.name=dubbo\r\ndubbo.protocol.port=-1\r\ndubbo.registry.address=spring-cloud://localhost\r\ndubbo.cloud.subscribed-services=user\r\nspring.main.allow-bean-definition-overriding=true\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\nspring.cloud.sentinel.transport.dashboard=localhost:8080\r\n\r\n\r\n\r\n','6bdb59d0670fb2cde552076f9384dc59','2021-09-25 20:20:04','2023-12-03 20:20:01',NULL,'127.0.0.1','','','null','null','null','text','null'),(17,'user-dev.properties','DEFAULT_GROUP','server.port = 8083\r\n\r\n\r\n\r\ndubbo.provider.filter = providerFilter\r\n\r\ndubbo.scan.base-packages=com.wangsong\r\ndubbo.protocol.name=dubbo\r\ndubbo.protocol.port=-1\r\ndubbo.registry.address=spring-cloud://localhost\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\nspring.cloud.sentinel.transport.dashboard=localhost:8080\r\n\r\n','6fe98fe678ba344920354861011ff706','2023-06-08 22:08:28','2023-12-03 20:19:51',NULL,'127.0.0.1','','','null','null','null','text','null');
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_aggr`
--

DROP TABLE IF EXISTS `config_info_aggr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_aggr` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_aggr`
--

LOCK TABLES `config_info_aggr` WRITE;
/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_beta`
--

DROP TABLE IF EXISTS `config_info_beta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_beta` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_beta`
--

LOCK TABLES `config_info_beta` WRITE;
/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_tag`
--

DROP TABLE IF EXISTS `config_info_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_tag` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_tag`
--

LOCK TABLES `config_info_tag` WRITE;
/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_tags_relation`
--

DROP TABLE IF EXISTS `config_tags_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_tags_relation` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_tags_relation`
--

LOCK TABLES `config_tags_relation` WRITE;
/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_capacity`
--

DROP TABLE IF EXISTS `group_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_capacity` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_capacity`
--

LOCK TABLES `group_capacity` WRITE;
/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `his_config_info`
--

DROP TABLE IF EXISTS `his_config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `his_config_info` (
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `his_config_info`
--

LOCK TABLES `his_config_info` WRITE;
/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;
INSERT INTO `his_config_info` VALUES (17,19,'user-dev.properties','DEFAULT_GROUP','','server.port = 8083\r\nspring.datasource.password = root\r\nspring.datasource.username = root\r\nspring.datasource.driver-class-name = com.mysql.jdbc.Driver\r\nspring.datasource.url = jdbc:mysql://localhost:3306/dubbo-app?useUnicode=true&characterEncoding=utf-8\r\nspring.datasource.druid.initial-Size = 5\r\nspring.datasource.druid.min-Idle = 5\r\nspring.datasource.druid.max-Active = 20\r\nspring.datasource.druid.max-Wait = 60000\r\nspring.datasource.druid.time-Between-Eviction-Runs-Millis = 60000\r\nspring.datasource.druid.min-Evictable-Idle-Time-Millis = 300000\r\nspring.datasource.druid.validation-Query = SELECT 1 FROM DUAL\r\nspring.datasource.druid.test-While-Idle = true\r\nspring.datasource.druid.test-On-Borrow = false\r\nspring.datasource.druid.test-On-Return = false\r\nspring.datasource.druid.filters = stat,wall,logback\r\nspring.redis.port = 6379\r\nspring.redis.host = 127.0.0.1\r\nconfigLocation = classpath:mybatis-config.xml\r\nmybatis.mapper-locations = classpath:mapping/*/*.xml\r\n\r\n\r\ndubbo.provider.filter = providerFilter\r\n\r\ndubbo.scan.base-packages=com.wangsong\r\ndubbo.protocol.name=dubbo\r\ndubbo.protocol.port=-1\r\ndubbo.registry.address=spring-cloud://localhost\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\nspring.cloud.sentinel.transport.dashboard=localhost:8080\r\n\r\nspring.cloud.sentinel.datasource.ds.nacos.server-addr=localhost:8848\r\nspring.cloud.sentinel.datasource.ds.nacos.dataId=${spring.application.name}-sentinel\r\nspring.cloud.sentinel.datasource.ds.nacos.groupId=DEFAULT_GROUP\r\nspring.cloud.sentinel.datasource.ds.nacos.rule-type=flow\r\n\r\nspring.rabbitmq.host=127.0.0.1\r\nspring.rabbitmq.port=5672\r\nspring.rabbitmq.username=guest\r\nspring.rabbitmq.password=guest\r\n\r\nspring.data.elasticsearch.cluster-name=elasticsearch\r\nspring.data.elasticsearch.cluster-nodes= 127.0.0.1:9300','d1f99a15b84cd445a5af49cac0efbf14','2023-12-03 19:59:44','2023-12-03 19:59:44',NULL,'127.0.0.1','U',''),(17,20,'user-dev.properties','DEFAULT_GROUP','','server.port = 8083\r\n\r\n\r\n\r\ndubbo.provider.filter = providerFilter\r\n\r\ndubbo.scan.base-packages=com.wangsong\r\ndubbo.protocol.name=dubbo\r\ndubbo.protocol.port=-1\r\ndubbo.registry.address=spring-cloud://localhost\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\nspring.cloud.sentinel.transport.dashboard=localhost:8080\r\n\r\nspring.cloud.sentinel.datasource.ds.nacos.server-addr=localhost:8848\r\nspring.cloud.sentinel.datasource.ds.nacos.dataId=${spring.application.name}-sentinel\r\nspring.cloud.sentinel.datasource.ds.nacos.groupId=DEFAULT_GROUP\r\nspring.cloud.sentinel.datasource.ds.nacos.rule-type=flow\r\n','857c794d4115fa55480e2cc5d4741309','2023-12-03 19:59:49','2023-12-03 19:59:49',NULL,'127.0.0.1','U',''),(12,21,'order-dev.properties','DEFAULT_GROUP','','server.port = 8085\r\nspring.datasource.password = root\r\nspring.datasource.username = root\r\nspring.datasource.driver-class-name = com.mysql.jdbc.Driver\r\nspring.datasource.url = jdbc:mysql://localhost:3306/dubbo-app?useUnicode=true&characterEncoding=utf-8\r\nspring.datasource.druid.initial-Size = 5\r\nspring.datasource.druid.min-Idle = 5\r\nspring.datasource.druid.max-Active = 20\r\nspring.datasource.druid.max-Wait = 60000\r\nspring.datasource.druid.time-Between-Eviction-Runs-Millis = 60000\r\nspring.datasource.druid.min-Evictable-Idle-Time-Millis = 300000\r\nspring.datasource.druid.validation-Query = SELECT 1 FROM DUAL\r\nspring.datasource.druid.test-While-Idle = true\r\nspring.datasource.druid.test-On-Borrow = false\r\nspring.datasource.druid.test-On-Return = false\r\nspring.datasource.druid.filters = stat,wall,logback\r\nconfigLocation = classpath:mybatis-config.xml\r\nmybatis.mapper-locations = classpath:mapping/*/*.xml\r\n\r\nspring.redis.host = 127.0.0.1\r\nspring.redis.port = 6379\r\n\r\n\r\ndubbo.scan.basePackages = com.wangsong\r\ndubbo.protocol.name=dubbo\r\ndubbo.protocol.port=-1\r\ndubbo.registry.address=spring-cloud://localhost\r\ndubbo.cloud.subscribed-services=user\r\nspring.main.allow-bean-definition-overriding=true\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\nspring.cloud.sentinel.transport.dashboard=localhost:8080\r\n\r\nspring.cloud.sentinel.datasource.ds.nacos.server-addr=localhost:8848\r\nspring.cloud.sentinel.datasource.ds.nacos.dataId=${spring.application.name}-sentinel\r\nspring.cloud.sentinel.datasource.ds.nacos.groupId=DEFAULT_GROUP\r\nspring.cloud.sentinel.datasource.ds.nacos.rule-type=flow\r\n\r\nspring.rabbitmq.host=127.0.0.1\r\nspring.rabbitmq.port=5672\r\nspring.rabbitmq.username=guest\r\nspring.rabbitmq.password=guest\r\n','95a786473b6b3604f876ae878421db02','2023-12-03 20:00:27','2023-12-03 20:00:28',NULL,'127.0.0.1','U',''),(17,22,'user-dev.properties','DEFAULT_GROUP','','server.port = 8083\r\n\r\n\r\n\r\ndubbo.provider.filter = providerFilter\r\n\r\ndubbo.scan.base-packages=com.wangsong\r\ndubbo.protocol.name=dubbo\r\ndubbo.protocol.port=-1\r\ndubbo.registry.address=spring-cloud://localhost\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\nspring.cloud.sentinel.transport.dashboard=localhost:8080\r\n\r\nspring.cloud.sentinel.datasource.ds.nacos.server-addr=localhost:8848\r\nspring.cloud.sentinel.datasource.ds.nacos.dataId=${spring.application.name}-sentinel\r\nspring.cloud.sentinel.datasource.ds.nacos.groupId=DEFAULT_GROUP\r\nspring.cloud.sentinel.datasource.ds.nacos.rule-type=flow\r\n','857c794d4115fa55480e2cc5d4741309','2023-12-03 20:19:51','2023-12-03 20:19:51',NULL,'127.0.0.1','U',''),(12,23,'order-dev.properties','DEFAULT_GROUP','','server.port = 8085\r\n\r\n\r\ndubbo.scan.basePackages = com.wangsong\r\ndubbo.protocol.name=dubbo\r\ndubbo.protocol.port=-1\r\ndubbo.registry.address=spring-cloud://localhost\r\ndubbo.cloud.subscribed-services=user\r\nspring.main.allow-bean-definition-overriding=true\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\nspring.cloud.sentinel.transport.dashboard=localhost:8080\r\n\r\nspring.cloud.sentinel.datasource.ds.nacos.server-addr=localhost:8848\r\nspring.cloud.sentinel.datasource.ds.nacos.dataId=${spring.application.name}-sentinel\r\nspring.cloud.sentinel.datasource.ds.nacos.groupId=DEFAULT_GROUP\r\nspring.cloud.sentinel.datasource.ds.nacos.rule-type=flow\r\n\r\n','50f08fb9ad4471dbca10e454421e17e4','2023-12-03 20:20:00','2023-12-03 20:20:01',NULL,'127.0.0.1','U','');
/*!40000 ALTER TABLE `his_config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(512) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('nacos','ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_capacity`
--

DROP TABLE IF EXISTS `tenant_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_capacity` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_capacity`
--

LOCK TABLES `tenant_capacity` WRITE;
/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_info`
--

DROP TABLE IF EXISTS `tenant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_info` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_info`
--

LOCK TABLES `tenant_info` WRITE;
/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'nacos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-03 20:22:34
