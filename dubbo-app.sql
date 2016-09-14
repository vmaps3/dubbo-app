-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.11-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 dubbo-app 的数据库结构
DROP DATABASE IF EXISTS `dubbo-app`;
CREATE DATABASE IF NOT EXISTS `dubbo-app` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dubbo-app`;


-- 导出  表 dubbo-app.muser 结构
DROP TABLE IF EXISTS `muser`;
CREATE TABLE IF NOT EXISTS `muser` (
  `ID` varchar(50) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dubbo-app.muser 的数据：~2 rows (大约)
DELETE FROM `muser`;
/*!40000 ALTER TABLE `muser` DISABLE KEYS */;
INSERT INTO `muser` (`ID`, `NAME`, `AGE`, `ADDRESS`) VALUES
	('234816db-56fd-443c-9558-ec94c9fac09b', '7', 2, '44'),
	('d96f898b-0dd8-4ffa-9b8b-096fd7dde0fd', '2', 2, '2');
/*!40000 ALTER TABLE `muser` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
