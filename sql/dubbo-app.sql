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


-- 导出 dubbo-app 的数据库结构
CREATE DATABASE IF NOT EXISTS `dubbo-app` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dubbo-app`;

-- 导出  表 dubbo-app.customer_user_amount 结构
CREATE TABLE IF NOT EXISTS `customer_user_amount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `amount` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.customer_user_amount 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `customer_user_amount` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_user_amount` ENABLE KEYS */;

-- 导出  表 dubbo-app.customer_user_amount_history 结构
CREATE TABLE IF NOT EXISTS `customer_user_amount_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.customer_user_amount_history 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `customer_user_amount_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_user_amount_history` ENABLE KEYS */;

-- 导出  表 dubbo-app.order 结构
CREATE TABLE IF NOT EXISTS `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `state` int(11) DEFAULT NULL COMMENT '1未支付，2已支付，3取消支付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.order 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- 导出  表 dubbo-app.order_details 结构
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0',
  `spu_sku_id` bigint(20) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.order_details 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;

-- 导出  表 dubbo-app.spu 结构
CREATE TABLE IF NOT EXISTS `spu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spu_type_id` bigint(20) NOT NULL DEFAULT '0',
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.spu 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `spu` DISABLE KEYS */;
/*!40000 ALTER TABLE `spu` ENABLE KEYS */;

-- 导出  表 dubbo-app.spu_sku 结构
CREATE TABLE IF NOT EXISTS `spu_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spu_id` bigint(20) NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.spu_sku 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `spu_sku` DISABLE KEYS */;
/*!40000 ALTER TABLE `spu_sku` ENABLE KEYS */;

-- 导出  表 dubbo-app.spu_sku_stock_history 结构
CREATE TABLE IF NOT EXISTS `spu_sku_stock_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spu_sku_id` bigint(20) NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.spu_sku_stock_history 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `spu_sku_stock_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `spu_sku_stock_history` ENABLE KEYS */;

-- 导出  表 dubbo-app.spu_type 结构
CREATE TABLE IF NOT EXISTS `spu_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.spu_type 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `spu_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `spu_type` ENABLE KEYS */;

-- 导出  表 dubbo-app.spu_type_attributes 结构
CREATE TABLE IF NOT EXISTS `spu_type_attributes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spu_type_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.spu_type_attributes 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `spu_type_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `spu_type_attributes` ENABLE KEYS */;

-- 导出  表 dubbo-app.spu_type_attributes_value 结构
CREATE TABLE IF NOT EXISTS `spu_type_attributes_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `spu_id` bigint(20) NOT NULL DEFAULT '0',
  `sku_id` bigint(20) NOT NULL DEFAULT '0',
  `spu_type_attributes_id` bigint(20) NOT NULL DEFAULT '0',
  `spu_type_value_id` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.spu_type_attributes_value 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `spu_type_attributes_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `spu_type_attributes_value` ENABLE KEYS */;

-- 导出  表 dubbo-app.spu_type_value 结构
CREATE TABLE IF NOT EXISTS `spu_type_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spu_type_attributes_id` bigint(20) NOT NULL DEFAULT '0',
  `value` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.spu_type_value 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `spu_type_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `spu_type_value` ENABLE KEYS */;

-- 导出  表 dubbo-app.system_resources 结构
CREATE TABLE IF NOT EXISTS `system_resources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.system_resources 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `system_resources` DISABLE KEYS */;
INSERT INTO `system_resources` (`id`, `pid`, `name`, `url`, `type`, `sort`) VALUES
	(1, 0, '菜单', '/', '1', NULL),
	(2, 1, '系统管理', '/system', '1', 1),
	(8, 2, '菜单管理', '/system/resources', '1', 3),
	(9, 8, '增加', '/system/resources/add', '2', NULL),
	(10, 8, '删除', '/system/resources/delete', '2', NULL),
	(11, 8, '列表', '/system/resources/list', '2', NULL),
	(12, 8, '更改', '/system/resources/update', '2', NULL),
	(13, 2, '角色管理', '/system/role', '1', 2),
	(14, 13, '添加', '/system/role/add', '2', NULL),
	(15, 13, '删除', '/system/role/delete', '2', NULL),
	(16, 13, '列表', '/system/role/list', '2', NULL),
	(17, 13, '更改', '/system/role/update', '2', NULL),
	(18, 2, '用户管理', '/system/user', '1', 1),
	(19, 18, '添加', '/system/user/add', '2', NULL),
	(20, 18, '删除', '/system/user/delete', '2', NULL),
	(21, 18, '列表', '/system/user/list', '2', NULL),
	(22, 18, '更改', '/system/user/update', '2', NULL);
/*!40000 ALTER TABLE `system_resources` ENABLE KEYS */;

-- 导出  表 dubbo-app.system_role 结构
CREATE TABLE IF NOT EXISTS `system_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.system_role 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `system_role` DISABLE KEYS */;
INSERT INTO `system_role` (`id`, `name`) VALUES
	(1, 'JAVA');
/*!40000 ALTER TABLE `system_role` ENABLE KEYS */;

-- 导出  表 dubbo-app.system_role_resources 结构
CREATE TABLE IF NOT EXISTS `system_role_resources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `resources_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.system_role_resources 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `system_role_resources` DISABLE KEYS */;
INSERT INTO `system_role_resources` (`id`, `role_id`, `resources_id`) VALUES
	(1, 1, 2),
	(7, 1, 8),
	(8, 1, 9),
	(9, 1, 10),
	(10, 1, 1),
	(11, 1, 11),
	(12, 1, 12),
	(13, 1, 13),
	(14, 1, 14),
	(15, 1, 15),
	(16, 1, 16),
	(17, 1, 17),
	(18, 1, 18),
	(19, 1, 19),
	(20, 1, 20),
	(21, 1, 21),
	(22, 1, 22);
/*!40000 ALTER TABLE `system_role_resources` ENABLE KEYS */;

-- 导出  表 dubbo-app.system_user 结构
CREATE TABLE IF NOT EXISTS `system_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.system_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `system_user` DISABLE KEYS */;
INSERT INTO `system_user` (`id`, `username`, `password`) VALUES
	(1, 'wangsong', '532da1c5da9fb86bf61b2a63487f300c');
/*!40000 ALTER TABLE `system_user` ENABLE KEYS */;

-- 导出  表 dubbo-app.system_user_role 结构
CREATE TABLE IF NOT EXISTS `system_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.system_user_role 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `system_user_role` DISABLE KEYS */;
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`) VALUES
	(1, 1, 1);
/*!40000 ALTER TABLE `system_user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
