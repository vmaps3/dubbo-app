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


-- 导出 xxl-job 的数据库结构
CREATE DATABASE IF NOT EXISTS `xxl-job` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `xxl-job`;

-- 导出  表 xxl-job.xxl_job_qrtz_blob_triggers 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `xxl_job_qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `xxl_job_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_blob_triggers 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_qrtz_blob_triggers` ENABLE KEYS */;

-- 导出  表 xxl-job.xxl_job_qrtz_calendars 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_calendars 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_qrtz_calendars` ENABLE KEYS */;

-- 导出  表 xxl-job.xxl_job_qrtz_cron_triggers 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `xxl_job_qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `xxl_job_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_cron_triggers 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_cron_triggers` DISABLE KEYS */;
INSERT INTO `xxl_job_qrtz_cron_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `CRON_EXPRESSION`, `TIME_ZONE_ID`) VALUES
	('quartzScheduler', '1', '1', '*/5 * * * * ?', 'Asia/Shanghai');
/*!40000 ALTER TABLE `xxl_job_qrtz_cron_triggers` ENABLE KEYS */;

-- 导出  表 xxl-job.xxl_job_qrtz_fired_triggers 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_fired_triggers 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_fired_triggers` DISABLE KEYS */;
INSERT INTO `xxl_job_qrtz_fired_triggers` (`SCHED_NAME`, `ENTRY_ID`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `INSTANCE_NAME`, `FIRED_TIME`, `SCHED_TIME`, `PRIORITY`, `STATE`, `JOB_NAME`, `JOB_GROUP`, `IS_NONCONCURRENT`, `REQUESTS_RECOVERY`) VALUES
	('quartzScheduler', 'wangsong-PC15277347492481527734749407', '1', '1', 'wangsong-PC1527734749248', 1527738500002, 1527738500000, 5, 'EXECUTING', '1', '1', '0', '0');
/*!40000 ALTER TABLE `xxl_job_qrtz_fired_triggers` ENABLE KEYS */;

-- 导出  表 xxl-job.xxl_job_qrtz_job_details 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_job_details 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_job_details` DISABLE KEYS */;
INSERT INTO `xxl_job_qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `JOB_CLASS_NAME`, `IS_DURABLE`, `IS_NONCONCURRENT`, `IS_UPDATE_DATA`, `REQUESTS_RECOVERY`, `JOB_DATA`) VALUES
	('quartzScheduler', '1', '1', NULL, 'com.xxl.job.admin.core.jobbean.RemoteHttpJobBean', '0', '0', '0', '0', _binary 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61703FE8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D6170133F3F760A3F00025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC13F603F000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
/*!40000 ALTER TABLE `xxl_job_qrtz_job_details` ENABLE KEYS */;

-- 导出  表 xxl-job.xxl_job_qrtz_locks 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_locks 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_locks` DISABLE KEYS */;
INSERT INTO `xxl_job_qrtz_locks` (`SCHED_NAME`, `LOCK_NAME`) VALUES
	('quartzScheduler', 'STATE_ACCESS'),
	('quartzScheduler', 'TRIGGER_ACCESS');
/*!40000 ALTER TABLE `xxl_job_qrtz_locks` ENABLE KEYS */;

-- 导出  表 xxl-job.xxl_job_qrtz_paused_trigger_grps 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_paused_trigger_grps 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_qrtz_paused_trigger_grps` ENABLE KEYS */;

-- 导出  表 xxl-job.xxl_job_qrtz_scheduler_state 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_scheduler_state 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_scheduler_state` DISABLE KEYS */;
INSERT INTO `xxl_job_qrtz_scheduler_state` (`SCHED_NAME`, `INSTANCE_NAME`, `LAST_CHECKIN_TIME`, `CHECKIN_INTERVAL`) VALUES
	('quartzScheduler', 'wangsong-PC1527734749248', 1527738497025, 5000);
/*!40000 ALTER TABLE `xxl_job_qrtz_scheduler_state` ENABLE KEYS */;

-- 导出  表 xxl-job.xxl_job_qrtz_simple_triggers 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `xxl_job_qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `xxl_job_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_simple_triggers 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_qrtz_simple_triggers` ENABLE KEYS */;

-- 导出  表 xxl-job.xxl_job_qrtz_simprop_triggers 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `xxl_job_qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `xxl_job_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_simprop_triggers 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_qrtz_simprop_triggers` ENABLE KEYS */;

-- 导出  表 xxl-job.xxl_job_qrtz_triggers 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `xxl_job_qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `xxl_job_qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_triggers 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_triggers` DISABLE KEYS */;
INSERT INTO `xxl_job_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `NEXT_FIRE_TIME`, `PREV_FIRE_TIME`, `PRIORITY`, `TRIGGER_STATE`, `TRIGGER_TYPE`, `START_TIME`, `END_TIME`, `CALENDAR_NAME`, `MISFIRE_INSTR`, `JOB_DATA`) VALUES
	('quartzScheduler', '1', '1', '1', '1', NULL, 1527738505000, 1527738500000, 5, 'ACQUIRED', 'CRON', 1527737577000, 0, NULL, 2, _binary '');
/*!40000 ALTER TABLE `xxl_job_qrtz_triggers` ENABLE KEYS */;

-- 导出  表 xxl-job.xxl_job_qrtz_trigger_group 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_trigger_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) NOT NULL COMMENT '执行器名称',
  `order` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `address_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` varchar(512) DEFAULT NULL COMMENT '执行器地址列表，多地址逗号分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_trigger_group 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_trigger_group` DISABLE KEYS */;
INSERT INTO `xxl_job_qrtz_trigger_group` (`id`, `app_name`, `title`, `order`, `address_type`, `address_list`) VALUES
	(1, 'xxl-job-executor-sample', '示例执行器', 1, 0, '192.168.11.187:9999');
/*!40000 ALTER TABLE `xxl_job_qrtz_trigger_group` ENABLE KEYS */;

-- 导出  表 xxl-job.xxl_job_qrtz_trigger_info 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_trigger_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_cron` varchar(128) NOT NULL COMMENT '任务执行CRON',
  `job_desc` varchar(255) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) DEFAULT NULL COMMENT '报警邮件',
  `executor_route_strategy` varchar(50) DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_fail_strategy` varchar(50) DEFAULT NULL COMMENT '失败处理策略',
  `glue_type` varchar(50) NOT NULL COMMENT 'GLUE类型',
  `glue_source` text COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_trigger_info 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_trigger_info` DISABLE KEYS */;
INSERT INTO `xxl_job_qrtz_trigger_info` (`id`, `job_group`, `job_cron`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_fail_strategy`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`) VALUES
	(1, 1, '*/5 * * * * ?', 'wangsongdemo', '2018-05-31 11:32:57', '2018-05-31 11:37:51', 'wangsong', '', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 'FAIL_ALARM', 'BEAN', '', 'GLUE代码初始化', '2018-05-31 11:32:57', '');
/*!40000 ALTER TABLE `xxl_job_qrtz_trigger_info` ENABLE KEYS */;

-- 导出  表 xxl-job.xxl_job_qrtz_trigger_log 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_trigger_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `executor_address` varchar(255) DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int(11) NOT NULL COMMENT '调度-结果',
  `trigger_msg` varchar(2048) DEFAULT NULL COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int(11) NOT NULL COMMENT '执行-状态',
  `handle_msg` varchar(2048) DEFAULT NULL COMMENT '执行-日志',
  PRIMARY KEY (`id`),
  KEY `I_trigger_time` (`trigger_time`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_trigger_log 的数据：~179 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_trigger_log` DISABLE KEYS */;
INSERT INTO `xxl_job_qrtz_trigger_log` (`id`, `job_group`, `job_id`, `glue_type`, `executor_address`, `executor_handler`, `executor_param`, `trigger_time`, `trigger_code`, `trigger_msg`, `handle_time`, `handle_code`, `handle_msg`) VALUES
	(1, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:33:00', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:33:11', 200, ''),
	(2, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:33:05', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:33:21', 200, ''),
	(3, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:33:10', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:33:31', 200, ''),
	(4, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:33:15', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:33:41', 200, ''),
	(5, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:33:20', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:33:51', 200, ''),
	(6, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:33:25', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:34:01', 200, ''),
	(7, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:33:30', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:34:11', 200, ''),
	(8, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:33:35', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:34:21', 200, ''),
	(9, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:33:40', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:34:31', 200, ''),
	(10, 1, 1, 'BEAN', '192.168.11.187:9999', '', '', '2018-05-31 11:33:45', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：job handler [] not found.', NULL, 0, NULL),
	(11, 1, 1, 'BEAN', '192.168.11.187:9999', '', '', '2018-05-31 11:33:50', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：job handler [] not found.', NULL, 0, NULL),
	(12, 1, 1, 'BEAN', '192.168.11.187:9999', '', '', '2018-05-31 11:33:55', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：job handler [] not found.', NULL, 0, NULL),
	(13, 1, 1, 'BEAN', '192.168.11.187:9999', '', '', '2018-05-31 11:34:00', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：job handler [] not found.', NULL, 0, NULL),
	(14, 1, 1, 'BEAN', '192.168.11.187:9999', '', '', '2018-05-31 11:34:05', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：job handler [] not found.', NULL, 0, NULL),
	(15, 1, 1, 'BEAN', '192.168.11.187:9999', '', '', '2018-05-31 11:34:10', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：job handler [] not found.', NULL, 0, NULL),
	(16, 1, 1, 'BEAN', '192.168.11.187:9999', '', '', '2018-05-31 11:34:15', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：job handler [] not found.', NULL, 0, NULL),
	(17, 1, 1, 'BEAN', '192.168.11.187:9999', '', '', '2018-05-31 11:34:20', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：job handler [] not found.', NULL, 0, NULL),
	(18, 1, 1, 'BEAN', '192.168.11.187:9999', '', '', '2018-05-31 11:34:25', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：job handler [] not found.', NULL, 0, NULL),
	(19, 1, 1, 'BEAN', '192.168.11.187:9999', '', '', '2018-05-31 11:34:30', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：job handler [] not found.', NULL, 0, NULL),
	(20, 1, 1, 'BEAN', '192.168.11.187:9999', '', '', '2018-05-31 11:34:35', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：job handler [] not found.', NULL, 0, NULL),
	(21, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:34:40', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:34:50', 200, ''),
	(22, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:34:45', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:35:00', 200, ''),
	(23, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:34:50', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:35:10', 200, ''),
	(24, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:34:55', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:35:20', 200, ''),
	(25, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:35:00', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:35:30', 200, ''),
	(26, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:35:05', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:35:40', 200, ''),
	(27, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:35:10', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:35:50', 200, ''),
	(28, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:35:15', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:36:00', 200, ''),
	(29, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:35:20', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:36:10', 200, ''),
	(30, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:35:25', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:36:20', 200, ''),
	(31, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:35:30', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:36:30', 200, ''),
	(32, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:35:35', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:36:40', 200, ''),
	(33, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:35:40', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:36:50', 200, ''),
	(34, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:35:45', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', NULL, 0, NULL),
	(35, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:35:50', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', NULL, 0, NULL),
	(36, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:35:55', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', NULL, 0, NULL),
	(37, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:36:00', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', NULL, 0, NULL),
	(38, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:36:05', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', NULL, 0, NULL),
	(39, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:36:10', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', NULL, 0, NULL),
	(40, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:36:15', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', NULL, 0, NULL),
	(41, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:36:20', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', NULL, 0, NULL),
	(42, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:36:25', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', NULL, 0, NULL),
	(43, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:36:30', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', NULL, 0, NULL),
	(44, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:36:35', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', NULL, 0, NULL),
	(45, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:36:40', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', NULL, 0, NULL),
	(46, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:36:45', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', NULL, 0, NULL),
	(47, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:36:50', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', NULL, 0, NULL),
	(48, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:36:55', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(49, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:37:00', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(50, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:37:05', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(51, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:37:10', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(52, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:37:15', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:37:16', 200, ''),
	(53, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:37:20', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:37:20', 200, ''),
	(54, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:37:25', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:37:25', 200, ''),
	(55, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:37:30', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:37:30', 200, ''),
	(56, 1, 1, 'BEAN', '192.168.11.187:9999', '', '', '2018-05-31 11:37:35', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：job handler [] not found.', NULL, 0, NULL),
	(57, 1, 1, 'BEAN', '192.168.11.187:9999', '', '', '2018-05-31 11:37:40', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：job handler [] not found.', NULL, 0, NULL),
	(58, 1, 1, 'BEAN', '192.168.11.187:9999', '', '', '2018-05-31 11:37:45', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：job handler [] not found.', NULL, 0, NULL),
	(59, 1, 1, 'BEAN', '192.168.11.187:9999', '', '', '2018-05-31 11:37:50', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：job handler [] not found.', NULL, 0, NULL),
	(60, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:37:55', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:37:55', 200, ''),
	(61, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:38:00', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:38:00', 200, ''),
	(62, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:38:05', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:38:05', 200, ''),
	(63, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:38:10', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:38:10', 200, ''),
	(64, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:38:15', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:38:15', 200, ''),
	(65, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:38:20', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:38:20', 200, ''),
	(66, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:38:25', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:38:25', 200, ''),
	(67, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:38:30', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(68, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:38:35', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(69, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:38:40', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(70, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:38:45', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(71, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:38:50', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(72, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:38:55', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(73, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:39:01', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(74, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:39:05', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(75, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:39:10', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(76, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:39:15', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(77, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:39:20', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(78, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:39:25', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(79, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:39:30', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(80, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:39:35', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(81, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:39:40', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(82, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:39:45', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(83, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:39:50', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(84, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:39:55', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：500<br>msg：java.lang.RuntimeException: Network request error: Connect to 192.168.11.187:9999 [/192.168.11.187] failed: Connection refused: connect', NULL, 0, NULL),
	(85, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:40:00', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(86, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:40:05', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(87, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:40:10', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(88, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:40:15', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(89, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:40:20', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(90, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:40:25', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(91, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:40:30', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(92, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:40:35', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(93, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:40:40', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(94, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:40:45', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(95, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:40:50', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(96, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:40:55', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(97, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:41:00', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(98, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:41:05', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(99, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:41:10', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(100, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:41:15', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(101, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:41:20', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(102, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:41:25', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(103, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:41:30', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(104, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:41:35', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(105, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:41:40', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(106, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:41:45', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(107, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:41:50', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(108, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:41:55', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(109, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:42:00', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(110, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:42:05', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(111, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:42:10', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(112, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:42:15', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(113, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:42:20', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(114, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:42:25', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(115, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:42:30', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(116, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:42:35', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(117, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:42:40', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(118, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:42:45', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(119, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:42:50', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(120, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:42:55', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(121, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:43:00', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(122, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:43:05', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(123, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:43:10', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(124, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:43:15', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(125, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:43:20', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(126, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:43:25', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(127, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:43:30', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(128, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:43:35', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(129, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:43:40', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(130, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:43:45', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(131, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:43:50', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(132, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:43:55', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(133, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:44:00', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(134, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:44:05', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(135, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:44:10', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(136, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:44:15', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(137, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:44:20', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(138, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:44:25', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(139, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:44:30', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(140, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:44:35', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(141, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:44:40', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(142, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:44:45', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(143, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:44:50', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(144, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:44:55', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(145, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:45:00', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(146, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:45:05', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(147, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:45:10', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(148, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:45:15', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(149, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:45:20', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(150, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:45:25', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(151, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:45:30', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(152, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:45:35', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(153, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:45:40', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(154, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:45:45', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(155, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:45:50', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(156, 1, 1, 'BEAN', NULL, 'demoJobHandler', '', '2018-05-31 11:45:55', 500, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', NULL, 0, NULL),
	(157, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:46:00', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:46:00', 200, ''),
	(158, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:46:05', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:46:05', 200, ''),
	(159, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:46:10', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:46:10', 200, ''),
	(160, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:46:15', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:46:15', 200, ''),
	(161, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:46:20', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:46:20', 200, ''),
	(162, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:46:25', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:46:25', 200, ''),
	(163, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:46:30', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:46:30', 200, ''),
	(164, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:46:35', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:46:35', 200, ''),
	(165, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:46:40', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:46:40', 200, ''),
	(166, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:46:45', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:46:45', 200, ''),
	(167, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:46:50', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:46:50', 200, ''),
	(168, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:46:55', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:46:55', 200, ''),
	(169, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:47:00', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:47:00', 200, ''),
	(170, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:47:05', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:47:05', 200, ''),
	(171, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:47:10', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:47:10', 200, ''),
	(172, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:47:15', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:47:15', 200, ''),
	(173, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:47:20', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:47:20', 200, ''),
	(174, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:47:25', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:47:25', 200, ''),
	(175, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:47:30', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:47:30', 200, ''),
	(176, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:47:35', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:47:35', 200, ''),
	(177, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:47:40', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:47:40', 200, ''),
	(178, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:47:45', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:47:45', 200, ''),
	(179, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:47:50', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:47:50', 200, ''),
	(180, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:47:55', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:47:55', 200, ''),
	(181, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:48:00', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:48:00', 200, ''),
	(182, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:48:05', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:48:05', 200, ''),
	(183, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:48:10', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:48:10', 200, ''),
	(184, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:48:15', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:48:15', 200, ''),
	(185, 1, 1, 'BEAN', '192.168.11.187:9999', 'demoJobHandler', '', '2018-05-31 11:48:20', 200, '调度机器：192.168.11.187<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.11.187:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.11.187:9999<br>code：200<br>msg：null', '2018-05-31 11:48:20', 200, '');
/*!40000 ALTER TABLE `xxl_job_qrtz_trigger_log` ENABLE KEYS */;

-- 导出  表 xxl-job.xxl_job_qrtz_trigger_logglue 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_trigger_logglue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` text COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) NOT NULL COMMENT 'GLUE备注',
  `add_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_trigger_logglue 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_trigger_logglue` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_qrtz_trigger_logglue` ENABLE KEYS */;

-- 导出  表 xxl-job.xxl_job_qrtz_trigger_registry 结构
CREATE TABLE IF NOT EXISTS `xxl_job_qrtz_trigger_registry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(255) NOT NULL,
  `registry_key` varchar(255) NOT NULL,
  `registry_value` varchar(255) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  xxl-job.xxl_job_qrtz_trigger_registry 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `xxl_job_qrtz_trigger_registry` DISABLE KEYS */;
INSERT INTO `xxl_job_qrtz_trigger_registry` (`id`, `registry_group`, `registry_key`, `registry_value`, `update_time`) VALUES
	(2, 'EXECUTOR', 'xxl-job-executor-sample', '192.168.11.187:9999', '2018-05-31 11:48:19');
/*!40000 ALTER TABLE `xxl_job_qrtz_trigger_registry` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
