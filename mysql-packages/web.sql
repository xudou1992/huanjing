/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.199
Source Server Version : 80044
Source Host           : 192.168.1.199:3306
Source Database       : web64

Target Server Type    : MYSQL
Target Server Version : 80044
File Encoding         : 65001

Date: 2026-01-02 10:57:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `password` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `question` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `answer` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `qq` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `tel` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `id_type` enum('IdCard') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'IdCard',
  `id_card` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `point` int DEFAULT '0',
  `expoint` int DEFAULT '0',
  `is_online` smallint unsigned NOT NULL DEFAULT '0',
  `is_lock` smallint unsigned NOT NULL DEFAULT '0',
  `is_gm` smallint unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`name`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('138', '1111@game.sohu.com', 'b59c67bf196a4758191e42f76670ceba', '1111', null, null, null, null, '123.161.110.239', 'IdCard', null, '0', '0', '0', '0', '0', null);

-- ----------------------------
-- Table structure for `account_banip`
-- ----------------------------
DROP TABLE IF EXISTS `account_banip`;
CREATE TABLE `account_banip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `host` char(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tips` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of account_banip
-- ----------------------------

-- ----------------------------
-- Table structure for `account_prize`
-- ----------------------------
DROP TABLE IF EXISTS `account_prize`;
CREATE TABLE `account_prize` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '账号',
  `world` int NOT NULL DEFAULT '0' COMMENT '世界ID',
  `charguid` int unsigned NOT NULL DEFAULT '0' COMMENT '玩家GUID',
  `itemid` int unsigned NOT NULL DEFAULT '0' COMMENT '物品ID',
  `itemnum` int NOT NULL COMMENT '物品数量',
  `isget` smallint NOT NULL COMMENT '是否领取了',
  `validtime` int NOT NULL COMMENT '有效期，时间格式为unix时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of account_prize
-- ----------------------------

-- ----------------------------
-- Table structure for `server`
-- ----------------------------
DROP TABLE IF EXISTS `server`;
CREATE TABLE `server` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `host` char(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of server
-- ----------------------------

-- ----------------------------
-- Table structure for `server_cfg`
-- ----------------------------
DROP TABLE IF EXISTS `server_cfg`;
CREATE TABLE `server_cfg` (
  `world` int NOT NULL COMMENT '世界ID',
  `time_open` int NOT NULL DEFAULT '0' COMMENT '服务器开放时间(ansi时间) 为0则不检查',
  `temp_stop` int NOT NULL DEFAULT '0' COMMENT '是否临时维护状态',
  PRIMARY KEY (`world`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of server_cfg
-- ----------------------------
INSERT INTO `server_cfg` VALUES ('10', '0', '0');
INSERT INTO `server_cfg` VALUES ('11', '0', '0');
