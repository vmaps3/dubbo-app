-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.20-log - MySQL Community Server (GPL)
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';

-- 正在导出表  apolloconfigdb.app 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `app` DISABLE KEYS */;
INSERT INTO `app` (`Id`, `AppId`, `Name`, `OrgId`, `OrgName`, `OwnerName`, `OwnerEmail`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'default', '2018-05-29 18:04:24', '', '2018-05-29 18:04:24'),
	(2, 'dubbo-app-system', 'dubbo-app-system', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2018-05-30 10:15:42', 'apollo', '2018-05-30 10:15:42'),
	(3, 'dubbo-app-schedule', 'dubbo-app-schedule', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2018-05-30 11:09:21', 'apollo', '2018-05-30 11:09:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='应用namespace定义';

-- 正在导出表  apolloconfigdb.appnamespace 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `appnamespace` DISABLE KEYS */;
INSERT INTO `appnamespace` (`Id`, `Name`, `AppId`, `Format`, `IsPublic`, `Comment`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'application', 'SampleApp', 'properties', b'0', 'default app namespace', b'0', '', '2018-05-29 18:04:24', '', '2018-05-29 18:04:24'),
	(2, 'application', 'dubbo-app-system', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2018-05-30 10:15:44', 'apollo', '2018-05-30 10:15:44'),
	(3, 'application', 'dubbo-app-schedule', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2018-05-30 11:09:21', 'apollo', '2018-05-30 11:09:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COMMENT='日志审计表';

-- 正在导出表  apolloconfigdb.audit 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
INSERT INTO `audit` (`Id`, `EntityName`, `EntityId`, `OpName`, `Comment`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'App', 2, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:15:43', NULL, '2018-05-30 10:15:43'),
	(2, 'AppNamespace', 2, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:15:44', NULL, '2018-05-30 10:15:44'),
	(3, 'Cluster', 2, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:15:44', NULL, '2018-05-30 10:15:44'),
	(4, 'Namespace', 2, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:15:44', NULL, '2018-05-30 10:15:44'),
	(5, 'Item', 2, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(6, 'Item', 3, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(7, 'Item', 4, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(8, 'Item', 5, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(9, 'Item', 6, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(10, 'Item', 7, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(11, 'Item', 8, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(12, 'Item', 9, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(13, 'Item', 10, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(14, 'Item', 11, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(15, 'Item', 12, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(16, 'Item', 13, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(17, 'Item', 14, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(18, 'Item', 15, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(19, 'Item', 16, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(20, 'Item', 17, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(21, 'Item', 18, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(22, 'Item', 19, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(23, 'Item', 20, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(24, 'Item', 21, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(25, 'Item', 22, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(26, 'Item', 23, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(27, 'Item', 24, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(28, 'Item', 25, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(29, 'Item', 26, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(30, 'Item', 27, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(31, 'Item', 28, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(32, 'Item', 29, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(33, 'Item', 30, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(34, 'Item', 31, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(35, 'Item', 32, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(36, 'Item', 33, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(37, 'Item', 34, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(38, 'Item', 35, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(39, 'Item', 36, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(40, 'Item', 37, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(41, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:08', NULL, '2018-05-30 10:17:08'),
	(42, 'Release', 2, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:59', NULL, '2018-05-30 10:17:59'),
	(43, 'ReleaseHistory', 2, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 10:17:59', NULL, '2018-05-30 10:17:59'),
	(44, 'App', 3, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:21', NULL, '2018-05-30 11:09:21'),
	(45, 'AppNamespace', 3, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:21', NULL, '2018-05-30 11:09:21'),
	(46, 'Cluster', 3, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:21', NULL, '2018-05-30 11:09:21'),
	(47, 'Namespace', 3, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:21', NULL, '2018-05-30 11:09:21'),
	(48, 'Item', 38, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(49, 'Item', 39, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(50, 'Item', 40, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(51, 'Item', 41, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(52, 'Item', 42, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(53, 'Item', 43, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(54, 'Item', 44, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(55, 'Item', 45, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(56, 'Item', 46, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(57, 'Item', 47, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(58, 'Item', 48, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(59, 'Item', 49, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(60, 'Item', 50, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(61, 'Item', 51, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(62, 'Item', 52, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(63, 'Item', 53, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(64, 'Item', 54, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(65, 'Item', 55, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(66, 'Item', 56, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(67, 'Item', 57, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(68, 'Item', 58, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(69, 'Item', 59, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(70, 'Item', 60, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(71, 'Item', 61, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(72, 'Item', 62, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(73, 'Item', 63, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(74, 'Item', 64, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(75, 'Item', 65, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(76, 'Item', 66, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(77, 'Item', 67, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(78, 'Item', 68, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(79, 'Item', 69, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(80, 'Item', 70, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(81, 'Item', 71, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(82, 'Item', 72, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(83, 'Item', 73, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(84, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:09:40', NULL, '2018-05-30 11:09:40'),
	(85, 'Release', 3, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:20:32', NULL, '2018-05-30 11:20:32'),
	(86, 'ReleaseHistory', 3, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 11:20:32', NULL, '2018-05-30 11:20:32'),
	(87, 'Item', 3, 'UPDATE', NULL, b'0', 'apollo', '2018-05-30 13:53:16', NULL, '2018-05-30 13:53:16'),
	(88, 'Release', 4, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 13:53:21', NULL, '2018-05-30 13:53:21'),
	(89, 'ReleaseHistory', 4, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 13:53:21', NULL, '2018-05-30 13:53:21'),
	(90, 'Item', 3, 'UPDATE', NULL, b'0', 'apollo', '2018-05-30 13:56:19', NULL, '2018-05-30 13:56:19'),
	(91, 'Release', 5, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 13:56:23', NULL, '2018-05-30 13:56:23'),
	(92, 'ReleaseHistory', 5, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 13:56:23', NULL, '2018-05-30 13:56:23'),
	(93, 'Item', 32, 'UPDATE', NULL, b'0', 'apollo', '2018-05-30 14:01:47', NULL, '2018-05-30 14:01:47'),
	(94, 'Release', 6, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 14:01:51', NULL, '2018-05-30 14:01:51'),
	(95, 'ReleaseHistory', 6, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 14:01:51', NULL, '2018-05-30 14:01:51'),
	(96, 'Item', 32, 'UPDATE', NULL, b'0', 'apollo', '2018-05-30 14:15:00', NULL, '2018-05-30 14:15:00'),
	(97, 'Release', 7, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 14:15:07', NULL, '2018-05-30 14:15:07'),
	(98, 'ReleaseHistory', 7, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 14:15:07', NULL, '2018-05-30 14:15:07'),
	(99, 'Item', 32, 'UPDATE', NULL, b'0', 'apollo', '2018-05-30 14:20:37', NULL, '2018-05-30 14:20:37'),
	(100, 'Release', 8, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 14:26:33', NULL, '2018-05-30 14:26:33'),
	(101, 'ReleaseHistory', 8, 'INSERT', NULL, b'0', 'apollo', '2018-05-30 14:26:33', NULL, '2018-05-30 14:26:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='集群';

-- 正在导出表  apolloconfigdb.cluster 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `cluster` DISABLE KEYS */;
INSERT INTO `cluster` (`Id`, `Name`, `AppId`, `ParentClusterId`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'default', 'SampleApp', 0, b'0', '', '2018-05-29 18:04:24', '', '2018-05-29 18:04:24'),
	(2, 'default', 'dubbo-app-system', 0, b'0', 'apollo', '2018-05-30 10:15:44', 'apollo', '2018-05-30 10:15:44'),
	(3, 'default', 'dubbo-app-schedule', 0, b'0', 'apollo', '2018-05-30 11:09:21', 'apollo', '2018-05-30 11:09:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='commit 历史表';

-- 正在导出表  apolloconfigdb.commit 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `commit` DISABLE KEYS */;
INSERT INTO `commit` (`Id`, `ChangeSets`, `AppId`, `ClusterName`, `NamespaceName`, `Comment`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, '{"createItems":[{"namespaceId":2,"key":"server.context-path","value":"/dubbo-app-system","comment":"","lineNum":1,"id":2,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:07","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"server.port","value":"8087","comment":"","lineNum":2,"id":3,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:07","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.url","value":"jdbc:mysql://localhost:3306/dubbo-app?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf-8","comment":"","lineNum":4,"id":5,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:07","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.username","value":"root","comment":"","lineNum":5,"id":6,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:07","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.password","value":"root","comment":"","lineNum":6,"id":7,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:07","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.driver-class-name","value":"com.mysql.jdbc.Driver","comment":"","lineNum":7,"id":8,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:07","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.type","value":"com.alibaba.druid.pool.DruidDataSource","comment":"","lineNum":8,"id":9,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:07","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.initialSize","value":"5","comment":"","lineNum":10,"id":11,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:07","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.minIdle","value":"5","comment":"","lineNum":11,"id":12,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:07","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.maxActive","value":"20","comment":"","lineNum":12,"id":13,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:07","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.maxWait","value":"60000","comment":"","lineNum":13,"id":14,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:07","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.timeBetweenEvictionRunsMillis","value":"60000","comment":"","lineNum":14,"id":15,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:07","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.minEvictableIdleTimeMillis","value":"300000","comment":"","lineNum":15,"id":16,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:07","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.validationQuery","value":"SELECT 1 FROM DUAL","comment":"","lineNum":16,"id":17,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:07","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.testWhileIdle","value":"true","comment":"","lineNum":17,"id":18,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:07","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.testOnBorrow","value":"false","comment":"","lineNum":18,"id":19,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.testOnReturn","value":"false","comment":"","lineNum":19,"id":20,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.filters","value":"stat,wall,log4j","comment":"","lineNum":20,"id":21,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.datasource.logSlowSql","value":"true","comment":"","lineNum":21,"id":22,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"mybatis.mapper-locations","value":"classpath:mapping/*/*.xml","comment":"","lineNum":23,"id":24,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"configLocation","value":"classpath:mybatis-config.xml","comment":"","lineNum":24,"id":25,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.redis.host","value":"127.0.0.1","comment":"","lineNum":26,"id":27,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.redis.port","value":"6379","comment":"","lineNum":27,"id":28,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"spring.redis.password","value":"","comment":"","lineNum":28,"id":29,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"shiro_redis_cache","value":"600000","comment":"","lineNum":30,"id":31,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"shiro_redis_session","value":"600000","comment":"","lineNum":31,"id":32,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"mybatis_redis_cache","value":"600000","comment":"","lineNum":32,"id":33,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"dubbo.application","value":"dubbo-app-system","comment":"","lineNum":34,"id":35,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"dubbo.registry","value":"zookeeper://127.0.0.1:2181","comment":"","lineNum":35,"id":36,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},{"namespaceId":2,"key":"dubbo.protocol","value":"20881","comment":"","lineNum":36,"id":37,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"}],"updateItems":[],"deleteItems":[]}', 'dubbo-app-system', 'default', 'application', NULL, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(2, '{"createItems":[{"namespaceId":3,"key":"server.context-path","value":"/dubbo-app-schedule","comment":"","lineNum":1,"id":38,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"server.port","value":"8085","comment":"","lineNum":2,"id":39,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.url","value":"jdbc:mysql://localhost:3306/dubbo-app?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf-8","comment":"","lineNum":4,"id":41,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.username","value":"root","comment":"","lineNum":5,"id":42,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.password","value":"root","comment":"","lineNum":6,"id":43,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.driver-class-name","value":"com.mysql.jdbc.Driver","comment":"","lineNum":7,"id":44,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.type","value":"com.alibaba.druid.pool.DruidDataSource","comment":"","lineNum":8,"id":45,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.initialSize","value":"5","comment":"","lineNum":10,"id":47,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.minIdle","value":"5","comment":"","lineNum":11,"id":48,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.maxActive","value":"20","comment":"","lineNum":12,"id":49,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.maxWait","value":"60000","comment":"","lineNum":13,"id":50,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.timeBetweenEvictionRunsMillis","value":"60000","comment":"","lineNum":14,"id":51,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.minEvictableIdleTimeMillis","value":"300000","comment":"","lineNum":15,"id":52,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.validationQuery","value":"SELECT 1 FROM DUAL","comment":"","lineNum":16,"id":53,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.testWhileIdle","value":"true","comment":"","lineNum":17,"id":54,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.testOnBorrow","value":"false","comment":"","lineNum":18,"id":55,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.testOnReturn","value":"false","comment":"","lineNum":19,"id":56,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.filters","value":"stat,wall,log4j","comment":"","lineNum":20,"id":57,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.datasource.logSlowSql","value":"true","comment":"","lineNum":21,"id":58,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"mybatis.mapper-locations","value":"classpath:mapping/*/*.xml","comment":"","lineNum":23,"id":60,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"configLocation","value":"classpath:mybatis-config.xml","comment":"","lineNum":24,"id":61,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.redis.host","value":"127.0.0.1","comment":"","lineNum":26,"id":63,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.redis.port","value":"6379","comment":"","lineNum":27,"id":64,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"spring.redis.password","value":"","comment":"","lineNum":28,"id":65,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"shiro_redis_cache","value":"600000","comment":"","lineNum":30,"id":67,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"shiro_redis_session","value":"600000","comment":"","lineNum":31,"id":68,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"mybatis_redis_cache","value":"600000","comment":"","lineNum":32,"id":69,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"dubbo.application","value":"dubbo-app-schedule","comment":"","lineNum":34,"id":71,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"dubbo.registry","value":"zookeeper://127.0.0.1:2181","comment":"","lineNum":35,"id":72,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"},{"namespaceId":3,"key":"dubbo.protocol","value":"20882","comment":"","lineNum":36,"id":73,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 11:09:39","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 11:09:39"}],"updateItems":[],"deleteItems":[]}', 'dubbo-app-schedule', 'default', 'application', NULL, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(3, '{"createItems":[],"updateItems":[{"oldItem":{"namespaceId":2,"key":"server.port","value":"8087","comment":"","lineNum":2,"id":3,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},"newItem":{"namespaceId":2,"key":"server.port","value":"8083","comment":"","lineNum":2,"id":3,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 13:53:15"}}],"deleteItems":[]}', 'dubbo-app-system', 'default', 'application', NULL, b'0', 'apollo', '2018-05-30 13:53:16', 'apollo', '2018-05-30 13:53:16'),
	(4, '{"createItems":[],"updateItems":[{"oldItem":{"namespaceId":2,"key":"server.port","value":"8083","comment":"","lineNum":2,"id":3,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 13:53:16"},"newItem":{"namespaceId":2,"key":"server.port","value":"8087","comment":"","lineNum":2,"id":3,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 13:56:19"}}],"deleteItems":[]}', 'dubbo-app-system', 'default', 'application', NULL, b'0', 'apollo', '2018-05-30 13:56:19', 'apollo', '2018-05-30 13:56:19'),
	(5, '{"createItems":[],"updateItems":[{"oldItem":{"namespaceId":2,"key":"shiro_redis_session","value":"600000","comment":"","lineNum":31,"id":32,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 10:17:08"},"newItem":{"namespaceId":2,"key":"shiro_redis_session","value":"600000123","comment":"","lineNum":31,"id":32,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 14:01:47"}}],"deleteItems":[]}', 'dubbo-app-system', 'default', 'application', NULL, b'0', 'apollo', '2018-05-30 14:01:47', 'apollo', '2018-05-30 14:01:47'),
	(6, '{"createItems":[],"updateItems":[{"oldItem":{"namespaceId":2,"key":"shiro_redis_session","value":"600000123","comment":"","lineNum":31,"id":32,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 14:01:47"},"newItem":{"namespaceId":2,"key":"shiro_redis_session","value":"6000009","comment":"","lineNum":31,"id":32,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 14:15:00"}}],"deleteItems":[]}', 'dubbo-app-system', 'default', 'application', NULL, b'0', 'apollo', '2018-05-30 14:15:01', 'apollo', '2018-05-30 14:15:01'),
	(7, '{"createItems":[],"updateItems":[{"oldItem":{"namespaceId":2,"key":"shiro_redis_session","value":"6000009","comment":"","lineNum":31,"id":32,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 14:15:01"},"newItem":{"namespaceId":2,"key":"shiro_redis_session","value":"60000066","comment":"","lineNum":31,"id":32,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-05-30 10:17:08","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-05-30 14:20:36"}}],"deleteItems":[]}', 'dubbo-app-system', 'default', 'application', NULL, b'0', 'apollo', '2018-05-30 14:20:37', 'apollo', '2018-05-30 14:20:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='使用配置的应用实例';

-- 正在导出表  apolloconfigdb.instance 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `instance` DISABLE KEYS */;
INSERT INTO `instance` (`Id`, `AppId`, `ClusterName`, `DataCenter`, `Ip`, `DataChange_CreatedTime`, `DataChange_LastTime`) VALUES
	(1, 'dubbo-app-system', 'default', '', '192.168.11.187', '2018-05-30 10:46:35', '2018-05-30 10:46:35'),
	(2, 'dubbo-app-schedule', 'default', '', '192.168.11.187', '2018-05-30 11:20:44', '2018-05-30 11:20:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='应用实例的配置信息';

-- 正在导出表  apolloconfigdb.instanceconfig 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `instanceconfig` DISABLE KEYS */;
INSERT INTO `instanceconfig` (`Id`, `InstanceId`, `ConfigAppId`, `ConfigClusterName`, `ConfigNamespaceName`, `ReleaseKey`, `ReleaseDeliveryTime`, `DataChange_CreatedTime`, `DataChange_LastTime`) VALUES
	(1, 1, 'dubbo-app-system', 'default', 'application', '20180530101758-e3984527ca28c0cc', '2018-05-30 10:46:34', '2018-05-30 10:46:34', '2018-05-30 10:46:34'),
	(2, 2, 'dubbo-app-schedule', 'default', 'application', '20180530112031-8f404527ca28c0cd', '2018-05-30 11:20:44', '2018-05-30 11:20:44', '2018-05-30 11:20:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COMMENT='配置项目';

-- 正在导出表  apolloconfigdb.item 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`Id`, `NamespaceId`, `Key`, `Value`, `Comment`, `LineNum`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 1, 'timeout', '100', 'sample timeout配置', 1, b'0', 'default', '2018-05-29 18:04:24', '', '2018-05-29 18:04:24'),
	(2, 2, 'server.context-path', '/dubbo-app-system', '', 1, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(3, 2, 'server.port', '8087', '', 2, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 13:56:19'),
	(4, 2, '', '', '', 3, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(5, 2, 'spring.datasource.url', 'jdbc:mysql://localhost:3306/dubbo-app?useUnicode=true&characterEncoding=utf-8', '', 4, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(6, 2, 'spring.datasource.username', 'root', '', 5, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(7, 2, 'spring.datasource.password', 'root', '', 6, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(8, 2, 'spring.datasource.driver-class-name', 'com.mysql.jdbc.Driver', '', 7, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(9, 2, 'spring.datasource.type', 'com.alibaba.druid.pool.DruidDataSource', '', 8, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(10, 2, '', '', '', 9, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(11, 2, 'spring.datasource.initialSize', '5', '', 10, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(12, 2, 'spring.datasource.minIdle', '5', '', 11, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(13, 2, 'spring.datasource.maxActive', '20', '', 12, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(14, 2, 'spring.datasource.maxWait', '60000', '', 13, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(15, 2, 'spring.datasource.timeBetweenEvictionRunsMillis', '60000', '', 14, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(16, 2, 'spring.datasource.minEvictableIdleTimeMillis', '300000', '', 15, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(17, 2, 'spring.datasource.validationQuery', 'SELECT 1 FROM DUAL', '', 16, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(18, 2, 'spring.datasource.testWhileIdle', 'true', '', 17, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(19, 2, 'spring.datasource.testOnBorrow', 'false', '', 18, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(20, 2, 'spring.datasource.testOnReturn', 'false', '', 19, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(21, 2, 'spring.datasource.filters', 'stat,wall,log4j', '', 20, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(22, 2, 'spring.datasource.logSlowSql', 'true', '', 21, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(23, 2, '', '', '', 22, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(24, 2, 'mybatis.mapper-locations', 'classpath:mapping/*/*.xml', '', 23, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(25, 2, 'configLocation', 'classpath:mybatis-config.xml', '', 24, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(26, 2, '', '', '', 25, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(27, 2, 'spring.redis.host', '127.0.0.1', '', 26, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(28, 2, 'spring.redis.port', '6379', '', 27, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(29, 2, 'spring.redis.password', '', '', 28, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(30, 2, '', '', '', 29, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(31, 2, 'shiro_redis_cache', '600000', '', 30, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(32, 2, 'shiro_redis_session', '60000066', '', 31, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 14:20:37'),
	(33, 2, 'mybatis_redis_cache', '600000', '', 32, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(34, 2, '', '', '', 33, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(35, 2, 'dubbo.application', 'dubbo-app-system', '', 34, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(36, 2, 'dubbo.registry', 'zookeeper://127.0.0.1:2181', '', 35, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(37, 2, 'dubbo.protocol', '20881', '', 36, b'0', 'apollo', '2018-05-30 10:17:08', 'apollo', '2018-05-30 10:17:08'),
	(38, 3, 'server.context-path', '/dubbo-app-schedule', '', 1, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(39, 3, 'server.port', '8085', '', 2, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(40, 3, '', '', '', 3, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(41, 3, 'spring.datasource.url', 'jdbc:mysql://localhost:3306/dubbo-app?useUnicode=true&characterEncoding=utf-8', '', 4, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(42, 3, 'spring.datasource.username', 'root', '', 5, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(43, 3, 'spring.datasource.password', 'root', '', 6, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(44, 3, 'spring.datasource.driver-class-name', 'com.mysql.jdbc.Driver', '', 7, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(45, 3, 'spring.datasource.type', 'com.alibaba.druid.pool.DruidDataSource', '', 8, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(46, 3, '', '', '', 9, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(47, 3, 'spring.datasource.initialSize', '5', '', 10, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(48, 3, 'spring.datasource.minIdle', '5', '', 11, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(49, 3, 'spring.datasource.maxActive', '20', '', 12, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(50, 3, 'spring.datasource.maxWait', '60000', '', 13, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(51, 3, 'spring.datasource.timeBetweenEvictionRunsMillis', '60000', '', 14, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(52, 3, 'spring.datasource.minEvictableIdleTimeMillis', '300000', '', 15, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(53, 3, 'spring.datasource.validationQuery', 'SELECT 1 FROM DUAL', '', 16, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(54, 3, 'spring.datasource.testWhileIdle', 'true', '', 17, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(55, 3, 'spring.datasource.testOnBorrow', 'false', '', 18, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(56, 3, 'spring.datasource.testOnReturn', 'false', '', 19, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(57, 3, 'spring.datasource.filters', 'stat,wall,log4j', '', 20, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(58, 3, 'spring.datasource.logSlowSql', 'true', '', 21, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(59, 3, '', '', '', 22, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(60, 3, 'mybatis.mapper-locations', 'classpath:mapping/*/*.xml', '', 23, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(61, 3, 'configLocation', 'classpath:mybatis-config.xml', '', 24, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(62, 3, '', '', '', 25, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(63, 3, 'spring.redis.host', '127.0.0.1', '', 26, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(64, 3, 'spring.redis.port', '6379', '', 27, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(65, 3, 'spring.redis.password', '', '', 28, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(66, 3, '', '', '', 29, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(67, 3, 'shiro_redis_cache', '600000', '', 30, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(68, 3, 'shiro_redis_session', '600000', '', 31, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(69, 3, 'mybatis_redis_cache', '600000', '', 32, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(70, 3, '', '', '', 33, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(71, 3, 'dubbo.application', 'dubbo-app-schedule', '', 34, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(72, 3, 'dubbo.registry', 'zookeeper://127.0.0.1:2181', '', 35, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40'),
	(73, 3, 'dubbo.protocol', '20882', '', 36, b'0', 'apollo', '2018-05-30 11:09:40', 'apollo', '2018-05-30 11:09:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='命名空间';

-- 正在导出表  apolloconfigdb.namespace 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `namespace` DISABLE KEYS */;
INSERT INTO `namespace` (`Id`, `AppId`, `ClusterName`, `NamespaceName`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'SampleApp', 'default', 'application', b'0', 'default', '2018-05-29 18:04:24', '', '2018-05-29 18:04:24'),
	(2, 'dubbo-app-system', 'default', 'application', b'0', 'apollo', '2018-05-30 10:15:44', 'apollo', '2018-05-30 10:15:44'),
	(3, 'dubbo-app-schedule', 'default', 'application', b'0', 'apollo', '2018-05-30 11:09:21', 'apollo', '2018-05-30 11:09:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='发布';

-- 正在导出表  apolloconfigdb.release 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `release` DISABLE KEYS */;
INSERT INTO `release` (`Id`, `ReleaseKey`, `Name`, `Comment`, `AppId`, `ClusterName`, `NamespaceName`, `Configurations`, `IsAbandoned`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, '20161009155425-d3a0749c6e20bc15', '20161009155424-release', 'Sample发布', 'SampleApp', 'default', 'application', '{"timeout":"100"}', b'0', b'0', 'default', '2018-05-29 18:04:24', '', '2018-05-29 18:04:24'),
	(2, '20180530101758-e3984527ca28c0cc', '20180530101752-release', '', 'dubbo-app-system', 'default', 'application', '{"spring.redis.host":"127.0.0.1","dubbo.protocol":"20881","spring.datasource.timeBetweenEvictionRunsMillis":"60000","spring.datasource.minIdle":"5","configLocation":"classpath:mybatis-config.xml","spring.datasource.driver-class-name":"com.mysql.jdbc.Driver","spring.datasource.maxActive":"20","spring.datasource.maxWait":"60000","mybatis.mapper-locations":"classpath:mapping/*/*.xml","shiro_redis_cache":"600000","spring.datasource.filters":"stat,wall,log4j","spring.datasource.initialSize":"5","server.port":"8087","mybatis_redis_cache":"600000","spring.redis.password":"","shiro_redis_session":"600000","spring.datasource.testWhileIdle":"true","server.context-path":"/dubbo-app-system","spring.redis.port":"6379","dubbo.application":"dubbo-app-system","spring.datasource.minEvictableIdleTimeMillis":"300000","spring.datasource.password":"root","spring.datasource.logSlowSql":"true","spring.datasource.username":"root","spring.datasource.testOnBorrow":"false","spring.datasource.url":"jdbc:mysql://localhost:3306/dubbo-app?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf-8","spring.datasource.testOnReturn":"false","spring.datasource.validationQuery":"SELECT 1 FROM DUAL","spring.datasource.type":"com.alibaba.druid.pool.DruidDataSource","dubbo.registry":"zookeeper://127.0.0.1:2181"}', b'0', b'0', 'apollo', '2018-05-30 10:17:59', 'apollo', '2018-05-30 10:17:59'),
	(3, '20180530112031-8f404527ca28c0cd', '20180530112028-release', '', 'dubbo-app-schedule', 'default', 'application', '{"spring.redis.host":"127.0.0.1","dubbo.protocol":"20882","spring.datasource.timeBetweenEvictionRunsMillis":"60000","spring.datasource.minIdle":"5","configLocation":"classpath:mybatis-config.xml","spring.datasource.driver-class-name":"com.mysql.jdbc.Driver","spring.datasource.maxActive":"20","spring.datasource.maxWait":"60000","mybatis.mapper-locations":"classpath:mapping/*/*.xml","shiro_redis_cache":"600000","spring.datasource.filters":"stat,wall,log4j","spring.datasource.initialSize":"5","server.port":"8085","mybatis_redis_cache":"600000","spring.redis.password":"","shiro_redis_session":"600000","spring.datasource.testWhileIdle":"true","server.context-path":"/dubbo-app-schedule","spring.redis.port":"6379","dubbo.application":"dubbo-app-schedule","spring.datasource.minEvictableIdleTimeMillis":"300000","spring.datasource.password":"root","spring.datasource.logSlowSql":"true","spring.datasource.username":"root","spring.datasource.testOnBorrow":"false","spring.datasource.url":"jdbc:mysql://localhost:3306/dubbo-app?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf-8","spring.datasource.testOnReturn":"false","spring.datasource.validationQuery":"SELECT 1 FROM DUAL","spring.datasource.type":"com.alibaba.druid.pool.DruidDataSource","dubbo.registry":"zookeeper://127.0.0.1:2181"}', b'0', b'0', 'apollo', '2018-05-30 11:20:32', 'apollo', '2018-05-30 11:20:32'),
	(4, '20180530135320-e3984527ca28c0ce', '20180530135319-release', '', 'dubbo-app-system', 'default', 'application', '{"spring.redis.host":"127.0.0.1","dubbo.protocol":"20881","spring.datasource.timeBetweenEvictionRunsMillis":"60000","spring.datasource.minIdle":"5","configLocation":"classpath:mybatis-config.xml","spring.datasource.driver-class-name":"com.mysql.jdbc.Driver","spring.datasource.maxActive":"20","spring.datasource.maxWait":"60000","mybatis.mapper-locations":"classpath:mapping/*/*.xml","shiro_redis_cache":"600000","spring.datasource.filters":"stat,wall,log4j","spring.datasource.initialSize":"5","server.port":"8083","mybatis_redis_cache":"600000","spring.redis.password":"","shiro_redis_session":"600000","spring.datasource.testWhileIdle":"true","server.context-path":"/dubbo-app-system","spring.redis.port":"6379","dubbo.application":"dubbo-app-system","spring.datasource.minEvictableIdleTimeMillis":"300000","spring.datasource.password":"root","spring.datasource.logSlowSql":"true","spring.datasource.username":"root","spring.datasource.testOnBorrow":"false","spring.datasource.url":"jdbc:mysql://localhost:3306/dubbo-app?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf-8","spring.datasource.testOnReturn":"false","spring.datasource.validationQuery":"SELECT 1 FROM DUAL","spring.datasource.type":"com.alibaba.druid.pool.DruidDataSource","dubbo.registry":"zookeeper://127.0.0.1:2181"}', b'0', b'0', 'apollo', '2018-05-30 13:53:21', 'apollo', '2018-05-30 13:53:21'),
	(5, '20180530135622-e3984527ca28c0cf', '20180530135621-release', '', 'dubbo-app-system', 'default', 'application', '{"spring.redis.host":"127.0.0.1","dubbo.protocol":"20881","spring.datasource.timeBetweenEvictionRunsMillis":"60000","spring.datasource.minIdle":"5","configLocation":"classpath:mybatis-config.xml","spring.datasource.driver-class-name":"com.mysql.jdbc.Driver","spring.datasource.maxActive":"20","spring.datasource.maxWait":"60000","mybatis.mapper-locations":"classpath:mapping/*/*.xml","shiro_redis_cache":"600000","spring.datasource.filters":"stat,wall,log4j","spring.datasource.initialSize":"5","server.port":"8087","mybatis_redis_cache":"600000","spring.redis.password":"","shiro_redis_session":"600000","spring.datasource.testWhileIdle":"true","server.context-path":"/dubbo-app-system","spring.redis.port":"6379","dubbo.application":"dubbo-app-system","spring.datasource.minEvictableIdleTimeMillis":"300000","spring.datasource.password":"root","spring.datasource.logSlowSql":"true","spring.datasource.username":"root","spring.datasource.testOnBorrow":"false","spring.datasource.url":"jdbc:mysql://localhost:3306/dubbo-app?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf-8","spring.datasource.testOnReturn":"false","spring.datasource.validationQuery":"SELECT 1 FROM DUAL","spring.datasource.type":"com.alibaba.druid.pool.DruidDataSource","dubbo.registry":"zookeeper://127.0.0.1:2181"}', b'0', b'0', 'apollo', '2018-05-30 13:56:23', 'apollo', '2018-05-30 13:56:23'),
	(6, '20180530140150-e3984527ca28c0d0', '20180530140149-release', '', 'dubbo-app-system', 'default', 'application', '{"spring.redis.host":"127.0.0.1","dubbo.protocol":"20881","spring.datasource.timeBetweenEvictionRunsMillis":"60000","spring.datasource.minIdle":"5","configLocation":"classpath:mybatis-config.xml","spring.datasource.driver-class-name":"com.mysql.jdbc.Driver","spring.datasource.maxActive":"20","spring.datasource.maxWait":"60000","mybatis.mapper-locations":"classpath:mapping/*/*.xml","shiro_redis_cache":"600000","spring.datasource.filters":"stat,wall,log4j","spring.datasource.initialSize":"5","server.port":"8087","mybatis_redis_cache":"600000","spring.redis.password":"","shiro_redis_session":"600000123","spring.datasource.testWhileIdle":"true","server.context-path":"/dubbo-app-system","spring.redis.port":"6379","dubbo.application":"dubbo-app-system","spring.datasource.minEvictableIdleTimeMillis":"300000","spring.datasource.password":"root","spring.datasource.logSlowSql":"true","spring.datasource.username":"root","spring.datasource.testOnBorrow":"false","spring.datasource.url":"jdbc:mysql://localhost:3306/dubbo-app?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf-8","spring.datasource.testOnReturn":"false","spring.datasource.validationQuery":"SELECT 1 FROM DUAL","spring.datasource.type":"com.alibaba.druid.pool.DruidDataSource","dubbo.registry":"zookeeper://127.0.0.1:2181"}', b'0', b'0', 'apollo', '2018-05-30 14:01:51', 'apollo', '2018-05-30 14:01:51'),
	(7, '20180530141507-e3984527ca28c0d1', '20180530141504-release', '', 'dubbo-app-system', 'default', 'application', '{"spring.redis.host":"127.0.0.1","dubbo.protocol":"20881","spring.datasource.timeBetweenEvictionRunsMillis":"60000","spring.datasource.minIdle":"5","configLocation":"classpath:mybatis-config.xml","spring.datasource.driver-class-name":"com.mysql.jdbc.Driver","spring.datasource.maxActive":"20","spring.datasource.maxWait":"60000","mybatis.mapper-locations":"classpath:mapping/*/*.xml","shiro_redis_cache":"600000","spring.datasource.filters":"stat,wall,log4j","spring.datasource.initialSize":"5","server.port":"8087","mybatis_redis_cache":"600000","spring.redis.password":"","shiro_redis_session":"6000009","spring.datasource.testWhileIdle":"true","server.context-path":"/dubbo-app-system","spring.redis.port":"6379","dubbo.application":"dubbo-app-system","spring.datasource.minEvictableIdleTimeMillis":"300000","spring.datasource.password":"root","spring.datasource.logSlowSql":"true","spring.datasource.username":"root","spring.datasource.testOnBorrow":"false","spring.datasource.url":"jdbc:mysql://localhost:3306/dubbo-app?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf-8","spring.datasource.testOnReturn":"false","spring.datasource.validationQuery":"SELECT 1 FROM DUAL","spring.datasource.type":"com.alibaba.druid.pool.DruidDataSource","dubbo.registry":"zookeeper://127.0.0.1:2181"}', b'0', b'0', 'apollo', '2018-05-30 14:15:07', 'apollo', '2018-05-30 14:15:07'),
	(8, '20180530142633-e3984527ca28c0d2', '20180530142613-release', '', 'dubbo-app-system', 'default', 'application', '{"spring.redis.host":"127.0.0.1","dubbo.protocol":"20881","spring.datasource.timeBetweenEvictionRunsMillis":"60000","spring.datasource.minIdle":"5","configLocation":"classpath:mybatis-config.xml","spring.datasource.driver-class-name":"com.mysql.jdbc.Driver","spring.datasource.maxActive":"20","spring.datasource.maxWait":"60000","mybatis.mapper-locations":"classpath:mapping/*/*.xml","shiro_redis_cache":"600000","spring.datasource.filters":"stat,wall,log4j","spring.datasource.initialSize":"5","server.port":"8087","mybatis_redis_cache":"600000","spring.redis.password":"","shiro_redis_session":"60000066","spring.datasource.testWhileIdle":"true","server.context-path":"/dubbo-app-system","spring.redis.port":"6379","dubbo.application":"dubbo-app-system","spring.datasource.minEvictableIdleTimeMillis":"300000","spring.datasource.password":"root","spring.datasource.logSlowSql":"true","spring.datasource.username":"root","spring.datasource.testOnBorrow":"false","spring.datasource.url":"jdbc:mysql://localhost:3306/dubbo-app?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf-8","spring.datasource.testOnReturn":"false","spring.datasource.validationQuery":"SELECT 1 FROM DUAL","spring.datasource.type":"com.alibaba.druid.pool.DruidDataSource","dubbo.registry":"zookeeper://127.0.0.1:2181"}', b'0', b'0', 'apollo', '2018-05-30 14:26:33', 'apollo', '2018-05-30 14:26:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='发布历史';

-- 正在导出表  apolloconfigdb.releasehistory 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `releasehistory` DISABLE KEYS */;
INSERT INTO `releasehistory` (`Id`, `AppId`, `ClusterName`, `NamespaceName`, `BranchName`, `ReleaseId`, `PreviousReleaseId`, `Operation`, `OperationContext`, `IsDeleted`, `DataChange_CreatedBy`, `DataChange_CreatedTime`, `DataChange_LastModifiedBy`, `DataChange_LastTime`) VALUES
	(1, 'SampleApp', 'default', 'application', 'default', 1, 0, 0, '{}', b'0', 'apollo', '2018-05-29 18:04:24', 'apollo', '2018-05-29 18:04:24'),
	(2, 'dubbo-app-system', 'default', 'application', 'default', 2, 0, 0, '{"isEmergencyPublish":false}', b'0', 'apollo', '2018-05-30 10:17:59', 'apollo', '2018-05-30 10:17:59'),
	(3, 'dubbo-app-schedule', 'default', 'application', 'default', 3, 0, 0, '{"isEmergencyPublish":false}', b'0', 'apollo', '2018-05-30 11:20:32', 'apollo', '2018-05-30 11:20:32'),
	(4, 'dubbo-app-system', 'default', 'application', 'default', 4, 2, 0, '{"isEmergencyPublish":false}', b'0', 'apollo', '2018-05-30 13:53:21', 'apollo', '2018-05-30 13:53:21'),
	(5, 'dubbo-app-system', 'default', 'application', 'default', 5, 4, 0, '{"isEmergencyPublish":false}', b'0', 'apollo', '2018-05-30 13:56:23', 'apollo', '2018-05-30 13:56:23'),
	(6, 'dubbo-app-system', 'default', 'application', 'default', 6, 5, 0, '{"isEmergencyPublish":false}', b'0', 'apollo', '2018-05-30 14:01:51', 'apollo', '2018-05-30 14:01:51'),
	(7, 'dubbo-app-system', 'default', 'application', 'default', 7, 6, 0, '{"isEmergencyPublish":false}', b'0', 'apollo', '2018-05-30 14:15:07', 'apollo', '2018-05-30 14:15:07'),
	(8, 'dubbo-app-system', 'default', 'application', 'default', 8, 7, 0, '{"isEmergencyPublish":false}', b'0', 'apollo', '2018-05-30 14:26:33', 'apollo', '2018-05-30 14:26:33');
/*!40000 ALTER TABLE `releasehistory` ENABLE KEYS */;

-- 导出  表 apolloconfigdb.releasemessage 结构
CREATE TABLE IF NOT EXISTS `releasemessage` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Message` varchar(1024) NOT NULL DEFAULT '' COMMENT '发布的消息内容',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Message` (`Message`(191))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='发布消息';

-- 正在导出表  apolloconfigdb.releasemessage 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `releasemessage` DISABLE KEYS */;
INSERT INTO `releasemessage` (`Id`, `Message`, `DataChange_LastTime`) VALUES
	(2, 'dubbo-app-schedule+default+application', '2018-05-30 11:20:32'),
	(7, 'dubbo-app-system+default+application', '2018-05-30 14:26:33');
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
	(1, 'eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔', b'0', 'default', '2018-05-29 18:04:24', '', '2018-05-29 18:04:24'),
	(2, 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', b'0', 'default', '2018-05-29 18:04:24', '', '2018-05-29 18:04:24'),
	(3, 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', b'0', 'default', '2018-05-29 18:04:24', '', '2018-05-29 18:04:24'),
	(4, 'config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！', b'0', 'default', '2018-05-29 18:04:24', '', '2018-05-29 18:04:24'),
	(5, 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', b'0', 'default', '2018-05-29 18:04:24', '', '2018-05-29 18:04:24');
/*!40000 ALTER TABLE `serverconfig` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
