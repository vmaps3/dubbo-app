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


-- 导出 apolloconfigdb 的数据库结构
CREATE DATABASE IF NOT EXISTS `apolloconfigdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `apolloconfigdb`;

-- 导出  表 apolloconfigdb.app 结构
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

-- 正在导出表  apolloconfigdb.app 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `app` DISABLE KEYS */;
INSERT INTO `app` (`Id`, `AppId`, `Name`, `OrgId`, `OrgName`, `OwnerName`, `OwnerEmail`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'default', '2018-12-30 13:13:37', '', '2018-12-30 13:13:37'),
	(2, 'dubbo-app-zuul', 'dubbo-app-zuul', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(3, 'dubbo-app-system', 'dubbo-app-system', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(4, 'dubbo-app-schedule', 'dubbo-app-schedule', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19');
/*!40000 ALTER TABLE `app` ENABLE KEYS */;

-- 导出  表 apolloconfigdb.appnamespace 结构
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

-- 正在导出表  apolloconfigdb.appnamespace 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `appnamespace` DISABLE KEYS */;
INSERT INTO `appnamespace` (`Id`, `Name`, `AppId`, `Format`, `IsPublic`, `Comment`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'application', 'SampleApp', 'properties', b'0', 'default app namespace', b'0', '', '2018-12-30 13:13:37', '', '2018-12-30 13:13:37'),
	(2, 'application', 'dubbo-app-zuul', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(3, 'application', 'dubbo-app-system', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(4, 'application', 'dubbo-app-schedule', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19');
/*!40000 ALTER TABLE `appnamespace` ENABLE KEYS */;

-- 导出  表 apolloconfigdb.audit 结构
CREATE TABLE IF NOT EXISTS `audit` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `EntityName` varchar(50) NOT NULL DEFAULT 'default' COMMENT '表名',
  `EntityId` int(10) unsigned DEFAULT NULL COMMENT '记录ID',
  `OpName` varchar(50) NOT NULL DEFAULT 'default' COMMENT '操作类型',
  `Comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COMMENT='日志审计表';

-- 正在导出表  apolloconfigdb.audit 的数据：~114 rows (大约)
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
INSERT INTO `audit` (`Id`, `EntityName`, `EntityId`, `OpName`, `Comment`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'App', 2, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:02:45', NULL, '2018-12-30 14:02:45'),
	(2, 'AppNamespace', 2, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:02:45', NULL, '2018-12-30 14:02:45'),
	(3, 'Cluster', 2, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:02:45', NULL, '2018-12-30 14:02:45'),
	(4, 'Namespace', 2, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:02:45', NULL, '2018-12-30 14:02:45'),
	(5, 'Item', 2, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:04:12', NULL, '2018-12-30 14:04:12'),
	(6, 'Item', 3, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:04:12', NULL, '2018-12-30 14:04:12'),
	(7, 'Item', 4, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:04:12', NULL, '2018-12-30 14:04:12'),
	(8, 'Item', 5, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:04:12', NULL, '2018-12-30 14:04:12'),
	(9, 'Item', 6, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:04:12', NULL, '2018-12-30 14:04:12'),
	(10, 'Item', 7, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:04:12', NULL, '2018-12-30 14:04:12'),
	(11, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:04:12', NULL, '2018-12-30 14:04:12'),
	(12, 'Release', 2, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:04:25', NULL, '2018-12-30 14:04:25'),
	(13, 'ReleaseHistory', 2, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:04:25', NULL, '2018-12-30 14:04:25'),
	(14, 'App', 3, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:06:24', NULL, '2018-12-30 14:06:24'),
	(15, 'AppNamespace', 3, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:06:24', NULL, '2018-12-30 14:06:24'),
	(16, 'Cluster', 3, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:06:24', NULL, '2018-12-30 14:06:24'),
	(17, 'Namespace', 3, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:06:24', NULL, '2018-12-30 14:06:24'),
	(18, 'Item', 8, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(19, 'Item', 9, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(20, 'Item', 10, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(21, 'Item', 11, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(22, 'Item', 12, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(23, 'Item', 13, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(24, 'Item', 14, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(25, 'Item', 15, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(26, 'Item', 16, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(27, 'Item', 17, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(28, 'Item', 18, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(29, 'Item', 19, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(30, 'Item', 20, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(31, 'Item', 21, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(32, 'Item', 22, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(33, 'Item', 23, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(34, 'Item', 24, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(35, 'Item', 25, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(36, 'Item', 26, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(37, 'Item', 27, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(38, 'Item', 28, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(39, 'Item', 29, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(40, 'Item', 30, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(41, 'Item', 31, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(42, 'Item', 32, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(43, 'Item', 33, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(44, 'Item', 34, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(45, 'Item', 35, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(46, 'Item', 36, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(47, 'Item', 37, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(48, 'Item', 38, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(49, 'Item', 39, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(50, 'Item', 40, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(51, 'Item', 41, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(52, 'Item', 42, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(53, 'Item', 43, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(54, 'Item', 44, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(55, 'Item', 45, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(56, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:08', NULL, '2018-12-30 14:07:08'),
	(57, 'Release', 3, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:28', NULL, '2018-12-30 14:07:28'),
	(58, 'ReleaseHistory', 3, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:07:28', NULL, '2018-12-30 14:07:28'),
	(59, 'App', 4, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:19', NULL, '2018-12-30 14:08:19'),
	(60, 'AppNamespace', 4, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:19', NULL, '2018-12-30 14:08:19'),
	(61, 'Cluster', 4, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:19', NULL, '2018-12-30 14:08:19'),
	(62, 'Namespace', 4, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:19', NULL, '2018-12-30 14:08:19'),
	(63, 'Item', 46, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(64, 'Item', 47, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(65, 'Item', 48, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(66, 'Item', 49, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(67, 'Item', 50, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(68, 'Item', 51, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(69, 'Item', 52, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(70, 'Item', 53, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(71, 'Item', 54, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(72, 'Item', 55, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(73, 'Item', 56, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(74, 'Item', 57, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(75, 'Item', 58, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(76, 'Item', 59, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(77, 'Item', 60, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(78, 'Item', 61, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(79, 'Item', 62, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(80, 'Item', 63, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(81, 'Item', 64, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(82, 'Item', 65, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(83, 'Item', 66, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(84, 'Item', 67, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(85, 'Item', 68, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(86, 'Item', 69, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(87, 'Item', 70, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(88, 'Item', 71, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(89, 'Item', 72, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(90, 'Item', 73, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(91, 'Item', 74, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(92, 'Item', 75, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(93, 'Item', 76, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(94, 'Item', 77, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(95, 'Item', 78, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(96, 'Item', 79, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(97, 'Item', 80, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(98, 'Item', 81, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(99, 'Item', 82, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(100, 'Item', 83, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(101, 'Item', 84, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(102, 'Item', 85, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(103, 'Item', 86, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(104, 'Item', 87, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(105, 'Item', 88, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(106, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:54', NULL, '2018-12-30 14:08:54'),
	(107, 'Release', 4, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:59', NULL, '2018-12-30 14:08:59'),
	(108, 'ReleaseHistory', 4, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 14:08:59', NULL, '2018-12-30 14:08:59'),
	(109, 'Item', 9, 'UPDATE', NULL, b'0', 'apollo', '2018-12-30 16:33:53', NULL, '2018-12-30 16:33:53'),
	(110, 'Release', 5, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 16:33:58', NULL, '2018-12-30 16:33:58'),
	(111, 'ReleaseHistory', 5, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 16:33:58', NULL, '2018-12-30 16:33:58'),
	(112, 'Item', 9, 'UPDATE', NULL, b'0', 'apollo', '2018-12-30 16:34:31', NULL, '2018-12-30 16:34:31'),
	(113, 'Release', 6, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 16:34:35', NULL, '2018-12-30 16:34:35'),
	(114, 'ReleaseHistory', 6, 'INSERT', NULL, b'0', 'apollo', '2018-12-30 16:34:35', NULL, '2018-12-30 16:34:35');
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;

-- 导出  表 apolloconfigdb.cluster 结构
CREATE TABLE IF NOT EXISTS `cluster` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '集群名字',
  `AppId` varchar(32) NOT NULL DEFAULT '' COMMENT 'App id',
  `ParentClusterId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父cluster',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_AppId_Name` (`AppId`,`Name`),
  KEY `IX_ParentClusterId` (`ParentClusterId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='集群';

-- 正在导出表  apolloconfigdb.cluster 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `cluster` DISABLE KEYS */;
INSERT INTO `cluster` (`Id`, `Name`, `AppId`, `ParentClusterId`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'default', 'SampleApp', 0, b'0', '', '2018-12-30 13:13:37', '', '2018-12-30 13:13:37'),
	(2, 'default', 'dubbo-app-zuul', 0, b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(3, 'default', 'dubbo-app-system', 0, b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(4, 'default', 'dubbo-app-schedule', 0, b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19');
/*!40000 ALTER TABLE `cluster` ENABLE KEYS */;

-- 导出  表 apolloconfigdb.commit 结构
CREATE TABLE IF NOT EXISTS `commit` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ChangeSets` longtext NOT NULL COMMENT '修改变更集',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `AppId` (`AppId`(191)),
  KEY `ClusterName` (`ClusterName`(191)),
  KEY `NamespaceName` (`NamespaceName`(191))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='commit 历史表';

-- 正在导出表  apolloconfigdb.commit 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `commit` DISABLE KEYS */;
INSERT INTO `commit` (`Id`, `ChangeSets`, `AppId`, `ClusterName`, `NamespaceName`, `Comment`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, '{"createItems":[{"namespaceId":2,"key":"server.port","value":"1101","comment":"","lineNum":1,"id":2,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:04:12","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:04:12"},{"namespaceId":2,"key":"zuul.sensitiveHeaders","value":"\\"*\\"","comment":"","lineNum":2,"id":3,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:04:12","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:04:12"},{"namespaceId":2,"key":"zuul.routes.a.path","value":"/dubbo-app-system/**","comment":"","lineNum":3,"id":4,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:04:12","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:04:12"},{"namespaceId":2,"key":"zuul.routes.a.url","value":"http://localhost:8083/dubbo-app-system","comment":"","lineNum":4,"id":5,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:04:12","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:04:12"},{"namespaceId":2,"key":"zuul.routes.b.path","value":"/dubbo-app-schedule/**","comment":"","lineNum":5,"id":6,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:04:12","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:04:12"},{"namespaceId":2,"key":"zuul.routes.b.url","value":"http://localhost:8085/dubbo-app-schedule","comment":"","lineNum":6,"id":7,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:04:12","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:04:12"}],"updateItems":[],"deleteItems":[]}', 'dubbo-app-zuul', 'default', 'application', NULL, b'0', 'apollo', '2018-12-30 14:04:12', 'apollo', '2018-12-30 14:04:12'),
	(2, '{"createItems":[{"namespaceId":3,"key":"dubbo.scan.basePackages","value":"com.wangsong","comment":"","lineNum":2,"id":9,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"dubbo.application.id","value":"dubbo-app-system","comment":"","lineNum":5,"id":12,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"dubbo.application.name","value":"dubbo-app-system","comment":"","lineNum":6,"id":13,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"dubbo.protocol.id","value":"dubbo","comment":"","lineNum":8,"id":15,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"dubbo.protocol.name","value":"dubbo","comment":"","lineNum":9,"id":16,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"dubbo.protocol.port","value":"20881","comment":"","lineNum":10,"id":17,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"dubbo.registry.id","value":"my-registry","comment":"","lineNum":12,"id":19,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"dubbo.registry.address","value":"zookeeper://127.0.0.1:2181","comment":"","lineNum":13,"id":20,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"shiro_redis_cache","value":"600000","comment":"","lineNum":14,"id":21,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"shiro_redis_session","value":"600000","comment":"","lineNum":15,"id":22,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"server.port","value":"8083","comment":"","lineNum":16,"id":23,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"server.context-path","value":"/dubbo-app-system","comment":"","lineNum":17,"id":24,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.redis.port","value":"6379","comment":"","lineNum":18,"id":25,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.redis.password","value":"","comment":"","lineNum":19,"id":26,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.redis.host","value":"127.0.0.1","comment":"","lineNum":20,"id":27,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.datasource.password","value":"root","comment":"","lineNum":21,"id":28,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.datasource.username","value":"root","comment":"","lineNum":22,"id":29,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.datasource.driver-class-name","value":"com.mysql.jdbc.Driver","comment":"","lineNum":23,"id":30,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.datasource.url","value":"jdbc:mysql://localhost:3306/dubbo-app?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf-8","comment":"","lineNum":24,"id":31,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.datasource.druid.initial-Size","value":"5","comment":"","lineNum":25,"id":32,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.datasource.druid.min-Idle","value":"5","comment":"","lineNum":26,"id":33,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.datasource.druid.max-Active","value":"20","comment":"","lineNum":27,"id":34,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.datasource.druid.max-Wait","value":"60000","comment":"","lineNum":28,"id":35,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.datasource.druid.time-Between-Eviction-Runs-Millis","value":"60000","comment":"","lineNum":29,"id":36,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.datasource.druid.min-Evictable-Idle-Time-Millis","value":"300000","comment":"","lineNum":30,"id":37,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.datasource.druid.validation-Query","value":"SELECT 1 FROM DUAL","comment":"","lineNum":31,"id":38,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.datasource.druid.test-While-Idle","value":"true","comment":"","lineNum":32,"id":39,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.datasource.druid.test-On-Borrow","value":"false","comment":"","lineNum":33,"id":40,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.datasource.druid.test-On-Return","value":"false","comment":"","lineNum":34,"id":41,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"spring.datasource.druid.filters","value":"stat,wall,logback","comment":"","lineNum":35,"id":42,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"configLocation","value":"classpath:mybatis-config.xml","comment":"","lineNum":36,"id":43,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"mybatis.mapper-locations","value":"classpath:mapping/*/*.xml","comment":"","lineNum":37,"id":44,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},{"namespaceId":3,"key":"dubbo.provider.filter","value":"providerFilter","comment":"","lineNum":38,"id":45,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"}],"updateItems":[],"deleteItems":[]}', 'dubbo-app-system', 'default', 'application', NULL, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(3, '{"createItems":[{"namespaceId":4,"key":"spring.datasource.password","value":"root","comment":"","lineNum":1,"id":46,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.datasource.username","value":"root","comment":"","lineNum":2,"id":47,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.datasource.driver-class-name","value":"com.mysql.jdbc.Driver","comment":"","lineNum":3,"id":48,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.datasource.url","value":"jdbc:mysql://localhost:3306/dubbo-app?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf-8","comment":"","lineNum":4,"id":49,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.datasource.druid.initial-Size","value":"5","comment":"","lineNum":5,"id":50,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.datasource.druid.min-Idle","value":"5","comment":"","lineNum":6,"id":51,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.datasource.druid.max-Active","value":"20","comment":"","lineNum":7,"id":52,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.datasource.druid.max-Wait","value":"60000","comment":"","lineNum":8,"id":53,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.datasource.druid.time-Between-Eviction-Runs-Millis","value":"60000","comment":"","lineNum":9,"id":54,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.datasource.druid.min-Evictable-Idle-Time-Millis","value":"300000","comment":"","lineNum":10,"id":55,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.datasource.druid.validation-Query","value":"SELECT 1 FROM DUAL","comment":"","lineNum":11,"id":56,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.datasource.druid.test-While-Idle","value":"true","comment":"","lineNum":12,"id":57,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.datasource.druid.test-On-Borrow","value":"false","comment":"","lineNum":13,"id":58,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.datasource.druid.test-On-Return","value":"false","comment":"","lineNum":14,"id":59,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.datasource.druid.filters","value":"stat,wall,logback","comment":"","lineNum":15,"id":60,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"configLocation","value":"classpath:mybatis-config.xml","comment":"","lineNum":16,"id":61,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"mybatis.mapper-locations","value":"classpath:mapping/*/*.xml","comment":"","lineNum":17,"id":62,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"server.context-path","value":"/dubbo-app-schedule","comment":"","lineNum":18,"id":63,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"server.port","value":"8085","comment":"","lineNum":19,"id":64,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.redis.host","value":"127.0.0.1","comment":"","lineNum":20,"id":65,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.redis.password","value":"","comment":"","lineNum":21,"id":66,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"spring.redis.port","value":"6379","comment":"","lineNum":22,"id":67,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"shiro_redis_session","value":"600000","comment":"","lineNum":23,"id":68,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"mybatis_redis_cache","value":"600000","comment":"","lineNum":24,"id":69,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"shiro_redis_cache","value":"600000","comment":"","lineNum":25,"id":70,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"dubbo.scan.basePackages","value":"com.wangsong","comment":"","lineNum":27,"id":72,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"dubbo.application.id","value":"dubbo-app-schedule","comment":"","lineNum":30,"id":75,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"dubbo.application.name","value":"dubbo-app-schedule","comment":"","lineNum":31,"id":76,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"dubbo.protocol.id","value":"dubbo","comment":"","lineNum":33,"id":78,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"dubbo.protocol.name","value":"dubbo","comment":"","lineNum":34,"id":79,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"dubbo.protocol.port","value":"20882","comment":"","lineNum":35,"id":80,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"dubbo.registry.id","value":"my-registry","comment":"","lineNum":37,"id":82,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"dubbo.registry.address","value":"zookeeper://127.0.0.1:2181","comment":"","lineNum":38,"id":83,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"regCenter.serverList","value":"localhost:2181","comment":"","lineNum":39,"id":84,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"regCenter.namespace","value":"elastic-job-lite-springboot","comment":"","lineNum":40,"id":85,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"simpleJob.cron","value":"0/5 * * * * ?","comment":"","lineNum":41,"id":86,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"simpleJob.shardingTotalCount","value":"3","comment":"","lineNum":42,"id":87,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"},{"namespaceId":4,"key":"simpleJob.shardingItemParameters","value":"0\\u003dBeijing,1\\u003dShanghai,2\\u003dGuangzhou","comment":"","lineNum":43,"id":88,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:08:54","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:08:54"}],"updateItems":[],"deleteItems":[]}', 'dubbo-app-schedule', 'default', 'application', NULL, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(4, '{"createItems":[],"updateItems":[{"oldItem":{"namespaceId":3,"key":"dubbo.scan.basePackages","value":"com.wangsong","comment":"","lineNum":2,"id":9,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 14:07:08"},"newItem":{"namespaceId":3,"key":"dubbo.scan.basePackages","value":"com.wangsong,com.ctrip.framework.apollo.use.cases.spring.boot.starter.dubbo.provider","comment":"","lineNum":2,"id":9,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 16:33:53"}}],"deleteItems":[]}', 'dubbo-app-system', 'default', 'application', NULL, b'0', 'apollo', '2018-12-30 16:33:53', 'apollo', '2018-12-30 16:33:53'),
	(5, '{"createItems":[],"updateItems":[{"oldItem":{"namespaceId":3,"key":"dubbo.scan.basePackages","value":"com.wangsong,com.ctrip.framework.apollo.use.cases.spring.boot.starter.dubbo.provider","comment":"","lineNum":2,"id":9,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 16:33:53"},"newItem":{"namespaceId":3,"key":"dubbo.scan.basePackages","value":"com.wangsong","comment":"","lineNum":2,"id":9,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-12-30 14:07:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-12-30 16:34:31"}}],"deleteItems":[]}', 'dubbo-app-system', 'default', 'application', NULL, b'0', 'apollo', '2018-12-30 16:34:31', 'apollo', '2018-12-30 16:34:31');
/*!40000 ALTER TABLE `commit` ENABLE KEYS */;

-- 导出  表 apolloconfigdb.grayreleaserule 结构
CREATE TABLE IF NOT EXISTS `grayreleaserule` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `BranchName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'branch name',
  `Rules` varchar(16000) DEFAULT '[]' COMMENT '灰度规则',
  `ReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '灰度对应的release',
  `BranchStatus` tinyint(2) DEFAULT '1' COMMENT '灰度分支状态: 0:删除分支,1:正在使用的规则 2：全量发布',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Namespace` (`AppId`,`ClusterName`,`NamespaceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='灰度规则表';

-- 正在导出表  apolloconfigdb.grayreleaserule 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `grayreleaserule` DISABLE KEYS */;
/*!40000 ALTER TABLE `grayreleaserule` ENABLE KEYS */;

-- 导出  表 apolloconfigdb.instance 结构
CREATE TABLE IF NOT EXISTS `instance` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `DataCenter` varchar(64) NOT NULL DEFAULT 'default' COMMENT 'Data Center Name',
  `Ip` varchar(32) NOT NULL DEFAULT '' COMMENT 'instance ip',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_UNIQUE_KEY` (`AppId`,`ClusterName`,`Ip`,`DataCenter`),
  KEY `IX_IP` (`Ip`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='使用配置的应用实例';

-- 正在导出表  apolloconfigdb.instance 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `instance` DISABLE KEYS */;
INSERT INTO `instance` (`Id`, `AppId`, `ClusterName`, `DataCenter`, `Ip`, `DataChange_CreatedTime`, `DataChange_LastTime`) VALUES
	(1, 'dubbo-app-zuul', 'default', '', '192.168.1.104', '2018-12-30 14:04:47', '2018-12-30 14:04:47'),
	(2, 'dubbo-app-schedule', 'default', '', '192.168.1.104', '2018-12-30 16:28:25', '2018-12-30 16:28:25'),
	(3, 'dubbo-app-system', 'default', '', '192.168.1.104', '2018-12-30 16:29:29', '2018-12-30 16:29:29');
/*!40000 ALTER TABLE `instance` ENABLE KEYS */;

-- 导出  表 apolloconfigdb.instanceconfig 结构
CREATE TABLE IF NOT EXISTS `instanceconfig` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `InstanceId` int(11) unsigned DEFAULT NULL COMMENT 'Instance Id',
  `ConfigAppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config App Id',
  `ConfigClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config Cluster Name',
  `ConfigNamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config Namespace Name',
  `ReleaseKey` varchar(64) NOT NULL DEFAULT '' COMMENT '发布的Key',
  `ReleaseDeliveryTime` timestamp NULL DEFAULT NULL COMMENT '配置获取时间',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_UNIQUE_KEY` (`InstanceId`,`ConfigAppId`,`ConfigNamespaceName`),
  KEY `IX_ReleaseKey` (`ReleaseKey`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Valid_Namespace` (`ConfigAppId`,`ConfigClusterName`,`ConfigNamespaceName`,`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='应用实例的配置信息';

-- 正在导出表  apolloconfigdb.instanceconfig 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `instanceconfig` DISABLE KEYS */;
INSERT INTO `instanceconfig` (`Id`, `InstanceId`, `ConfigAppId`, `ConfigClusterName`, `ConfigNamespaceName`, `ReleaseKey`, `ReleaseDeliveryTime`, `DataChange_CreatedTime`, `DataChange_LastTime`) VALUES
	(1, 1, 'dubbo-app-zuul', 'default', 'application', '20181230140424-aa7b80ff27c42050', '2018-12-30 14:04:46', '2018-12-30 14:04:46', '2018-12-30 14:04:46'),
	(2, 2, 'dubbo-app-schedule', 'default', 'application', '20181230140858-8f4080ff27c42052', '2018-12-30 16:28:24', '2018-12-30 16:28:24', '2018-12-30 16:28:24'),
	(3, 3, 'dubbo-app-system', 'default', 'application', '20181230163435-e39880ff27c42054', '2018-12-30 16:46:29', '2018-12-30 16:29:29', '2018-12-30 16:46:30');
/*!40000 ALTER TABLE `instanceconfig` ENABLE KEYS */;

-- 导出  表 apolloconfigdb.item 结构
CREATE TABLE IF NOT EXISTS `item` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `NamespaceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '集群NamespaceId',
  `Key` varchar(128) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` longtext NOT NULL COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `LineNum` int(10) unsigned DEFAULT '0' COMMENT '行号',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_GroupId` (`NamespaceId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COMMENT='配置项目';

-- 正在导出表  apolloconfigdb.item 的数据：~88 rows (大约)
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`Id`, `NamespaceId`, `Key`, `Value`, `Comment`, `LineNum`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 1, 'timeout', '100', 'sample timeout配置', 1, b'0', 'default', '2018-12-30 13:13:37', '', '2018-12-30 13:13:37'),
	(2, 2, 'server.port', '1101', '', 1, b'0', 'apollo', '2018-12-30 14:04:12', 'apollo', '2018-12-30 14:04:12'),
	(3, 2, 'zuul.sensitiveHeaders', '"*"', '', 2, b'0', 'apollo', '2018-12-30 14:04:12', 'apollo', '2018-12-30 14:04:12'),
	(4, 2, 'zuul.routes.a.path', '/dubbo-app-system/**', '', 3, b'0', 'apollo', '2018-12-30 14:04:12', 'apollo', '2018-12-30 14:04:12'),
	(5, 2, 'zuul.routes.a.url', 'http://localhost:8083/dubbo-app-system', '', 4, b'0', 'apollo', '2018-12-30 14:04:12', 'apollo', '2018-12-30 14:04:12'),
	(6, 2, 'zuul.routes.b.path', '/dubbo-app-schedule/**', '', 5, b'0', 'apollo', '2018-12-30 14:04:12', 'apollo', '2018-12-30 14:04:12'),
	(7, 2, 'zuul.routes.b.url', 'http://localhost:8085/dubbo-app-schedule', '', 6, b'0', 'apollo', '2018-12-30 14:04:12', 'apollo', '2018-12-30 14:04:12'),
	(8, 3, '', '', '# Base packages to scan Dubbo Components (e.g @Service , @Reference)', 1, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(9, 3, 'dubbo.scan.basePackages', 'com.wangsong', '', 2, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 16:34:31'),
	(10, 3, '', '', '# Dubbo Config properties', 3, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(11, 3, '', '', '## ApplicationConfig Bean', 4, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(12, 3, 'dubbo.application.id', 'dubbo-app-system', '', 5, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(13, 3, 'dubbo.application.name', 'dubbo-app-system', '', 6, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(14, 3, '', '', '## ProtocolConfig Bean', 7, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(15, 3, 'dubbo.protocol.id', 'dubbo', '', 8, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(16, 3, 'dubbo.protocol.name', 'dubbo', '', 9, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(17, 3, 'dubbo.protocol.port', '20881', '', 10, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(18, 3, '', '', '## RegistryConfig Bean', 11, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(19, 3, 'dubbo.registry.id', 'my-registry', '', 12, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(20, 3, 'dubbo.registry.address', 'zookeeper://127.0.0.1:2181', '', 13, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(21, 3, 'shiro_redis_cache', '600000', '', 14, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(22, 3, 'shiro_redis_session', '600000', '', 15, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(23, 3, 'server.port', '8083', '', 16, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(24, 3, 'server.context-path', '/dubbo-app-system', '', 17, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(25, 3, 'spring.redis.port', '6379', '', 18, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(26, 3, 'spring.redis.password', '', '', 19, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(27, 3, 'spring.redis.host', '127.0.0.1', '', 20, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(28, 3, 'spring.datasource.password', 'root', '', 21, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(29, 3, 'spring.datasource.username', 'root', '', 22, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(30, 3, 'spring.datasource.driver-class-name', 'com.mysql.jdbc.Driver', '', 23, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(31, 3, 'spring.datasource.url', 'jdbc:mysql://localhost:3306/dubbo-app?useUnicode=true&characterEncoding=utf-8', '', 24, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(32, 3, 'spring.datasource.druid.initial-Size', '5', '', 25, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(33, 3, 'spring.datasource.druid.min-Idle', '5', '', 26, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(34, 3, 'spring.datasource.druid.max-Active', '20', '', 27, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(35, 3, 'spring.datasource.druid.max-Wait', '60000', '', 28, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(36, 3, 'spring.datasource.druid.time-Between-Eviction-Runs-Millis', '60000', '', 29, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(37, 3, 'spring.datasource.druid.min-Evictable-Idle-Time-Millis', '300000', '', 30, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(38, 3, 'spring.datasource.druid.validation-Query', 'SELECT 1 FROM DUAL', '', 31, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(39, 3, 'spring.datasource.druid.test-While-Idle', 'true', '', 32, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(40, 3, 'spring.datasource.druid.test-On-Borrow', 'false', '', 33, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(41, 3, 'spring.datasource.druid.test-On-Return', 'false', '', 34, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(42, 3, 'spring.datasource.druid.filters', 'stat,wall,logback', '', 35, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(43, 3, 'configLocation', 'classpath:mybatis-config.xml', '', 36, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(44, 3, 'mybatis.mapper-locations', 'classpath:mapping/*/*.xml', '', 37, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(45, 3, 'dubbo.provider.filter', 'providerFilter', '', 38, b'0', 'apollo', '2018-12-30 14:07:08', 'apollo', '2018-12-30 14:07:08'),
	(46, 4, 'spring.datasource.password', 'root', '', 1, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(47, 4, 'spring.datasource.username', 'root', '', 2, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(48, 4, 'spring.datasource.driver-class-name', 'com.mysql.jdbc.Driver', '', 3, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(49, 4, 'spring.datasource.url', 'jdbc:mysql://localhost:3306/dubbo-app?useUnicode=true&characterEncoding=utf-8', '', 4, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(50, 4, 'spring.datasource.druid.initial-Size', '5', '', 5, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(51, 4, 'spring.datasource.druid.min-Idle', '5', '', 6, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(52, 4, 'spring.datasource.druid.max-Active', '20', '', 7, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(53, 4, 'spring.datasource.druid.max-Wait', '60000', '', 8, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(54, 4, 'spring.datasource.druid.time-Between-Eviction-Runs-Millis', '60000', '', 9, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(55, 4, 'spring.datasource.druid.min-Evictable-Idle-Time-Millis', '300000', '', 10, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(56, 4, 'spring.datasource.druid.validation-Query', 'SELECT 1 FROM DUAL', '', 11, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(57, 4, 'spring.datasource.druid.test-While-Idle', 'true', '', 12, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(58, 4, 'spring.datasource.druid.test-On-Borrow', 'false', '', 13, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(59, 4, 'spring.datasource.druid.test-On-Return', 'false', '', 14, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(60, 4, 'spring.datasource.druid.filters', 'stat,wall,logback', '', 15, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(61, 4, 'configLocation', 'classpath:mybatis-config.xml', '', 16, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(62, 4, 'mybatis.mapper-locations', 'classpath:mapping/*/*.xml', '', 17, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(63, 4, 'server.context-path', '/dubbo-app-schedule', '', 18, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(64, 4, 'server.port', '8085', '', 19, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(65, 4, 'spring.redis.host', '127.0.0.1', '', 20, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(66, 4, 'spring.redis.password', '', '', 21, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(67, 4, 'spring.redis.port', '6379', '', 22, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(68, 4, 'shiro_redis_session', '600000', '', 23, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(69, 4, 'mybatis_redis_cache', '600000', '', 24, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(70, 4, 'shiro_redis_cache', '600000', '', 25, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(71, 4, '', '', '# Base packages to scan Dubbo Components (e.g @Service , @Reference)', 26, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(72, 4, 'dubbo.scan.basePackages', 'com.wangsong', '', 27, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(73, 4, '', '', '# Dubbo Config properties', 28, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(74, 4, '', '', '## ApplicationConfig Bean', 29, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(75, 4, 'dubbo.application.id', 'dubbo-app-schedule', '', 30, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(76, 4, 'dubbo.application.name', 'dubbo-app-schedule', '', 31, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(77, 4, '', '', '## ProtocolConfig Bean', 32, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(78, 4, 'dubbo.protocol.id', 'dubbo', '', 33, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(79, 4, 'dubbo.protocol.name', 'dubbo', '', 34, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(80, 4, 'dubbo.protocol.port', '20882', '', 35, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(81, 4, '', '', '## RegistryConfig Bean', 36, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(82, 4, 'dubbo.registry.id', 'my-registry', '', 37, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(83, 4, 'dubbo.registry.address', 'zookeeper://127.0.0.1:2181', '', 38, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(84, 4, 'regCenter.serverList', 'localhost:2181', '', 39, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(85, 4, 'regCenter.namespace', 'elastic-job-lite-springboot', '', 40, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(86, 4, 'simpleJob.cron', '0/5 * * * * ?', '', 41, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(87, 4, 'simpleJob.shardingTotalCount', '3', '', 42, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54'),
	(88, 4, 'simpleJob.shardingItemParameters', '0=Beijing,1=Shanghai,2=Guangzhou', '', 43, b'0', 'apollo', '2018-12-30 14:08:54', 'apollo', '2018-12-30 14:08:54');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- 导出  表 apolloconfigdb.namespace 结构
CREATE TABLE IF NOT EXISTS `namespace` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId_ClusterName_NamespaceName` (`AppId`(191),`ClusterName`(191),`NamespaceName`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_NamespaceName` (`NamespaceName`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='命名空间';

-- 正在导出表  apolloconfigdb.namespace 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `namespace` DISABLE KEYS */;
INSERT INTO `namespace` (`Id`, `AppId`, `ClusterName`, `NamespaceName`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'SampleApp', 'default', 'application', b'0', 'default', '2018-12-30 13:13:37', '', '2018-12-30 13:13:37'),
	(2, 'dubbo-app-zuul', 'default', 'application', b'0', 'apollo', '2018-12-30 14:02:45', 'apollo', '2018-12-30 14:02:45'),
	(3, 'dubbo-app-system', 'default', 'application', b'0', 'apollo', '2018-12-30 14:06:24', 'apollo', '2018-12-30 14:06:24'),
	(4, 'dubbo-app-schedule', 'default', 'application', b'0', 'apollo', '2018-12-30 14:08:19', 'apollo', '2018-12-30 14:08:19');
/*!40000 ALTER TABLE `namespace` ENABLE KEYS */;

-- 导出  表 apolloconfigdb.namespacelock 结构
CREATE TABLE IF NOT EXISTS `namespacelock` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `NamespaceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '集群NamespaceId',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT 'default' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `IsDeleted` bit(1) DEFAULT b'0' COMMENT '软删除',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_NamespaceId` (`NamespaceId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='namespace的编辑锁';

-- 正在导出表  apolloconfigdb.namespacelock 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `namespacelock` DISABLE KEYS */;
/*!40000 ALTER TABLE `namespacelock` ENABLE KEYS */;

-- 导出  表 apolloconfigdb.release 结构
CREATE TABLE IF NOT EXISTS `release` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `ReleaseKey` varchar(64) NOT NULL DEFAULT '' COMMENT '发布的Key',
  `Name` varchar(64) NOT NULL DEFAULT 'default' COMMENT '发布名字',
  `Comment` varchar(256) DEFAULT NULL COMMENT '发布说明',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Configurations` longtext NOT NULL COMMENT '发布配置',
  `IsAbandoned` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否废弃',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId_ClusterName_GroupName` (`AppId`(191),`ClusterName`(191),`NamespaceName`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_ReleaseKey` (`ReleaseKey`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='发布';

-- 正在导出表  apolloconfigdb.release 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `release` DISABLE KEYS */;
INSERT INTO `release` (`Id`, `ReleaseKey`, `Name`, `Comment`, `AppId`, `ClusterName`, `NamespaceName`, `Configurations`, `IsAbandoned`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, '20161009155425-d3a0749c6e20bc15', '20161009155424-release', 'Sample发布', 'SampleApp', 'default', 'application', '{"timeout":"100"}', b'0', b'0', 'default', '2018-12-30 13:13:37', '', '2018-12-30 13:13:37'),
	(2, '20181230140424-aa7b80ff27c42050', '20181230140422-release', '', 'dubbo-app-zuul', 'default', 'application', '{"zuul.routes.a.url":"http://localhost:8083/dubbo-app-system","zuul.routes.b.url":"http://localhost:8085/dubbo-app-schedule","zuul.sensitiveHeaders":"\\"*\\"","server.port":"1101","zuul.routes.a.path":"/dubbo-app-system/**","zuul.routes.b.path":"/dubbo-app-schedule/**"}', b'0', b'0', 'apollo', '2018-12-30 14:04:25', 'apollo', '2018-12-30 14:04:25'),
	(3, '20181230140728-e39880ff27c42051', '20181230140726-release', '', 'dubbo-app-system', 'default', 'application', '{"dubbo.application.id":"dubbo-app-system","dubbo.registry.id":"my-registry","spring.datasource.druid.test-On-Borrow":"false","spring.redis.host":"127.0.0.1","spring.datasource.druid.time-Between-Eviction-Runs-Millis":"60000","spring.datasource.druid.max-Active":"20","configLocation":"classpath:mybatis-config.xml","spring.datasource.druid.validation-Query":"SELECT 1 FROM DUAL","spring.datasource.druid.test-On-Return":"false","spring.datasource.driver-class-name":"com.mysql.jdbc.Driver","shiro_redis_cache":"600000","mybatis.mapper-locations":"classpath:mapping/*/*.xml","dubbo.registry.address":"zookeeper://127.0.0.1:2181","spring.datasource.druid.max-Wait":"60000","server.port":"8083","spring.datasource.druid.min-Idle":"5","spring.datasource.druid.filters":"stat,wall,logback","spring.datasource.druid.test-While-Idle":"true","dubbo.provider.filter":"providerFilter","dubbo.protocol.name":"dubbo","spring.redis.password":"","shiro_redis_session":"600000","server.context-path":"/dubbo-app-system","spring.datasource.druid.initial-Size":"5","spring.redis.port":"6379","dubbo.application.name":"dubbo-app-system","dubbo.protocol.id":"dubbo","spring.datasource.password":"root","spring.datasource.username":"root","dubbo.scan.basePackages":"com.wangsong","spring.datasource.druid.min-Evictable-Idle-Time-Millis":"300000","spring.datasource.url":"jdbc:mysql://localhost:3306/dubbo-app?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf-8","dubbo.protocol.port":"20881"}', b'0', b'0', 'apollo', '2018-12-30 14:07:28', 'apollo', '2018-12-30 14:07:28'),
	(4, '20181230140858-8f4080ff27c42052', '20181230140856-release', '', 'dubbo-app-schedule', 'default', 'application', '{"dubbo.application.id":"dubbo-app-schedule","spring.datasource.druid.test-On-Borrow":"false","dubbo.registry.id":"my-registry","spring.datasource.druid.time-Between-Eviction-Runs-Millis":"60000","spring.redis.host":"127.0.0.1","regCenter.namespace":"elastic-job-lite-springboot","spring.datasource.druid.max-Active":"20","configLocation":"classpath:mybatis-config.xml","spring.datasource.druid.validation-Query":"SELECT 1 FROM DUAL","spring.datasource.druid.test-On-Return":"false","spring.datasource.driver-class-name":"com.mysql.jdbc.Driver","mybatis.mapper-locations":"classpath:mapping/*/*.xml","shiro_redis_cache":"600000","spring.datasource.druid.max-Wait":"60000","dubbo.registry.address":"zookeeper://127.0.0.1:2181","regCenter.serverList":"localhost:2181","spring.datasource.druid.min-Idle":"5","server.port":"8085","spring.datasource.druid.filters":"stat,wall,logback","simpleJob.cron":"0/5 * * * * ?","mybatis_redis_cache":"600000","spring.datasource.druid.test-While-Idle":"true","spring.redis.password":"","dubbo.protocol.name":"dubbo","shiro_redis_session":"600000","spring.datasource.druid.initial-Size":"5","server.context-path":"/dubbo-app-schedule","spring.redis.port":"6379","dubbo.application.name":"dubbo-app-schedule","dubbo.protocol.id":"dubbo","spring.datasource.password":"root","spring.datasource.username":"root","dubbo.scan.basePackages":"com.wangsong","spring.datasource.druid.min-Evictable-Idle-Time-Millis":"300000","spring.datasource.url":"jdbc:mysql://localhost:3306/dubbo-app?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf-8","dubbo.protocol.port":"20882","simpleJob.shardingItemParameters":"0\\u003dBeijing,1\\u003dShanghai,2\\u003dGuangzhou","simpleJob.shardingTotalCount":"3"}', b'0', b'0', 'apollo', '2018-12-30 14:08:59', 'apollo', '2018-12-30 14:08:59'),
	(5, '20181230163357-e39880ff27c42053', '20181230163355-release', '', 'dubbo-app-system', 'default', 'application', '{"dubbo.application.id":"dubbo-app-system","dubbo.registry.id":"my-registry","spring.datasource.druid.test-On-Borrow":"false","spring.redis.host":"127.0.0.1","spring.datasource.druid.time-Between-Eviction-Runs-Millis":"60000","spring.datasource.druid.max-Active":"20","configLocation":"classpath:mybatis-config.xml","spring.datasource.druid.validation-Query":"SELECT 1 FROM DUAL","spring.datasource.druid.test-On-Return":"false","spring.datasource.driver-class-name":"com.mysql.jdbc.Driver","shiro_redis_cache":"600000","mybatis.mapper-locations":"classpath:mapping/*/*.xml","dubbo.registry.address":"zookeeper://127.0.0.1:2181","spring.datasource.druid.max-Wait":"60000","server.port":"8083","spring.datasource.druid.min-Idle":"5","spring.datasource.druid.filters":"stat,wall,logback","spring.datasource.druid.test-While-Idle":"true","dubbo.provider.filter":"providerFilter","dubbo.protocol.name":"dubbo","spring.redis.password":"","shiro_redis_session":"600000","server.context-path":"/dubbo-app-system","spring.datasource.druid.initial-Size":"5","spring.redis.port":"6379","dubbo.application.name":"dubbo-app-system","dubbo.protocol.id":"dubbo","spring.datasource.password":"root","spring.datasource.username":"root","dubbo.scan.basePackages":"com.wangsong,com.ctrip.framework.apollo.use.cases.spring.boot.starter.dubbo.provider","spring.datasource.druid.min-Evictable-Idle-Time-Millis":"300000","spring.datasource.url":"jdbc:mysql://localhost:3306/dubbo-app?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf-8","dubbo.protocol.port":"20881"}', b'0', b'0', 'apollo', '2018-12-30 16:33:58', 'apollo', '2018-12-30 16:33:58'),
	(6, '20181230163435-e39880ff27c42054', '20181230163433-release', '', 'dubbo-app-system', 'default', 'application', '{"dubbo.application.id":"dubbo-app-system","dubbo.registry.id":"my-registry","spring.datasource.druid.test-On-Borrow":"false","spring.redis.host":"127.0.0.1","spring.datasource.druid.time-Between-Eviction-Runs-Millis":"60000","spring.datasource.druid.max-Active":"20","configLocation":"classpath:mybatis-config.xml","spring.datasource.druid.validation-Query":"SELECT 1 FROM DUAL","spring.datasource.druid.test-On-Return":"false","spring.datasource.driver-class-name":"com.mysql.jdbc.Driver","shiro_redis_cache":"600000","mybatis.mapper-locations":"classpath:mapping/*/*.xml","dubbo.registry.address":"zookeeper://127.0.0.1:2181","spring.datasource.druid.max-Wait":"60000","server.port":"8083","spring.datasource.druid.min-Idle":"5","spring.datasource.druid.filters":"stat,wall,logback","spring.datasource.druid.test-While-Idle":"true","dubbo.provider.filter":"providerFilter","dubbo.protocol.name":"dubbo","spring.redis.password":"","shiro_redis_session":"600000","server.context-path":"/dubbo-app-system","spring.datasource.druid.initial-Size":"5","spring.redis.port":"6379","dubbo.application.name":"dubbo-app-system","dubbo.protocol.id":"dubbo","spring.datasource.password":"root","spring.datasource.username":"root","dubbo.scan.basePackages":"com.wangsong","spring.datasource.druid.min-Evictable-Idle-Time-Millis":"300000","spring.datasource.url":"jdbc:mysql://localhost:3306/dubbo-app?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf-8","dubbo.protocol.port":"20881"}', b'0', b'0', 'apollo', '2018-12-30 16:34:35', 'apollo', '2018-12-30 16:34:35');
/*!40000 ALTER TABLE `release` ENABLE KEYS */;

-- 导出  表 apolloconfigdb.releasehistory 结构
CREATE TABLE IF NOT EXISTS `releasehistory` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `BranchName` varchar(32) NOT NULL DEFAULT 'default' COMMENT '发布分支名',
  `ReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联的Release Id',
  `PreviousReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '前一次发布的ReleaseId',
  `Operation` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布类型，0: 普通发布，1: 回滚，2: 灰度发布，3: 灰度规则更新，4: 灰度合并回主分支发布，5: 主分支发布灰度自动发布，6: 主分支回滚灰度自动发布，7: 放弃灰度',
  `OperationContext` longtext NOT NULL COMMENT '发布上下文信息',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_Namespace` (`AppId`,`ClusterName`,`NamespaceName`,`BranchName`),
  KEY `IX_ReleaseId` (`ReleaseId`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='发布历史';

-- 正在导出表  apolloconfigdb.releasehistory 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `releasehistory` DISABLE KEYS */;
INSERT INTO `releasehistory` (`Id`, `AppId`, `ClusterName`, `NamespaceName`, `BranchName`, `ReleaseId`, `PreviousReleaseId`, `Operation`, `OperationContext`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'SampleApp', 'default', 'application', 'default', 1, 0, 0, '{}', b'0', 'apollo', '2018-12-30 13:13:37', 'apollo', '2018-12-30 13:13:37'),
	(2, 'dubbo-app-zuul', 'default', 'application', 'default', 2, 0, 0, '{"isEmergencyPublish":false}', b'0', 'apollo', '2018-12-30 14:04:25', 'apollo', '2018-12-30 14:04:25'),
	(3, 'dubbo-app-system', 'default', 'application', 'default', 3, 0, 0, '{"isEmergencyPublish":false}', b'0', 'apollo', '2018-12-30 14:07:28', 'apollo', '2018-12-30 14:07:28'),
	(4, 'dubbo-app-schedule', 'default', 'application', 'default', 4, 0, 0, '{"isEmergencyPublish":false}', b'0', 'apollo', '2018-12-30 14:08:59', 'apollo', '2018-12-30 14:08:59'),
	(5, 'dubbo-app-system', 'default', 'application', 'default', 5, 3, 0, '{"isEmergencyPublish":false}', b'0', 'apollo', '2018-12-30 16:33:58', 'apollo', '2018-12-30 16:33:58'),
	(6, 'dubbo-app-system', 'default', 'application', 'default', 6, 5, 0, '{"isEmergencyPublish":false}', b'0', 'apollo', '2018-12-30 16:34:35', 'apollo', '2018-12-30 16:34:35');
/*!40000 ALTER TABLE `releasehistory` ENABLE KEYS */;

-- 导出  表 apolloconfigdb.releasemessage 结构
CREATE TABLE IF NOT EXISTS `releasemessage` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Message` varchar(1024) NOT NULL DEFAULT '' COMMENT '发布的消息内容',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Message` (`Message`(191))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='发布消息';

-- 正在导出表  apolloconfigdb.releasemessage 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `releasemessage` DISABLE KEYS */;
INSERT INTO `releasemessage` (`Id`, `Message`, `DataChange_LastTime`) VALUES
	(1, 'dubbo-app-zuul+default+application', '2018-12-30 14:04:25'),
	(3, 'dubbo-app-schedule+default+application', '2018-12-30 14:08:59'),
	(5, 'dubbo-app-system+default+application', '2018-12-30 16:34:35');
/*!40000 ALTER TABLE `releasemessage` ENABLE KEYS */;

-- 导出  表 apolloconfigdb.serverconfig 结构
CREATE TABLE IF NOT EXISTS `serverconfig` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Cluster` varchar(32) NOT NULL DEFAULT 'default' COMMENT '配置对应的集群，default为不针对特定的集群',
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='配置服务自身配置';

-- 正在导出表  apolloconfigdb.serverconfig 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `serverconfig` DISABLE KEYS */;
INSERT INTO `serverconfig` (`Id`, `Key`, `Cluster`, `Value`, `Comment`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔', b'0', 'default', '2018-12-30 13:13:37', '', '2018-12-30 13:13:37'),
	(2, 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', b'0', 'default', '2018-12-30 13:13:37', '', '2018-12-30 13:13:37'),
	(3, 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', b'0', 'default', '2018-12-30 13:13:37', '', '2018-12-30 13:13:37'),
	(4, 'config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！', b'0', 'default', '2018-12-30 13:13:37', '', '2018-12-30 13:13:37'),
	(5, 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', b'0', 'default', '2018-12-30 13:13:37', '', '2018-12-30 13:13:37');
/*!40000 ALTER TABLE `serverconfig` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
