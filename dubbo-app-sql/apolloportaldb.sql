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


-- 导出 apolloportaldb 的数据库结构
CREATE DATABASE IF NOT EXISTS `apolloportaldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `apolloportaldb`;

-- 导出  表 apolloportaldb.app 结构
CREATE TABLE IF NOT EXISTS `app` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Name` (`Name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';

-- 正在导出表  apolloportaldb.app 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `app` DISABLE KEYS */;
INSERT INTO `app` (`Id`, `AppId`, `Name`, `OrgId`, `OrgName`, `OwnerName`, `OwnerEmail`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'default', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(2, 'dubbo-app-zuul', 'dubbo-app-zuul', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(3, 'dubbo-app-system', 'dubbo-app-system', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(4, 'dubbo-app-schedule', 'dubbo-app-schedule', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19');
/*!40000 ALTER TABLE `app` ENABLE KEYS */;

-- 导出  表 apolloportaldb.appnamespace 结构
CREATE TABLE IF NOT EXISTS `appnamespace` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(32) NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_AppId` (`AppId`),
  KEY `Name_AppId` (`Name`,`AppId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='应用namespace定义';

-- 正在导出表  apolloportaldb.appnamespace 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `appnamespace` DISABLE KEYS */;
INSERT INTO `appnamespace` (`Id`, `Name`, `AppId`, `Format`, `IsPublic`, `Comment`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'application', 'SampleApp', 'properties', b'0', 'default app namespace', b'0', '', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(2, 'application', 'dubbo-app-zuul', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(3, 'application', 'dubbo-app-system', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(4, 'application', 'dubbo-app-schedule', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19');
/*!40000 ALTER TABLE `appnamespace` ENABLE KEYS */;

-- 导出  表 apolloportaldb.authorities 结构
CREATE TABLE IF NOT EXISTS `authorities` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) NOT NULL,
  `Authority` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  apolloportaldb.authorities 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` (`Id`, `Username`, `Authority`) VALUES
	(1, 'apollo', 'ROLE_user');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;

-- 导出  表 apolloportaldb.consumer 结构
CREATE TABLE IF NOT EXISTS `consumer` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='开放API消费者';

-- 正在导出表  apolloportaldb.consumer 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumer` ENABLE KEYS */;

-- 导出  表 apolloportaldb.consumeraudit 结构
CREATE TABLE IF NOT EXISTS `consumeraudit` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `Uri` varchar(1024) NOT NULL DEFAULT '' COMMENT '访问的Uri',
  `Method` varchar(16) NOT NULL DEFAULT '' COMMENT '访问的Method',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_ConsumerId` (`ConsumerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer审计表';

-- 正在导出表  apolloportaldb.consumeraudit 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `consumeraudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumeraudit` ENABLE KEYS */;

-- 导出  表 apolloportaldb.consumerrole 结构
CREATE TABLE IF NOT EXISTS `consumerrole` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_ConsumerId_RoleId` (`ConsumerId`,`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer和role的绑定表';

-- 正在导出表  apolloportaldb.consumerrole 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `consumerrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumerrole` ENABLE KEYS */;

-- 导出  表 apolloportaldb.consumertoken 结构
CREATE TABLE IF NOT EXISTS `consumertoken` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'ConsumerId',
  `Token` varchar(128) NOT NULL DEFAULT '' COMMENT 'token',
  `Expires` datetime NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Token` (`Token`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer token表';

-- 正在导出表  apolloportaldb.consumertoken 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `consumertoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumertoken` ENABLE KEYS */;

-- 导出  表 apolloportaldb.favorite 结构
CREATE TABLE IF NOT EXISTS `favorite` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Position` int(32) NOT NULL DEFAULT '10000' COMMENT '收藏顺序',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `IX_UserId` (`UserId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='应用收藏表';

-- 正在导出表  apolloportaldb.favorite 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;

-- 导出  表 apolloportaldb.permission 结构
CREATE TABLE IF NOT EXISTS `permission` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `PermissionType` varchar(32) NOT NULL DEFAULT '' COMMENT '权限类型',
  `TargetId` varchar(256) NOT NULL DEFAULT '' COMMENT '权限对象类型',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_TargetId_PermissionType` (`TargetId`(191),`PermissionType`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COMMENT='permission表';

-- 正在导出表  apolloportaldb.permission 的数据：~26 rows (大约)
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` (`Id`, `PermissionType`, `TargetId`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'CreateCluster', 'SampleApp', b'0', '', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(2, 'CreateNamespace', 'SampleApp', b'0', '', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(3, 'AssignRole', 'SampleApp', b'0', '', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(4, 'ModifyNamespace', 'SampleApp+application', b'0', '', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(5, 'ReleaseNamespace', 'SampleApp+application', b'0', '', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(6, 'CreateCluster', 'dubbo-app-zuul', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(7, 'CreateNamespace', 'dubbo-app-zuul', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(8, 'AssignRole', 'dubbo-app-zuul', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(9, 'ModifyNamespace', 'dubbo-app-zuul+application', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(10, 'ReleaseNamespace', 'dubbo-app-zuul+application', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(11, 'ModifyNamespace', 'dubbo-app-zuul+application+DEV', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(12, 'ReleaseNamespace', 'dubbo-app-zuul+application+DEV', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(13, 'CreateCluster', 'dubbo-app-system', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(14, 'CreateNamespace', 'dubbo-app-system', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(15, 'AssignRole', 'dubbo-app-system', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(16, 'ModifyNamespace', 'dubbo-app-system+application', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(17, 'ReleaseNamespace', 'dubbo-app-system+application', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(18, 'ModifyNamespace', 'dubbo-app-system+application+DEV', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(19, 'ReleaseNamespace', 'dubbo-app-system+application+DEV', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(20, 'CreateCluster', 'dubbo-app-schedule', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(21, 'CreateNamespace', 'dubbo-app-schedule', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(22, 'AssignRole', 'dubbo-app-schedule', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(23, 'ModifyNamespace', 'dubbo-app-schedule+application', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(24, 'ReleaseNamespace', 'dubbo-app-schedule+application', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(25, 'ModifyNamespace', 'dubbo-app-schedule+application+DEV', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(26, 'ReleaseNamespace', 'dubbo-app-schedule+application+DEV', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;

-- 导出  表 apolloportaldb.role 结构
CREATE TABLE IF NOT EXISTS `role` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleName` varchar(256) NOT NULL DEFAULT '' COMMENT 'Role name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_RoleName` (`RoleName`(191)),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- 正在导出表  apolloportaldb.role 的数据：~18 rows (大约)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`Id`, `RoleName`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'Master+SampleApp', b'0', 'default', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(2, 'ModifyNamespace+SampleApp+application', b'0', 'default', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(3, 'ReleaseNamespace+SampleApp+application', b'0', 'default', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(4, 'Master+dubbo-app-zuul', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(5, 'ModifyNamespace+dubbo-app-zuul+application', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(6, 'ReleaseNamespace+dubbo-app-zuul+application', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(7, 'ModifyNamespace+dubbo-app-zuul+application+DEV', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(8, 'ReleaseNamespace+dubbo-app-zuul+application+DEV', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(9, 'Master+dubbo-app-system', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(10, 'ModifyNamespace+dubbo-app-system+application', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(11, 'ReleaseNamespace+dubbo-app-system+application', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(12, 'ModifyNamespace+dubbo-app-system+application+DEV', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(13, 'ReleaseNamespace+dubbo-app-system+application+DEV', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(14, 'Master+dubbo-app-schedule', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(15, 'ModifyNamespace+dubbo-app-schedule+application', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(16, 'ReleaseNamespace+dubbo-app-schedule+application', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(17, 'ModifyNamespace+dubbo-app-schedule+application+DEV', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(18, 'ReleaseNamespace+dubbo-app-schedule+application+DEV', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- 导出  表 apolloportaldb.rolepermission 结构
CREATE TABLE IF NOT EXISTS `rolepermission` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `PermissionId` int(10) unsigned DEFAULT NULL COMMENT 'Permission Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_PermissionId` (`PermissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COMMENT='角色和权限的绑定表';

-- 正在导出表  apolloportaldb.rolepermission 的数据：~26 rows (大约)
/*!40000 ALTER TABLE `rolepermission` DISABLE KEYS */;
INSERT INTO `rolepermission` (`Id`, `RoleId`, `PermissionId`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 1, 1, b'0', '', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(2, 1, 2, b'0', '', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(3, 1, 3, b'0', '', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(4, 2, 4, b'0', '', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(5, 3, 5, b'0', '', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(6, 4, 6, b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(7, 4, 7, b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(8, 4, 8, b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(9, 5, 9, b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(10, 6, 10, b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(11, 7, 11, b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(12, 8, 12, b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(13, 9, 13, b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(14, 9, 14, b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(15, 9, 15, b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(16, 10, 16, b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(17, 11, 17, b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(18, 12, 18, b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(19, 13, 19, b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(20, 14, 20, b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(21, 14, 21, b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(22, 14, 22, b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(23, 15, 23, b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(24, 16, 24, b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(25, 17, 25, b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(26, 18, 26, b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19');
/*!40000 ALTER TABLE `rolepermission` ENABLE KEYS */;

-- 导出  表 apolloportaldb.serverconfig 结构
CREATE TABLE IF NOT EXISTS `serverconfig` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` varchar(2048) NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_Key` (`Key`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='配置服务自身配置';

-- 正在导出表  apolloportaldb.serverconfig 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `serverconfig` DISABLE KEYS */;
INSERT INTO `serverconfig` (`Id`, `Key`, `Value`, `Comment`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'apollo.portal.envs', 'dev', '可支持的环境列表', b'0', 'default', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(2, 'organizations', '[{"orgId":"TEST1","orgName":"样例部门1"},{"orgId":"TEST2","orgName":"样例部门2"}]', '部门列表', b'0', 'default', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(3, 'superAdmin', 'apollo', 'Portal超级管理员', b'0', 'default', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(4, 'api.readTimeout', '10000', 'http接口read timeout', b'0', 'default', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(5, 'consumer.token.salt', 'someSalt', 'consumer token salt', b'0', 'default', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(6, 'admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace', b'0', 'default', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(7, 'configView.memberOnly.envs', 'dev', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔', b'0', 'default', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57');
/*!40000 ALTER TABLE `serverconfig` ENABLE KEYS */;

-- 导出  表 apolloportaldb.userrole 结构
CREATE TABLE IF NOT EXISTS `userrole` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `UserId` varchar(128) DEFAULT '' COMMENT '用户身份标识',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_UserId_RoleId` (`UserId`,`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='用户和role的绑定表';

-- 正在导出表  apolloportaldb.userrole 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` (`Id`, `UserId`, `RoleId`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'apollo', 1, b'0', '', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(2, 'apollo', 2, b'0', '', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(3, 'apollo', 3, b'0', '', '2018-12-30 13:13:57', '', '2018-12-30 13:13:57'),
	(4, 'apollo', 4, b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(5, 'apollo', 5, b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(6, 'apollo', 6, b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(7, 'apollo', 9, b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(8, 'apollo', 10, b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(9, 'apollo', 11, b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(10, 'apollo', 14, b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(11, 'apollo', 15, b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19'),
	(12, 'apollo', 16, b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19');
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;

-- 导出  表 apolloportaldb.users 结构
CREATE TABLE IF NOT EXISTS `users` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) NOT NULL DEFAULT 'default' COMMENT '用户名',
  `Password` varchar(64) NOT NULL DEFAULT 'default' COMMENT '密码',
  `Email` varchar(64) NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
  `Enabled` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 正在导出表  apolloportaldb.users 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`Id`, `Username`, `Password`, `Email`, `Enabled`) VALUES
	(1, 'apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo@acme.com', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
