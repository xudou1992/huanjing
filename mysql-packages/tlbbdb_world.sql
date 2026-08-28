/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.199
Source Server Version : 80044
Source Host           : 192.168.1.199:3306
Source Database       : tlbbdb_world

Target Server Type    : MYSQL
Target Server Version : 80044
File Encoding         : 65001

Date: 2026-01-02 10:57:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_ability`
-- ----------------------------
DROP TABLE IF EXISTS `t_ability`;
CREATE TABLE `t_ability` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `abid` smallint NOT NULL,
  `ablvl` smallint NOT NULL,
  `abexp` int unsigned NOT NULL,
  `dbversion` int DEFAULT '0',
  `isvalid` int DEFAULT '1',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_ab_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2984 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_ability
-- ----------------------------

-- ----------------------------
-- Table structure for `t_auction`
-- ----------------------------
DROP TABLE IF EXISTS `t_auction`;
CREATE TABLE `t_auction` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `zoneworldid` int NOT NULL,
  `poolid` int NOT NULL,
  `tabletype` int NOT NULL,
  `curstatus` int NOT NULL,
  `prize` int NOT NULL,
  `ownername` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ownerguid` int NOT NULL,
  `gtime` int NOT NULL,
  `dtime` int NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_pshop_new_sidpid` (`poolid`) USING BTREE,
  KEY `Index_pshop_new_ownerguid` (`ownerguid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_auction
-- ----------------------------

-- ----------------------------
-- Table structure for `t_auction_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_auction_item`;
CREATE TABLE `t_auction_item` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `zoneworldid` int NOT NULL,
  `poolid` int NOT NULL,
  `Itm_guid` int NOT NULL,
  `Itm_world` int NOT NULL,
  `Itm_server` int NOT NULL,
  `Itm_itemtype` int NOT NULL,
  `Itm_p1` int NOT NULL,
  `Itm_p2` int NOT NULL,
  `Itm_p3` int NOT NULL,
  `Itm_p4` int NOT NULL,
  `Itm_p5` int NOT NULL,
  `Itm_p6` int NOT NULL,
  `Itm_p7` int NOT NULL,
  `Itm_p8` int NOT NULL,
  `Itm_p9` int NOT NULL,
  `Itm_p10` int NOT NULL,
  `Itm_p11` int NOT NULL,
  `Itm_p12` int NOT NULL,
  `Itm_p13` int NOT NULL,
  `Itm_p14` int NOT NULL,
  `Itm_p15` int NOT NULL DEFAULT '0',
  `Itm_p16` int NOT NULL DEFAULT '0',
  `Itm_p17` int NOT NULL DEFAULT '0',
  `Itm_p18` int NOT NULL DEFAULT '0',
  `Itm_p19` int NOT NULL DEFAULT '0',
  `Itm_p20` int NOT NULL DEFAULT '0',
  `Itm_p21` int NOT NULL DEFAULT '0',
  `Itm_creator` varchar(180) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `Itm_dbversion` int DEFAULT '0',
  `Itm_fixattr` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Itm_var` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `Itm_visualid` int NOT NULL DEFAULT '0',
  `Itm_maxgemid` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE KEY `Index_pauction_unit_ItmUntIndex` (`poolid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_auction_item
-- ----------------------------

-- ----------------------------
-- Table structure for `t_auction_pet`
-- ----------------------------
DROP TABLE IF EXISTS `t_auction_pet`;
CREATE TABLE `t_auction_pet` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `zoneworldid` int NOT NULL,
  `poolid` int NOT NULL,
  `Pet_hpetguid` int NOT NULL,
  `Pet_lpetguid` int NOT NULL,
  `Pet_dataxid` int NOT NULL,
  `Pet_petname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Pet_petnick` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Pet_level` int NOT NULL,
  `Pet_needlevel` int NOT NULL,
  `Pet_atttype` int NOT NULL,
  `Pet_aitype` int NOT NULL,
  `Pet_camp` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Pet_hp` int NOT NULL,
  `Pet_mp` int NOT NULL,
  `Pet_life` int NOT NULL,
  `Pet_pettype` smallint NOT NULL,
  `Pet_genera` smallint NOT NULL,
  `Pet_enjoy` smallint NOT NULL,
  `Pet_strper` int NOT NULL,
  `Pet_conper` int NOT NULL,
  `Pet_dexper` int NOT NULL,
  `Pet_sprper` int NOT NULL,
  `Pet_iprper` int NOT NULL,
  `Pet_gengu` int NOT NULL,
  `Pet_growrate` int NOT NULL,
  `Pet_repoint` int NOT NULL,
  `Pet_exp` int NOT NULL,
  `Pet_str` int NOT NULL,
  `Pet_con` int NOT NULL,
  `Pet_dex` int NOT NULL,
  `Pet_spr` int NOT NULL,
  `Pet_ipr` int NOT NULL,
  `Pet_skill` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Pet_dbversion` int DEFAULT '0',
  `Pet_flags` int DEFAULT NULL,
  `Pet_isvalid` int DEFAULT '1',
  `Pet_pwflag` int DEFAULT '0',
  `Pet_pclvl` int DEFAULT '0',
  `Pet_hspetguid` int DEFAULT '0',
  `Pet_lspetguid` int DEFAULT '0',
  `Pet_savvy` int DEFAULT '0',
  `Pet_title` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `Pet_curtitle` int NOT NULL DEFAULT '-1',
  `Pet_us_unlock_time` int NOT NULL DEFAULT '0',
  `Pet_us_reserve` int NOT NULL DEFAULT '0',
  `Pet_olddataxid` int NOT NULL,
  `Pet_fitvalue` int NOT NULL,
  `Pet_linxing` int NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE KEY `Index_pshop_stall_pet_ShpStlUntIndex` (`poolid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_auction_pet
-- ----------------------------

-- ----------------------------
-- Table structure for `t_char`
-- ----------------------------
DROP TABLE IF EXISTS `t_char`;
CREATE TABLE `t_char` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `accname` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `charguid` int NOT NULL,
  `zoneworldid` int NOT NULL,
  `charname` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `title` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `pw` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `sex` smallint NOT NULL,
  `level` int NOT NULL,
  `enegry` int NOT NULL,
  `energymax` int NOT NULL,
  `outlook` int NOT NULL,
  `scene` int NOT NULL,
  `xpos` int NOT NULL,
  `zpos` int NOT NULL,
  `menpai` smallint NOT NULL,
  `hp` int NOT NULL,
  `mp` int NOT NULL,
  `strikepoint` smallint NOT NULL,
  `engpoint` smallint NOT NULL,
  `str` int NOT NULL,
  `spr` int NOT NULL,
  `con` int NOT NULL,
  `ipr` int NOT NULL,
  `dex` int NOT NULL,
  `points` int NOT NULL,
  `logouttime` int NOT NULL,
  `logintime` int NOT NULL,
  `createtime` int NOT NULL,
  `haircolor` int NOT NULL,
  `hairmodel` int NOT NULL,
  `facecolor` int NOT NULL,
  `facemodel` int NOT NULL,
  `vmoney` int NOT NULL,
  `isvalid` smallint NOT NULL,
  `exp` int NOT NULL,
  `pres` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mdata` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `mexdata` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `mflag` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `relflag` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `settings` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `dbversion` int NOT NULL DEFAULT '0',
  `shopinfo` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `carrypet` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `posspet` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `guldid` int NOT NULL,
  `teamid` int NOT NULL,
  `headid` int NOT NULL,
  `erecover` int NOT NULL,
  `vigor` int NOT NULL,
  `maxvigor` int NOT NULL,
  `vrecover` int NOT NULL,
  `pwdeltime` int NOT NULL,
  `pinfo` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bkscene` int DEFAULT NULL,
  `bkxpos` int DEFAULT NULL,
  `bkzpos` int DEFAULT NULL,
  `titleinfo` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `dietime` int NOT NULL,
  `cooldown` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bankmoney` int NOT NULL,
  `bankend` int NOT NULL,
  `petbankend` int NOT NULL,
  `fashionend` int NOT NULL,
  `rage` int DEFAULT '0',
  `reserve` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dinfo` int DEFAULT '0',
  `defeq` int DEFAULT '-1',
  `guildpoint` int DEFAULT '0',
  `menpaipoint` int DEFAULT '0',
  `gevil` int DEFAULT '0',
  `pkvalue` int DEFAULT '0',
  `otime` int DEFAULT '0',
  `deltime` int DEFAULT '0',
  `expinfo` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `savetime` int DEFAULT '0',
  `crc32` int DEFAULT '0',
  `pvpinfo` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `loginip` int NOT NULL DEFAULT '0',
  `pkvaluetime` int NOT NULL DEFAULT '0',
  `fatigue` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `yuanbao` int NOT NULL DEFAULT '0',
  `visualgem` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `whwg` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `isolditem` smallint NOT NULL DEFAULT '0',
  `uipoint` int NOT NULL DEFAULT '0',
  `zengdian` int NOT NULL DEFAULT '0',
  `bdyuanbao` int NOT NULL DEFAULT '0',
  `petposs` int NOT NULL,
  `curpetdataid` int NOT NULL,
  `power` smallint NOT NULL,
  `headframeid` int NOT NULL,
  `sect_type` int NOT NULL,
  `sect_point` int NOT NULL,
  `banendtime` int NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE KEY `Index_char_charguid` (`charguid`) USING BTREE,
  UNIQUE KEY `Index_char_charname` (`charname`) USING BTREE,
  KEY `Index_char_accname` (`accname`) USING BTREE,
  KEY `Index_char_level` (`level`,`exp`) USING BTREE,
  KEY `Index_char_yuanbao` (`yuanbao`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_char
-- ----------------------------

-- ----------------------------
-- Table structure for `t_charextra`
-- ----------------------------
DROP TABLE IF EXISTS `t_charextra`;
CREATE TABLE `t_charextra` (
  `charguid` int NOT NULL,
  `dbversion` int NOT NULL DEFAULT '0',
  `buyyuanbao` int NOT NULL DEFAULT '0',
  `costyuanbao` int NOT NULL DEFAULT '0',
  `kmcount` int NOT NULL DEFAULT '0',
  `cmcount` tinyint NOT NULL DEFAULT '0',
  `sbmoney` int unsigned NOT NULL DEFAULT '0',
  `sbunlock` int unsigned NOT NULL DEFAULT '0',
  `sbstatus` smallint NOT NULL DEFAULT '0',
  `ipregion` int NOT NULL DEFAULT '-1',
  `petnumextra` tinyint NOT NULL DEFAULT '0',
  `leagueid` int NOT NULL DEFAULT '-1',
  `moneyjz` int NOT NULL DEFAULT '0',
  `mycamcount` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mysterystore` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `week_active` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tjcpvp_shop` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fanli_shop` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fashion_auc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ibidentityid` int NOT NULL DEFAULT '0',
  `ibpower` int NOT NULL DEFAULT '0',
  `dwbank` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`charguid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_charextra
-- ----------------------------

-- ----------------------------
-- Table structure for `t_chedifulu`
-- ----------------------------
DROP TABLE IF EXISTS `t_chedifulu`;
CREATE TABLE `t_chedifulu` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `idx` smallint NOT NULL,
  `sceneid` smallint NOT NULL,
  `x` smallint NOT NULL,
  `z` smallint NOT NULL,
  `dbversion` int DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_talent_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_chedifulu
-- ----------------------------

-- ----------------------------
-- Table structure for `t_city_building`
-- ----------------------------
DROP TABLE IF EXISTS `t_city_building`;
CREATE TABLE `t_city_building` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `zoneworldid` int NOT NULL,
  `poolid` int NOT NULL DEFAULT '0',
  `bdtype` int NOT NULL DEFAULT '-1',
  `bdid` int NOT NULL DEFAULT '-1',
  `bdlevel` smallint NOT NULL DEFAULT '0',
  `ri` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ricontri` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rimaxnum` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `riprice` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ritvalue` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rivalid` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rinum` smallint NOT NULL DEFAULT '0',
  `isvalid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE KEY `Index_citybd_poolid` (`poolid`,`bdtype`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_city_building
-- ----------------------------

-- ----------------------------
-- Table structure for `t_city_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_city_info`;
CREATE TABLE `t_city_info` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `zoneworldid` int NOT NULL,
  `poolid` int NOT NULL,
  `fcityid1` int NOT NULL DEFAULT '-1',
  `fboth1` smallint NOT NULL DEFAULT '0',
  `fcityid2` int NOT NULL DEFAULT '-1',
  `fboth2` smallint NOT NULL DEFAULT '0',
  `fcityid3` int NOT NULL DEFAULT '-1',
  `fboth3` smallint NOT NULL DEFAULT '0',
  `fcityid4` int NOT NULL DEFAULT '-1',
  `fboth4` smallint NOT NULL DEFAULT '0',
  `fcityid5` int NOT NULL DEFAULT '-1',
  `fboth5` smallint NOT NULL DEFAULT '0',
  `fcityid6` int NOT NULL DEFAULT '-1',
  `fboth6` smallint NOT NULL DEFAULT '0',
  `fcityid7` int NOT NULL DEFAULT '-1',
  `fboth7` smallint NOT NULL DEFAULT '0',
  `fcityid8` int NOT NULL DEFAULT '-1',
  `fboth8` smallint NOT NULL DEFAULT '0',
  `fnum` int NOT NULL,
  `btime1` int NOT NULL DEFAULT '0',
  `bguild1` int NOT NULL DEFAULT '-1',
  `bguild2` int NOT NULL DEFAULT '-1',
  `btime2` int NOT NULL DEFAULT '0',
  `bguild3` int NOT NULL DEFAULT '-1',
  `btime3` int NOT NULL DEFAULT '0',
  `bnum` int NOT NULL DEFAULT '0',
  `isvalid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_cityinfo_pooid` (`poolid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_city_info
-- ----------------------------
INSERT INTO `t_city_info` VALUES ('1', '10', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('2', '10', '1', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('3', '10', '2', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('4', '10', '3', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('5', '10', '4', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('6', '10', '5', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('7', '10', '6', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('8', '10', '7', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('9', '10', '8', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('10', '10', '9', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('11', '10', '10', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('12', '10', '11', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('13', '10', '12', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('14', '10', '13', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('15', '10', '14', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('16', '10', '15', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('17', '10', '16', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('18', '10', '17', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('19', '10', '18', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('20', '10', '19', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('21', '10', '20', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('22', '10', '21', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('23', '10', '22', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('24', '10', '23', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('25', '10', '24', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('26', '10', '25', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('27', '10', '26', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('28', '10', '27', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('29', '10', '28', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('30', '10', '29', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('31', '10', '30', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('32', '10', '31', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('33', '10', '32', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('34', '10', '33', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('35', '10', '34', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('36', '10', '35', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('37', '10', '36', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('38', '10', '37', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('39', '10', '38', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('40', '10', '39', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('41', '10', '40', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('42', '10', '41', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('43', '10', '42', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('44', '10', '43', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('45', '10', '44', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('46', '10', '45', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('47', '10', '46', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('48', '10', '47', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('49', '10', '48', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('50', '10', '49', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('51', '10', '50', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('52', '10', '51', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('53', '10', '52', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('54', '10', '53', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('55', '10', '54', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('56', '10', '55', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('57', '10', '56', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('58', '10', '57', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('59', '10', '58', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('60', '10', '59', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('61', '10', '60', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('62', '10', '61', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('63', '10', '62', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('64', '10', '63', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('65', '10', '64', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('66', '10', '65', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('67', '10', '66', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('68', '10', '67', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('69', '10', '68', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('70', '10', '69', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('71', '10', '70', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('72', '10', '71', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('73', '10', '72', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('74', '10', '73', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('75', '10', '74', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('76', '10', '75', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('77', '10', '76', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('78', '10', '77', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('79', '10', '78', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('80', '10', '79', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('81', '10', '80', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('82', '10', '81', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('83', '10', '82', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('84', '10', '83', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('85', '10', '84', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('86', '10', '85', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('87', '10', '86', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('88', '10', '87', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('89', '10', '88', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('90', '10', '89', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('91', '10', '90', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('92', '10', '91', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('93', '10', '92', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('94', '10', '93', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('95', '10', '94', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('96', '10', '95', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('97', '10', '96', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('98', '10', '97', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('99', '10', '98', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('100', '10', '99', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('101', '10', '100', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('102', '10', '101', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('103', '10', '102', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('104', '10', '103', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('105', '10', '104', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('106', '10', '105', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('107', '10', '106', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('108', '10', '107', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('109', '10', '108', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('110', '10', '109', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('111', '10', '110', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('112', '10', '111', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('113', '10', '112', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('114', '10', '113', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('115', '10', '114', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('116', '10', '115', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('117', '10', '116', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('118', '10', '117', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('119', '10', '118', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('120', '10', '119', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('121', '10', '120', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('122', '10', '121', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('123', '10', '122', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('124', '10', '123', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('125', '10', '124', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('126', '10', '125', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('127', '10', '126', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('128', '10', '127', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('129', '10', '128', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('130', '10', '129', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('131', '10', '130', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('132', '10', '131', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('133', '10', '132', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('134', '10', '133', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('135', '10', '134', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('136', '10', '135', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('137', '10', '136', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('138', '10', '137', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('139', '10', '138', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('140', '10', '139', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('141', '10', '140', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('142', '10', '141', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('143', '10', '142', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('144', '10', '143', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('145', '10', '144', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('146', '10', '145', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('147', '10', '146', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('148', '10', '147', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('149', '10', '148', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('150', '10', '149', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('151', '10', '150', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('152', '10', '151', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('153', '10', '152', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('154', '10', '153', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('155', '10', '154', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('156', '10', '155', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('157', '10', '156', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('158', '10', '157', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('159', '10', '158', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('160', '10', '159', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('161', '10', '160', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('162', '10', '161', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('163', '10', '162', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('164', '10', '163', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('165', '10', '164', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('166', '10', '165', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('167', '10', '166', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('168', '10', '167', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('169', '10', '168', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('170', '10', '169', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('171', '10', '170', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('172', '10', '171', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('173', '10', '172', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('174', '10', '173', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('175', '10', '174', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('176', '10', '175', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('177', '10', '176', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('178', '10', '177', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('179', '10', '178', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('180', '10', '179', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('181', '10', '180', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('182', '10', '181', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('183', '10', '182', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('184', '10', '183', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('185', '10', '184', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('186', '10', '185', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('187', '10', '186', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('188', '10', '187', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('189', '10', '188', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('190', '10', '189', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('191', '10', '190', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('192', '10', '191', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('193', '10', '192', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('194', '10', '193', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('195', '10', '194', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('196', '10', '195', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('197', '10', '196', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('198', '10', '197', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('199', '10', '198', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('200', '10', '199', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('201', '10', '200', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('202', '10', '201', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('203', '10', '202', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('204', '10', '203', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('205', '10', '204', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('206', '10', '205', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('207', '10', '206', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('208', '10', '207', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('209', '10', '208', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('210', '10', '209', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('211', '10', '210', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('212', '10', '211', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('213', '10', '212', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('214', '10', '213', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('215', '10', '214', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('216', '10', '215', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('217', '10', '216', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('218', '10', '217', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('219', '10', '218', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('220', '10', '219', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('221', '10', '220', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('222', '10', '221', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('223', '10', '222', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('224', '10', '223', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('225', '10', '224', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('226', '10', '225', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('227', '10', '226', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('228', '10', '227', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('229', '10', '228', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('230', '10', '229', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('231', '10', '230', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('232', '10', '231', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('233', '10', '232', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('234', '10', '233', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('235', '10', '234', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('236', '10', '235', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('237', '10', '236', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('238', '10', '237', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('239', '10', '238', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('240', '10', '239', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('241', '10', '240', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('242', '10', '241', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('243', '10', '242', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('244', '10', '243', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('245', '10', '244', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('246', '10', '245', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('247', '10', '246', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('248', '10', '247', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('249', '10', '248', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('250', '10', '249', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('251', '10', '250', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('252', '10', '251', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('253', '10', '252', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('254', '10', '253', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');
INSERT INTO `t_city_info` VALUES ('255', '10', '254', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '-1', '0', '0', '0', '-1', '0', '-1', '0', '-1', '0', '0');

-- ----------------------------
-- Table structure for `t_city_new`
-- ----------------------------
DROP TABLE IF EXISTS `t_city_new`;
CREATE TABLE `t_city_new` (
  `poolid` int NOT NULL,
  `zoneworldid` int NOT NULL,
  `guildid` int NOT NULL DEFAULT '-1',
  `scene` int NOT NULL DEFAULT '-1',
  `citylevel` smallint NOT NULL DEFAULT '0',
  `cityname` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cubprog` int NOT NULL DEFAULT '0',
  `mxbprog` int NOT NULL DEFAULT '0',
  `cusprog` int NOT NULL DEFAULT '0',
  `mxsprog` int NOT NULL DEFAULT '0',
  `curupbld` int NOT NULL DEFAULT '0',
  `mantain` smallint NOT NULL DEFAULT '0',
  `indrate` int NOT NULL DEFAULT '0',
  `argrate` int NOT NULL DEFAULT '0',
  `comrate` int NOT NULL DEFAULT '0',
  `defrate` int NOT NULL DEFAULT '0',
  `scirate` int NOT NULL DEFAULT '0',
  `extrate` int NOT NULL DEFAULT '0',
  `leftpoint` int NOT NULL DEFAULT '0',
  `cuspeifang` int NOT NULL DEFAULT '0',
  `cusbld` int NOT NULL DEFAULT '0',
  `smoney` int NOT NULL DEFAULT '0',
  `smoneyfix` int NOT NULL DEFAULT '0',
  `bmoney` int NOT NULL DEFAULT '0',
  `pmoney` int NOT NULL DEFAULT '0',
  `gmoneymax` int NOT NULL DEFAULT '0',
  `foundtime` int NOT NULL DEFAULT '0',
  `isvalid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`poolid`,`zoneworldid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_city_new
-- ----------------------------
INSERT INTO `t_city_new` VALUES ('0', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('1', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('2', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('3', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('4', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('5', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('6', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('7', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('8', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('9', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('10', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('11', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('12', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('13', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('14', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('15', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('16', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('17', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('18', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('19', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('20', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('21', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('22', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('23', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('24', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('25', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('26', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('27', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('28', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('29', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('30', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('31', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('32', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('33', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('34', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('35', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('36', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('37', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('38', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('39', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('40', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('41', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('42', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('43', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('44', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('45', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('46', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('47', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('48', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('49', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('50', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('51', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('52', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('53', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('54', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('55', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('56', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('57', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('58', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('59', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('60', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('61', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('62', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('63', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('64', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('65', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('66', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('67', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('68', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('69', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('70', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('71', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('72', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('73', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('74', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('75', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('76', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('77', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('78', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('79', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('80', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('81', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('82', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('83', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('84', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('85', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('86', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('87', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('88', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('89', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('90', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('91', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('92', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('93', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('94', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('95', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('96', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('97', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('98', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('99', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('100', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('101', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('102', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('103', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('104', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('105', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('106', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('107', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('108', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('109', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('110', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('111', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('112', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('113', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('114', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('115', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('116', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('117', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('118', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('119', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('120', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('121', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('122', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('123', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('124', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('125', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('126', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('127', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('128', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('129', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('130', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('131', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('132', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('133', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('134', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('135', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('136', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('137', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('138', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('139', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('140', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('141', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('142', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('143', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('144', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('145', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('146', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('147', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('148', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('149', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('150', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('151', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('152', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('153', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('154', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('155', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('156', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('157', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('158', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('159', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('160', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('161', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('162', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('163', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('164', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('165', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('166', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('167', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('168', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('169', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('170', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('171', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('172', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('173', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('174', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('175', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('176', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('177', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('178', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('179', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('180', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('181', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('182', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('183', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('184', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('185', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('186', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('187', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('188', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('189', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('190', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('191', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('192', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('193', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('194', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('195', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('196', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('197', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('198', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('199', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('200', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('201', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('202', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('203', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('204', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('205', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('206', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('207', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('208', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('209', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('210', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('211', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('212', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('213', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('214', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('215', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('216', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('217', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('218', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('219', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('220', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('221', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('222', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('223', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('224', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('225', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('226', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('227', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('228', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('229', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('230', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('231', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('232', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('233', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('234', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('235', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('236', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('237', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('238', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('239', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('240', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('241', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('242', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('243', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('244', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('245', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('246', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('247', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('248', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('249', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('250', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('251', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('252', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('253', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');
INSERT INTO `t_city_new` VALUES ('254', '10', '-1', '-1', '0', '', '0', '0', '0', '0', '-1', '2', '10', '10', '10', '10', '10', '10', '10', '0', '-1', '0', '100', '0', '0', '300', '0', '0');

-- ----------------------------
-- Table structure for `t_crc32`
-- ----------------------------
DROP TABLE IF EXISTS `t_crc32`;
CREATE TABLE `t_crc32` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `logouttime` int NOT NULL,
  `crc32` int NOT NULL,
  `fulldata` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isdelete` smallint NOT NULL DEFAULT '0',
  `server` int NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_crc_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_crc32
-- ----------------------------

-- ----------------------------
-- Table structure for `t_cshop`
-- ----------------------------
DROP TABLE IF EXISTS `t_cshop`;
CREATE TABLE `t_cshop` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `worldid` int NOT NULL,
  `serverid` int NOT NULL,
  `poolid` int NOT NULL,
  `isvalid` int NOT NULL DEFAULT '0',
  `cshopid` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE KEY `Index_cshop_PoolId` (`worldid`,`serverid`,`poolid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_cshop
-- ----------------------------

-- ----------------------------
-- Table structure for `t_cshopitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_cshopitem`;
CREATE TABLE `t_cshopitem` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `cshopid` int NOT NULL,
  `cshoppos` int NOT NULL,
  `serial` int NOT NULL DEFAULT '0',
  `charguid` int NOT NULL,
  `charname` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `gtype` smallint NOT NULL,
  `gvalue` int NOT NULL DEFAULT '0',
  `svalue` int NOT NULL DEFAULT '0',
  `ctime` int NOT NULL DEFAULT '0',
  `costctime` int NOT NULL DEFAULT '0',
  `isvalid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE KEY `Index_cshopitem_cshopid` (`cshopid`,`cshoppos`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_cshopitem
-- ----------------------------

-- ----------------------------
-- Table structure for `t_ctu_cfg`
-- ----------------------------
DROP TABLE IF EXISTS `t_ctu_cfg`;
CREATE TABLE `t_ctu_cfg` (
  `ctu_id` int NOT NULL,
  `ctu_state` int NOT NULL,
  `ctu_magic` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_ctu_cfg
-- ----------------------------

-- ----------------------------
-- Table structure for `t_di4shop`
-- ----------------------------
DROP TABLE IF EXISTS `t_di4shop`;
CREATE TABLE `t_di4shop` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `idx` smallint NOT NULL,
  `buycount` smallint NOT NULL,
  `dbversion` int DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_di4shop_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_di4shop
-- ----------------------------

-- ----------------------------
-- Table structure for `t_exterior`
-- ----------------------------
DROP TABLE IF EXISTS `t_exterior`;
CREATE TABLE `t_exterior` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `exterior_type` int DEFAULT '0',
  `exterior_id` int DEFAULT '0',
  `lefttime` int DEFAULT '0',
  `redpoint` int DEFAULT '0',
  `dbversion` int DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_exterior_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2051 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_exterior
-- ----------------------------

-- ----------------------------
-- Table structure for `t_exterior_char`
-- ----------------------------
DROP TABLE IF EXISTS `t_exterior_char`;
CREATE TABLE `t_exterior_char` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `curface` int DEFAULT '0',
  `curhair` int DEFAULT '0',
  `curhead` int DEFAULT '0',
  `curmount` int DEFAULT '0',
  `curhaircolor` int DEFAULT '0',
  `curfashionidx` int DEFAULT '0',
  `curpetposs` int DEFAULT '0',
  `curpetpossvisual` int DEFAULT '0',
  `curweapon` int DEFAULT '0',
  `curweaponlv` int DEFAULT '0',
  `pro_tag` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pro_dress` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pro_ride` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pro_weapon` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `curpossplan` int DEFAULT '-1',
  `ridecard` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `OrnamentsBackId` int DEFAULT '-1',
  `OrnamentsBackPos` int DEFAULT '0',
  `OrnamentsHeadId` int DEFAULT '-1',
  `OrnamentsHeadPos` int DEFAULT '0',
  `dbversion` int DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_exterior_char_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_exterior_char
-- ----------------------------

-- ----------------------------
-- Table structure for `t_exterior_fashion`
-- ----------------------------
DROP TABLE IF EXISTS `t_exterior_fashion`;
CREATE TABLE `t_exterior_fashion` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `guid` int NOT NULL,
  `world` int NOT NULL,
  `server` int NOT NULL,
  `itemtype` int NOT NULL,
  `pos` smallint NOT NULL,
  `p1` int NOT NULL,
  `p2` int NOT NULL,
  `p3` int NOT NULL,
  `p4` int NOT NULL,
  `p5` int NOT NULL,
  `p6` int NOT NULL,
  `p7` int NOT NULL,
  `p8` int NOT NULL,
  `p9` int NOT NULL,
  `p10` int NOT NULL,
  `p11` int NOT NULL,
  `p12` int NOT NULL,
  `p13` int NOT NULL,
  `p14` int NOT NULL,
  `p15` int DEFAULT '0',
  `p16` int DEFAULT '0',
  `p17` int DEFAULT '0',
  `p18` int DEFAULT NULL,
  `p19` int DEFAULT NULL,
  `p20` int DEFAULT NULL,
  `p21` int DEFAULT NULL,
  `creator` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `isvalid` smallint NOT NULL DEFAULT '1',
  `dbversion` int DEFAULT '0',
  `fixattr` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `var` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `visualid` int NOT NULL DEFAULT '0',
  `maxgemid` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE KEY `Index_it_charguid` (`charguid`,`pos`) USING BTREE,
  KEY `Index_it_itemguid` (`guid`,`world`,`server`) USING BTREE,
  KEY `Index_iteminfo_itemtype` (`itemtype`,`isvalid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_exterior_fashion
-- ----------------------------

-- ----------------------------
-- Table structure for `t_exterior_haircolor`
-- ----------------------------
DROP TABLE IF EXISTS `t_exterior_haircolor`;
CREATE TABLE `t_exterior_haircolor` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `idx` int DEFAULT '0',
  `color` int DEFAULT '0',
  `redpoint` int DEFAULT '0',
  `dbversion` int DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_t_exterior_haircolor_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_exterior_haircolor
-- ----------------------------

-- ----------------------------
-- Table structure for `t_exterior_ornaments`
-- ----------------------------
DROP TABLE IF EXISTS `t_exterior_ornaments`;
CREATE TABLE `t_exterior_ornaments` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `otype` int DEFAULT '0',
  `oid` int DEFAULT '-1',
  `position` int DEFAULT '0',
  `ostate` int DEFAULT '0',
  `redpoint` int DEFAULT '0',
  `dbversion` int DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_t_exterior_ornaments_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_exterior_ornaments
-- ----------------------------

-- ----------------------------
-- Table structure for `t_exterior_ranse`
-- ----------------------------
DROP TABLE IF EXISTS `t_exterior_ranse`;
CREATE TABLE `t_exterior_ranse` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `exterior_id` int DEFAULT '0',
  `color1` int DEFAULT '0',
  `color2` int DEFAULT '0',
  `color3` int DEFAULT '0',
  `dbversion` int DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_t_exterior_ranse_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_exterior_ranse
-- ----------------------------

-- ----------------------------
-- Table structure for `t_exterior_weapon`
-- ----------------------------
DROP TABLE IF EXISTS `t_exterior_weapon`;
CREATE TABLE `t_exterior_weapon` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `exterior_id` int DEFAULT '0',
  `lefttime` int DEFAULT '0',
  `redpoint` int DEFAULT '0',
  `wlevel` int DEFAULT '0',
  `dbversion` int DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_t_exterior_weapon_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_exterior_weapon
-- ----------------------------

-- ----------------------------
-- Table structure for `t_fashion_auction`
-- ----------------------------
DROP TABLE IF EXISTS `t_fashion_auction`;
CREATE TABLE `t_fashion_auction` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `bidindex` int NOT NULL,
  `section` int NOT NULL,
  `groupindex` int NOT NULL,
  `itemid` int NOT NULL,
  `itemnum` int NOT NULL,
  `baseprice` int NOT NULL,
  `minadd` int NOT NULL,
  `maxadd` int NOT NULL,
  `curtopbid` int NOT NULL,
  `curtopworldid` int NOT NULL,
  `curtopguid` int NOT NULL,
  `ownername` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `countdown` int NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_pfashion_auction_new_bidindex` (`bidindex`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_fashion_auction
-- ----------------------------

-- ----------------------------
-- Table structure for `t_findfriendad`
-- ----------------------------
DROP TABLE IF EXISTS `t_findfriendad`;
CREATE TABLE `t_findfriendad` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `poolid` int NOT NULL,
  `charguid` int unsigned NOT NULL,
  `type` smallint NOT NULL,
  `charname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `charlevel` int unsigned NOT NULL,
  `charsex` smallint NOT NULL,
  `charmenpai` smallint NOT NULL,
  `charguildname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `charismarried` smallint NOT NULL,
  `sendtime` int unsigned NOT NULL,
  `announcetext` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `messageboard` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isvalid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_pcre_pindex` (`poolid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_findfriendad
-- ----------------------------

-- ----------------------------
-- Table structure for `t_global`
-- ----------------------------
DROP TABLE IF EXISTS `t_global`;
CREATE TABLE `t_global` (
  `poolid` int NOT NULL,
  `zoneworldid` int NOT NULL,
  `data1` int NOT NULL,
  PRIMARY KEY (`poolid`,`zoneworldid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_global
-- ----------------------------
INSERT INTO `t_global` VALUES ('29', '10', '14450');
INSERT INTO `t_global` VALUES ('31', '10', '2123007181');
INSERT INTO `t_global` VALUES ('48', '10', '2137847929');
INSERT INTO `t_global` VALUES ('50', '10', '563630273');
INSERT INTO `t_global` VALUES ('56', '10', '34896000');
INSERT INTO `t_global` VALUES ('60', '10', '244');
INSERT INTO `t_global` VALUES ('61', '10', '20250103');
INSERT INTO `t_global` VALUES ('62', '10', '1');
INSERT INTO `t_global` VALUES ('63', '10', '1');
INSERT INTO `t_global` VALUES ('64', '10', '15000');
INSERT INTO `t_global` VALUES ('65', '10', '1733884156');
INSERT INTO `t_global` VALUES ('67', '10', '3549');
INSERT INTO `t_global` VALUES ('68', '10', '4');

-- ----------------------------
-- Table structure for `t_guild_new`
-- ----------------------------
DROP TABLE IF EXISTS `t_guild_new`;
CREATE TABLE `t_guild_new` (
  `guildid` int NOT NULL,
  `zoneworldid` int NOT NULL,
  `guilddesc` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `guildname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `chiefname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `guildstat` smallint NOT NULL DEFAULT '0',
  `glvl` int NOT NULL DEFAULT '0',
  `chiefguid` int NOT NULL DEFAULT '0',
  `pcount` int NOT NULL DEFAULT '0',
  `ucount` int NOT NULL DEFAULT '0',
  `mucount` int NOT NULL DEFAULT '0',
  `gpoint` int NOT NULL DEFAULT '0',
  `guildmoney` int NOT NULL DEFAULT '0',
  `cityid` int NOT NULL DEFAULT '0',
  `ctime` int NOT NULL DEFAULT '0',
  `logevity` int NOT NULL DEFAULT '0',
  `contribu` int NOT NULL DEFAULT '0',
  `honor` int NOT NULL DEFAULT '0',
  `indlvl` int NOT NULL DEFAULT '0',
  `agrlvl` int NOT NULL DEFAULT '0',
  `comlvl` int NOT NULL DEFAULT '0',
  `deflvl` int NOT NULL DEFAULT '0',
  `techlvl` int NOT NULL DEFAULT '0',
  `ambilvl` int NOT NULL DEFAULT '0',
  `admin` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fixucount` int NOT NULL DEFAULT '0',
  `salarytime` int NOT NULL DEFAULT '0',
  `guildmsg` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dataversion` int NOT NULL DEFAULT '0',
  `isvalid` int NOT NULL DEFAULT '0',
  `gnameinfo` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `guildboom` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `leagueid` int NOT NULL DEFAULT '-1',
  `lqltime` int NOT NULL DEFAULT '0',
  `battle_succ` int NOT NULL DEFAULT '0',
  `battle_fail` int NOT NULL DEFAULT '0',
  `battle_score` int NOT NULL DEFAULT '0',
  `battle_kill` int NOT NULL DEFAULT '0',
  `battle_res` int NOT NULL DEFAULT '0',
  `week_suc0` int NOT NULL DEFAULT '0',
  `week_suc1` int NOT NULL DEFAULT '0',
  `week_suc2` int NOT NULL DEFAULT '0',
  `week_suc3` int NOT NULL DEFAULT '0',
  `week_fal0` int NOT NULL DEFAULT '0',
  `week_fal1` int NOT NULL DEFAULT '0',
  `week_fal2` int NOT NULL DEFAULT '0',
  `week_fal3` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`zoneworldid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_guild_new
-- ----------------------------
INSERT INTO `t_guild_new` VALUES ('0', '10', 'Ò»¸öÐÂÐËµÄ°ï»áÊÆÁ¦¡£', 'Ó³ÕÕÖîÌì', '¼ÀµÀ', '¼ÀµÀ', '1', '0', '100000013', '0', '2', '60', '0', '0', '-1', '-1782875667', '0', '0', '0', '0', '0', '0', '0', '0', '0', '00000000000000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0101B0EFD6F70000000000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0003B8B1B0EFD6F70000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000B0EFD6DA00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FBEABD3A200000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0003C9CCC8CB00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0003BAEBBBAFCAB90000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0003B9A4CEF1CAB90000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0003C4DACEF1CAB90000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF', '0', '0', '', '0', '1', '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 'AA6100000400000000000000000000000000000000000000000000000000000000000000000000000000000088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `t_guild_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_guild_user`;
CREATE TABLE `t_guild_user` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `zoneworldid` int NOT NULL,
  `guildid` int NOT NULL,
  `pos` int NOT NULL,
  `charguid` int NOT NULL,
  `charname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `guildpos` smallint NOT NULL,
  `lastontime` int NOT NULL,
  `level` int NOT NULL,
  `menpai` smallint NOT NULL,
  `contri` int NOT NULL,
  `maxcoutri` int NOT NULL,
  `jointime` int NOT NULL,
  `pwcontri` int NOT NULL,
  `cwcontri` int NOT NULL,
  `guildpostime` int NOT NULL,
  `isvalid` int NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '0',
  `gptime` int NOT NULL,
  `lastdowntime` int NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE KEY `Index_gusr_guildpos` (`guildid`,`pos`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_guild_user
-- ----------------------------
INSERT INTO `t_guild_user` VALUES ('1', '10', '0', '0', '100000013', '¼ÀµÀ', '9', '-1782866196', '111', '3', '0', '0', '-1782875667', '0', '0', '0', '1', '383', '0', '0');
INSERT INTO `t_guild_user` VALUES ('2', '10', '0', '1', '100000034', 'Á¬É½¨B', '2', '-1782866038', '111', '8', '0', '0', '-1782866252', '0', '0', '0', '1', '192', '0', '0');

-- ----------------------------
-- Table structure for `t_impact`
-- ----------------------------
DROP TABLE IF EXISTS `t_impact`;
CREATE TABLE `t_impact` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `imdata` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dbversion` int DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_impact_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_impact
-- ----------------------------

-- ----------------------------
-- Table structure for `t_iteminfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_iteminfo`;
CREATE TABLE `t_iteminfo` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `guid` int NOT NULL,
  `world` int NOT NULL,
  `server` int NOT NULL,
  `itemtype` int NOT NULL,
  `pos` smallint NOT NULL,
  `p1` int NOT NULL,
  `p2` int NOT NULL,
  `p3` int NOT NULL,
  `p4` int NOT NULL,
  `p5` int NOT NULL,
  `p6` int NOT NULL,
  `p7` int NOT NULL,
  `p8` int NOT NULL,
  `p9` int NOT NULL,
  `p10` int NOT NULL,
  `p11` int NOT NULL,
  `p12` int NOT NULL,
  `p13` int NOT NULL,
  `p14` int NOT NULL,
  `p15` int DEFAULT '0',
  `p16` int DEFAULT '0',
  `p17` int DEFAULT '0',
  `p18` int DEFAULT NULL,
  `p19` int DEFAULT NULL,
  `p20` int DEFAULT NULL,
  `p21` int DEFAULT NULL,
  `creator` varchar(180) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `isvalid` smallint NOT NULL DEFAULT '1',
  `dbversion` int DEFAULT '0',
  `fixattr` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `var` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `visualid` int NOT NULL DEFAULT '0',
  `maxgemid` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE KEY `Index_it_charguid` (`charguid`,`pos`) USING BTREE,
  KEY `Index_it_itemguid` (`guid`,`world`,`server`) USING BTREE,
  KEY `Index_iteminfo_itemtype` (`itemtype`,`isvalid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5908 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_iteminfo
-- ----------------------------

-- ----------------------------
-- Table structure for `t_itemkey`
-- ----------------------------
DROP TABLE IF EXISTS `t_itemkey`;
CREATE TABLE `t_itemkey` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `zoneworldid` int NOT NULL,
  `sid` int NOT NULL,
  `smkey` int NOT NULL,
  `serial` int NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_itk_sid` (`sid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_itemkey
-- ----------------------------
INSERT INTO `t_itemkey` VALUES ('1', '10', '0', '7001', '238312');
INSERT INTO `t_itemkey` VALUES ('2', '12', '1', '7002', '1001');
INSERT INTO `t_itemkey` VALUES ('3', '12', '2', '7003', '1001');
INSERT INTO `t_itemkey` VALUES ('4', '12', '3', '7004', '1001');
INSERT INTO `t_itemkey` VALUES ('5', '12', '4', '7005', '1001');
INSERT INTO `t_itemkey` VALUES ('6', '12', '5', '7006', '1001');
INSERT INTO `t_itemkey` VALUES ('7', '12', '6', '7007', '1001');
INSERT INTO `t_itemkey` VALUES ('8', '12', '7', '7008', '1001');
INSERT INTO `t_itemkey` VALUES ('9', '12', '8', '7009', '1001');
INSERT INTO `t_itemkey` VALUES ('10', '12', '9', '7010', '1001');
INSERT INTO `t_itemkey` VALUES ('11', '12', '10', '7011', '1001');
INSERT INTO `t_itemkey` VALUES ('12', '12', '11', '7012', '1001');
INSERT INTO `t_itemkey` VALUES ('13', '10', '12', '7013', '1001');
INSERT INTO `t_itemkey` VALUES ('14', '12', '13', '7014', '1001');
INSERT INTO `t_itemkey` VALUES ('15', '12', '14', '7015', '1001');
INSERT INTO `t_itemkey` VALUES ('16', '12', '15', '7016', '1001');
INSERT INTO `t_itemkey` VALUES ('17', '12', '16', '7017', '1001');
INSERT INTO `t_itemkey` VALUES ('18', '12', '17', '7018', '1001');
INSERT INTO `t_itemkey` VALUES ('19', '12', '18', '7019', '1001');
INSERT INTO `t_itemkey` VALUES ('20', '12', '19', '7020', '1001');
INSERT INTO `t_itemkey` VALUES ('21', '12', '20', '7021', '1001');
INSERT INTO `t_itemkey` VALUES ('22', '12', '21', '7022', '1001');
INSERT INTO `t_itemkey` VALUES ('23', '12', '22', '7023', '1001');
INSERT INTO `t_itemkey` VALUES ('24', '12', '23', '7024', '1001');
INSERT INTO `t_itemkey` VALUES ('25', '12', '24', '7025', '1001');
INSERT INTO `t_itemkey` VALUES ('26', '12', '25', '7026', '1001');
INSERT INTO `t_itemkey` VALUES ('27', '12', '26', '7027', '1001');
INSERT INTO `t_itemkey` VALUES ('28', '12', '27', '7028', '1001');
INSERT INTO `t_itemkey` VALUES ('29', '12', '28', '7029', '1001');
INSERT INTO `t_itemkey` VALUES ('30', '12', '29', '7030', '1001');
INSERT INTO `t_itemkey` VALUES ('31', '12', '30', '7031', '1001');
INSERT INTO `t_itemkey` VALUES ('32', '12', '31', '7032', '1001');
INSERT INTO `t_itemkey` VALUES ('33', '12', '32', '7033', '1001');
INSERT INTO `t_itemkey` VALUES ('34', '12', '33', '7034', '1001');
INSERT INTO `t_itemkey` VALUES ('35', '12', '34', '7035', '1001');
INSERT INTO `t_itemkey` VALUES ('36', '12', '35', '7036', '1001');
INSERT INTO `t_itemkey` VALUES ('37', '12', '36', '7037', '1001');
INSERT INTO `t_itemkey` VALUES ('38', '12', '37', '7038', '1001');
INSERT INTO `t_itemkey` VALUES ('39', '12', '38', '7039', '1001');
INSERT INTO `t_itemkey` VALUES ('40', '12', '39', '7040', '1001');
INSERT INTO `t_itemkey` VALUES ('41', '12', '40', '7041', '1001');
INSERT INTO `t_itemkey` VALUES ('42', '12', '41', '7042', '1001');
INSERT INTO `t_itemkey` VALUES ('43', '12', '42', '7043', '1001');
INSERT INTO `t_itemkey` VALUES ('44', '12', '43', '7044', '1001');
INSERT INTO `t_itemkey` VALUES ('45', '12', '44', '7045', '1001');
INSERT INTO `t_itemkey` VALUES ('46', '12', '45', '7046', '1001');

-- ----------------------------
-- Table structure for `t_league`
-- ----------------------------
DROP TABLE IF EXISTS `t_league`;
CREATE TABLE `t_league` (
  `leagueid` int NOT NULL,
  `zoneworldid` int NOT NULL,
  `leaguename` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `leaguedesc` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `creatorname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `chiefguid` int NOT NULL,
  `chiefname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `createtime` int NOT NULL,
  `applynum` int NOT NULL,
  `isvalid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`leagueid`,`zoneworldid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_league
-- ----------------------------
INSERT INTO `t_league` VALUES ('0', '10', '¹²ËêÔÂ', 'Ò»¸öÐÂÐËµÄÍ¬ÃËÊÆÁ¦', '¼ÀµÀ', '100000013', '¼ÀµÀ', '-1782875665', '0', '1');

-- ----------------------------
-- Table structure for `t_league_apply`
-- ----------------------------
DROP TABLE IF EXISTS `t_league_apply`;
CREATE TABLE `t_league_apply` (
  `leagueid` int NOT NULL,
  `zoneworldid` int NOT NULL,
  `applypos` int NOT NULL,
  `applyguildid` int NOT NULL,
  `isvalid` int NOT NULL DEFAULT '0',
  UNIQUE KEY `Index_league_apply_id` (`leagueid`,`applypos`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_league_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `t_league_usr`
-- ----------------------------
DROP TABLE IF EXISTS `t_league_usr`;
CREATE TABLE `t_league_usr` (
  `leagueid` int NOT NULL,
  `zoneworldid` int NOT NULL,
  `guildpos` int NOT NULL,
  `guildid` int NOT NULL,
  `jointime` int NOT NULL,
  `isvalid` int NOT NULL DEFAULT '0',
  UNIQUE KEY `Index_league_usr_id` (`leagueid`,`guildpos`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_league_usr
-- ----------------------------
INSERT INTO `t_league_usr` VALUES ('0', '10', '0', '0', '-1782875665', '0');

-- ----------------------------
-- Table structure for `t_mail`
-- ----------------------------
DROP TABLE IF EXISTS `t_mail`;
CREATE TABLE `t_mail` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `recer` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mailinfo` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mailcont` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pindex` int NOT NULL,
  `zoneworldid` int NOT NULL,
  `isvalid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE KEY `Index_mail_mail` (`pindex`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1092 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_mail
-- ----------------------------
INSERT INTO `t_mail` VALUES ('1', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000184F77670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '0', '10', '1');
INSERT INTO `t_mail` VALUES ('2', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000184F77670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '1', '10', '1');
INSERT INTO `t_mail` VALUES ('3', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001500010000003F4F77670000000000000000000000000000000000000000', '#{LevelMail_menpai_1}', '2', '10', '1');
INSERT INTO `t_mail` VALUES ('4', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000794F77670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '3', '10', '1');
INSERT INTO `t_mail` VALUES ('5', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000794F77670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '4', '10', '1');
INSERT INTO `t_mail` VALUES ('6', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000009A5077670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '5', '10', '1');
INSERT INTO `t_mail` VALUES ('7', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000225177670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '6', '10', '1');
INSERT INTO `t_mail` VALUES ('8', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '7', '10', '0');
INSERT INTO `t_mail` VALUES ('9', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000174F77670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '8', '10', '1');
INSERT INTO `t_mail` VALUES ('10', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000174F77670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '9', '10', '1');
INSERT INTO `t_mail` VALUES ('11', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000174F77670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '10', '10', '1');
INSERT INTO `t_mail` VALUES ('12', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000174F77670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '11', '10', '1');
INSERT INTO `t_mail` VALUES ('13', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000174F77670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '12', '10', '1');
INSERT INTO `t_mail` VALUES ('14', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000174F77670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '13', '10', '1');
INSERT INTO `t_mail` VALUES ('15', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000174F77670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '14', '10', '1');
INSERT INTO `t_mail` VALUES ('16', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000174F77670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '15', '10', '1');
INSERT INTO `t_mail` VALUES ('17', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000174F77670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '16', '10', '1');
INSERT INTO `t_mail` VALUES ('18', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000184F77670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '17', '10', '1');
INSERT INTO `t_mail` VALUES ('19', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000184F77670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '18', '10', '1');
INSERT INTO `t_mail` VALUES ('20', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000184F77670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '19', '10', '1');
INSERT INTO `t_mail` VALUES ('21', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000184F77670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '20', '10', '1');
INSERT INTO `t_mail` VALUES ('22', '', '±´±´', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000184F77670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '21', '10', '1');
INSERT INTO `t_mail` VALUES ('23', '', '±ùä¿ÁÜ¡¤', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FEC157670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '22', '10', '1');
INSERT INTO `t_mail` VALUES ('24', '', '±ùä¿ÁÜ¡¤', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FEC157670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '23', '10', '1');
INSERT INTO `t_mail` VALUES ('25', '', '±ùä¿ÁÜ¡¤', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FEC157670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '24', '10', '1');
INSERT INTO `t_mail` VALUES ('26', '', '±ùä¿ÁÜ¡¤', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FEC157670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '25', '10', '1');
INSERT INTO `t_mail` VALUES ('27', '', '±ùä¿ÁÜ¡¤', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FEC157670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '26', '10', '1');
INSERT INTO `t_mail` VALUES ('28', '', '±ùä¿ÁÜ¡¤', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FEC157670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '27', '10', '1');
INSERT INTO `t_mail` VALUES ('29', '', '±ùä¿ÁÜ¡¤', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FEC157670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '28', '10', '1');
INSERT INTO `t_mail` VALUES ('30', '', '±ùä¿ÁÜ¡¤', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FEC157670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '29', '10', '1');
INSERT INTO `t_mail` VALUES ('31', '', '±ùä¿ÁÜ¡¤', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FEC157670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '30', '10', '1');
INSERT INTO `t_mail` VALUES ('32', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '31', '10', '0');
INSERT INTO `t_mail` VALUES ('33', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '32', '10', '0');
INSERT INTO `t_mail` VALUES ('34', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '33', '10', '0');
INSERT INTO `t_mail` VALUES ('35', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '34', '10', '0');
INSERT INTO `t_mail` VALUES ('36', '', 'Í¹ÄûÃÈÍ¹', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF08002E0001000000C11859670000000000000000000000000000000000000000', '#{DLYJ_081009_01}Í¹ÄûÃÈÍ¹¹ÃÄï#{DLYJ_081009_02}', '35', '10', '1');
INSERT INTO `t_mail` VALUES ('37', '', 'Í¹ÄûÃÈÍ¹', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000C11859670000000000000000000000000000000000000000', '#{MAIL_100305_01}', '36', '10', '1');
INSERT INTO `t_mail` VALUES ('38', '', 'Í¹ÄûÃÈÍ¹', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000C11859670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '37', '10', '1');
INSERT INTO `t_mail` VALUES ('39', '', '¡¢²ýºÓ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000E91859670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '38', '10', '1');
INSERT INTO `t_mail` VALUES ('40', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '39', '10', '0');
INSERT INTO `t_mail` VALUES ('41', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '40', '10', '0');
INSERT INTO `t_mail` VALUES ('42', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '41', '10', '0');
INSERT INTO `t_mail` VALUES ('43', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '42', '10', '0');
INSERT INTO `t_mail` VALUES ('44', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '43', '10', '0');
INSERT INTO `t_mail` VALUES ('45', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '44', '10', '0');
INSERT INTO `t_mail` VALUES ('46', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '45', '10', '0');
INSERT INTO `t_mail` VALUES ('47', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '46', '10', '0');
INSERT INTO `t_mail` VALUES ('48', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '47', '10', '0');
INSERT INTO `t_mail` VALUES ('49', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '48', '10', '0');
INSERT INTO `t_mail` VALUES ('50', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '49', '10', '0');
INSERT INTO `t_mail` VALUES ('51', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '50', '10', '0');
INSERT INTO `t_mail` VALUES ('52', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '51', '10', '0');
INSERT INTO `t_mail` VALUES ('53', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '52', '10', '0');
INSERT INTO `t_mail` VALUES ('54', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '53', '10', '0');
INSERT INTO `t_mail` VALUES ('55', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '54', '10', '0');
INSERT INTO `t_mail` VALUES ('56', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '55', '10', '0');
INSERT INTO `t_mail` VALUES ('57', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '56', '10', '0');
INSERT INTO `t_mail` VALUES ('58', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '57', '10', '0');
INSERT INTO `t_mail` VALUES ('59', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '58', '10', '0');
INSERT INTO `t_mail` VALUES ('60', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '59', '10', '0');
INSERT INTO `t_mail` VALUES ('61', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '60', '10', '0');
INSERT INTO `t_mail` VALUES ('62', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '61', '10', '0');
INSERT INTO `t_mail` VALUES ('63', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '62', '10', '0');
INSERT INTO `t_mail` VALUES ('64', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '63', '10', '0');
INSERT INTO `t_mail` VALUES ('65', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '64', '10', '0');
INSERT INTO `t_mail` VALUES ('66', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '65', '10', '0');
INSERT INTO `t_mail` VALUES ('67', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '66', '10', '0');
INSERT INTO `t_mail` VALUES ('68', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '67', '10', '0');
INSERT INTO `t_mail` VALUES ('69', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '68', '10', '0');
INSERT INTO `t_mail` VALUES ('70', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000BD957670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '69', '10', '1');
INSERT INTO `t_mail` VALUES ('71', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF060012000100000013DA57670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '70', '10', '1');
INSERT INTO `t_mail` VALUES ('72', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF060015000100000066DC57670000000000000000000000000000000000000000', '#{LevelMail_menpai_1}', '71', '10', '1');
INSERT INTO `t_mail` VALUES ('73', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000005E2E58670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '72', '10', '1');
INSERT INTO `t_mail` VALUES ('74', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '73', '10', '0');
INSERT INTO `t_mail` VALUES ('75', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000008E2E58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '74', '10', '1');
INSERT INTO `t_mail` VALUES ('76', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '75', '10', '0');
INSERT INTO `t_mail` VALUES ('77', '', '¡¢ÄºÓê', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600170001000000AD4B58670000000000000000000000000000000000000000', 'Äã±»Íæ¼Ò: ÒÔÕ½Ö¹Õ½ É±ËÀ', '76', '10', '1');
INSERT INTO `t_mail` VALUES ('78', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '77', '10', '0');
INSERT INTO `t_mail` VALUES ('79', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000000BD957670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '78', '10', '1');
INSERT INTO `t_mail` VALUES ('80', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000000BD957670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '79', '10', '1');
INSERT INTO `t_mail` VALUES ('81', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000000BD957670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '80', '10', '1');
INSERT INTO `t_mail` VALUES ('82', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000000BD957670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '81', '10', '1');
INSERT INTO `t_mail` VALUES ('83', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000000BD957670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '82', '10', '1');
INSERT INTO `t_mail` VALUES ('84', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000BD957670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '83', '10', '1');
INSERT INTO `t_mail` VALUES ('85', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000BD957670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '84', '10', '1');
INSERT INTO `t_mail` VALUES ('86', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000BD957670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '85', '10', '1');
INSERT INTO `t_mail` VALUES ('87', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000BD957670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '86', '10', '1');
INSERT INTO `t_mail` VALUES ('88', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000BD957670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '87', '10', '1');
INSERT INTO `t_mail` VALUES ('89', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000BD957670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '88', '10', '1');
INSERT INTO `t_mail` VALUES ('90', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000BD957670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '89', '10', '1');
INSERT INTO `t_mail` VALUES ('91', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000BD957670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '90', '10', '1');
INSERT INTO `t_mail` VALUES ('92', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000BD957670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '91', '10', '1');
INSERT INTO `t_mail` VALUES ('93', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF060012000100000013DA57670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '92', '10', '1');
INSERT INTO `t_mail` VALUES ('94', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '93', '10', '0');
INSERT INTO `t_mail` VALUES ('95', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '94', '10', '0');
INSERT INTO `t_mail` VALUES ('96', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF060011000100000013DA57670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '95', '10', '1');
INSERT INTO `t_mail` VALUES ('97', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '96', '10', '0');
INSERT INTO `t_mail` VALUES ('98', '', '¡¢ÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000002E2D58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '97', '10', '1');
INSERT INTO `t_mail` VALUES ('99', '', '¨BÐÇºÓÈëÃÎ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A002C00010000006B3658670000000000000000000000000000000000000000', '#{HJYK_201223_13**\n¨BÐÇºÓÈëÃÎ*2025*1*9}', '98', '10', '1');
INSERT INTO `t_mail` VALUES ('100', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '99', '10', '0');
INSERT INTO `t_mail` VALUES ('101', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '100', '10', '0');
INSERT INTO `t_mail` VALUES ('102', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '101', '10', '0');
INSERT INTO `t_mail` VALUES ('103', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600280001000000CF6158670000000000000000000000000000000000000000', '#{HJYK_201223_13**¡¢ÓêÏª*2025*1*9}', '102', '10', '1');
INSERT INTO `t_mail` VALUES ('104', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF060011000100000013DA57670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '103', '10', '1');
INSERT INTO `t_mail` VALUES ('105', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF060011000100000013DA57670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '104', '10', '1');
INSERT INTO `t_mail` VALUES ('106', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF060012000100000013DA57670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '105', '10', '1');
INSERT INTO `t_mail` VALUES ('107', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF060012000100000013DA57670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '106', '10', '1');
INSERT INTO `t_mail` VALUES ('108', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF060012000100000013DA57670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '107', '10', '1');
INSERT INTO `t_mail` VALUES ('109', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF060012000100000013DA57670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '108', '10', '1');
INSERT INTO `t_mail` VALUES ('110', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF060012000100000013DA57670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '109', '10', '1');
INSERT INTO `t_mail` VALUES ('111', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF060012000100000013DA57670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '110', '10', '1');
INSERT INTO `t_mail` VALUES ('112', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF060012000100000013DA57670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '111', '10', '1');
INSERT INTO `t_mail` VALUES ('113', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF060012000100000013DA57670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '112', '10', '1');
INSERT INTO `t_mail` VALUES ('114', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF060012000100000013DA57670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '113', '10', '1');
INSERT INTO `t_mail` VALUES ('115', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '114', '10', '0');
INSERT INTO `t_mail` VALUES ('116', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '115', '10', '1');
INSERT INTO `t_mail` VALUES ('117', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '116', '10', '0');
INSERT INTO `t_mail` VALUES ('118', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '135', '10', '1');
INSERT INTO `t_mail` VALUES ('119', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000576258670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '136', '10', '1');
INSERT INTO `t_mail` VALUES ('120', '', '¡¢ÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000002F2D58670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '137', '10', '1');
INSERT INTO `t_mail` VALUES ('121', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '138', '10', '1');
INSERT INTO `t_mail` VALUES ('122', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000067458670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '139', '10', '1');
INSERT INTO `t_mail` VALUES ('123', '', '¡¢ÄºÓê', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600280001000000466C58670000000000000000000000000000000000000000', '#{HJYK_201223_13**¡¢ÄºÓê*2025*1*9}', '140', '10', '1');
INSERT INTO `t_mail` VALUES ('124', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '141', '10', '0');
INSERT INTO `t_mail` VALUES ('125', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '142', '10', '1');
INSERT INTO `t_mail` VALUES ('126', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '143', '10', '1');
INSERT INTO `t_mail` VALUES ('127', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '144', '10', '1');
INSERT INTO `t_mail` VALUES ('128', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '145', '10', '1');
INSERT INTO `t_mail` VALUES ('129', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '146', '10', '1');
INSERT INTO `t_mail` VALUES ('130', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '147', '10', '1');
INSERT INTO `t_mail` VALUES ('131', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '148', '10', '1');
INSERT INTO `t_mail` VALUES ('132', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '149', '10', '1');
INSERT INTO `t_mail` VALUES ('133', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '150', '10', '1');
INSERT INTO `t_mail` VALUES ('134', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '151', '10', '1');
INSERT INTO `t_mail` VALUES ('135', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '152', '10', '1');
INSERT INTO `t_mail` VALUES ('136', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '153', '10', '1');
INSERT INTO `t_mail` VALUES ('137', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '154', '10', '1');
INSERT INTO `t_mail` VALUES ('138', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000DDDA57670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '155', '10', '1');
INSERT INTO `t_mail` VALUES ('139', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000576258670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '156', '10', '1');
INSERT INTO `t_mail` VALUES ('140', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600150001000000C5DB57670000000000000000000000000000000000000000', '#{LevelMail_menpai_8}', '157', '10', '1');
INSERT INTO `t_mail` VALUES ('141', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '158', '10', '0');
INSERT INTO `t_mail` VALUES ('142', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000576258670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '159', '10', '1');
INSERT INTO `t_mail` VALUES ('143', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '160', '10', '0');
INSERT INTO `t_mail` VALUES ('144', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000576258670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '161', '10', '1');
INSERT INTO `t_mail` VALUES ('145', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000576258670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '162', '10', '1');
INSERT INTO `t_mail` VALUES ('146', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000576258670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '163', '10', '1');
INSERT INTO `t_mail` VALUES ('147', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000576258670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '164', '10', '1');
INSERT INTO `t_mail` VALUES ('148', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000576258670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '165', '10', '1');
INSERT INTO `t_mail` VALUES ('149', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000576258670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '166', '10', '1');
INSERT INTO `t_mail` VALUES ('150', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000576258670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '167', '10', '1');
INSERT INTO `t_mail` VALUES ('151', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000576258670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '168', '10', '1');
INSERT INTO `t_mail` VALUES ('152', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000576258670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '169', '10', '1');
INSERT INTO `t_mail` VALUES ('153', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000576258670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '170', '10', '1');
INSERT INTO `t_mail` VALUES ('154', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000576258670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '171', '10', '1');
INSERT INTO `t_mail` VALUES ('155', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000576258670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '172', '10', '1');
INSERT INTO `t_mail` VALUES ('156', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000576258670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '173', '10', '1');
INSERT INTO `t_mail` VALUES ('157', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000576258670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '174', '10', '1');
INSERT INTO `t_mail` VALUES ('158', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000576258670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '175', '10', '1');
INSERT INTO `t_mail` VALUES ('159', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000576258670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '176', '10', '1');
INSERT INTO `t_mail` VALUES ('160', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00120001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '177', '10', '1');
INSERT INTO `t_mail` VALUES ('161', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '178', '10', '1');
INSERT INTO `t_mail` VALUES ('162', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '179', '10', '0');
INSERT INTO `t_mail` VALUES ('163', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '180', '10', '0');
INSERT INTO `t_mail` VALUES ('164', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001200010000000DF757670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '181', '10', '1');
INSERT INTO `t_mail` VALUES ('165', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '182', '10', '0');
INSERT INTO `t_mail` VALUES ('166', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '183', '10', '0');
INSERT INTO `t_mail` VALUES ('167', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '184', '10', '1');
INSERT INTO `t_mail` VALUES ('168', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200150001000000A2F857670000000000000000000000000000000000000000', '#{LevelMail_menpai_4}', '185', '10', '1');
INSERT INTO `t_mail` VALUES ('169', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200150001000000ADF857670000000000000000000000000000000000000000', '#{LevelMail_menpai_8}', '186', '10', '1');
INSERT INTO `t_mail` VALUES ('170', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000270258670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '187', '10', '1');
INSERT INTO `t_mail` VALUES ('171', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '188', '10', '0');
INSERT INTO `t_mail` VALUES ('172', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001100010000001B1958670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '189', '10', '1');
INSERT INTO `t_mail` VALUES ('173', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '190', '10', '0');
INSERT INTO `t_mail` VALUES ('174', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001100010000000DF757670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '191', '10', '1');
INSERT INTO `t_mail` VALUES ('175', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001100010000000DF757670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '192', '10', '1');
INSERT INTO `t_mail` VALUES ('176', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001100010000000DF757670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '193', '10', '1');
INSERT INTO `t_mail` VALUES ('177', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001100010000000DF757670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '194', '10', '1');
INSERT INTO `t_mail` VALUES ('178', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001100010000000DF757670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '195', '10', '1');
INSERT INTO `t_mail` VALUES ('179', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001200010000000DF757670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '196', '10', '1');
INSERT INTO `t_mail` VALUES ('180', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001200010000000DF757670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '197', '10', '1');
INSERT INTO `t_mail` VALUES ('181', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001200010000000DF757670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '198', '10', '1');
INSERT INTO `t_mail` VALUES ('182', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001200010000000DF757670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '199', '10', '1');
INSERT INTO `t_mail` VALUES ('183', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001200010000000DF757670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '200', '10', '1');
INSERT INTO `t_mail` VALUES ('184', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001200010000000DF757670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '201', '10', '1');
INSERT INTO `t_mail` VALUES ('185', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001200010000000DF757670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '202', '10', '1');
INSERT INTO `t_mail` VALUES ('186', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001200010000000DF757670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '203', '10', '1');
INSERT INTO `t_mail` VALUES ('187', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001200010000000DF757670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '204', '10', '1');
INSERT INTO `t_mail` VALUES ('188', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '205', '10', '1');
INSERT INTO `t_mail` VALUES ('189', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020012000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '206', '10', '1');
INSERT INTO `t_mail` VALUES ('190', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200150001000000C9F757670000000000000000000000000000000000000000', '#{LevelMail_menpai_8}', '207', '10', '1');
INSERT INTO `t_mail` VALUES ('191', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001100010000007E1B58670000000000000000000000000000000000000000', '#{MAIL_100305_01}', '208', '10', '1');
INSERT INTO `t_mail` VALUES ('192', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00160001000000382E58670000000000000000000000000000000000000000', '#{LevelMail_menpai_10}', '209', '10', '1');
INSERT INTO `t_mail` VALUES ('193', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000931B58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '210', '10', '1');
INSERT INTO `t_mail` VALUES ('194', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '211', '10', '1');
INSERT INTO `t_mail` VALUES ('195', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '212', '10', '1');
INSERT INTO `t_mail` VALUES ('196', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '213', '10', '1');
INSERT INTO `t_mail` VALUES ('197', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '214', '10', '1');
INSERT INTO `t_mail` VALUES ('198', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '215', '10', '1');
INSERT INTO `t_mail` VALUES ('199', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '216', '10', '1');
INSERT INTO `t_mail` VALUES ('200', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '217', '10', '1');
INSERT INTO `t_mail` VALUES ('201', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '218', '10', '1');
INSERT INTO `t_mail` VALUES ('202', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '219', '10', '1');
INSERT INTO `t_mail` VALUES ('203', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '220', '10', '1');
INSERT INTO `t_mail` VALUES ('204', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '221', '10', '1');
INSERT INTO `t_mail` VALUES ('205', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '222', '10', '1');
INSERT INTO `t_mail` VALUES ('206', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '223', '10', '1');
INSERT INTO `t_mail` VALUES ('207', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '224', '10', '1');
INSERT INTO `t_mail` VALUES ('208', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000CFF757670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '225', '10', '1');
INSERT INTO `t_mail` VALUES ('209', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '226', '10', '0');
INSERT INTO `t_mail` VALUES ('210', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000382458670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '227', '10', '1');
INSERT INTO `t_mail` VALUES ('211', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000382458670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '228', '10', '1');
INSERT INTO `t_mail` VALUES ('212', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '229', '10', '1');
INSERT INTO `t_mail` VALUES ('213', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '230', '10', '1');
INSERT INTO `t_mail` VALUES ('214', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '231', '10', '1');
INSERT INTO `t_mail` VALUES ('215', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '232', '10', '1');
INSERT INTO `t_mail` VALUES ('216', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '233', '10', '1');
INSERT INTO `t_mail` VALUES ('217', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '234', '10', '1');
INSERT INTO `t_mail` VALUES ('218', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '235', '10', '1');
INSERT INTO `t_mail` VALUES ('219', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '236', '10', '1');
INSERT INTO `t_mail` VALUES ('220', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '237', '10', '1');
INSERT INTO `t_mail` VALUES ('221', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '238', '10', '1');
INSERT INTO `t_mail` VALUES ('222', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '239', '10', '1');
INSERT INTO `t_mail` VALUES ('223', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '240', '10', '1');
INSERT INTO `t_mail` VALUES ('224', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '241', '10', '1');
INSERT INTO `t_mail` VALUES ('225', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '242', '10', '1');
INSERT INTO `t_mail` VALUES ('226', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000D6F757670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '243', '10', '1');
INSERT INTO `t_mail` VALUES ('227', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001100010000001B1958670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '244', '10', '1');
INSERT INTO `t_mail` VALUES ('228', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001100010000001B1958670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '245', '10', '1');
INSERT INTO `t_mail` VALUES ('229', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02002800010000007E1B58670000000000000000000000000000000000000000', '#{DLYJ_081009_01}çÛ¹ÃÄï#{DLYJ_081009_02}', '246', '10', '1');
INSERT INTO `t_mail` VALUES ('230', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '247', '10', '1');
INSERT INTO `t_mail` VALUES ('231', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '248', '10', '1');
INSERT INTO `t_mail` VALUES ('232', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '249', '10', '1');
INSERT INTO `t_mail` VALUES ('233', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '250', '10', '1');
INSERT INTO `t_mail` VALUES ('234', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '251', '10', '1');
INSERT INTO `t_mail` VALUES ('235', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '252', '10', '1');
INSERT INTO `t_mail` VALUES ('236', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '253', '10', '1');
INSERT INTO `t_mail` VALUES ('237', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '254', '10', '1');
INSERT INTO `t_mail` VALUES ('238', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '255', '10', '1');
INSERT INTO `t_mail` VALUES ('239', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '256', '10', '1');
INSERT INTO `t_mail` VALUES ('240', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '257', '10', '1');
INSERT INTO `t_mail` VALUES ('241', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '258', '10', '1');
INSERT INTO `t_mail` VALUES ('242', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '259', '10', '1');
INSERT INTO `t_mail` VALUES ('243', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '260', '10', '1');
INSERT INTO `t_mail` VALUES ('244', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200120001000000DEF757670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '261', '10', '1');
INSERT INTO `t_mail` VALUES ('245', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020012000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '262', '10', '1');
INSERT INTO `t_mail` VALUES ('246', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001500010000009DF857670000000000000000000000000000000000000000', '#{LevelMail_menpai_8}', '263', '10', '1');
INSERT INTO `t_mail` VALUES ('247', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF08001500010000009B2458670000000000000000000000000000000000000000', '#{LevelMail_menpai_8}', '264', '10', '1');
INSERT INTO `t_mail` VALUES ('248', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001100010000001C1958670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '265', '10', '1');
INSERT INTO `t_mail` VALUES ('249', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000E91A58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '266', '10', '1');
INSERT INTO `t_mail` VALUES ('250', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001100010000007D1B58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '267', '10', '1');
INSERT INTO `t_mail` VALUES ('251', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020011000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '268', '10', '1');
INSERT INTO `t_mail` VALUES ('252', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020011000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '269', '10', '1');
INSERT INTO `t_mail` VALUES ('253', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020011000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '270', '10', '1');
INSERT INTO `t_mail` VALUES ('254', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020011000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '271', '10', '1');
INSERT INTO `t_mail` VALUES ('255', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020011000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '272', '10', '1');
INSERT INTO `t_mail` VALUES ('256', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020011000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '273', '10', '1');
INSERT INTO `t_mail` VALUES ('257', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020012000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '274', '10', '1');
INSERT INTO `t_mail` VALUES ('258', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020012000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '275', '10', '1');
INSERT INTO `t_mail` VALUES ('259', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020012000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '276', '10', '1');
INSERT INTO `t_mail` VALUES ('260', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020012000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '277', '10', '1');
INSERT INTO `t_mail` VALUES ('261', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020012000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '278', '10', '1');
INSERT INTO `t_mail` VALUES ('262', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020012000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '279', '10', '1');
INSERT INTO `t_mail` VALUES ('263', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020012000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '280', '10', '1');
INSERT INTO `t_mail` VALUES ('264', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020012000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '281', '10', '1');
INSERT INTO `t_mail` VALUES ('265', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF020012000100000005F857670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '282', '10', '1');
INSERT INTO `t_mail` VALUES ('266', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040012000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '283', '10', '1');
INSERT INTO `t_mail` VALUES ('267', '', 'Èþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200280001000000FF0158670000000000000000000000000000000000000000', '#{DLYJ_081009_01}Èþ¹ÃÄï#{DLYJ_081009_02}', '284', '10', '1');
INSERT INTO `t_mail` VALUES ('268', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040011000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_90_1}', '285', '10', '1');
INSERT INTO `t_mail` VALUES ('269', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040011000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '286', '10', '1');
INSERT INTO `t_mail` VALUES ('270', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040011000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '287', '10', '1');
INSERT INTO `t_mail` VALUES ('271', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040011000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '288', '10', '1');
INSERT INTO `t_mail` VALUES ('272', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040011000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '289', '10', '1');
INSERT INTO `t_mail` VALUES ('273', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040011000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '290', '10', '1');
INSERT INTO `t_mail` VALUES ('274', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040011000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '291', '10', '1');
INSERT INTO `t_mail` VALUES ('275', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040011000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '292', '10', '1');
INSERT INTO `t_mail` VALUES ('276', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040011000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '293', '10', '1');
INSERT INTO `t_mail` VALUES ('277', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040011000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '294', '10', '1');
INSERT INTO `t_mail` VALUES ('278', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040012000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '295', '10', '1');
INSERT INTO `t_mail` VALUES ('279', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040012000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '296', '10', '1');
INSERT INTO `t_mail` VALUES ('280', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040012000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '297', '10', '1');
INSERT INTO `t_mail` VALUES ('281', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040012000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '298', '10', '1');
INSERT INTO `t_mail` VALUES ('282', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040012000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '299', '10', '1');
INSERT INTO `t_mail` VALUES ('283', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040012000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '300', '10', '1');
INSERT INTO `t_mail` VALUES ('284', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040012000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '301', '10', '1');
INSERT INTO `t_mail` VALUES ('285', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040012000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '302', '10', '1');
INSERT INTO `t_mail` VALUES ('286', '', 'q123', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF040012000100000085FF57670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '303', '10', '1');
INSERT INTO `t_mail` VALUES ('287', '', 'Èþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000FF0158670000000000000000000000000000000000000000', '#{MAIL_100305_01}', '304', '10', '1');
INSERT INTO `t_mail` VALUES ('288', '', 'Èþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000FF0158670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '305', '10', '1');
INSERT INTO `t_mail` VALUES ('289', '', 'É¡', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000270258670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '306', '10', '1');
INSERT INTO `t_mail` VALUES ('290', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '307', '10', '1');
INSERT INTO `t_mail` VALUES ('291', '', '±ùä¿ÁÜ¡¤', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF08001100010000009D2958670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '308', '10', '1');
INSERT INTO `t_mail` VALUES ('292', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000493A58670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '309', '10', '1');
INSERT INTO `t_mail` VALUES ('293', '', '¡¢ÓêÏª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600170001000000C44B58670000000000000000000000000000000000000000', 'Äã±»Íæ¼Ò: ÒÔÕ½Ö¹Õ½ É±ËÀ', '310', '10', '1');
INSERT INTO `t_mail` VALUES ('294', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '311', '10', '0');
INSERT INTO `t_mail` VALUES ('295', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '312', '10', '1');
INSERT INTO `t_mail` VALUES ('296', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '313', '10', '1');
INSERT INTO `t_mail` VALUES ('297', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '314', '10', '1');
INSERT INTO `t_mail` VALUES ('298', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '315', '10', '1');
INSERT INTO `t_mail` VALUES ('299', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '316', '10', '1');
INSERT INTO `t_mail` VALUES ('300', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '317', '10', '1');
INSERT INTO `t_mail` VALUES ('301', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '318', '10', '1');
INSERT INTO `t_mail` VALUES ('302', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '319', '10', '1');
INSERT INTO `t_mail` VALUES ('303', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '320', '10', '1');
INSERT INTO `t_mail` VALUES ('304', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '321', '10', '1');
INSERT INTO `t_mail` VALUES ('305', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '322', '10', '1');
INSERT INTO `t_mail` VALUES ('306', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '323', '10', '1');
INSERT INTO `t_mail` VALUES ('307', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '324', '10', '1');
INSERT INTO `t_mail` VALUES ('308', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '325', '10', '1');
INSERT INTO `t_mail` VALUES ('309', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '326', '10', '1');
INSERT INTO `t_mail` VALUES ('310', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000004A0358670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '327', '10', '1');
INSERT INTO `t_mail` VALUES ('311', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF08001100010000000C4D58670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '328', '10', '1');
INSERT INTO `t_mail` VALUES ('312', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '329', '10', '0');
INSERT INTO `t_mail` VALUES ('313', '', '¶û', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001100010000001B1958670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '330', '10', '1');
INSERT INTO `t_mail` VALUES ('314', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '331', '10', '0');
INSERT INTO `t_mail` VALUES ('315', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001100010000001C1958670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '332', '10', '1');
INSERT INTO `t_mail` VALUES ('316', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '333', '10', '0');
INSERT INTO `t_mail` VALUES ('317', '', 'Îá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200110001000000211B58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '334', '10', '1');
INSERT INTO `t_mail` VALUES ('318', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '335', '10', '0');
INSERT INTO `t_mail` VALUES ('319', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000005E2E58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '336', '10', '1');
INSERT INTO `t_mail` VALUES ('320', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '337', '10', '0');
INSERT INTO `t_mail` VALUES ('321', '', '·Å¼ÙÁË', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600150001000000352158670000000000000000000000000000000000000000', '#{LevelMail_menpai_7}', '338', '10', '1');
INSERT INTO `t_mail` VALUES ('322', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '339', '10', '0');
INSERT INTO `t_mail` VALUES ('323', '', '·Å¼ÙÁË', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000854458670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '340', '10', '1');
INSERT INTO `t_mail` VALUES ('324', '', '´«ËµØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600280001000000044558670000000000000000000000000000000000000000', '#{HJYK_201223_13**´«ËµØ¼*2025*1*9}', '341', '10', '1');
INSERT INTO `t_mail` VALUES ('325', '', 'äìÏæÒ¹Óê', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF08002A0001000000AF4558670000000000000000000000000000000000000000', '#{HJYK_201223_13**äìÏæÒ¹Óê*2025*1*9}', '342', '10', '1');
INSERT INTO `t_mail` VALUES ('326', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '343', '10', '1');
INSERT INTO `t_mail` VALUES ('327', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600280001000000727458670000000000000000000000000000000000000000', '#{HJYK_201223_13**¡¢°¢Æ®*2025*1*9}', '344', '10', '1');
INSERT INTO `t_mail` VALUES ('328', '', '¡¢°¢Æ®', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600170001000000D34B58670000000000000000000000000000000000000000', 'Äã±»Íæ¼Ò: ÒÔÕ½Ö¹Õ½ É±ËÀ', '345', '10', '1');
INSERT INTO `t_mail` VALUES ('329', '', '¡¢ÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600170001000000EA4B58670000000000000000000000000000000000000000', 'Äã±»Íæ¼Ò: ÒÔÕ½Ö¹Õ½ É±ËÀ', '346', '10', '1');
INSERT INTO `t_mail` VALUES ('330', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000067458670000000000000000000000000000000000000000', '#{LevelMail_90_1}', '347', '10', '1');
INSERT INTO `t_mail` VALUES ('331', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '348', '10', '0');
INSERT INTO `t_mail` VALUES ('332', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000067458670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '349', '10', '1');
INSERT INTO `t_mail` VALUES ('333', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06002800010000002C4658670000000000000000000000000000000000000000', '#{HJYK_201223_13**ÂåÁ§¡£*2025*1*9}', '350', '10', '1');
INSERT INTO `t_mail` VALUES ('334', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '351', '10', '0');
INSERT INTO `t_mail` VALUES ('335', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '352', '10', '1');
INSERT INTO `t_mail` VALUES ('336', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '353', '10', '0');
INSERT INTO `t_mail` VALUES ('337', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '354', '10', '0');
INSERT INTO `t_mail` VALUES ('338', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000067458670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '355', '10', '1');
INSERT INTO `t_mail` VALUES ('339', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000067458670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '356', '10', '1');
INSERT INTO `t_mail` VALUES ('340', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '357', '10', '0');
INSERT INTO `t_mail` VALUES ('341', '', '¨BÐÇºÓÈëÃÎ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000004A1858670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '367', '10', '1');
INSERT INTO `t_mail` VALUES ('342', '', '¨BÐÇºÓÈëÃÎ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000004A1858670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '368', '10', '1');
INSERT INTO `t_mail` VALUES ('343', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '369', '10', '1');
INSERT INTO `t_mail` VALUES ('344', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '370', '10', '1');
INSERT INTO `t_mail` VALUES ('345', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '371', '10', '1');
INSERT INTO `t_mail` VALUES ('346', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '372', '10', '1');
INSERT INTO `t_mail` VALUES ('347', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000067458670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '373', '10', '1');
INSERT INTO `t_mail` VALUES ('348', '', 'Ð¡ºÅ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000144558670000000000000000000000000000000000000000', '#{MAIL_100305_01}', '374', '10', '1');
INSERT INTO `t_mail` VALUES ('349', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000067458670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '375', '10', '1');
INSERT INTO `t_mail` VALUES ('350', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000067458670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '376', '10', '1');
INSERT INTO `t_mail` VALUES ('351', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000067458670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '377', '10', '1');
INSERT INTO `t_mail` VALUES ('352', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000067458670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '378', '10', '1');
INSERT INTO `t_mail` VALUES ('353', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000067458670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '379', '10', '1');
INSERT INTO `t_mail` VALUES ('354', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000067458670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '380', '10', '1');
INSERT INTO `t_mail` VALUES ('355', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000067458670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '381', '10', '1');
INSERT INTO `t_mail` VALUES ('356', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000067458670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '382', '10', '1');
INSERT INTO `t_mail` VALUES ('357', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000067458670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '383', '10', '1');
INSERT INTO `t_mail` VALUES ('358', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000067458670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '384', '10', '1');
INSERT INTO `t_mail` VALUES ('359', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000067458670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '385', '10', '1');
INSERT INTO `t_mail` VALUES ('360', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '386', '10', '0');
INSERT INTO `t_mail` VALUES ('361', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '387', '10', '0');
INSERT INTO `t_mail` VALUES ('362', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000493A58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '388', '10', '1');
INSERT INTO `t_mail` VALUES ('363', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '389', '10', '0');
INSERT INTO `t_mail` VALUES ('364', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000391358670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '390', '10', '1');
INSERT INTO `t_mail` VALUES ('365', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001500010000007C1358670000000000000000000000000000000000000000', '#{LevelMail_menpai_1}', '391', '10', '1');
INSERT INTO `t_mail` VALUES ('366', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '392', '10', '0');
INSERT INTO `t_mail` VALUES ('367', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000391358670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '393', '10', '1');
INSERT INTO `t_mail` VALUES ('368', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000391358670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '394', '10', '1');
INSERT INTO `t_mail` VALUES ('369', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000391358670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '395', '10', '1');
INSERT INTO `t_mail` VALUES ('370', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000391358670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '396', '10', '1');
INSERT INTO `t_mail` VALUES ('371', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000391358670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '397', '10', '1');
INSERT INTO `t_mail` VALUES ('372', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000391358670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '398', '10', '1');
INSERT INTO `t_mail` VALUES ('373', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000391358670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '399', '10', '1');
INSERT INTO `t_mail` VALUES ('374', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000391358670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '400', '10', '1');
INSERT INTO `t_mail` VALUES ('375', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000391358670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '401', '10', '1');
INSERT INTO `t_mail` VALUES ('376', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000391358670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '402', '10', '1');
INSERT INTO `t_mail` VALUES ('377', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000391358670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '403', '10', '1');
INSERT INTO `t_mail` VALUES ('378', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000391358670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '404', '10', '1');
INSERT INTO `t_mail` VALUES ('379', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000391358670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '405', '10', '1');
INSERT INTO `t_mail` VALUES ('380', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000391358670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '406', '10', '1');
INSERT INTO `t_mail` VALUES ('381', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000391358670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '407', '10', '1');
INSERT INTO `t_mail` VALUES ('382', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000391358670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '408', '10', '1');
INSERT INTO `t_mail` VALUES ('383', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000391358670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '409', '10', '1');
INSERT INTO `t_mail` VALUES ('384', '', '¹ÇÓñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000391358670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '410', '10', '1');
INSERT INTO `t_mail` VALUES ('385', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000067458670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '364', '10', '1');
INSERT INTO `t_mail` VALUES ('386', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000067458670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '365', '10', '1');
INSERT INTO `t_mail` VALUES ('387', '', '¹¤ÐÐ½¨ÐÐ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000067458670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '366', '10', '1');
INSERT INTO `t_mail` VALUES ('388', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '411', '10', '0');
INSERT INTO `t_mail` VALUES ('389', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '412', '10', '1');
INSERT INTO `t_mail` VALUES ('390', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '413', '10', '1');
INSERT INTO `t_mail` VALUES ('391', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '414', '10', '1');
INSERT INTO `t_mail` VALUES ('392', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '415', '10', '1');
INSERT INTO `t_mail` VALUES ('393', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '416', '10', '1');
INSERT INTO `t_mail` VALUES ('394', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '417', '10', '1');
INSERT INTO `t_mail` VALUES ('395', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '418', '10', '1');
INSERT INTO `t_mail` VALUES ('396', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '419', '10', '1');
INSERT INTO `t_mail` VALUES ('397', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '420', '10', '1');
INSERT INTO `t_mail` VALUES ('398', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '421', '10', '1');
INSERT INTO `t_mail` VALUES ('399', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '422', '10', '1');
INSERT INTO `t_mail` VALUES ('400', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '423', '10', '1');
INSERT INTO `t_mail` VALUES ('401', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '424', '10', '1');
INSERT INTO `t_mail` VALUES ('402', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000006C3B58670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '425', '10', '1');
INSERT INTO `t_mail` VALUES ('403', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '426', '10', '1');
INSERT INTO `t_mail` VALUES ('404', '', '·üÌì', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400150001000000FC3B58670000000000000000000000000000000000000000', '#{LevelMail_menpai_5}', '427', '10', '1');
INSERT INTO `t_mail` VALUES ('405', '', 'æÌÈ»', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400150001000000CA3B58670000000000000000000000000000000000000000', '#{LevelMail_menpai_5}', '428', '10', '1');
INSERT INTO `t_mail` VALUES ('406', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000671858670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '358', '10', '1');
INSERT INTO `t_mail` VALUES ('407', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000671858670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '359', '10', '1');
INSERT INTO `t_mail` VALUES ('408', '', 'Ð¡ºÅ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04002A0001000000144558670000000000000000000000000000000000000000', '#{DLYJ_081009_01}Ð¡ºÅ¹ÃÄï#{DLYJ_081009_02}', '360', '10', '1');
INSERT INTO `t_mail` VALUES ('409', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '361', '10', '1');
INSERT INTO `t_mail` VALUES ('410', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '362', '10', '1');
INSERT INTO `t_mail` VALUES ('411', '', 'Ë¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF02001100010000001B1958670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '363', '10', '1');
INSERT INTO `t_mail` VALUES ('412', '', 'Ð¡ºÅ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000144558670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '429', '10', '1');
INSERT INTO `t_mail` VALUES ('413', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000314A58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '430', '10', '1');
INSERT INTO `t_mail` VALUES ('414', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '431', '10', '0');
INSERT INTO `t_mail` VALUES ('415', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '432', '10', '0');
INSERT INTO `t_mail` VALUES ('416', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '433', '10', '0');
INSERT INTO `t_mail` VALUES ('417', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '434', '10', '0');
INSERT INTO `t_mail` VALUES ('418', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '435', '10', '0');
INSERT INTO `t_mail` VALUES ('419', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '436', '10', '0');
INSERT INTO `t_mail` VALUES ('420', '', '·¨Á¦ÎÞ±ßØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001500010000009C6358670000000000000000000000000000000000000000', '#{LevelMail_menpai_1}', '437', '10', '1');
INSERT INTO `t_mail` VALUES ('421', '', '¨BÐÇºÓÈëÃÎ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000004A1858670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '438', '10', '1');
INSERT INTO `t_mail` VALUES ('422', '', '¨BÐÇºÓÈëÃÎ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000004A1858670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '439', '10', '1');
INSERT INTO `t_mail` VALUES ('423', '', '¨BÐÇºÓÈëÃÎ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000004A1858670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '440', '10', '1');
INSERT INTO `t_mail` VALUES ('424', '', '¨BÐÇºÓÈëÃÎ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000004A1858670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '441', '10', '1');
INSERT INTO `t_mail` VALUES ('425', '', '¨BÐÇºÓÈëÃÎ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000004A1858670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '442', '10', '1');
INSERT INTO `t_mail` VALUES ('426', '', '¨BÐÇºÓÈëÃÎ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000004A1858670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '443', '10', '1');
INSERT INTO `t_mail` VALUES ('427', '', '¨BÐÇºÓÈëÃÎ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000004A1858670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '444', '10', '1');
INSERT INTO `t_mail` VALUES ('428', '', '¨BÐÇºÓÈëÃÎ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000004A1858670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '445', '10', '1');
INSERT INTO `t_mail` VALUES ('429', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001500010000005B3958670000000000000000000000000000000000000000', '#{LevelMail_menpai_8}', '446', '10', '1');
INSERT INTO `t_mail` VALUES ('430', '', '°×ÒÂ·ç²»ÎÅ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00110001000000414558670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '447', '10', '1');
INSERT INTO `t_mail` VALUES ('431', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000FE4B58670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '448', '10', '1');
INSERT INTO `t_mail` VALUES ('432', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '449', '10', '0');
INSERT INTO `t_mail` VALUES ('433', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '450', '10', '0');
INSERT INTO `t_mail` VALUES ('434', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '451', '10', '0');
INSERT INTO `t_mail` VALUES ('435', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '452', '10', '0');
INSERT INTO `t_mail` VALUES ('436', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '453', '10', '0');
INSERT INTO `t_mail` VALUES ('437', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '454', '10', '0');
INSERT INTO `t_mail` VALUES ('438', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '455', '10', '0');
INSERT INTO `t_mail` VALUES ('439', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '456', '10', '0');
INSERT INTO `t_mail` VALUES ('440', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '457', '10', '0');
INSERT INTO `t_mail` VALUES ('441', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '458', '10', '0');
INSERT INTO `t_mail` VALUES ('442', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '459', '10', '0');
INSERT INTO `t_mail` VALUES ('443', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '460', '10', '0');
INSERT INTO `t_mail` VALUES ('444', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '461', '10', '0');
INSERT INTO `t_mail` VALUES ('445', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '462', '10', '0');
INSERT INTO `t_mail` VALUES ('446', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '463', '10', '0');
INSERT INTO `t_mail` VALUES ('447', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00150001000000CE3958670000000000000000000000000000000000000000', '#{LevelMail_menpai_4}', '464', '10', '1');
INSERT INTO `t_mail` VALUES ('448', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '465', '10', '0');
INSERT INTO `t_mail` VALUES ('449', '', '°×ÒÂ·ç²»ÎÅ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00110001000000494058670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '466', '10', '1');
INSERT INTO `t_mail` VALUES ('450', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000671858670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '467', '10', '1');
INSERT INTO `t_mail` VALUES ('451', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000671858670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '468', '10', '1');
INSERT INTO `t_mail` VALUES ('452', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000671858670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '469', '10', '1');
INSERT INTO `t_mail` VALUES ('453', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000671858670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '470', '10', '1');
INSERT INTO `t_mail` VALUES ('454', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000671858670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '471', '10', '1');
INSERT INTO `t_mail` VALUES ('455', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000671858670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '472', '10', '1');
INSERT INTO `t_mail` VALUES ('456', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000671858670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '473', '10', '1');
INSERT INTO `t_mail` VALUES ('457', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000671858670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '474', '10', '1');
INSERT INTO `t_mail` VALUES ('458', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000671858670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '475', '10', '1');
INSERT INTO `t_mail` VALUES ('459', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000671858670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '476', '10', '1');
INSERT INTO `t_mail` VALUES ('460', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000671858670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '477', '10', '1');
INSERT INTO `t_mail` VALUES ('461', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000671858670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '478', '10', '1');
INSERT INTO `t_mail` VALUES ('462', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000671858670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '479', '10', '1');
INSERT INTO `t_mail` VALUES ('463', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000671858670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '480', '10', '1');
INSERT INTO `t_mail` VALUES ('464', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000671858670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '481', '10', '1');
INSERT INTO `t_mail` VALUES ('465', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '482', '10', '1');
INSERT INTO `t_mail` VALUES ('466', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '483', '10', '0');
INSERT INTO `t_mail` VALUES ('467', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '484', '10', '0');
INSERT INTO `t_mail` VALUES ('468', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '485', '10', '1');
INSERT INTO `t_mail` VALUES ('469', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '486', '10', '1');
INSERT INTO `t_mail` VALUES ('470', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '487', '10', '1');
INSERT INTO `t_mail` VALUES ('471', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '488', '10', '1');
INSERT INTO `t_mail` VALUES ('472', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '489', '10', '1');
INSERT INTO `t_mail` VALUES ('473', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '490', '10', '1');
INSERT INTO `t_mail` VALUES ('474', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '491', '10', '1');
INSERT INTO `t_mail` VALUES ('475', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '492', '10', '1');
INSERT INTO `t_mail` VALUES ('476', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '493', '10', '1');
INSERT INTO `t_mail` VALUES ('477', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '494', '10', '1');
INSERT INTO `t_mail` VALUES ('478', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '495', '10', '1');
INSERT INTO `t_mail` VALUES ('479', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '496', '10', '1');
INSERT INTO `t_mail` VALUES ('480', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '497', '10', '1');
INSERT INTO `t_mail` VALUES ('481', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '498', '10', '1');
INSERT INTO `t_mail` VALUES ('482', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000006E1858670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '499', '10', '1');
INSERT INTO `t_mail` VALUES ('483', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '500', '10', '0');
INSERT INTO `t_mail` VALUES ('484', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '501', '10', '0');
INSERT INTO `t_mail` VALUES ('485', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '502', '10', '0');
INSERT INTO `t_mail` VALUES ('486', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '503', '10', '0');
INSERT INTO `t_mail` VALUES ('487', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '506', '10', '1');
INSERT INTO `t_mail` VALUES ('488', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001500010000000F2258670000000000000000000000000000000000000000', '#{LevelMail_menpai_4}', '507', '10', '1');
INSERT INTO `t_mail` VALUES ('489', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '508', '10', '0');
INSERT INTO `t_mail` VALUES ('490', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000034758670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '509', '10', '1');
INSERT INTO `t_mail` VALUES ('491', '', '°×ÒÂ·ç²»ÎÅ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C002E0001000000374758670000000000000000000000000000000000000000', '#{HJYK_201223_13**°×ÒÂ·ç²»ÎÅ¡£*2025*1*9}', '510', '10', '1');
INSERT INTO `t_mail` VALUES ('492', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '511', '10', '1');
INSERT INTO `t_mail` VALUES ('493', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '512', '10', '1');
INSERT INTO `t_mail` VALUES ('494', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '513', '10', '1');
INSERT INTO `t_mail` VALUES ('495', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '514', '10', '1');
INSERT INTO `t_mail` VALUES ('496', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '515', '10', '1');
INSERT INTO `t_mail` VALUES ('497', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '516', '10', '1');
INSERT INTO `t_mail` VALUES ('498', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '517', '10', '1');
INSERT INTO `t_mail` VALUES ('499', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '518', '10', '1');
INSERT INTO `t_mail` VALUES ('500', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '519', '10', '1');
INSERT INTO `t_mail` VALUES ('501', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '520', '10', '1');
INSERT INTO `t_mail` VALUES ('502', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '521', '10', '1');
INSERT INTO `t_mail` VALUES ('503', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '522', '10', '1');
INSERT INTO `t_mail` VALUES ('504', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '523', '10', '1');
INSERT INTO `t_mail` VALUES ('505', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '524', '10', '1');
INSERT INTO `t_mail` VALUES ('506', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '525', '10', '1');
INSERT INTO `t_mail` VALUES ('507', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000DB2158670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '526', '10', '1');
INSERT INTO `t_mail` VALUES ('508', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '527', '10', '0');
INSERT INTO `t_mail` VALUES ('509', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF08002A00010000003A5858670000000000000000000000000000000000000000', '#{HJYK_201223_13**ÌÒÖ®Ø²Ø²*2025*1*9}', '528', '10', '1');
INSERT INTO `t_mail` VALUES ('510', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '529', '10', '0');
INSERT INTO `t_mail` VALUES ('511', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '530', '10', '0');
INSERT INTO `t_mail` VALUES ('512', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000382458670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '531', '10', '1');
INSERT INTO `t_mail` VALUES ('513', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000382458670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '532', '10', '1');
INSERT INTO `t_mail` VALUES ('514', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000382458670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '533', '10', '1');
INSERT INTO `t_mail` VALUES ('515', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000382458670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '534', '10', '1');
INSERT INTO `t_mail` VALUES ('516', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000382458670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '535', '10', '1');
INSERT INTO `t_mail` VALUES ('517', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000382458670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '536', '10', '1');
INSERT INTO `t_mail` VALUES ('518', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000382458670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '537', '10', '1');
INSERT INTO `t_mail` VALUES ('519', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000382458670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '538', '10', '1');
INSERT INTO `t_mail` VALUES ('520', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000382458670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '539', '10', '1');
INSERT INTO `t_mail` VALUES ('521', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000382458670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '540', '10', '1');
INSERT INTO `t_mail` VALUES ('522', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000382458670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '541', '10', '1');
INSERT INTO `t_mail` VALUES ('523', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '542', '10', '0');
INSERT INTO `t_mail` VALUES ('524', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '543', '10', '1');
INSERT INTO `t_mail` VALUES ('525', '', 'çÛ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0200150001000000F02A58670000000000000000000000000000000000000000', '#{LevelMail_menpai_4}', '544', '10', '1');
INSERT INTO `t_mail` VALUES ('526', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_90_1}', '545', '10', '1');
INSERT INTO `t_mail` VALUES ('527', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '546', '10', '1');
INSERT INTO `t_mail` VALUES ('528', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '547', '10', '1');
INSERT INTO `t_mail` VALUES ('529', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '548', '10', '1');
INSERT INTO `t_mail` VALUES ('530', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '549', '10', '1');
INSERT INTO `t_mail` VALUES ('531', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '550', '10', '1');
INSERT INTO `t_mail` VALUES ('532', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '551', '10', '1');
INSERT INTO `t_mail` VALUES ('533', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '552', '10', '1');
INSERT INTO `t_mail` VALUES ('534', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '553', '10', '1');
INSERT INTO `t_mail` VALUES ('535', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '554', '10', '1');
INSERT INTO `t_mail` VALUES ('536', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '555', '10', '1');
INSERT INTO `t_mail` VALUES ('537', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '556', '10', '1');
INSERT INTO `t_mail` VALUES ('538', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '557', '10', '1');
INSERT INTO `t_mail` VALUES ('539', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '558', '10', '1');
INSERT INTO `t_mail` VALUES ('540', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '559', '10', '1');
INSERT INTO `t_mail` VALUES ('541', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '560', '10', '1');
INSERT INTO `t_mail` VALUES ('542', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '561', '10', '1');
INSERT INTO `t_mail` VALUES ('543', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '562', '10', '1');
INSERT INTO `t_mail` VALUES ('544', '', 'ÈË¼äÓÈÎï', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000C12A58670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '563', '10', '1');
INSERT INTO `t_mail` VALUES ('545', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00110001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '564', '10', '1');
INSERT INTO `t_mail` VALUES ('546', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00110001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '565', '10', '1');
INSERT INTO `t_mail` VALUES ('547', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00110001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '566', '10', '1');
INSERT INTO `t_mail` VALUES ('548', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00110001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '567', '10', '1');
INSERT INTO `t_mail` VALUES ('549', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00110001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '568', '10', '1');
INSERT INTO `t_mail` VALUES ('550', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00110001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '569', '10', '1');
INSERT INTO `t_mail` VALUES ('551', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00110001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '570', '10', '1');
INSERT INTO `t_mail` VALUES ('552', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00110001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '571', '10', '1');
INSERT INTO `t_mail` VALUES ('553', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00110001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '572', '10', '1');
INSERT INTO `t_mail` VALUES ('554', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00120001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '573', '10', '1');
INSERT INTO `t_mail` VALUES ('555', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00120001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '574', '10', '1');
INSERT INTO `t_mail` VALUES ('556', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00120001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '575', '10', '1');
INSERT INTO `t_mail` VALUES ('557', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00120001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '576', '10', '1');
INSERT INTO `t_mail` VALUES ('558', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00120001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '577', '10', '1');
INSERT INTO `t_mail` VALUES ('559', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00120001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '578', '10', '1');
INSERT INTO `t_mail` VALUES ('560', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00120001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '579', '10', '1');
INSERT INTO `t_mail` VALUES ('561', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00120001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '580', '10', '1');
INSERT INTO `t_mail` VALUES ('562', '', 'ÔÂ¹éÄÏÉ½Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0C00120001000000F82D58670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '581', '10', '1');
INSERT INTO `t_mail` VALUES ('563', '', '¡¢ÄºÓê', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000C22E58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '582', '10', '1');
INSERT INTO `t_mail` VALUES ('564', '', '¨BÐÇºÓÈëÃÎ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001500010000000F3A58670000000000000000000000000000000000000000', '#{LevelMail_menpai_4}', '583', '10', '1');
INSERT INTO `t_mail` VALUES ('565', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '584', '10', '1');
INSERT INTO `t_mail` VALUES ('566', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000473358670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '585', '10', '1');
INSERT INTO `t_mail` VALUES ('567', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '586', '10', '1');
INSERT INTO `t_mail` VALUES ('568', '', '¡¢ÄºÓê', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000C22E58670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '117', '10', '1');
INSERT INTO `t_mail` VALUES ('569', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '118', '10', '0');
INSERT INTO `t_mail` VALUES ('570', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000473358670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '604', '10', '1');
INSERT INTO `t_mail` VALUES ('571', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '605', '10', '0');
INSERT INTO `t_mail` VALUES ('572', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '606', '10', '0');
INSERT INTO `t_mail` VALUES ('573', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000473358670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '607', '10', '1');
INSERT INTO `t_mail` VALUES ('574', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000473358670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '608', '10', '1');
INSERT INTO `t_mail` VALUES ('575', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000473358670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '609', '10', '1');
INSERT INTO `t_mail` VALUES ('576', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000473358670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '610', '10', '1');
INSERT INTO `t_mail` VALUES ('577', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000473358670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '611', '10', '1');
INSERT INTO `t_mail` VALUES ('578', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000473358670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '612', '10', '1');
INSERT INTO `t_mail` VALUES ('579', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000473358670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '613', '10', '1');
INSERT INTO `t_mail` VALUES ('580', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000473358670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '614', '10', '1');
INSERT INTO `t_mail` VALUES ('581', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000473358670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '615', '10', '1');
INSERT INTO `t_mail` VALUES ('582', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000473358670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '616', '10', '1');
INSERT INTO `t_mail` VALUES ('583', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000473358670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '617', '10', '1');
INSERT INTO `t_mail` VALUES ('584', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000473358670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '618', '10', '1');
INSERT INTO `t_mail` VALUES ('585', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000473358670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '619', '10', '1');
INSERT INTO `t_mail` VALUES ('586', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000473358670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '620', '10', '1');
INSERT INTO `t_mail` VALUES ('587', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000473358670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '621', '10', '1');
INSERT INTO `t_mail` VALUES ('588', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000473358670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '622', '10', '1');
INSERT INTO `t_mail` VALUES ('589', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000473358670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '623', '10', '1');
INSERT INTO `t_mail` VALUES ('590', '', 'ÁøÈçÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000473358670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '624', '10', '1');
INSERT INTO `t_mail` VALUES ('591', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '587', '10', '1');
INSERT INTO `t_mail` VALUES ('592', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '588', '10', '1');
INSERT INTO `t_mail` VALUES ('593', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '589', '10', '1');
INSERT INTO `t_mail` VALUES ('594', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '590', '10', '1');
INSERT INTO `t_mail` VALUES ('595', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '591', '10', '1');
INSERT INTO `t_mail` VALUES ('596', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '592', '10', '1');
INSERT INTO `t_mail` VALUES ('597', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '593', '10', '1');
INSERT INTO `t_mail` VALUES ('598', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '594', '10', '1');
INSERT INTO `t_mail` VALUES ('599', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '595', '10', '1');
INSERT INTO `t_mail` VALUES ('600', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '596', '10', '1');
INSERT INTO `t_mail` VALUES ('601', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '597', '10', '1');
INSERT INTO `t_mail` VALUES ('602', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '598', '10', '1');
INSERT INTO `t_mail` VALUES ('603', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '599', '10', '1');
INSERT INTO `t_mail` VALUES ('604', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '600', '10', '1');
INSERT INTO `t_mail` VALUES ('605', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000D23B58670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '601', '10', '1');
INSERT INTO `t_mail` VALUES ('606', '', '¶ëÃ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000034758670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '602', '10', '1');
INSERT INTO `t_mail` VALUES ('607', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '603', '10', '0');
INSERT INTO `t_mail` VALUES ('608', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '625', '10', '1');
INSERT INTO `t_mail` VALUES ('609', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400150001000000583C58670000000000000000000000000000000000000000', '#{LevelMail_menpai_8}', '626', '10', '1');
INSERT INTO `t_mail` VALUES ('610', '', 'ÇàÐþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400150001000000663C58670000000000000000000000000000000000000000', '#{LevelMail_menpai_8}', '627', '10', '1');
INSERT INTO `t_mail` VALUES ('611', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '628', '10', '1');
INSERT INTO `t_mail` VALUES ('612', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '629', '10', '1');
INSERT INTO `t_mail` VALUES ('613', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '630', '10', '1');
INSERT INTO `t_mail` VALUES ('614', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '631', '10', '1');
INSERT INTO `t_mail` VALUES ('615', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '632', '10', '1');
INSERT INTO `t_mail` VALUES ('616', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '633', '10', '1');
INSERT INTO `t_mail` VALUES ('617', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '634', '10', '1');
INSERT INTO `t_mail` VALUES ('618', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '635', '10', '1');
INSERT INTO `t_mail` VALUES ('619', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '636', '10', '1');
INSERT INTO `t_mail` VALUES ('620', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '637', '10', '1');
INSERT INTO `t_mail` VALUES ('621', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '638', '10', '1');
INSERT INTO `t_mail` VALUES ('622', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '639', '10', '1');
INSERT INTO `t_mail` VALUES ('623', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '640', '10', '1');
INSERT INTO `t_mail` VALUES ('624', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '641', '10', '1');
INSERT INTO `t_mail` VALUES ('625', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '642', '10', '1');
INSERT INTO `t_mail` VALUES ('626', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '643', '10', '1');
INSERT INTO `t_mail` VALUES ('627', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '644', '10', '1');
INSERT INTO `t_mail` VALUES ('628', '', 'º®ÑÌ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000323C58670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '645', '10', '1');
INSERT INTO `t_mail` VALUES ('629', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000A4158670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '646', '10', '1');
INSERT INTO `t_mail` VALUES ('630', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000A4158670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '647', '10', '1');
INSERT INTO `t_mail` VALUES ('631', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '648', '10', '0');
INSERT INTO `t_mail` VALUES ('632', '', '·Å¼ÙÁË', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000854458670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '649', '10', '1');
INSERT INTO `t_mail` VALUES ('633', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '650', '10', '1');
INSERT INTO `t_mail` VALUES ('634', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001500010000004F4158670000000000000000000000000000000000000000', '#{LevelMail_menpai_4}', '651', '10', '1');
INSERT INTO `t_mail` VALUES ('635', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '652', '10', '1');
INSERT INTO `t_mail` VALUES ('636', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000E64658670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '653', '10', '1');
INSERT INTO `t_mail` VALUES ('637', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300120001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '654', '10', '1');
INSERT INTO `t_mail` VALUES ('638', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600280001000000FB4758670000000000000000000000000000000000000000', '#{HJYK_201223_13**ÂåÉñ¡£*2025*1*9}', '655', '10', '1');
INSERT INTO `t_mail` VALUES ('639', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000094158670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '656', '10', '1');
INSERT INTO `t_mail` VALUES ('640', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000094158670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '657', '10', '1');
INSERT INTO `t_mail` VALUES ('641', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000094158670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '658', '10', '1');
INSERT INTO `t_mail` VALUES ('642', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000000A4158670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '659', '10', '1');
INSERT INTO `t_mail` VALUES ('643', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000000A4158670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '660', '10', '1');
INSERT INTO `t_mail` VALUES ('644', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000000A4158670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '661', '10', '1');
INSERT INTO `t_mail` VALUES ('645', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000A4158670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '662', '10', '1');
INSERT INTO `t_mail` VALUES ('646', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000A4158670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '663', '10', '1');
INSERT INTO `t_mail` VALUES ('647', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000A4158670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '664', '10', '1');
INSERT INTO `t_mail` VALUES ('648', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000A4158670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '665', '10', '1');
INSERT INTO `t_mail` VALUES ('649', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000A4158670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '666', '10', '1');
INSERT INTO `t_mail` VALUES ('650', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000A4158670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '667', '10', '1');
INSERT INTO `t_mail` VALUES ('651', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000A4158670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '668', '10', '1');
INSERT INTO `t_mail` VALUES ('652', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000000A4158670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '669', '10', '1');
INSERT INTO `t_mail` VALUES ('653', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '670', '10', '1');
INSERT INTO `t_mail` VALUES ('654', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300120001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '671', '10', '1');
INSERT INTO `t_mail` VALUES ('655', '', 'ÂåÉñ¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000E64658670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '672', '10', '1');
INSERT INTO `t_mail` VALUES ('656', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '673', '10', '1');
INSERT INTO `t_mail` VALUES ('657', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '674', '10', '1');
INSERT INTO `t_mail` VALUES ('658', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '675', '10', '1');
INSERT INTO `t_mail` VALUES ('659', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '676', '10', '1');
INSERT INTO `t_mail` VALUES ('660', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '677', '10', '1');
INSERT INTO `t_mail` VALUES ('661', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '678', '10', '1');
INSERT INTO `t_mail` VALUES ('662', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '679', '10', '1');
INSERT INTO `t_mail` VALUES ('663', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '680', '10', '1');
INSERT INTO `t_mail` VALUES ('664', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '681', '10', '1');
INSERT INTO `t_mail` VALUES ('665', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '682', '10', '1');
INSERT INTO `t_mail` VALUES ('666', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '683', '10', '1');
INSERT INTO `t_mail` VALUES ('667', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '684', '10', '1');
INSERT INTO `t_mail` VALUES ('668', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '685', '10', '1');
INSERT INTO `t_mail` VALUES ('669', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '686', '10', '1');
INSERT INTO `t_mail` VALUES ('670', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '687', '10', '1');
INSERT INTO `t_mail` VALUES ('671', '', 'ÂåÁ§¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000D24558670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '688', '10', '1');
INSERT INTO `t_mail` VALUES ('672', '', 'ÚôÓÐºÉ»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF08002A0001000000794858670000000000000000000000000000000000000000', '#{HJYK_201223_13**ÚôÓÐºÉ»ª*2025*1*9}', '689', '10', '1');
INSERT INTO `t_mail` VALUES ('673', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000A04958670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '690', '10', '1');
INSERT INTO `t_mail` VALUES ('674', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000A04958670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '691', '10', '1');
INSERT INTO `t_mail` VALUES ('675', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600280001000000A04C58670000000000000000000000000000000000000000', '#{HJYK_201223_13**ÄÎÑ©¡£*2025*1*9}', '692', '10', '1');
INSERT INTO `t_mail` VALUES ('676', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000944958670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '693', '10', '1');
INSERT INTO `t_mail` VALUES ('677', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000944958670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '694', '10', '1');
INSERT INTO `t_mail` VALUES ('678', '', 'Í¹²¨ÎÆÍ¹', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF080015000100000016BB58670000000000000000000000000000000000000000', '#{LevelMail_menpai_8}', '695', '10', '1');
INSERT INTO `t_mail` VALUES ('679', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '698', '10', '0');
INSERT INTO `t_mail` VALUES ('680', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '718', '10', '1');
INSERT INTO `t_mail` VALUES ('681', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '719', '10', '1');
INSERT INTO `t_mail` VALUES ('682', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '720', '10', '1');
INSERT INTO `t_mail` VALUES ('683', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '721', '10', '1');
INSERT INTO `t_mail` VALUES ('684', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '722', '10', '0');
INSERT INTO `t_mail` VALUES ('685', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '723', '10', '0');
INSERT INTO `t_mail` VALUES ('686', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000567958670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '724', '10', '1');
INSERT INTO `t_mail` VALUES ('687', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000B64C58670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '725', '10', '1');
INSERT INTO `t_mail` VALUES ('688', '', 'ÒÔÕ½Ö¹Õ½', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF08005C0001000000B82E38690000000000000000000000000000000000000000', '¹§Ï²ÄúµÄÕäÊÞÒÑ¾­·±Ö³³É¹¦£¬ÇëÎñ±ØÓÚ48Ð¡Ê±ÄÚÇ°À´ÁìÈ¡£¬Èç¹ûÓâÆÚ²»ÖÁµÄ»°£¬¿ÉÁ¯µÄÕäÊÞ½«±»ÎÒÃÇÊÕÑø', '726', '10', '1');
INSERT INTO `t_mail` VALUES ('689', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '727', '10', '1');
INSERT INTO `t_mail` VALUES ('690', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800150001000000AC5158670000000000000000000000000000000000000000', '#{LevelMail_menpai_4}', '728', '10', '1');
INSERT INTO `t_mail` VALUES ('691', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000944958670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '729', '10', '1');
INSERT INTO `t_mail` VALUES ('692', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000944958670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '730', '10', '1');
INSERT INTO `t_mail` VALUES ('693', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000944958670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '731', '10', '1');
INSERT INTO `t_mail` VALUES ('694', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000944958670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '732', '10', '1');
INSERT INTO `t_mail` VALUES ('695', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000944958670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '733', '10', '1');
INSERT INTO `t_mail` VALUES ('696', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000944958670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '734', '10', '1');
INSERT INTO `t_mail` VALUES ('697', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000944958670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '735', '10', '1');
INSERT INTO `t_mail` VALUES ('698', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000944958670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '736', '10', '1');
INSERT INTO `t_mail` VALUES ('699', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000944958670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '737', '10', '1');
INSERT INTO `t_mail` VALUES ('700', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000944958670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '738', '10', '1');
INSERT INTO `t_mail` VALUES ('701', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000944958670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '739', '10', '1');
INSERT INTO `t_mail` VALUES ('702', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000944958670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '740', '10', '1');
INSERT INTO `t_mail` VALUES ('703', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000944958670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '741', '10', '1');
INSERT INTO `t_mail` VALUES ('704', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000944958670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '742', '10', '1');
INSERT INTO `t_mail` VALUES ('705', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000944958670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '743', '10', '1');
INSERT INTO `t_mail` VALUES ('706', '', 'Éñ»°Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000E35E58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '744', '10', '1');
INSERT INTO `t_mail` VALUES ('707', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '745', '10', '0');
INSERT INTO `t_mail` VALUES ('708', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000009F4958670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '746', '10', '1');
INSERT INTO `t_mail` VALUES ('709', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000009F4958670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '747', '10', '1');
INSERT INTO `t_mail` VALUES ('710', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000009F4958670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '748', '10', '1');
INSERT INTO `t_mail` VALUES ('711', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000009F4958670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '749', '10', '1');
INSERT INTO `t_mail` VALUES ('712', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000009F4958670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '750', '10', '1');
INSERT INTO `t_mail` VALUES ('713', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000009F4958670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '751', '10', '1');
INSERT INTO `t_mail` VALUES ('714', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001200010000009F4958670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '752', '10', '1');
INSERT INTO `t_mail` VALUES ('715', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000A04958670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '753', '10', '1');
INSERT INTO `t_mail` VALUES ('716', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000A04958670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '754', '10', '1');
INSERT INTO `t_mail` VALUES ('717', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000A04958670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '755', '10', '1');
INSERT INTO `t_mail` VALUES ('718', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000A04958670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '756', '10', '1');
INSERT INTO `t_mail` VALUES ('719', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000A04958670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '757', '10', '1');
INSERT INTO `t_mail` VALUES ('720', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000A04958670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '758', '10', '1');
INSERT INTO `t_mail` VALUES ('721', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000A04958670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '759', '10', '1');
INSERT INTO `t_mail` VALUES ('722', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000A04958670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '760', '10', '1');
INSERT INTO `t_mail` VALUES ('723', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001700010000009C4B58670000000000000000000000000000000000000000', 'Äã±»Íæ¼Ò: ÒÔÕ½Ö¹Õ½ É±ËÀ', '761', '10', '1');
INSERT INTO `t_mail` VALUES ('724', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000AD4958670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '762', '10', '1');
INSERT INTO `t_mail` VALUES ('725', '', '¨BÎíÓìÄØà«', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000AD4958670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '763', '10', '1');
INSERT INTO `t_mail` VALUES ('726', '', '¨BÐÇºÓÈëÃÎ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000B84958670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '764', '10', '1');
INSERT INTO `t_mail` VALUES ('727', '', '¨BÐÇºÓÈëÃÎ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000B84958670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '765', '10', '1');
INSERT INTO `t_mail` VALUES ('728', '', '¨BÕµÀæÒ¡´º', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000314A58670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '766', '10', '1');
INSERT INTO `t_mail` VALUES ('729', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000C54A58670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '767', '10', '1');
INSERT INTO `t_mail` VALUES ('730', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000C54A58670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '768', '10', '1');
INSERT INTO `t_mail` VALUES ('731', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '769', '10', '1');
INSERT INTO `t_mail` VALUES ('732', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '770', '10', '1');
INSERT INTO `t_mail` VALUES ('733', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '771', '10', '1');
INSERT INTO `t_mail` VALUES ('734', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '772', '10', '1');
INSERT INTO `t_mail` VALUES ('735', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '773', '10', '1');
INSERT INTO `t_mail` VALUES ('736', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '774', '10', '1');
INSERT INTO `t_mail` VALUES ('737', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '775', '10', '1');
INSERT INTO `t_mail` VALUES ('738', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '776', '10', '1');
INSERT INTO `t_mail` VALUES ('739', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '777', '10', '1');
INSERT INTO `t_mail` VALUES ('740', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '778', '10', '1');
INSERT INTO `t_mail` VALUES ('741', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '779', '10', '1');
INSERT INTO `t_mail` VALUES ('742', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '780', '10', '1');
INSERT INTO `t_mail` VALUES ('743', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '781', '10', '1');
INSERT INTO `t_mail` VALUES ('744', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '782', '10', '1');
INSERT INTO `t_mail` VALUES ('745', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '783', '10', '1');
INSERT INTO `t_mail` VALUES ('746', '', '°Ë²¿Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000C64A58670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '784', '10', '1');
INSERT INTO `t_mail` VALUES ('747', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '119', '10', '0');
INSERT INTO `t_mail` VALUES ('748', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300110001000000965058670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '787', '10', '1');
INSERT INTO `t_mail` VALUES ('749', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800150001000000AE5158670000000000000000000000000000000000000000', '#{LevelMail_menpai_5}', '788', '10', '1');
INSERT INTO `t_mail` VALUES ('750', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300110001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '789', '10', '1');
INSERT INTO `t_mail` VALUES ('751', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300110001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '790', '10', '1');
INSERT INTO `t_mail` VALUES ('752', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300110001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '791', '10', '1');
INSERT INTO `t_mail` VALUES ('753', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300110001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '792', '10', '1');
INSERT INTO `t_mail` VALUES ('754', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300110001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '793', '10', '1');
INSERT INTO `t_mail` VALUES ('755', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300110001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '794', '10', '1');
INSERT INTO `t_mail` VALUES ('756', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300110001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '795', '10', '1');
INSERT INTO `t_mail` VALUES ('757', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300110001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '796', '10', '1');
INSERT INTO `t_mail` VALUES ('758', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300120001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '797', '10', '1');
INSERT INTO `t_mail` VALUES ('759', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300120001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '798', '10', '1');
INSERT INTO `t_mail` VALUES ('760', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300120001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '799', '10', '1');
INSERT INTO `t_mail` VALUES ('761', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300120001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '800', '10', '1');
INSERT INTO `t_mail` VALUES ('762', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300120001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '801', '10', '1');
INSERT INTO `t_mail` VALUES ('763', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300120001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '802', '10', '1');
INSERT INTO `t_mail` VALUES ('764', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300120001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '803', '10', '1');
INSERT INTO `t_mail` VALUES ('765', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300120001000000924B58670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '804', '10', '1');
INSERT INTO `t_mail` VALUES ('766', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000007D5258670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '805', '10', '1');
INSERT INTO `t_mail` VALUES ('767', '', 'ÄÎÑ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06002C0001000000495F58670000000000000000000000000000000000000000', '#{DLYJ_081009_01}ÄÎÑ©Ø¼¹ÃÄï#{DLYJ_081009_02}', '806', '10', '1');
INSERT INTO `t_mail` VALUES ('768', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '807', '10', '1');
INSERT INTO `t_mail` VALUES ('769', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '808', '10', '1');
INSERT INTO `t_mail` VALUES ('770', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '809', '10', '1');
INSERT INTO `t_mail` VALUES ('771', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '810', '10', '1');
INSERT INTO `t_mail` VALUES ('772', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '811', '10', '1');
INSERT INTO `t_mail` VALUES ('773', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '812', '10', '1');
INSERT INTO `t_mail` VALUES ('774', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '813', '10', '1');
INSERT INTO `t_mail` VALUES ('775', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '814', '10', '1');
INSERT INTO `t_mail` VALUES ('776', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '815', '10', '1');
INSERT INTO `t_mail` VALUES ('777', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '816', '10', '1');
INSERT INTO `t_mail` VALUES ('778', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '817', '10', '1');
INSERT INTO `t_mail` VALUES ('779', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '818', '10', '1');
INSERT INTO `t_mail` VALUES ('780', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '819', '10', '1');
INSERT INTO `t_mail` VALUES ('781', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '820', '10', '1');
INSERT INTO `t_mail` VALUES ('782', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000554C58670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '821', '10', '1');
INSERT INTO `t_mail` VALUES ('783', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400160001000000904C58670000000000000000000000000000000000000000', '#{LevelMail_menpai_10}', '822', '10', '1');
INSERT INTO `t_mail` VALUES ('784', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000B64C58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '823', '10', '1');
INSERT INTO `t_mail` VALUES ('785', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '824', '10', '1');
INSERT INTO `t_mail` VALUES ('786', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '825', '10', '1');
INSERT INTO `t_mail` VALUES ('787', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '826', '10', '1');
INSERT INTO `t_mail` VALUES ('788', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '827', '10', '1');
INSERT INTO `t_mail` VALUES ('789', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '828', '10', '1');
INSERT INTO `t_mail` VALUES ('790', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '829', '10', '1');
INSERT INTO `t_mail` VALUES ('791', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '830', '10', '1');
INSERT INTO `t_mail` VALUES ('792', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '831', '10', '1');
INSERT INTO `t_mail` VALUES ('793', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '832', '10', '1');
INSERT INTO `t_mail` VALUES ('794', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '833', '10', '1');
INSERT INTO `t_mail` VALUES ('795', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '834', '10', '1');
INSERT INTO `t_mail` VALUES ('796', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '835', '10', '1');
INSERT INTO `t_mail` VALUES ('797', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '836', '10', '1');
INSERT INTO `t_mail` VALUES ('798', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '837', '10', '1');
INSERT INTO `t_mail` VALUES ('799', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '838', '10', '1');
INSERT INTO `t_mail` VALUES ('800', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '839', '10', '1');
INSERT INTO `t_mail` VALUES ('801', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '840', '10', '1');
INSERT INTO `t_mail` VALUES ('802', '', 'ÄÎÑ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000834C58670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '841', '10', '1');
INSERT INTO `t_mail` VALUES ('803', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400150001000000BA4C58670000000000000000000000000000000000000000', '#{LevelMail_menpai_4}', '842', '10', '1');
INSERT INTO `t_mail` VALUES ('804', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '843', '10', '1');
INSERT INTO `t_mail` VALUES ('805', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '844', '10', '1');
INSERT INTO `t_mail` VALUES ('806', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF08001100010000000C4D58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '845', '10', '1');
INSERT INTO `t_mail` VALUES ('807', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000424E58670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '785', '10', '1');
INSERT INTO `t_mail` VALUES ('808', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000424E58670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '786', '10', '1');
INSERT INTO `t_mail` VALUES ('809', '', 'ÂåÁ§Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001500010000008E5258670000000000000000000000000000000000000000', '#{LevelMail_menpai_4}', '847', '10', '1');
INSERT INTO `t_mail` VALUES ('810', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000045158670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '848', '10', '1');
INSERT INTO `t_mail` VALUES ('811', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000055158670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '849', '10', '1');
INSERT INTO `t_mail` VALUES ('812', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000414E58670000000000000000000000000000000000000000', '#{LevelMail_90_1}', '850', '10', '1');
INSERT INTO `t_mail` VALUES ('813', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000414E58670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '851', '10', '1');
INSERT INTO `t_mail` VALUES ('814', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000414E58670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '852', '10', '1');
INSERT INTO `t_mail` VALUES ('815', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000414E58670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '853', '10', '1');
INSERT INTO `t_mail` VALUES ('816', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000414E58670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '854', '10', '1');
INSERT INTO `t_mail` VALUES ('817', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000414E58670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '855', '10', '1');
INSERT INTO `t_mail` VALUES ('818', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000414E58670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '856', '10', '1');
INSERT INTO `t_mail` VALUES ('819', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000414E58670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '857', '10', '1');
INSERT INTO `t_mail` VALUES ('820', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000414E58670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '858', '10', '1');
INSERT INTO `t_mail` VALUES ('821', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000414E58670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '859', '10', '1');
INSERT INTO `t_mail` VALUES ('822', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000414E58670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '860', '10', '1');
INSERT INTO `t_mail` VALUES ('823', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000414E58670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '861', '10', '1');
INSERT INTO `t_mail` VALUES ('824', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000414E58670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '862', '10', '1');
INSERT INTO `t_mail` VALUES ('825', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000414E58670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '863', '10', '1');
INSERT INTO `t_mail` VALUES ('826', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000414E58670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '864', '10', '1');
INSERT INTO `t_mail` VALUES ('827', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000424E58670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '865', '10', '1');
INSERT INTO `t_mail` VALUES ('828', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000424E58670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '866', '10', '1');
INSERT INTO `t_mail` VALUES ('829', '', 'Ç§Ñ©¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000424E58670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '867', '10', '1');
INSERT INTO `t_mail` VALUES ('830', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '868', '10', '0');
INSERT INTO `t_mail` VALUES ('831', '', 'ÄÎÑ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000495F58670000000000000000000000000000000000000000', '#{MAIL_100305_01}', '869', '10', '1');
INSERT INTO `t_mail` VALUES ('832', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '870', '10', '1');
INSERT INTO `t_mail` VALUES ('833', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '871', '10', '1');
INSERT INTO `t_mail` VALUES ('834', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '872', '10', '1');
INSERT INTO `t_mail` VALUES ('835', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '873', '10', '1');
INSERT INTO `t_mail` VALUES ('836', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '874', '10', '1');
INSERT INTO `t_mail` VALUES ('837', '', '·¨Á¦ÎÞ±ß¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A003000010000001E4F58670000000000000000000000000000000000000000', '#{DLYJ_081009_01}·¨Á¦ÎÞ±ß¡£ÉÙÏÀ#{DLYJ_081009_02}', '875', '10', '1');
INSERT INTO `t_mail` VALUES ('838', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000405058670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '876', '10', '1');
INSERT INTO `t_mail` VALUES ('839', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000405058670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '877', '10', '1');
INSERT INTO `t_mail` VALUES ('840', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000405058670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '878', '10', '1');
INSERT INTO `t_mail` VALUES ('841', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_90_1}', '879', '10', '1');
INSERT INTO `t_mail` VALUES ('842', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '880', '10', '1');
INSERT INTO `t_mail` VALUES ('843', '', 'ÄÎÑ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600150001000000FF6058670000000000000000000000000000000000000000', '#{LevelMail_menpai_8}', '881', '10', '1');
INSERT INTO `t_mail` VALUES ('844', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '882', '10', '1');
INSERT INTO `t_mail` VALUES ('845', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '883', '10', '1');
INSERT INTO `t_mail` VALUES ('846', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '884', '10', '1');
INSERT INTO `t_mail` VALUES ('847', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '885', '10', '1');
INSERT INTO `t_mail` VALUES ('848', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '886', '10', '1');
INSERT INTO `t_mail` VALUES ('849', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '887', '10', '1');
INSERT INTO `t_mail` VALUES ('850', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '888', '10', '1');
INSERT INTO `t_mail` VALUES ('851', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '889', '10', '1');
INSERT INTO `t_mail` VALUES ('852', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '890', '10', '1');
INSERT INTO `t_mail` VALUES ('853', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '891', '10', '1');
INSERT INTO `t_mail` VALUES ('854', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '892', '10', '1');
INSERT INTO `t_mail` VALUES ('855', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '893', '10', '1');
INSERT INTO `t_mail` VALUES ('856', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '894', '10', '1');
INSERT INTO `t_mail` VALUES ('857', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '895', '10', '1');
INSERT INTO `t_mail` VALUES ('858', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '896', '10', '1');
INSERT INTO `t_mail` VALUES ('859', '', 'ÈÎ×ã', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000ED4E58670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '897', '10', '1');
INSERT INTO `t_mail` VALUES ('860', '', '·¨Á¦ÎÞ±ß¡£', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000001E4F58670000000000000000000000000000000000000000', '#{MAIL_100305_01}', '898', '10', '1');
INSERT INTO `t_mail` VALUES ('861', '', '222', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0300110001000000965058670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '899', '10', '1');
INSERT INTO `t_mail` VALUES ('862', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000664F58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '900', '10', '1');
INSERT INTO `t_mail` VALUES ('863', '', '²Ô¼è', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000675158670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '901', '10', '1');
INSERT INTO `t_mail` VALUES ('864', '', 'ÏÄºîÎþ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000009C5158670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '921', '10', '1');
INSERT INTO `t_mail` VALUES ('865', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF08002A0001000000025858670000000000000000000000000000000000000000', '#{HJYK_201223_13**ÃÀÄ¿ÅÎÙâ*2025*1*9}', '922', '10', '1');
INSERT INTO `t_mail` VALUES ('866', '', '¡¢á°Éñ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600280001000000486158670000000000000000000000000000000000000000', '#{HJYK_201223_13**¡¢á°Éñ*2025*1*9}', '923', '10', '1');
INSERT INTO `t_mail` VALUES ('867', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000405058670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '924', '10', '1');
INSERT INTO `t_mail` VALUES ('868', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000405058670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '925', '10', '1');
INSERT INTO `t_mail` VALUES ('869', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000405058670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '926', '10', '1');
INSERT INTO `t_mail` VALUES ('870', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000405058670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '927', '10', '1');
INSERT INTO `t_mail` VALUES ('871', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000405058670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '928', '10', '1');
INSERT INTO `t_mail` VALUES ('872', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000405058670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '929', '10', '1');
INSERT INTO `t_mail` VALUES ('873', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000405058670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '930', '10', '1');
INSERT INTO `t_mail` VALUES ('874', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000405058670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '931', '10', '1');
INSERT INTO `t_mail` VALUES ('875', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000405058670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '932', '10', '1');
INSERT INTO `t_mail` VALUES ('876', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000405058670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '933', '10', '1');
INSERT INTO `t_mail` VALUES ('877', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000405058670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '934', '10', '1');
INSERT INTO `t_mail` VALUES ('878', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000405058670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '935', '10', '1');
INSERT INTO `t_mail` VALUES ('879', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000405058670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '936', '10', '1');
INSERT INTO `t_mail` VALUES ('880', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000405058670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '937', '10', '1');
INSERT INTO `t_mail` VALUES ('881', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000405058670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '938', '10', '1');
INSERT INTO `t_mail` VALUES ('882', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600150001000000065858670000000000000000000000000000000000000000', '#{LevelMail_menpai_9}', '939', '10', '1');
INSERT INTO `t_mail` VALUES ('883', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '940', '10', '1');
INSERT INTO `t_mail` VALUES ('884', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000417E58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '941', '10', '1');
INSERT INTO `t_mail` VALUES ('885', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '942', '10', '0');
INSERT INTO `t_mail` VALUES ('886', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '943', '10', '0');
INSERT INTO `t_mail` VALUES ('887', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '944', '10', '1');
INSERT INTO `t_mail` VALUES ('888', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '945', '10', '1');
INSERT INTO `t_mail` VALUES ('889', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '946', '10', '1');
INSERT INTO `t_mail` VALUES ('890', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '947', '10', '1');
INSERT INTO `t_mail` VALUES ('891', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '948', '10', '1');
INSERT INTO `t_mail` VALUES ('892', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '949', '10', '1');
INSERT INTO `t_mail` VALUES ('893', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '950', '10', '1');
INSERT INTO `t_mail` VALUES ('894', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '951', '10', '1');
INSERT INTO `t_mail` VALUES ('895', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '952', '10', '1');
INSERT INTO `t_mail` VALUES ('896', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '953', '10', '1');
INSERT INTO `t_mail` VALUES ('897', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '954', '10', '1');
INSERT INTO `t_mail` VALUES ('898', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000B45058670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '955', '10', '1');
INSERT INTO `t_mail` VALUES ('899', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF08002A0001000000485858670000000000000000000000000000000000000000', '#{HJYK_201223_13**ÇÉÐ¦Ù»Ùâ*2025*1*9}', '956', '10', '1');
INSERT INTO `t_mail` VALUES ('900', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '957', '10', '1');
INSERT INTO `t_mail` VALUES ('901', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '958', '10', '1');
INSERT INTO `t_mail` VALUES ('902', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '959', '10', '1');
INSERT INTO `t_mail` VALUES ('903', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '960', '10', '1');
INSERT INTO `t_mail` VALUES ('904', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '961', '10', '1');
INSERT INTO `t_mail` VALUES ('905', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '962', '10', '1');
INSERT INTO `t_mail` VALUES ('906', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '963', '10', '1');
INSERT INTO `t_mail` VALUES ('907', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '964', '10', '1');
INSERT INTO `t_mail` VALUES ('908', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '965', '10', '1');
INSERT INTO `t_mail` VALUES ('909', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '966', '10', '1');
INSERT INTO `t_mail` VALUES ('910', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '967', '10', '1');
INSERT INTO `t_mail` VALUES ('911', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '968', '10', '1');
INSERT INTO `t_mail` VALUES ('912', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '969', '10', '1');
INSERT INTO `t_mail` VALUES ('913', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '970', '10', '1');
INSERT INTO `t_mail` VALUES ('914', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '971', '10', '1');
INSERT INTO `t_mail` VALUES ('915', '', 'ÌÒÖ®Ø²Ø²', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000FE5058670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '972', '10', '1');
INSERT INTO `t_mail` VALUES ('916', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '973', '10', '0');
INSERT INTO `t_mail` VALUES ('917', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000045158670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '974', '10', '1');
INSERT INTO `t_mail` VALUES ('918', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000045158670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '975', '10', '1');
INSERT INTO `t_mail` VALUES ('919', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000045158670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '976', '10', '1');
INSERT INTO `t_mail` VALUES ('920', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000045158670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '977', '10', '1');
INSERT INTO `t_mail` VALUES ('921', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000045158670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '978', '10', '1');
INSERT INTO `t_mail` VALUES ('922', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000045158670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '979', '10', '1');
INSERT INTO `t_mail` VALUES ('923', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000045158670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '980', '10', '1');
INSERT INTO `t_mail` VALUES ('924', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000045158670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '981', '10', '1');
INSERT INTO `t_mail` VALUES ('925', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000045158670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '982', '10', '1');
INSERT INTO `t_mail` VALUES ('926', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000045158670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '983', '10', '1');
INSERT INTO `t_mail` VALUES ('927', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000045158670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '984', '10', '1');
INSERT INTO `t_mail` VALUES ('928', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000045158670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '985', '10', '1');
INSERT INTO `t_mail` VALUES ('929', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000045158670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '986', '10', '1');
INSERT INTO `t_mail` VALUES ('930', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000045158670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '987', '10', '1');
INSERT INTO `t_mail` VALUES ('931', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000045158670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '988', '10', '1');
INSERT INTO `t_mail` VALUES ('932', '', 'ÇÉÐ¦Ù»Ùâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000045158670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '989', '10', '1');
INSERT INTO `t_mail` VALUES ('933', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '994', '10', '0');
INSERT INTO `t_mail` VALUES ('934', '', '°²Éá', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF04001100010000007D5258670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '1013', '10', '1');
INSERT INTO `t_mail` VALUES ('935', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '1014', '10', '0');
INSERT INTO `t_mail` VALUES ('936', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000025358670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '1015', '10', '1');
INSERT INTO `t_mail` VALUES ('937', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '1016', '10', '1');
INSERT INTO `t_mail` VALUES ('938', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000025358670000000000000000000000000000000000000000', '#{LevelMail_90_1}', '1017', '10', '1');
INSERT INTO `t_mail` VALUES ('939', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000025358670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '1018', '10', '1');
INSERT INTO `t_mail` VALUES ('940', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000025358670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '1019', '10', '1');
INSERT INTO `t_mail` VALUES ('941', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000025358670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '1020', '10', '1');
INSERT INTO `t_mail` VALUES ('942', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000025358670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '1021', '10', '1');
INSERT INTO `t_mail` VALUES ('943', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000025358670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '1022', '10', '1');
INSERT INTO `t_mail` VALUES ('944', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000025358670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '1023', '10', '1');
INSERT INTO `t_mail` VALUES ('945', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000025358670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '1024', '10', '1');
INSERT INTO `t_mail` VALUES ('946', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000025358670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '1025', '10', '1');
INSERT INTO `t_mail` VALUES ('947', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400110001000000025358670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '1026', '10', '1');
INSERT INTO `t_mail` VALUES ('948', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000025358670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '1027', '10', '1');
INSERT INTO `t_mail` VALUES ('949', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000025358670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '1028', '10', '1');
INSERT INTO `t_mail` VALUES ('950', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000025358670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '1029', '10', '1');
INSERT INTO `t_mail` VALUES ('951', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000025358670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '1030', '10', '1');
INSERT INTO `t_mail` VALUES ('952', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000025358670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '1031', '10', '1');
INSERT INTO `t_mail` VALUES ('953', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000025358670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '1032', '10', '1');
INSERT INTO `t_mail` VALUES ('954', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000025358670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '1033', '10', '1');
INSERT INTO `t_mail` VALUES ('955', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000025358670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '1034', '10', '1');
INSERT INTO `t_mail` VALUES ('956', '', 'Â¬¸¾', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0400120001000000025358670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '1035', '10', '1');
INSERT INTO `t_mail` VALUES ('957', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '993', '10', '0');
INSERT INTO `t_mail` VALUES ('958', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF08002A0001000000F05758670000000000000000000000000000000000000000', '#{HJYK_201223_13**É½ÓÐ·öËÕ*2025*1*9}', '1036', '10', '1');
INSERT INTO `t_mail` VALUES ('959', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF08002A00010000002A5858670000000000000000000000000000000000000000', '#{HJYK_201223_13**×Æ×ÆÆä»ª*2025*1*9}', '1037', '10', '1');
INSERT INTO `t_mail` VALUES ('960', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '1038', '10', '1');
INSERT INTO `t_mail` VALUES ('961', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '1039', '10', '1');
INSERT INTO `t_mail` VALUES ('962', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '1040', '10', '1');
INSERT INTO `t_mail` VALUES ('963', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '1041', '10', '1');
INSERT INTO `t_mail` VALUES ('964', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '1042', '10', '1');
INSERT INTO `t_mail` VALUES ('965', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '1043', '10', '1');
INSERT INTO `t_mail` VALUES ('966', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '1044', '10', '1');
INSERT INTO `t_mail` VALUES ('967', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '1045', '10', '1');
INSERT INTO `t_mail` VALUES ('968', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001100010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '1046', '10', '1');
INSERT INTO `t_mail` VALUES ('969', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '1047', '10', '1');
INSERT INTO `t_mail` VALUES ('970', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '1048', '10', '1');
INSERT INTO `t_mail` VALUES ('971', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '1049', '10', '1');
INSERT INTO `t_mail` VALUES ('972', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '1050', '10', '1');
INSERT INTO `t_mail` VALUES ('973', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '1051', '10', '1');
INSERT INTO `t_mail` VALUES ('974', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '1052', '10', '1');
INSERT INTO `t_mail` VALUES ('975', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '1053', '10', '1');
INSERT INTO `t_mail` VALUES ('976', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '1054', '10', '1');
INSERT INTO `t_mail` VALUES ('977', '', 'ÂåÉñØ¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF06001200010000004B5758670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '1055', '10', '1');
INSERT INTO `t_mail` VALUES ('978', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '1056', '10', '0');
INSERT INTO `t_mail` VALUES ('979', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '1057', '10', '0');
INSERT INTO `t_mail` VALUES ('980', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '1059', '10', '0');
INSERT INTO `t_mail` VALUES ('981', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '1060', '10', '1');
INSERT INTO `t_mail` VALUES ('982', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600150001000000005C58670000000000000000000000000000000000000000', '#{LevelMail_menpai_8}', '1061', '10', '1');
INSERT INTO `t_mail` VALUES ('983', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '1062', '10', '0');
INSERT INTO `t_mail` VALUES ('984', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '1063', '10', '1');
INSERT INTO `t_mail` VALUES ('985', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '1064', '10', '1');
INSERT INTO `t_mail` VALUES ('986', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '1065', '10', '1');
INSERT INTO `t_mail` VALUES ('987', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '1066', '10', '1');
INSERT INTO `t_mail` VALUES ('988', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '1067', '10', '1');
INSERT INTO `t_mail` VALUES ('989', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '1068', '10', '1');
INSERT INTO `t_mail` VALUES ('990', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '1069', '10', '1');
INSERT INTO `t_mail` VALUES ('991', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '1070', '10', '1');
INSERT INTO `t_mail` VALUES ('992', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '1071', '10', '1');
INSERT INTO `t_mail` VALUES ('993', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '1072', '10', '1');
INSERT INTO `t_mail` VALUES ('994', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '1073', '10', '1');
INSERT INTO `t_mail` VALUES ('995', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '1074', '10', '1');
INSERT INTO `t_mail` VALUES ('996', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '1075', '10', '1');
INSERT INTO `t_mail` VALUES ('997', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '1076', '10', '1');
INSERT INTO `t_mail` VALUES ('998', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '1077', '10', '1');
INSERT INTO `t_mail` VALUES ('999', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '1078', '10', '1');
INSERT INTO `t_mail` VALUES ('1000', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '1079', '10', '1');
INSERT INTO `t_mail` VALUES ('1001', '', 'Ç§Ñ©Ø¼', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000CC5B58670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '1080', '10', '1');
INSERT INTO `t_mail` VALUES ('1002', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '120', '10', '0');
INSERT INTO `t_mail` VALUES ('1003', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '1093', '10', '0');
INSERT INTO `t_mail` VALUES ('1004', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000567958670000000000000000000000000000000000000000', '#{LevelMail_90_1}', '1094', '10', '1');
INSERT INTO `t_mail` VALUES ('1005', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000567958670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '1095', '10', '1');
INSERT INTO `t_mail` VALUES ('1006', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000567958670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '1096', '10', '1');
INSERT INTO `t_mail` VALUES ('1007', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000567958670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '1097', '10', '1');
INSERT INTO `t_mail` VALUES ('1008', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000567958670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '1098', '10', '1');
INSERT INTO `t_mail` VALUES ('1009', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000567958670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '1099', '10', '1');
INSERT INTO `t_mail` VALUES ('1010', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000567958670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '1100', '10', '1');
INSERT INTO `t_mail` VALUES ('1011', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000567958670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '1101', '10', '1');
INSERT INTO `t_mail` VALUES ('1012', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000567958670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '1102', '10', '1');
INSERT INTO `t_mail` VALUES ('1013', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600110001000000567958670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '1103', '10', '1');
INSERT INTO `t_mail` VALUES ('1014', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000567958670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '1104', '10', '1');
INSERT INTO `t_mail` VALUES ('1015', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000567958670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '1105', '10', '1');
INSERT INTO `t_mail` VALUES ('1016', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000567958670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '1106', '10', '1');
INSERT INTO `t_mail` VALUES ('1017', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000567958670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '1107', '10', '1');
INSERT INTO `t_mail` VALUES ('1018', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000567958670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '1108', '10', '1');
INSERT INTO `t_mail` VALUES ('1019', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000567958670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '1109', '10', '1');
INSERT INTO `t_mail` VALUES ('1020', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000567958670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '1110', '10', '1');
INSERT INTO `t_mail` VALUES ('1021', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000567958670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '1111', '10', '1');
INSERT INTO `t_mail` VALUES ('1022', '', 'ÍÛ¹þ¹þ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600120001000000567958670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '1112', '10', '1');
INSERT INTO `t_mail` VALUES ('1023', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '1113', '10', '0');
INSERT INTO `t_mail` VALUES ('1024', '', 'É½ÓÐ·öËÕ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF08001100010000003E7D58670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '1114', '10', '1');
INSERT INTO `t_mail` VALUES ('1025', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '1115', '10', '0');
INSERT INTO `t_mail` VALUES ('1026', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '1116', '10', '0');
INSERT INTO `t_mail` VALUES ('1027', '', '×Æ×ÆÆä»ª', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000207C58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '1117', '10', '1');
INSERT INTO `t_mail` VALUES ('1028', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_110_1}', '1118', '10', '1');
INSERT INTO `t_mail` VALUES ('1029', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '1119', '10', '1');
INSERT INTO `t_mail` VALUES ('1030', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '1120', '10', '0');
INSERT INTO `t_mail` VALUES ('1031', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '1121', '10', '1');
INSERT INTO `t_mail` VALUES ('1032', '', 'ÃÀÄ¿ÅÎÙâ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF08001100010000004FDE58670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '1122', '10', '1');
INSERT INTO `t_mail` VALUES ('1033', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_90_1}', '1123', '10', '1');
INSERT INTO `t_mail` VALUES ('1034', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '1124', '10', '1');
INSERT INTO `t_mail` VALUES ('1035', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '1125', '10', '1');
INSERT INTO `t_mail` VALUES ('1036', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '1126', '10', '1');
INSERT INTO `t_mail` VALUES ('1037', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '1127', '10', '1');
INSERT INTO `t_mail` VALUES ('1038', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '1128', '10', '1');
INSERT INTO `t_mail` VALUES ('1039', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '1129', '10', '1');
INSERT INTO `t_mail` VALUES ('1040', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '1130', '10', '1');
INSERT INTO `t_mail` VALUES ('1041', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '1131', '10', '1');
INSERT INTO `t_mail` VALUES ('1042', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00110001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '1132', '10', '1');
INSERT INTO `t_mail` VALUES ('1043', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '1133', '10', '1');
INSERT INTO `t_mail` VALUES ('1044', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '1134', '10', '1');
INSERT INTO `t_mail` VALUES ('1045', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '1135', '10', '1');
INSERT INTO `t_mail` VALUES ('1046', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '1136', '10', '1');
INSERT INTO `t_mail` VALUES ('1047', '', '¡¢²ýºÓ', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0600280001000000D87F58670000000000000000000000000000000000000000', '#{HJYK_201223_13**¡¢²ýºÓ*2025*1*9}', '1137', '10', '1');
INSERT INTO `t_mail` VALUES ('1048', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '1138', '10', '1');
INSERT INTO `t_mail` VALUES ('1049', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '1139', '10', '1');
INSERT INTO `t_mail` VALUES ('1050', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '1140', '10', '1');
INSERT INTO `t_mail` VALUES ('1051', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '1141', '10', '1');
INSERT INTO `t_mail` VALUES ('1052', '', 'ÖÁ¸ß·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A00120001000000F5D958670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '1142', '10', '1');
INSERT INTO `t_mail` VALUES ('1053', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_90_1}', '1143', '10', '1');
INSERT INTO `t_mail` VALUES ('1054', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_91_1}', '1144', '10', '1');
INSERT INTO `t_mail` VALUES ('1055', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '1145', '10', '1');
INSERT INTO `t_mail` VALUES ('1056', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '1146', '10', '1');
INSERT INTO `t_mail` VALUES ('1057', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '1147', '10', '1');
INSERT INTO `t_mail` VALUES ('1058', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '1148', '10', '1');
INSERT INTO `t_mail` VALUES ('1059', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '1149', '10', '1');
INSERT INTO `t_mail` VALUES ('1060', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '1150', '10', '1');
INSERT INTO `t_mail` VALUES ('1061', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '1151', '10', '1');
INSERT INTO `t_mail` VALUES ('1062', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001100010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '1152', '10', '1');
INSERT INTO `t_mail` VALUES ('1063', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '1153', '10', '1');
INSERT INTO `t_mail` VALUES ('1064', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '1154', '10', '1');
INSERT INTO `t_mail` VALUES ('1065', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '1155', '10', '1');
INSERT INTO `t_mail` VALUES ('1066', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '1156', '10', '1');
INSERT INTO `t_mail` VALUES ('1067', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '1157', '10', '1');
INSERT INTO `t_mail` VALUES ('1068', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '1158', '10', '1');
INSERT INTO `t_mail` VALUES ('1069', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '1159', '10', '1');
INSERT INTO `t_mail` VALUES ('1070', '', '·è¿ñ·¶ÌØÎ÷', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0A001200010000005FDD58670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '1160', '10', '1');
INSERT INTO `t_mail` VALUES ('1071', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_111_1}', '1161', '10', '1');
INSERT INTO `t_mail` VALUES ('1072', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF080011000100000037E458670000000000000000000000000000000000000000', '#{WGTJ_201222_55}', '1162', '10', '1');
INSERT INTO `t_mail` VALUES ('1073', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF080011000100000037E458670000000000000000000000000000000000000000', '#{SFYD_231227_01}', '1163', '10', '1');
INSERT INTO `t_mail` VALUES ('1074', '', '', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000', '', '1164', '10', '0');
INSERT INTO `t_mail` VALUES ('1075', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_92_1}', '1165', '10', '1');
INSERT INTO `t_mail` VALUES ('1076', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_93_1}', '1166', '10', '1');
INSERT INTO `t_mail` VALUES ('1077', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_94_1}', '1167', '10', '1');
INSERT INTO `t_mail` VALUES ('1078', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_95_1}', '1168', '10', '1');
INSERT INTO `t_mail` VALUES ('1079', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_96_1}', '1169', '10', '1');
INSERT INTO `t_mail` VALUES ('1080', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_97_1}', '1170', '10', '1');
INSERT INTO `t_mail` VALUES ('1081', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_98_1}', '1171', '10', '1');
INSERT INTO `t_mail` VALUES ('1082', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800110001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_99_1}', '1172', '10', '1');
INSERT INTO `t_mail` VALUES ('1083', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_100_1}', '1173', '10', '1');
INSERT INTO `t_mail` VALUES ('1084', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_102_1}', '1174', '10', '1');
INSERT INTO `t_mail` VALUES ('1085', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_103_1}', '1175', '10', '1');
INSERT INTO `t_mail` VALUES ('1086', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_104_1}', '1176', '10', '1');
INSERT INTO `t_mail` VALUES ('1087', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_105_1}', '1177', '10', '1');
INSERT INTO `t_mail` VALUES ('1088', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_106_1}', '1178', '10', '1');
INSERT INTO `t_mail` VALUES ('1089', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_107_1}', '1179', '10', '1');
INSERT INTO `t_mail` VALUES ('1090', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_108_1}', '1180', '10', '1');
INSERT INTO `t_mail` VALUES ('1091', '', '33332232', 'FFFFFFFF00000000FFFFFFFFFFFFFFFF0800120001000000F8E358670000000000000000000000000000000000000000', '#{LevelMail_109_1}', '1181', '10', '1');

-- ----------------------------
-- Table structure for `t_mission`
-- ----------------------------
DROP TABLE IF EXISTS `t_mission`;
CREATE TABLE `t_mission` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `missionid` int NOT NULL,
  `scriptid` int NOT NULL,
  `flag` smallint NOT NULL,
  `p1` int NOT NULL,
  `p2` int NOT NULL,
  `p3` int NOT NULL,
  `p4` int NOT NULL,
  `p5` int NOT NULL,
  `p6` int NOT NULL,
  `p7` int NOT NULL,
  `p8` int NOT NULL,
  `dbversion` int DEFAULT '0',
  `isvalid` int DEFAULT '1',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_mi_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2499 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_mission
-- ----------------------------

-- ----------------------------
-- Table structure for `t_pet`
-- ----------------------------
DROP TABLE IF EXISTS `t_pet`;
CREATE TABLE `t_pet` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `hpetguid` int NOT NULL,
  `lpetguid` int NOT NULL,
  `dataxid` int NOT NULL,
  `petname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `petnick` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `level` int NOT NULL,
  `needlevel` int NOT NULL,
  `atttype` int NOT NULL,
  `aitype` int NOT NULL,
  `camp` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hp` int NOT NULL,
  `mp` int NOT NULL,
  `life` int NOT NULL,
  `pettype` smallint NOT NULL,
  `genera` smallint NOT NULL,
  `enjoy` smallint NOT NULL,
  `strper` int NOT NULL,
  `conper` int NOT NULL,
  `dexper` int NOT NULL,
  `sprper` int NOT NULL,
  `iprper` int NOT NULL,
  `gengu` int NOT NULL,
  `growrate` int NOT NULL,
  `repoint` int NOT NULL,
  `exp` int NOT NULL,
  `str` int NOT NULL,
  `con` int NOT NULL,
  `dex` int NOT NULL,
  `spr` int NOT NULL,
  `ipr` int NOT NULL,
  `skill` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dbversion` int DEFAULT '0',
  `flags` int DEFAULT NULL,
  `isvalid` int DEFAULT '1',
  `pwflag` int DEFAULT '0',
  `pclvl` int DEFAULT '0',
  `hspetguid` int DEFAULT '0',
  `lspetguid` int DEFAULT '0',
  `savvy` int DEFAULT '0',
  `title` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `curtitle` int NOT NULL DEFAULT '-1',
  `us_unlock_time` int NOT NULL DEFAULT '0',
  `us_reserve` int NOT NULL DEFAULT '0',
  `olddataxid` int NOT NULL,
  `fitvalue` int NOT NULL,
  `linxing` int NOT NULL,
  `dataversion` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_Pet_Charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_pet
-- ----------------------------

-- ----------------------------
-- Table structure for `t_pet_bank`
-- ----------------------------
DROP TABLE IF EXISTS `t_pet_bank`;
CREATE TABLE `t_pet_bank` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `hpetguid` int NOT NULL,
  `lpetguid` int NOT NULL,
  `dataxid` int NOT NULL,
  `petname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `petnick` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `level` int NOT NULL,
  `needlevel` int NOT NULL,
  `atttype` int NOT NULL,
  `aitype` int NOT NULL,
  `camp` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hp` int NOT NULL,
  `mp` int NOT NULL,
  `life` int NOT NULL,
  `pettype` smallint NOT NULL,
  `genera` smallint NOT NULL,
  `enjoy` smallint NOT NULL,
  `strper` int NOT NULL,
  `conper` int NOT NULL,
  `dexper` int NOT NULL,
  `sprper` int NOT NULL,
  `iprper` int NOT NULL,
  `gengu` int NOT NULL,
  `growrate` int NOT NULL,
  `repoint` int NOT NULL,
  `exp` int NOT NULL,
  `str` int NOT NULL,
  `con` int NOT NULL,
  `dex` int NOT NULL,
  `spr` int NOT NULL,
  `ipr` int NOT NULL,
  `skill` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dbversion` int DEFAULT '0',
  `flags` int DEFAULT NULL,
  `isvalid` int DEFAULT '1',
  `pwflag` int DEFAULT '0',
  `pclvl` int DEFAULT '0',
  `hspetguid` int DEFAULT '0',
  `lspetguid` int DEFAULT '0',
  `savvy` int DEFAULT '0',
  `title` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `curtitle` int NOT NULL DEFAULT '-1',
  `us_unlock_time` int NOT NULL DEFAULT '0',
  `us_reserve` int NOT NULL DEFAULT '0',
  `olddataxid` int NOT NULL,
  `fitvalue` int NOT NULL,
  `linxing` int NOT NULL,
  `dataversion` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_PetBank_Charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_pet_bank
-- ----------------------------

-- ----------------------------
-- Table structure for `t_pet_iteminfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_pet_iteminfo`;
CREATE TABLE `t_pet_iteminfo` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `hpetguid` int NOT NULL,
  `lpetguid` int NOT NULL,
  `guid` int NOT NULL,
  `world` int NOT NULL,
  `server` int NOT NULL,
  `itemtype` int NOT NULL,
  `pos` smallint NOT NULL,
  `p1` int NOT NULL,
  `p2` int NOT NULL,
  `p3` int NOT NULL,
  `p4` int NOT NULL,
  `p5` int NOT NULL,
  `p6` int NOT NULL,
  `p7` int NOT NULL,
  `p8` int NOT NULL,
  `p9` int NOT NULL,
  `p10` int NOT NULL,
  `p11` int NOT NULL,
  `p12` int NOT NULL,
  `p13` int NOT NULL,
  `p14` int NOT NULL,
  `p15` int DEFAULT '0',
  `p16` int DEFAULT '0',
  `p17` int DEFAULT '0',
  `p18` int DEFAULT NULL,
  `p19` int DEFAULT NULL,
  `p20` int DEFAULT NULL,
  `p21` int DEFAULT NULL,
  `creator` varchar(180) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `isvalid` smallint NOT NULL DEFAULT '1',
  `dbversion` int DEFAULT '0',
  `fixattr` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `var` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `visualid` int NOT NULL DEFAULT '0',
  `maxgemid` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE KEY `Index_it_petguid` (`charguid`,`hpetguid`,`lpetguid`,`pos`) USING BTREE,
  KEY `Index_it_itemguid` (`guid`,`world`,`server`) USING BTREE,
  KEY `Index_iteminfo_itemtype` (`itemtype`,`isvalid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_pet_iteminfo
-- ----------------------------

-- ----------------------------
-- Table structure for `t_petcreate`
-- ----------------------------
DROP TABLE IF EXISTS `t_petcreate`;
CREATE TABLE `t_petcreate` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `zoneworldid` int NOT NULL,
  `pindex` int NOT NULL,
  `pairdata` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isvalid` int NOT NULL,
  `dataversion` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_pcre_pindex` (`pindex`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_petcreate
-- ----------------------------
INSERT INTO `t_petcreate` VALUES ('1', '10', '0', '010000000CE1F505FFFFFFFFB1F9E4BFC1DCA1A4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000CE1F5054F0A57040000000000000000E3750000B8B2BAA3C1FABEFDB1A6B1A60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000005F000000FFFFFFFF04000000AE140000DD800100000064770700004C050000EA040000B8020000D00300000000000031080C409B00000076250000022A0000002F0000002B000000330000002F000000B602000001FFFFFFFF00D2020000019502000001FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00000000001B0500001B050000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF0000000000000000000000000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFFE37500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000CE1F50584E857040000000000000000E3750000B8B2BAA3C1FABEFDB1A6B1A60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000005F000000FFFFFFFF0100000000150000DD800100000064340700003A0500009B04000099020000A10300000000000031080C409B00000032320000022D0000002E0000002F0000003400000028000000B602000001D202000001D602000001FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF0004000000A4130000A4130000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF0000000000000000000000000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFFE37500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008586BE00000000000000000001000000', '1', '2');
INSERT INTO `t_petcreate` VALUES ('2', '10', '1', 'FF000000FFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF0000000000000000FF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF0000000000000000000000000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF0000000000000000FF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFFFFFF00FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF00000000000000000000FFFF0000000000000000000000000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF00000000000000000000000000000000', '0', '2');

-- ----------------------------
-- Table structure for `t_pshop_new`
-- ----------------------------
DROP TABLE IF EXISTS `t_pshop_new`;
CREATE TABLE `t_pshop_new` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `sid` int NOT NULL,
  `zoneworldid` int NOT NULL,
  `poolid` int NOT NULL,
  `shopguid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `shopindex` int NOT NULL,
  `type` int NOT NULL,
  `stat` int NOT NULL,
  `maxbmoney` int NOT NULL,
  `basemoney` int NOT NULL,
  `createtime` int NOT NULL,
  `shopname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `shopdesc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ownername` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ownerguid` int NOT NULL,
  `isopen` int NOT NULL,
  `sale` int NOT NULL,
  `saleprice` int NOT NULL,
  `saletype` int NOT NULL,
  `partner` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `recoder` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isvalid` int NOT NULL,
  `partnum` int NOT NULL,
  `subtype` int NOT NULL,
  `profit` int NOT NULL,
  `dataversion` int NOT NULL DEFAULT '0',
  `freeze` smallint NOT NULL DEFAULT '0',
  `lockstat` smallint NOT NULL,
  `unlocktime` int NOT NULL,
  `ownerlastlogtime` int NOT NULL,
  `buydesc` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `buyreserve` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_pshop_new_shopguid` (`shopguid`) USING BTREE,
  KEY `Index_pshop_new_sidpid` (`sid`,`poolid`) USING BTREE,
  KEY `Index_pshop_new_ownerguid` (`ownerguid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_pshop_new
-- ----------------------------

-- ----------------------------
-- Table structure for `t_pshop_stall`
-- ----------------------------
DROP TABLE IF EXISTS `t_pshop_stall`;
CREATE TABLE `t_pshop_stall` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `shopguid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stallid` int NOT NULL,
  `Box_Status` smallint NOT NULL,
  `Box_Type` smallint NOT NULL,
  `Box_VldNum` smallint NOT NULL,
  `Box_FstPage` int NOT NULL,
  `Buy_StlRsv` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE KEY `Index_pshop_stall_ShpStlIndex` (`shopguid`,`stallid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_pshop_stall
-- ----------------------------

-- ----------------------------
-- Table structure for `t_pshop_stall_buy`
-- ----------------------------
DROP TABLE IF EXISTS `t_pshop_stall_buy`;
CREATE TABLE `t_pshop_stall_buy` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `shopguid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stallid` int NOT NULL,
  `stallunitid` int NOT NULL,
  `Buy_ItemNum` int NOT NULL,
  `Buy_ItemIdx` int NOT NULL,
  `Buy_Price` int NOT NULL,
  `Buy_InStlNum` smallint NOT NULL,
  `Itm_charguid` int NOT NULL,
  `Itm_guid` int NOT NULL,
  `Itm_world` int NOT NULL,
  `Itm_server` int NOT NULL,
  `Itm_itemtype` int NOT NULL,
  `Itm_pos` smallint NOT NULL,
  `Itm_p1` int NOT NULL,
  `Itm_p2` int NOT NULL,
  `Itm_p3` int NOT NULL,
  `Itm_p4` int NOT NULL,
  `Itm_p5` int NOT NULL,
  `Itm_p6` int NOT NULL,
  `Itm_p7` int NOT NULL,
  `Itm_p8` int NOT NULL,
  `Itm_p9` int NOT NULL,
  `Itm_p10` int NOT NULL,
  `Itm_p11` int NOT NULL,
  `Itm_p12` int NOT NULL,
  `Itm_p13` int NOT NULL,
  `Itm_p14` int NOT NULL,
  `Itm_p15` int DEFAULT '0',
  `Itm_p16` int DEFAULT '0',
  `Itm_p17` int DEFAULT '0',
  `Itm_p18` int DEFAULT '0',
  `Itm_p19` int DEFAULT '0',
  `Itm_p20` int DEFAULT '0',
  `Itm_p21` int DEFAULT '0',
  `Itm_creator` varchar(180) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `Itm_isvalid` smallint NOT NULL DEFAULT '1',
  `Itm_dbversion` int DEFAULT '0',
  `Itm_fixattr` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Itm_var` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `Itm_visualid` int NOT NULL DEFAULT '0',
  `Itm_maxgemid` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE KEY `Index_pshop_stall_buy_ShpStlUntIndex` (`shopguid`,`stallid`,`stallunitid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_pshop_stall_buy
-- ----------------------------

-- ----------------------------
-- Table structure for `t_pshop_stall_itm`
-- ----------------------------
DROP TABLE IF EXISTS `t_pshop_stall_itm`;
CREATE TABLE `t_pshop_stall_itm` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `shopguid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stallid` int NOT NULL,
  `stallunitid` int NOT NULL,
  `Box_OnSale` smallint NOT NULL,
  `Box_Price` int NOT NULL,
  `Itm_charguid` int NOT NULL,
  `Itm_guid` int NOT NULL,
  `Itm_world` int NOT NULL,
  `Itm_server` int NOT NULL,
  `Itm_itemtype` int NOT NULL,
  `Itm_pos` smallint NOT NULL,
  `Itm_p1` int NOT NULL,
  `Itm_p2` int NOT NULL,
  `Itm_p3` int NOT NULL,
  `Itm_p4` int NOT NULL,
  `Itm_p5` int NOT NULL,
  `Itm_p6` int NOT NULL,
  `Itm_p7` int NOT NULL,
  `Itm_p8` int NOT NULL,
  `Itm_p9` int NOT NULL,
  `Itm_p10` int NOT NULL,
  `Itm_p11` int NOT NULL,
  `Itm_p12` int NOT NULL,
  `Itm_p13` int NOT NULL,
  `Itm_p14` int NOT NULL,
  `Itm_p15` int DEFAULT '0',
  `Itm_p16` int DEFAULT '0',
  `Itm_p17` int DEFAULT '0',
  `Itm_p18` int DEFAULT '0',
  `Itm_p19` int DEFAULT '0',
  `Itm_p20` int DEFAULT '0',
  `Itm_p21` int DEFAULT '0',
  `Itm_creator` varchar(180) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `Itm_isvalid` smallint NOT NULL DEFAULT '1',
  `Itm_dbversion` int DEFAULT '0',
  `Itm_fixattr` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Itm_var` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `Itm_visualid` int NOT NULL DEFAULT '0',
  `Itm_maxgemid` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE KEY `Index_pshop_stall_itm_ShpStlUntIndex` (`shopguid`,`stallid`,`stallunitid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_pshop_stall_itm
-- ----------------------------

-- ----------------------------
-- Table structure for `t_pshop_stall_pet`
-- ----------------------------
DROP TABLE IF EXISTS `t_pshop_stall_pet`;
CREATE TABLE `t_pshop_stall_pet` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `shopguid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stallid` int NOT NULL,
  `stallunitid` int NOT NULL,
  `Box_OnSale` smallint NOT NULL,
  `Box_Price` int NOT NULL,
  `Pet_charguid` int NOT NULL,
  `Pet_hpetguid` int NOT NULL,
  `Pet_lpetguid` int NOT NULL,
  `Pet_dataxid` int NOT NULL,
  `Pet_petname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Pet_petnick` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Pet_level` int NOT NULL,
  `Pet_needlevel` int NOT NULL,
  `Pet_atttype` int NOT NULL,
  `Pet_aitype` int NOT NULL,
  `Pet_camp` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Pet_hp` int NOT NULL,
  `Pet_mp` int NOT NULL,
  `Pet_life` int NOT NULL,
  `Pet_pettype` smallint NOT NULL,
  `Pet_genera` smallint NOT NULL,
  `Pet_enjoy` smallint NOT NULL,
  `Pet_strper` int NOT NULL,
  `Pet_conper` int NOT NULL,
  `Pet_dexper` int NOT NULL,
  `Pet_sprper` int NOT NULL,
  `Pet_iprper` int NOT NULL,
  `Pet_gengu` int NOT NULL,
  `Pet_growrate` int NOT NULL,
  `Pet_repoint` int NOT NULL,
  `Pet_exp` int NOT NULL,
  `Pet_str` int NOT NULL,
  `Pet_con` int NOT NULL,
  `Pet_dex` int NOT NULL,
  `Pet_spr` int NOT NULL,
  `Pet_ipr` int NOT NULL,
  `Pet_skill` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Pet_dbversion` int DEFAULT '0',
  `Pet_flags` int DEFAULT NULL,
  `Pet_isvalid` int DEFAULT '1',
  `Pet_pwflag` int DEFAULT '0',
  `Pet_pclvl` int DEFAULT '0',
  `Pet_hspetguid` int DEFAULT '0',
  `Pet_lspetguid` int DEFAULT '0',
  `Pet_savvy` int DEFAULT '0',
  `Pet_title` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `Pet_curtitle` int NOT NULL DEFAULT '-1',
  `Pet_us_unlock_time` int NOT NULL DEFAULT '0',
  `Pet_us_reserve` int NOT NULL DEFAULT '0',
  `Pet_olddataxid` int NOT NULL,
  `Pet_fitvalue` int NOT NULL,
  `Pet_linxing` int NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE KEY `Index_pshop_stall_pet_ShpStlUntIndex` (`shopguid`,`stallid`,`stallunitid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_pshop_stall_pet
-- ----------------------------

-- ----------------------------
-- Table structure for `t_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_relation`;
CREATE TABLE `t_relation` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `fguid` int NOT NULL,
  `fname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fpoint` int NOT NULL,
  `reflag` smallint NOT NULL,
  `groupid` smallint NOT NULL,
  `extdata` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `trusttime` int NOT NULL,
  `remark` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `onlinenotice` smallint NOT NULL,
  `dbversion` int DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_re_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `t_seckill`
-- ----------------------------
DROP TABLE IF EXISTS `t_seckill`;
CREATE TABLE `t_seckill` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `sectkillnum` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `sectdropitem` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `insectkill` smallint DEFAULT '0',
  `fubenid` smallint DEFAULT '0',
  `bossidx` smallint DEFAULT '0',
  `doubleexp` smallint DEFAULT '0',
  `moneysweep` smallint DEFAULT '0',
  `jinbidaibi` int DEFAULT '0',
  `yinbidaibi` int DEFAULT '0',
  `dbversion` int DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_sect_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_seckill
-- ----------------------------

-- ----------------------------
-- Table structure for `t_shengwang`
-- ----------------------------
DROP TABLE IF EXISTS `t_shengwang`;
CREATE TABLE `t_shengwang` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `swid` int NOT NULL,
  `swpoint` int NOT NULL,
  `mission_idx` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `mission_done` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `shop_week` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `shop_week_yb` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `dbversion` int DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_shengwang_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_shengwang
-- ----------------------------

-- ----------------------------
-- Table structure for `t_skill`
-- ----------------------------
DROP TABLE IF EXISTS `t_skill`;
CREATE TABLE `t_skill` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `skid` smallint NOT NULL,
  `sktime` int DEFAULT NULL,
  `dbversion` int DEFAULT '0',
  `isvalid` int DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_sk_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5470 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_skill
-- ----------------------------

-- ----------------------------
-- Table structure for `t_talent`
-- ----------------------------
DROP TABLE IF EXISTS `t_talent`;
CREATE TABLE `t_talent` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `sectid` smallint NOT NULL,
  `sectlvl` smallint NOT NULL,
  `dbversion` int DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_talent_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_talent
-- ----------------------------

-- ----------------------------
-- Table structure for `t_toplist`
-- ----------------------------
DROP TABLE IF EXISTS `t_toplist`;
CREATE TABLE `t_toplist` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `toplistid` int NOT NULL COMMENT '数据序号',
  `guid` int unsigned NOT NULL COMMENT '数据标识GUID',
  `charname` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '' COMMENT '角色名',
  `keyvalue` int NOT NULL COMMENT '数据值',
  `type` int NOT NULL COMMENT '榜类型',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `toplistIdIndex` (`toplistid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_toplist
-- ----------------------------

-- ----------------------------
-- Table structure for `t_var`
-- ----------------------------
DROP TABLE IF EXISTS `t_var`;
CREATE TABLE `t_var` (
  `worldid` int NOT NULL,
  `maxcharguid` int NOT NULL,
  PRIMARY KEY (`maxcharguid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_var
-- ----------------------------
INSERT INTO `t_var` VALUES ('10', '100000001');

-- ----------------------------
-- Table structure for `t_xfallexp`
-- ----------------------------
DROP TABLE IF EXISTS `t_xfallexp`;
CREATE TABLE `t_xfallexp` (
  `xflv` int NOT NULL,
  `id1all` int NOT NULL,
  `id2all` int NOT NULL,
  `id3all` int NOT NULL,
  `id4all` int NOT NULL,
  `id5all` int NOT NULL,
  `id6all` int NOT NULL,
  `id7all` int NOT NULL,
  PRIMARY KEY (`xflv`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_xfallexp
-- ----------------------------

-- ----------------------------
-- Table structure for `t_xinfa`
-- ----------------------------
DROP TABLE IF EXISTS `t_xinfa`;
CREATE TABLE `t_xinfa` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `xinfaid` smallint NOT NULL,
  `xinfalvl` smallint NOT NULL,
  `dbversion` int DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_xinfa_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=973 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_xinfa
-- ----------------------------

-- ----------------------------
-- Table structure for `t_xiulian`
-- ----------------------------
DROP TABLE IF EXISTS `t_xiulian`;
CREATE TABLE `t_xiulian` (
  `aid` bigint NOT NULL AUTO_INCREMENT,
  `charguid` int NOT NULL,
  `mifaid` smallint NOT NULL,
  `mifalvl` smallint NOT NULL,
  `mifajinjie` smallint NOT NULL,
  `dbversion` int DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `Index_xiulian_charguid` (`charguid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3323 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_xiulian
-- ----------------------------

-- ----------------------------
-- Procedure structure for `create_newchar`
-- ----------------------------
DROP PROCEDURE IF EXISTS `create_newchar`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `create_newchar`(pzoneworldid					int,
paccname              varchar(50) binary,
pcharname             varchar(50) binary,
psex                  smallint,
pcreatetime           int,
phaircolor            int,
phairmodel            int,
pfacecolor            int,
pfacemodel            int,
pheadid               int,
pdefeq                int)
begin
declare rguid      	  int default -1;
declare result		  int default -1;
declare rzoneworldid		  int default -1;
start transaction; 
 select charguid into rguid from t_char where charname=pcharname limit 1;
 if found_rows() = 0 then
  set rguid = -1;
  update t_var set maxcharguid=maxcharguid+1 where worldid=pzoneworldid;
  select maxcharguid,worldid into rguid,rzoneworldid from t_var where worldid=pzoneworldid limit 1 for update;
  
  if rguid <> -1 then
   insert into t_char(accname,charguid,zoneworldid,charname,title,pw,sex,level,enegry,outlook,scene,xpos,zpos,menpai,
    hp,mp,strikepoint,engpoint,str,con,dex,spr,ipr,points,logouttime,logintime,createtime,dbversion,haircolor,
    hairmodel,facecolor,facemodel,vmoney,settings,isvalid,exp,pres,
    shopinfo,carrypet,posspet,guldid,teamid,headid,erecover,vigor,maxvigor,vrecover,energymax,pwdeltime,
    pinfo,bkscene,bkxpos,bkzpos,titleinfo,dietime,bankmoney,bankend,cooldown,defeq,petposs,curpetdataid,power,headframeid,
		petbankend,whwg,fashionend,sect_type,sect_point,banendtime)
   values(paccname,rguid,rzoneworldid,pcharname,'','',psex,1,0,0,0,100,100,9,
    5000,5000,0,0,5,5,5,5,5,0,0,0,pcreatetime,0,phaircolor,
    phairmodel,pfacecolor,pfacemodel,0,'',1,0,'',
		'','','',-1,-1,pheadid,0,0,0,0,0,0,
		'',0,0,0,'',0,0,20,'',pdefeq,0,-1,100,1,2,'',2,-1,0,0);
   select row_count() into result;
  else
   set result = -3; 
  end if;
 else
   set result = -2;	
 end if;
commit;
select result,rguid,rzoneworldid;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `delete_char_fullof_world`
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_char_fullof_world`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `delete_char_fullof_world`(pguid_begin    int,
pguid_end      int)
begin

start transaction; 

delete FROM t_ability WHERE charguid >= pguid_begin and charguid <= pguid_end;
delete FROM t_char WHERE charguid >= pguid_begin and charguid <= pguid_end;
delete FROM t_charextra WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_chedifulu WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_di4shop WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_exterior WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_exterior_char WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_exterior_fashion WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_exterior_haircolor WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_exterior_ranse WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_exterior_weapon WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_exterior_ornaments WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_impact WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_iteminfo WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_mission WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_pet WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_pet_bank WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_pet_iteminfo WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_seckill WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_shengwang WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_skill WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_talent WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_xinfa WHERE charguid >= pguid_begin and charguid <= pguid_end; 
delete FROM t_xiulian WHERE charguid >= pguid_begin and charguid <= pguid_end; 

commit;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `delete_char_new`
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_char_new`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `delete_char_new`(pcharname             varchar(100),
paccount              varchar(100),
pcharguid             int,
pdeltime              int,
pcrc32                int)
begin
declare rcharguid   int;
declare rlevel      int;
declare rdeltime    int;
declare rnext       int;
declare rdbversion  int;
declare rcrc        int;
set     rcharguid = -1;
set     rnext = 0;
set     rdbversion = 0;
start transaction;
select charguid,level,deltime,crc32 into rcharguid,rlevel,rdeltime,rcrc from t_char
    where accname=paccount and charguid = pcharguid and isvalid=1;
if rcharguid<>-1 then
	if rlevel<1 then
          update t_char set isvalid = 0,charname = CONCAT(charname,'@DELETE_',pcharguid)
            where accname= paccount and charguid = pcharguid;
          select dbversion into rdbversion from t_char
            where accname= paccount and charguid = pcharguid;
          set rnext = 1;
    else 
       set rcrc = rcrc + pcrc32;
	   if rdeltime=0 then
            update t_char set deltime= pdeltime,crc32=rcrc where charguid= pcharguid;        
	   end if;
	end if;
end if;
commit;
    select rnext,rdbversion;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `fetch_savetime`
-- ----------------------------
DROP PROCEDURE IF EXISTS `fetch_savetime`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `fetch_savetime`(pcharguid	int)
begin
	declare 	visvalidtime 		 	int;
	declare 	vsavetime		 	int;
	declare 	vnowtime		 	 int;
    declare     vupdatetime          int;
	set 		vsavetime = -1;
	set 		vnowtime  = -1;
	set 		visvalidtime = 0;
 	start transaction;
	 select savetime into vsavetime from t_char where charguid = pcharguid;
	 if vsavetime = -1 then
		set  visvalidtime = 1;
	 else
          set vnowtime = time_to_sec(now());
	 	  if	abs(vsavetime-vnowtime)<300 then
	 	 	set  visvalidtime = 2;
		  else
	 	   
	 	  	update t_char set savetime = vnowtime where charguid = pcharguid;
	 	  	select savetime into vupdatetime from t_char where charguid = pcharguid;
	 	  	if vupdatetime = vnowtime then
	 	  		set visvalidtime = 3;
	 	  	else
	 	  	 	set visvalidtime = 4;
	 	  	end if;
	 	  end if;
	 end if;
  commit;
	select visvalidtime;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_50level_list`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_50level_list`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_50level_list`()
begin
 select accname,charguid,charname,menpai,level,exp 
 from t_char 
 where charname not like '%DELETE%'
 order by level desc, exp desc
 limit 50;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_50money_list`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_50money_list`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_50money_list`()
begin
 select a.accname,a.charguid,a.charname,a.menpai, 
  (a.vmoney+a.bankmoney+if(isnull(b.profit),0,b.profit)+if(isnull(c.sbmoney),0,c.sbmoney)) as totalmoney
 from t_char as a left join (t_pshop_new as b,t_charextra as c)
  on (a.charguid=b.ownerguid and a.charguid=c.charguid)
 where a.charname not like '%DELETE%'
 order by totalmoney desc 
 limit 50;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_50xinfa_list`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_50xinfa_list`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_50xinfa_list`()
begin
 drop table if exists tmp_xinfa;
 create temporary table tmp_xinfa
 (charguid int not null,
  totalexp bigint not null
 );
 
 insert into tmp_xinfa
 select a.charguid,sum(
  case mod(a.xinfaid,6)
   when 1 then b.id1all
   when 2 then b.id2all
   when 3 then b.id3all
   when 4 then b.id4all
   when 5 then b.id5all
   when 0 then b.id6all
   else b.id7all
  end
  ) as totalexp
 from t_xinfa as a left join t_xfallexp as b
  on a.xinfalvl=b.xflv
 where a.charguid in(
 select charguid from t_char where charname not like '%DELETE%'
 )
 group by a.charguid
 order by totalexp desc
 limit 50;
 
 select a.accname,b.charguid,a.charname,a.menpai,a.exp,b.totalexp
 from t_char as a,tmp_xinfa as b 
 where b.charguid=a.charguid
 order by b.totalexp desc, a.exp desc;
 
 drop table if exists tmp_xinfa;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_auction_itm`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_auction_itm`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_auction_itm`(pzoneworldid					int,
pPoolid            		int,
pItm_guid             int,
pItm_world            int,
pItm_server           int,
pItm_itemtype         int,
pItm_p1               int,
pItm_p2               int,
pItm_p3               int,
pItm_p4               int,
pItm_p5               int,
pItm_p6               int,
pItm_p7               int,
pItm_p8               int,
pItm_p9               int,
pItm_p10              int,
pItm_p11              int,
pItm_p12              int,
pItm_p13              int,
pItm_p14              int,
pItm_p15              int,
pItm_p16              int,
pItm_p17              int,
pItm_p18              int,
pItm_p19              int,
pItm_p20              int,
pItm_p21              int,
pItm_creator          varchar(180),
pItm_var              varchar(40),
pItm_fixattr					varchar(200),
pItm_visualid         int,
pItm_maxgemid         int)
begin
declare rpos	   int;
start transaction;
select poolid into rpos from t_auction_item where poolid = pPoolid and zoneworldid=pzoneworldid;
if rpos = pPoolid then
		update t_auction_item set  
                            Itm_guid=pItm_guid,
                            Itm_world=pItm_world,
                            Itm_server=pItm_server,
                            Itm_itemtype=pItm_itemtype,
                            Itm_p1=pItm_p1,
                            Itm_p2=pItm_p2,
                            Itm_p3=pItm_p3,
                            Itm_p4=pItm_p4,
                            Itm_p5=pItm_p5,
                            Itm_p6=pItm_p6,
                            Itm_p7=pItm_p7,
                            Itm_p8=pItm_p8,
                            Itm_p9=pItm_p9,
                            Itm_p10=pItm_p10,
                            Itm_p11=pItm_p11,
                            Itm_p12=pItm_p12,
                            Itm_p13=pItm_p13,
                            Itm_p14=pItm_p14,
                            Itm_p15=pItm_p15,
                            Itm_p16=pItm_p16,
                            Itm_p17=pItm_p17,
														Itm_p18=pItm_p18,
														Itm_p19=pItm_p19,
														Itm_p20=pItm_p20,
														Itm_p21=pItm_p21,
                            Itm_creator=pItm_creator,
                            Itm_var=pItm_var,
														Itm_fixattr=pItm_fixattr,
                            Itm_visualid=pItm_visualid,
                            Itm_maxgemid=pItm_maxgemid 
                            where poolid = pPoolid and zoneworldid=pzoneworldid;
else
		insert into t_auction_item(zoneworldid,
														 poolid,
                             Itm_guid,
                             Itm_world,
                             Itm_server,
                             Itm_itemtype,
                             Itm_p1,
                             Itm_p2,
                             Itm_p3,
                             Itm_p4,
                             Itm_p5,
                             Itm_p6,
                             Itm_p7,
                             Itm_p8,
                             Itm_p9,
                             Itm_p10,
                             Itm_p11,
                             Itm_p12,
                             Itm_p13,
                             Itm_p14,
                             Itm_p15,
                             Itm_p16,
                             Itm_p17,
														 Itm_p18,
														 Itm_p19,
														 Itm_p20,
														 Itm_p21,
                             Itm_creator,
                             Itm_var,
														 Itm_fixattr,
                             Itm_visualid,
                             Itm_maxgemid)    values
                            (pzoneworldid,
														 pPoolid,
                             pItm_guid,
                             pItm_world,
                             pItm_server,
                             pItm_itemtype,
                             pItm_p1,
                             pItm_p2,
                             pItm_p3,
                             pItm_p4,
                             pItm_p5,
                             pItm_p6,
                             pItm_p7,
                             pItm_p8,
                             pItm_p9,
                             pItm_p10,
                             pItm_p11,
                             pItm_p12,
                             pItm_p13,
                             pItm_p14,
                             pItm_p15,
                             pItm_p16,
                             pItm_p17,
														 pItm_p18,
														 pItm_p19,
														 pItm_p20,
														 pItm_p21,
                             pItm_creator,
                             pItm_var,
														 pItm_fixattr,
                             pItm_visualid,
                             pItm_maxgemid); 
end if;                      
commit;                      
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_auction_pet`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_auction_pet`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_auction_pet`(pzoneworldid					int,
pPoolid            		int,
pPet_hpetguid         int,
pPet_lpetguid         int,
pPet_dataxid          int,
pPet_petname          varchar(50),
pPet_petnick          varchar(50),
pPet_level            int,
pPet_needlevel        int,
pPet_atttype          int,
pPet_aitype           int,
pPet_camp             varchar(30),
pPet_hp               int,
pPet_mp               int,
pPet_life             int,
pPet_pettype          smallint,
pPet_genera           smallint,
pPet_enjoy            smallint,
pPet_strper           int,
pPet_conper           int,
pPet_dexper           int,
pPet_sprper           int,
pPet_iprper           int,
pPet_gengu            int,
pPet_growrate         int,
pPet_repoint          int,
pPet_exp              int,
pPet_str              int,
pPet_con              int,
pPet_dex              int,
pPet_spr              int,
pPet_ipr              int,
pPet_skill            varchar(200),
pPet_pwflag           int,
pPet_pclvl            int,
pPet_hspetguid        int,
pPet_lspetguid        int,
pPet_savvy            int,
pPet_title            varchar(200),
pPet_curtitle         int,
pPet_us_unlock_time   int,
pPet_us_reserve       int,
pPet_olddataxid       int,
pPet_fitvalue   			int,
pPet_linxing       		int)
begin
declare rpos	   int;
start transaction;
select poolid into rpos from t_auction_pet where poolid = pPoolid and zoneworldid=pzoneworldid;
if rpos = pPoolid then
		update t_auction_pet set     
                            Pet_hpetguid=pPet_hpetguid,      
                            Pet_lpetguid=pPet_lpetguid,      
                            Pet_dataxid=pPet_dataxid,       
                            Pet_petname=pPet_petname,       
                            Pet_petnick=pPet_petnick,       
                            Pet_level=pPet_level,         
                            Pet_needlevel=pPet_needlevel,     
                            Pet_atttype=pPet_atttype,       
                            Pet_aitype=pPet_aitype,        
                            Pet_camp=pPet_camp,          
                            Pet_hp=pPet_hp,            
                            Pet_mp=pPet_mp,            
                            Pet_life=pPet_life,          
                            Pet_pettype=pPet_pettype,       
                            Pet_genera=pPet_genera,        
                            Pet_enjoy=pPet_enjoy,         
                            Pet_strper=pPet_strper,        
                            Pet_conper=pPet_conper,        
                            Pet_dexper=pPet_dexper,        
                            Pet_sprper=pPet_sprper,        
                            Pet_iprper=pPet_iprper,        
                            Pet_gengu=pPet_gengu,         
                            Pet_growrate=pPet_growrate,      
                            Pet_repoint=pPet_repoint,       
                            Pet_exp=pPet_exp,           
                            Pet_str=pPet_str,           
                            Pet_con=pPet_con,           
                            Pet_dex=pPet_dex,           
                            Pet_spr=pPet_spr,           
                            Pet_ipr=pPet_ipr,           
                            Pet_skill=pPet_skill,         
                            Pet_pwflag=pPet_pwflag,        
                            Pet_pclvl=pPet_pclvl,         
                            Pet_hspetguid=pPet_hspetguid,     
                            Pet_lspetguid=pPet_lspetguid,     
                            Pet_savvy=pPet_savvy,         
                            Pet_title=pPet_title,         
                            Pet_curtitle=pPet_curtitle,      
                            Pet_us_unlock_time=pPet_us_unlock_time,
                            Pet_us_reserve=pPet_us_reserve,
													  Pet_olddataxid=pPet_olddataxid,      
                            Pet_fitvalue=pPet_fitvalue,	
														Pet_linxing=pPet_linxing
                            where poolid = pPoolid and zoneworldid=pzoneworldid;
else
		insert into t_auction_pet(zoneworldid,
														poolid,
                            Pet_hpetguid,
                            Pet_lpetguid,
                            Pet_dataxid,
                            Pet_petname,
                            Pet_petnick,
                            Pet_level,
                            Pet_needlevel,
                            Pet_atttype,
                            Pet_aitype,
                            Pet_camp,
                            Pet_hp,
                            Pet_mp,
                            Pet_life,
                            Pet_pettype,
                            Pet_genera,
                            Pet_enjoy,
                            Pet_strper,
                            Pet_conper,
                            Pet_dexper,
                            Pet_sprper,
                            Pet_iprper,
                            Pet_gengu,
                            Pet_growrate,
                            Pet_repoint,
                            Pet_exp,
                            Pet_str,
                            Pet_con,
                            Pet_dex,
                            Pet_spr,
                            Pet_ipr,
                            Pet_skill,
                            Pet_pwflag,
                            Pet_pclvl,
                            Pet_hspetguid,
                            Pet_lspetguid,
                            Pet_savvy,
                            Pet_title,
                            Pet_curtitle,
                            Pet_us_unlock_time,
                            Pet_us_reserve,
														Pet_olddataxid,
														Pet_fitvalue,
														Pet_linxing)    values
                            (pzoneworldid,
														 pPoolid,
                             pPet_hpetguid,
                             pPet_lpetguid,
                             pPet_dataxid,
                             pPet_petname,
                             pPet_petnick,
                             pPet_level,
                             pPet_needlevel,
                             pPet_atttype,
                             pPet_aitype,
                             pPet_camp,
                             pPet_hp,
                             pPet_mp,
                             pPet_life,
                             pPet_pettype,
                             pPet_genera,
                             pPet_enjoy,
                             pPet_strper,
                             pPet_conper,
                             pPet_dexper,
                             pPet_sprper,
                             pPet_iprper,
                             pPet_gengu,
                             pPet_growrate,
                             pPet_repoint,
                             pPet_exp,
                             pPet_str,
                             pPet_con,
                             pPet_dex,
                             pPet_spr,
                             pPet_ipr,
                             pPet_skill,
                             pPet_pwflag,
                             pPet_pclvl,
                             pPet_hspetguid,
                             pPet_lspetguid,
                             pPet_savvy,
                             pPet_title,
                             pPet_curtitle,
                             pPet_us_unlock_time,
                             pPet_us_reserve,
														 pPet_olddataxid,
														 pPet_fitvalue,
														 pPet_linxing); 
end if;                      
commit;                      
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_auction_unit`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_auction_unit`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_auction_unit`(pzoneworldid		  int,
ppoolid               int,
ptabletype			  int,
pcurstatus            int,
pprize                int,
pownername            varchar(50),
pownerguid            int,
pgtime                int,
pdtime                int)
begin
declare rindex int;
start transaction;
select poolid into rindex from t_auction where poolid=ppoolid and zoneworldid=pzoneworldid;
if rindex = ppoolid then
		update t_auction set  	curstatus=pcurstatus,
														tabletype=ptabletype,
														prize=pprize,
                            ownername=pownername,
                            ownerguid=pownerguid,
														gtime=pgtime,
                            dtime=pdtime 
                            where poolid=ppoolid and zoneworldid=pzoneworldid;
else
		insert into t_auction	 (zoneworldid,
														poolid,    
                            tabletype,  
														curstatus,
                            prize,  
                            ownername, 
                            ownerguid, 
                            gtime,
                            dtime)    values
                            (pzoneworldid,
														 ppoolid,    
                             ptabletype,  
														 pcurstatus,
                             pprize,  
                             pownername, 
                             pownerguid, 
                             pgtime,
                             pdtime); 
end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_charextra`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_charextra`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_charextra`(pcharguid           int,
pdbversion          int,
pbuyyuanbao         int,
pcostyuanbao				int,
pkmcount            int,
pcmcount            tinyint,
psbmoney            int unsigned,
psbunlock           int unsigned,
psbstatus           smallint,
pipregion           int,
ppetnumextra        tinyint,
pleagueid           int,
pmoneyjz            int,
pmycampaigncount    varchar(1024),
pweek_active 			  varchar(1024),
pmysterystore       varchar(1536),
ptjcpvp_shop 			  varchar(1024),
pfanli_shop         varchar(6400),
pfashion_auc        varchar(6400),
pibidentityid		    int,
pibpower			      int,
pdwbank             varchar(1024))
begin
	declare sameid  int;
    set sameid = -1;
    
    select charguid into sameid from t_charextra where charguid=pcharguid;
    if  sameid <> -1 then
        update t_charextra set
          dbversion=pdbversion,
          buyyuanbao=pbuyyuanbao,
					costyuanbao=pcostyuanbao,
          kmcount=pkmcount,
          cmcount=pcmcount,
          sbmoney=psbmoney,
          sbunlock=psbunlock,
          sbstatus=psbstatus,
          ipregion=pipregion,
          petnumextra=ppetnumextra,
          leagueid=pleagueid,
          moneyjz=pmoneyjz,
					mycamcount = pmycampaigncount,
					week_active = pweek_active,
					mysterystore = pmysterystore,
					tjcpvp_shop = ptjcpvp_shop,
					fanli_shop = pfanli_shop,
					fashion_auc = pfashion_auc,
					ibidentityid = pibidentityid,
					ibpower = pibpower,
          dwbank = pdwbank
        where charguid=pcharguid and dbversion<=pdbversion;
    else
        insert into t_charextra (
          charguid,
          dbversion,
          buyyuanbao,
					costyuanbao,
          kmcount,
          cmcount,
          sbmoney,
          sbunlock,
          sbstatus,
          ipregion,
          petnumextra,
          leagueid,
          moneyjz,
					mycamcount,
					week_active,
					mysterystore,
					tjcpvp_shop,
					fanli_shop,
					fashion_auc,
					ibidentityid,
					ibpower,
          dwbank)
        values (
          pcharguid,
          pdbversion,
          pbuyyuanbao,
					pcostyuanbao,
          pkmcount,
          pcmcount,
          psbmoney,
          psbunlock,
          psbstatus,
          pipregion,
          ppetnumextra,
          pleagueid,
          pmoneyjz,
					pmycampaigncount,
					pweek_active,
					pmysterystore,
					ptjcpvp_shop,
					pfanli_shop,
					pfashion_auc,
					pibidentityid,
					pibpower,
          pdwbank);
    end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_cityinfo_bld`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_cityinfo_bld`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_cityinfo_bld`(pzoneworldid int,
ppoolid int,
pbdtype int,
pbdid int,
pbdlevel smallint,
pri text,
pricontri text,
primaxnum text,
priprice text,
pritvalue text,
privalid text,
prinum smallint,
pisvalid int)
begin
declare existpos int default -1;
start transaction;
select bdtype into existpos from t_city_building where poolid=ppoolid and bdtype=pbdtype and zoneworldid=pzoneworldid;
if existpos = pbdtype then
	update t_city_building set
		bdid =pbdid,
		bdlevel =pbdlevel,
		ri =pri,
		ricontri =pricontri,
		rimaxnum =primaxnum,
		riprice =priprice,
		ritvalue =pritvalue,
		rivalid =privalid,
		rinum =prinum,
		isvalid =pisvalid
	where poolid=ppoolid and bdtype=pbdtype and zoneworldid=pzoneworldid;
else
	insert into t_city_building(
		zoneworldid,
		poolid,
		bdtype,
		bdid,
		bdlevel,
		ri,
		ricontri,
		rimaxnum,
		riprice,
		ritvalue,
		rivalid,
		rinum,
		isvalid
	)values(
		pzoneworldid,
		ppoolid,
		pbdtype,
		pbdid,
		pbdlevel,
		pri,
		pricontri,
		primaxnum,
		priprice,
		pritvalue,
		privalid,
		prinum,
		pisvalid
	);
end if;	
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_cityinfo_ext`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_cityinfo_ext`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_cityinfo_ext`(pzoneworldid int,
ppoolid int,
pfcityid1 int,
pfboth1 smallint,
pfcityid2 int,
pfboth2 smallint,
pfcityid3 int,
pfboth3 smallint,
pfcityid4 int,
pfboth4 smallint,
pfcityid5 int,
pfboth5 smallint,
pfcityid6 int,
pfboth6 smallint,
pfcityid7 int,
pfboth7 smallint,
pfcityid8 int,
pfboth8 smallint,
pfnum int,
pbtime1 int,
pbguild1 int,
pbguild2 int,
pbtime2 int,
pbguild3 int,
pbtime3 int,
pbnum int,
pisvalid int)
begin
declare existpos int default -1;
start transaction;
select poolid into existpos from t_city_info where poolid=ppoolid and zoneworldid=pzoneworldid;
if existpos = ppoolid then
	update t_city_info set
		fcityid1 =pfcityid1,
		fboth1   =pfboth1,
		fcityid2 =pfcityid2,
		fboth2   =pfboth2,
		fcityid3 =pfcityid3,
		fboth3   =pfboth3,
		fcityid4 =pfcityid4,
		fboth4   =pfboth4,
		fcityid5 =pfcityid5,
		fboth5   =pfboth5,
		fcityid6 =pfcityid6,
		fboth6   =pfboth6,
		fcityid7 =pfcityid7,
		fboth7   =pfboth7,
		fcityid8 =pfcityid8,
		fboth8   =pfboth8,
		fnum     =pfnum,
		btime1   =pbtime1,
		bguild1  =pbguild1,
		bguild2  =pbguild2,
		btime2   =pbtime2,
		bguild3  =pbguild3,
		btime3   =pbtime3,
		bnum     =pbnum,
		isvalid  =pisvalid
	where poolid=ppoolid and zoneworldid=pzoneworldid;
else
	insert into t_city_info(
		zoneworldid,
		poolid,
		fcityid1,
		fboth1,
		fcityid2,
		fboth2,
		fcityid3,
		fboth3,
		fcityid4,
		fboth4,
		fcityid5,
		fboth5,
		fcityid6,
		fboth6,
		fcityid7,
		fboth7,
		fcityid8,
		fboth8,
		fnum,
		btime1,
		bguild1,
		bguild2,
		btime2,
		bguild3,
		btime3,
		bnum,
		isvalid
	)values(
		pzoneworldid,
		ppoolid,
		pfcityid1,
		pfboth1,
		pfcityid2,
		pfboth2,
		pfcityid3,
		pfboth3,
		pfcityid4,
		pfboth4,
		pfcityid5,
		pfboth5,
		pfcityid6,
		pfboth6,
		pfcityid7,
		pfboth7,
		pfcityid8,
		pfboth8,
		pfnum,
		pbtime1,
		pbguild1,
		pbguild2,
		pbtime2,
		pbguild3,
		pbtime3,
		pbnum,
		pisvalid
	);
end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_cityinfo_new`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_cityinfo_new`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_cityinfo_new`(pzoneworldid		  int,
ppoolid	int,
pguildid	int,
pscene	int,
pcitylevel	smallint,
pcityname	varchar(30),
pcubprog	int,
pmxbprog    int,
pcusprog	int,
pmxsprog    int,
pcurupbld	int,
pmantain	smallint,
pindrate	int,
pargrate	int,
pcomrate	int,
pdefrate	int,
pscirate	int,
pextrate	int,
pleftpoint  int,
pcuspeifang	int,
pcusbld	int,
psmoney	int,
psmoneyfix	int,
pbmoney	int,
ppmoney	int,
pgmoneymax	int,
pfoundtime	int,
pisvalid	int)
begin
declare rcount int default -1;
start transaction;
select poolid into rcount from t_city_new where poolid=ppoolid and zoneworldid=pzoneworldid;
if rcount = ppoolid then
	update t_city_new set
		guildid =pguildid,
		scene =pscene,
		citylevel =pcitylevel,
		cityname =pcityname,
		cubprog =pcubprog,
        mxbprog =pmxbprog,
		cusprog =pcusprog,
        mxsprog =pmxsprog,
		curupbld =pcurupbld,
		mantain =pmantain,
		indrate =pindrate,
		argrate =pargrate,
		comrate =pcomrate,
		defrate =pdefrate,
		scirate =pscirate,
		extrate =pextrate,
        leftpoint =pleftpoint,
		cuspeifang =pcuspeifang,
		cusbld =pcusbld,
		smoney =psmoney,
		smoneyfix =psmoneyfix,
		bmoney =pbmoney,
		pmoney =ppmoney,
		gmoneymax =pgmoneymax,
		foundtime =pfoundtime,
		isvalid =pisvalid 
	where poolid=ppoolid and zoneworldid=pzoneworldid;
else
	insert into t_city_new(
		zoneworldid,
		poolid,
		guildid,
		scene,
		citylevel,
		cityname,
		cubprog,
        mxbprog,
		cusprog,
        mxsprog,
		curupbld,
		mantain,
		indrate,
		argrate,
		comrate,
		defrate,
		scirate,
		extrate,
        leftpoint,
		cuspeifang,
		cusbld,
		smoney,
		smoneyfix,
		bmoney,
		pmoney,
		gmoneymax,
		foundtime,
		isvalid
	)values(
		pzoneworldid,
		ppoolid,
		pguildid,
		pscene,
		pcitylevel,
		pcityname,
		pcubprog,
		pmxbprog,
		pcusprog,
		pmxsprog,
		pcurupbld,
		pmantain,
		pindrate,
		pargrate,
		pcomrate,
		pdefrate,
		pscirate,
		pextrate,
        pleftpoint,
		pcuspeifang,
		pcusbld,
		psmoney,
		psmoneyfix,
		pbmoney,
		ppmoney,
		pgmoneymax,
		pfoundtime,
		pisvalid
	);
end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_cshop`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_cshop`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_cshop`(pworldid            int,
pserverid           int,
ppoolid             int,
pcshopid            int)
begin
	declare sameid  int;
    set sameid = -1;
    
start transaction;
    select poolid into sameid from t_cshop 
    where worldid=pworldid and serverid=pserverid and poolid=ppoolid;
    if  sameid <> -1 then
        update t_cshop set cshopid=pcshopid,isvalid=1
        where worldid=pworldid and serverid=pserverid and poolid=ppoolid;
    else
        insert into t_cshop (worldid,serverid,poolid,isvalid,cshopid)
        values (pworldid,pserverid,ppoolid, 1, pcshopid);
    end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_cshopitem`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_cshopitem`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_cshopitem`(pcshopid            int,
pcshoppos           int,
pserial             int,
pcharguid           int,
pcharname           varchar(50) binary,
pgtype              smallint,
pgvalue             int,
psvalue             int,
pctime              int,
pcostctime          int)
begin
	declare sameid  int;
    declare samepos int;
    set sameid = -1;
    set samepos = -1;
start transaction;
    select cshopid,cshoppos into sameid,samepos 
    from t_cshopitem 
    where cshopid=pcshopid and cshoppos=pcshoppos;
    
    if  sameid <> -1 then
        update t_cshopitem
        set serial=pserial,charguid=pcharguid,charname=pcharname,
            gtype=pgtype,gvalue=pgvalue,svalue=psvalue,ctime=pctime,
            costctime=pcostctime,isvalid=1
        where cshopid=pcshopid and cshoppos=pcshoppos;
    else
        insert into t_cshopitem (cshopid,cshoppos,serial,charguid,charname,gtype,gvalue,svalue,ctime,costctime,isvalid) 
        values (pcshopid,pcshoppos,pserial,pcharguid,pcharname,pgtype,pgvalue,psvalue,pctime,pcostctime,1);
    end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_exterior_fashionitem`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_exterior_fashionitem`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_exterior_fashionitem`(pcharguid             int,
pguid                 int,
pworld                int,
pserver               int,
pitemtype             int,
ppos                  smallint,
pvisualid             int,
pmaxgemid             int,
pfixattr              varchar(100),
pp1                   int,
pp2                   int,
pp3                   int,
pp4                   int,
pp5                   int,
pp6                   int,
pp7                   int,
pp8                   int,
pp9                   int,
pp10                  int,
pp11                  int,
pp12                  int,
pp13                  int,
pp14                  int,
pp15                  int,
pp16                  int,
pp17                  int,
pp18                  int,
pp19                  int,
pp20                  int,
pp21                  int,
pisvalid              smallint,
pdbversion            int,
pcreator              varchar(180),
pvar                  varchar(40))
begin
declare rguid      int;
declare rpos	   int;
start transaction;
select charguid,pos into rguid,rpos from t_exterior_fashion
	where charguid = pcharguid and pos=ppos;
	if rguid = pcharguid then
	 update t_exterior_fashion set charguid = pcharguid,
		guid		 	= pguid,
		world		 	= pworld,
		server	 		= pserver,
		itemtype 		= pitemtype,
		pos			= ppos,
        visualid        = pvisualid,
        maxgemid        = pmaxgemid,
		fixattr	 		= pfixattr,
		p1			= pp1,
		p2			= pp2,
		p3			= pp3,
		p4			= pp4,
		p5			= pp5,
		p6			= pp6,
		p7			= pp7,
		p8			= pp8,
		p9			= pp9,
		p10			= pp10,
		p11			= pp11,
		p12			= pp12,
		p13			= pp13,
		p14			= pp14,
		p15			= pp15,
		p16			= pp16,
		p17			= pp17,
		p18     	= pp18,
		p19     	= pp19,
		p20     	= pp20,
		p21     	= pp21,
		isvalid  		= pisvalid,
		dbversion		= pdbversion,
		creator  		= pcreator,
		var			= pvar where
		charguid=pcharguid and pos=ppos and dbversion<=pdbversion;
      
      if row_count() > 0 then
        update t_exterior_fashion set isvalid=0 
        where guid=pguid and world=pworld and server=pserver and charguid<>pcharguid and pos<>ppos;
      end if;
	else
		insert into t_exterior_fashion(charguid,world,server,guid,itemtype,
		pos,visualid,maxgemid,fixattr,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,
		isvalid,dbversion,creator,var)
		values(pcharguid,pworld,pserver,pguid,pitemtype,ppos,pvisualid,pmaxgemid,
		pfixattr,pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8,pp9,pp10,
		pp11,pp12,pp13,pp14,pp15,pp16,pp17,pp18,pp19,pp20,pp21,pisvalid,pdbversion,pcreator,pvar);
	end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_fashion_auction_unit`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_fashion_auction_unit`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_fashion_auction_unit`(pbidindex					    int,
psection              int,
pgroupindex						int,
pitemid               int,
pitemnum              int,
pbaseprice            int,
pminadd               int,
pmaxadd               int,
pcurtopbid            int,
pcurtopworldid        int,
pcurtopguid           int,
pownername            varchar(50),
pcountdown          int)
begin
declare rindex int;
start transaction;
select bidindex into rindex from t_fashion_auction where bidindex=pbidindex;
if rindex = pbidindex then
		update t_fashion_auction set  	
                            bidindex=pbidindex,
														section=psection,
														groupindex=pgroupindex,
                            itemid=pitemid,
                            itemnum=pitemnum,
                            baseprice=pbaseprice,
                            minadd=pminadd,
                            maxadd=pmaxadd,
                            curtopbid=pcurtopbid,
                            curtopworldid=pcurtopworldid,
                            curtopguid=pcurtopguid,
                            ownername=pownername,
                            countdown=pcountdown  
                            where bidindex=pbidindex;
else
		insert into t_fashion_auction	 (bidindex,
														section,    
                            groupindex,  
														itemid,
                            itemnum,  
                            baseprice, 
                            minadd, 
                            maxadd,
                            curtopbid,
                            curtopworldid,
                            curtopguid,
                            ownername,
                            countdown)    values
                            (pbidindex,
														 psection,    
                             pgroupindex,  
														 pitemid,
                             pitemnum,  
                             pbaseprice, 
                             pminadd, 
                             pmaxadd,
                             pcurtopbid,
                             pcurtopworldid,
                             pcurtopguid,
                             pownername,
                             pcountdown); 
end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_findfriendad`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_findfriendad`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_findfriendad`(ppoolid	                      int,           
   pcharguid                      int unsigned,          
   ptype                          smallint,     
   pcharname                      varchar(50),  
   pcharlevel                     int unsigned,          
   pcharsex                       smallint,     
   pcharmenpai                    smallint,     
   pcharguildname                 varchar(50),  
   pcharismarried                 smallint,     
   psendtime                      int unsigned,          
   pannouncetext                  varchar(128), 
   pmessageboard                  varchar(4096),
   pisvalid                       int)
begin
	declare rcount                  int;
start transaction;
	select poolid into rcount from t_findfriendad where poolid = ppoolid;
	if rcount = ppoolid then
			update t_findfriendad set
				poolid	      =	ppoolid,	      
				charguid      =	pcharguid,     
				type          =	ptype,         
				charname      =	pcharname,     
				charlevel     =	pcharlevel,     
				charsex       =	pcharsex,       
				charmenpai    =	pcharmenpai,   
				charguildname =	pcharguildname,
				charismarried =	pcharismarried,
				sendtime      =	psendtime,     
				announcetext  =	pannouncetext, 
				messageboard  =	pmessageboard, 
				isvalid       =	pisvalid where poolid = ppoolid;
	else
			insert into t_findfriendad(
				poolid,	      
				charguid,     
				type,         
				charname,     
				charlevel,    
				charsex,      
				charmenpai,   
				charguildname,
				charismarried,
				sendtime,     
				announcetext, 
				messageboard, 
				isvalid ) values (
				ppoolid,	      
				pcharguid,     
				ptype,         
				pcharname,     
				pcharlevel,    
				pcharsex,      
				pcharmenpai,   
				pcharguildname,
				pcharismarried,
				psendtime,     
				pannouncetext, 
				pmessageboard, 
				pisvalid );
	end if;
	commit;
      
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_general_set`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_general_set`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_general_set`(psKey                 varchar(50),
pnVal                 int)
begin
declare _sKey varchar(50) default NULL;
start transaction;
select sKey into _sKey from t_general_set where sKey = psKey;
if _sKey = psKey then
		update t_general_set set sKey=psKey,
                             nVal=pnVal 
                             where  sKey = psKey;
else
		insert into t_general_set(sKey,       
                              nVal) values
                             (psKey,       
                              pnVal);
end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_global`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_global`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_global`(pzoneworldid				int,
ppoolid             int,
pdata1              int)
begin
	declare sameid  int;
    set sameid = -1;
    
    select poolid into sameid from t_global where poolid=ppoolid and zoneworldid=pzoneworldid;
    if  sameid <> -1 then
        update t_global set data1=pdata1 where poolid=ppoolid and zoneworldid=pzoneworldid;
    else
        insert into t_global (poolid,zoneworldid,data1) values (ppoolid, pzoneworldid,pdata1);
    end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_guild_user`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_guild_user`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_guild_user`(pzoneworldid  int,
pguildid      int,
ppos          int,
pcharguid     int,
pcharname     varchar(50),
pguildpos     smallint,
plastontime   int,
plevel        int,
pmenpai       smallint,
pcontri       int,
pmaxcoutri    int,
pjointime     int,
ppwcontri     int,
pcwcontri     int,
pguildpostime int,
pisvalid      int,
paccess       int,
pgptime       int,
plastdowntime int)
begin
declare existpos int default -1;
select pos into existpos from t_guild_user where guildid=pguildid and pos=ppos and zoneworldid=pzoneworldid;
if existpos=ppos then
	update t_guild_user set
		charguid     =pcharguid,    
		charname     =pcharname,    
		guildpos     =pguildpos,    
		lastontime   =plastontime,  
		level        =plevel,       
		menpai       =pmenpai,      
		contri       =pcontri,      
		maxcoutri    =pmaxcoutri,   
		jointime     =pjointime,    
		pwcontri     =ppwcontri,    
		cwcontri     =pcwcontri,    
		guildpostime =pguildpostime,
		isvalid      =pisvalid,
        access       =paccess,
        gptime       =pgptime,
        lastdowntime =plastdowntime
	where guildid=pguildid and pos=ppos and zoneworldid=pzoneworldid;
else
	insert into t_guild_user(
		zoneworldid,
		guildid,
		pos,
		charguid,
		charname,
		guildpos,
		lastontime,
		level,
		menpai,
		contri,
		maxcoutri,
		jointime,
		pwcontri,
		cwcontri,
		guildpostime,
		isvalid,
        access,
        gptime,
        lastdowntime
	)values(
		pzoneworldid,
		pguildid,
		ppos,
		pcharguid,
		pcharname,
		pguildpos,
		plastontime,
		plevel,
		pmenpai,
		pcontri,
		pmaxcoutri,
		pjointime,
		ppwcontri,
		pcwcontri,
		pguildpostime,
		pisvalid,
        paccess,
        pgptime,
        plastdowntime
	);
end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_guildinfo_new`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_guildinfo_new`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_guildinfo_new`(pzoneworldid  int,
pguildid      int,
pguilddesc    varchar(150),
pguildname    varchar(50),
pchiefname    varchar(50),
pcname        varchar(50),
pguildstat    smallint,
pglvl         int,
pchiefguid    int,
ppcount       int,
pucount       int,
pmucount      int,
pgpoint       int,
pguildmoney   int,
pcityid       int,
pctime        int,
plogevity     int,
pcontribu     int,
phonor        int,
pindlvl       int,
pagrlvl       int,
pcomlvl       int,
pdeflvl       int,
ptechlvl      int,
pambilvl      int,
padmin        text,
pfixucount    int,
psalarytime   int,
pgnameinfo    text,
pguildboom    text,
pleagueid     int,
plqltime      int,
pbattle_succ  int,
pbattle_fail  int,
pbattle_score int,
pbattle_kill  int,
pbattle_res   int,
pweek_suc0    int,
pweek_suc1    int,
pweek_suc2    int,
pweek_suc3    int,
pweek_fal0    int,
pweek_fal1    int,
pweek_fal2    int,
pweek_fal3    int,
pguildmsg     varchar(300),
pdataversion  int,
pisvalid      int)
begin
declare rcount int default -1;
start transaction;
select guildid into rcount from t_guild_new where guildid = pguildid and zoneworldid=pzoneworldid;
if rcount = pguildid then
	update t_guild_new set
		guilddesc    =pguilddesc,  
		guildname    =pguildname,  
		chiefname    =pchiefname,  
		cname        =pcname,
    guildstat    =pguildstat,      
		glvl         =pglvl,       
		chiefguid    =pchiefguid,  
		pcount       =ppcount,     
		ucount       =pucount,     
		mucount      =pmucount,
    gpoint       =pgpoint,    
		guildmoney   =pguildmoney, 
		cityid       =pcityid,     
		ctime        =pctime,      
		logevity     =plogevity,   
		contribu     =pcontribu,   
		honor        =phonor,      
		indlvl       =pindlvl,     
		agrlvl       =pagrlvl,     
		comlvl       =pcomlvl,     
		deflvl       =pdeflvl,     
		techlvl      =ptechlvl,    
		ambilvl      =pambilvl,
    admin        =padmin,    
		fixucount    =pfixucount,  
		salarytime   =psalarytime,
    gnameinfo    =pgnameinfo,
    guildboom    =pguildboom,
    leagueid     =pleagueid,
    lqltime      =plqltime,
    battle_succ  =pbattle_succ,
		battle_fail  =pbattle_fail,
		battle_score =pbattle_score,
    battle_kill  =pbattle_kill,
    battle_res   =pbattle_res,
		week_suc0    =pweek_suc0,
		week_suc1    =pweek_suc1,
    week_suc2    =pweek_suc2,
    week_suc3    =pweek_suc3,
		week_fal0    =pweek_fal0,
		week_fal1    =pweek_fal1,
    week_fal2    =pweek_fal2,
    week_fal3    =pweek_fal3,
		guildmsg     =pguildmsg,
		dataversion  =pdataversion,
		isvalid      =pisvalid
	where guildid	 =pguildid and zoneworldid=pzoneworldid;
else
	insert into t_guild_new(
		zoneworldid,
		guildid,
		guilddesc,
		guildname,
		chiefname,
		cname,
    guildstat,
		glvl,
		chiefguid,
		pcount,
		ucount,
		mucount,
    gpoint,
		guildmoney,
		cityid,
		ctime,
		logevity,
		contribu,
		honor,
		indlvl,
		agrlvl,
		comlvl,
		deflvl,
		techlvl,
		ambilvl,
    admin,
		fixucount,
		salarytime,
    gnameinfo,
    guildboom,
    leagueid, 
    lqltime,
    battle_succ,
    battle_fail,
    battle_score,
    battle_kill,
    battle_res,
		week_suc0,
		week_suc1,
    week_suc2,
    week_suc3,
		week_fal0,
		week_fal1,
    week_fal2,
    week_fal3,
		guildmsg,
		dataversion,
		isvalid
	)values(
		pzoneworldid,
		pguildid,
		pguilddesc,
		pguildname,
		pchiefname,
		pcname,
    pguildstat,
		pglvl,
		pchiefguid,
		ppcount,
		pucount,
		pmucount,
    pgpoint,
		pguildmoney,
		pcityid,
		pctime,
		plogevity,
		pcontribu,
		phonor,
		pindlvl,
		pagrlvl,
		pcomlvl,
		pdeflvl,
		ptechlvl,
		pambilvl,
    padmin,
		pfixucount,
		psalarytime,
    pgnameinfo,
    pguildboom,
    pleagueid,
    plqltime,
    pbattle_succ,
    pbattle_fail,
    pbattle_score,
    pbattle_kill,
    pbattle_res,
		pweek_suc0,
		pweek_suc1,
    pweek_suc2,
    pweek_suc3,
		pweek_fal0,
		pweek_fal1,
    pweek_fal2,
    pweek_fal3,
		pguildmsg,
		pdataversion,
		pisvalid
	);
end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_iteminfo`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_iteminfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_iteminfo`(pcharguid             int,
pguid                 int,
pworld                int,
pserver               int,
pitemtype             int,
ppos                  smallint,
pvisualid             int,
pmaxgemid             int,
pfixattr              varchar(100),
pp1                   int,
pp2                   int,
pp3                   int,
pp4                   int,
pp5                   int,
pp6                   int,
pp7                   int,
pp8                   int,
pp9                   int,
pp10                  int,
pp11                  int,
pp12                  int,
pp13                  int,
pp14                  int,
pp15                  int,
pp16                  int,
pp17                  int,
pp18                  int,
pp19                  int,
pp20                  int,
pp21                  int,
pisvalid              smallint,
pdbversion            int,
pcreator              varchar(180),
pvar                  varchar(40))
begin
declare rguid      int;
declare rpos	   int;
start transaction;
select charguid,pos into rguid,rpos from t_iteminfo
	where charguid = pcharguid and pos=ppos;
	if rguid = pcharguid then
	 update t_iteminfo set charguid = pcharguid,
		guid		 	= pguid,
		world		 	= pworld,
		server	 		= pserver,
		itemtype 		= pitemtype,
		pos			= ppos,
        visualid        = pvisualid,
        maxgemid        = pmaxgemid,
		fixattr	 		= pfixattr,
		p1			= pp1,
		p2			= pp2,
		p3			= pp3,
		p4			= pp4,
		p5			= pp5,
		p6			= pp6,
		p7			= pp7,
		p8			= pp8,
		p9			= pp9,
		p10			= pp10,
		p11			= pp11,
		p12			= pp12,
		p13			= pp13,
		p14			= pp14,
		p15			= pp15,
		p16			= pp16,
		p17			= pp17,
		p18     	= pp18,
		p19     	= pp19,
		p20     	= pp20,
		p21     	= pp21,
		isvalid  		= pisvalid,
		dbversion		= pdbversion,
		creator  		= pcreator,
		var			= pvar where
		charguid=pcharguid and pos=ppos and dbversion<=pdbversion;
      
      if row_count() > 0 then
        update t_iteminfo set isvalid=0 
        where guid=pguid and world=pworld and server=pserver and charguid<>pcharguid and pos<>ppos;
      end if;
	else
		insert into t_iteminfo(charguid,world,server,guid,itemtype,
		pos,visualid,maxgemid,fixattr,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,
		isvalid,dbversion,creator,var)
		values(pcharguid,pworld,pserver,pguid,pitemtype,ppos,pvisualid,pmaxgemid,
		pfixattr,pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8,pp9,pp10,
		pp11,pp12,pp13,pp14,pp15,pp16,pp17,pp18,pp19,pp20,pp21,pisvalid,pdbversion,pcreator,pvar);
	end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_league`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_league`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_league`(pzoneworldid	int,
pleagueid		int,
pleaguename	    varchar(40),
pleaguedesc	    varchar(80),
pcreatorname	varchar(50),
pchiefguid		int,
pchiefname		varchar(50),
pcreatetime	    int,
papplynum	int,
pisvalid        int)
begin
declare existpos int default -1;
select leagueid into existpos from t_league where leagueid=pleagueid and zoneworldid=pzoneworldid;
if existpos=pleagueid then
	update t_league set
        leaguename  =pleaguename ,
        leaguedesc  =pleaguedesc ,
        creatorname =pcreatorname,
        chiefguid   =pchiefguid  ,
        chiefname   =pchiefname  ,
        createtime  =pcreatetime ,
        applynum =papplynum,
        isvalid     =pisvalid
	where leagueid=pleagueid and zoneworldid=pzoneworldid;
else
	insert into t_league(
		zoneworldid,
		leagueid,
		leaguename,
		leaguedesc,
		creatorname,
		chiefguid,
		chiefname,
		createtime,
		applynum,
		isvalid
	)values(
		pzoneworldid,
		pleagueid,
		pleaguename,
		pleaguedesc,
		pcreatorname,
		pchiefguid,
		pchiefname,
		pcreatetime,
		papplynum,
		pisvalid
	);
end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_league_apply`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_league_apply`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_league_apply`(pzoneworldid	int,
pleagueid		int,
papplypos       int,
papplyguildid	int,
pisvalid        int)
begin
declare existpos int default -1;
select papplypos into existpos from t_league_apply where leagueid=pleagueid and applypos=papplypos and zoneworldid=pzoneworldid;
if existpos=papplypos then
	update t_league_apply set
        applyguildid = papplyguildid,
        isvalid     =pisvalid
	where leagueid=pleagueid and applypos=papplypos and zoneworldid=pzoneworldid;
else
	insert into t_league_apply(
		zoneworldid,
		leagueid,
        applypos,
        applyguildid,
		isvalid
	)values(
		pzoneworldid,
		pleagueid,
        papplypos,
        papplyguildid,
		pisvalid
	);
end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_league_usr`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_league_usr`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_league_usr`(pzoneworldid	int,
pleagueid		int,
pguildpos       int,
pguildid        int,
pjointime       int,
pisvalid        int)
begin
declare existpos int default -1;
select pguildpos into existpos from t_league_usr where leagueid=pleagueid and guildpos=pguildpos and zoneworldid=pzoneworldid;
if existpos=pguildpos then
	update t_league_usr set
        guildid     =pguildid,
        jointime    =pjointime,
        isvalid     =pisvalid
	where leagueid=pleagueid and guildpos=pguildpos and zoneworldid=pzoneworldid;
else
	insert into t_league_usr(
		zoneworldid,
		leagueid,
        guildpos,
        guildid,
        jointime,
		isvalid
	)values(
		pzoneworldid,
		pleagueid,
        pguildpos,
        pguildid,
        pjointime,
		pisvalid
	);
end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_mailinfo`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_mailinfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_mailinfo`(p1 varchar(50),p2 varchar(50),p3 varchar(100),p4 varchar(300),p5 int,pzoneworldid int,p6 int)
begin
declare rcount int;
start transaction;
select pindex into rcount from t_mail where pindex = p5 and zoneworldid=pzoneworldid;
if rcount = p5 then
		update t_mail set sender=p1,recer=p2,mailinfo=p3,
        	mailcont=p4,isvalid=p6 where pindex=p5 and zoneworldid=pzoneworldid;
else
		insert into t_mail(pindex,sender,recer,mailinfo,mailcont,zoneworldid,isvalid)
		  values(p5,p1,p2,p3,p4,pzoneworldid,p6);
end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_petequipiteminfo`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_petequipiteminfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_petequipiteminfo`(pcharguid             int,
phguid                int,
plguid                int,
pguid                 int,
pworld                int,
pserver               int,
pitemtype             int,
ppos                  smallint,
pvisualid             int,
pmaxgemid             int,
pfixattr              varchar(100),
pp1                   int,
pp2                   int,
pp3                   int,
pp4                   int,
pp5                   int,
pp6                   int,
pp7                   int,
pp8                   int,
pp9                   int,
pp10                  int,
pp11                  int,
pp12                  int,
pp13                  int,
pp14                  int,
pp15                  int,
pp16                  int,
pp17                  int,
pp18                  int,
pp19                  int,
pp20                  int,
pp21                  int,
pisvalid              smallint,
pdbversion            int,
pcreator              varchar(180),
pvar                  varchar(40))
begin
declare rguid      int;
declare rpos	   int;
declare rhguid      int;
declare rlguid	   int;
start transaction;
select charguid,hpetguid,lpetguid,pos into rguid,rhguid,rlguid,rpos from t_pet_iteminfo where charguid = pcharguid and hpetguid=phguid and lpetguid=plguid and pos=ppos;

	if rguid = pcharguid and rhguid = phguid and rlguid = plguid then
	 update t_pet_iteminfo set charguid = pcharguid,
        hpetguid        = phguid,
        lpetguid        = plguid,
		guid		 	= pguid,
		world		 	= pworld,
		server	 		= pserver,
		itemtype 		= pitemtype,
		pos			    = ppos,
        visualid        = pvisualid,
        maxgemid        = pmaxgemid,
		fixattr	 		= pfixattr,
		p1			    = pp1,
		p2			    = pp2,
		p3			    = pp3,
		p4			    = pp4,
		p5			    = pp5,
		p6			    = pp6,
		p7			    = pp7,
		p8			    = pp8,
		p9			    = pp9,
		p10			    = pp10,
		p11			    = pp11,
		p12			    = pp12,
		p13			    = pp13,
		p14			    = pp14,
		p15			    = pp15,
		p16			    = pp16,
		p17			    = pp17,
		p18     	    = pp18,
		p19     	    = pp19,
		p20     	    = pp20,
		p21     	    = pp21,
		isvalid  		= pisvalid,
		dbversion		= pdbversion,
		creator  		= pcreator,
		var			    = pvar where
		charguid=pcharguid and hpetguid=phguid and lpetguid=plguid and pos=ppos and dbversion<=pdbversion;
      
      if row_count() > 0 then
        update t_pet_iteminfo set isvalid=0 
        where guid=pguid and world=pworld and server=pserver and hpetguid=phguid and lpetguid=plguid and charguid<>pcharguid and pos<>ppos;
      end if;
	else
		insert into t_pet_iteminfo(charguid,hpetguid,lpetguid,world,server,guid,itemtype,
		pos,visualid,maxgemid,fixattr,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,
		isvalid,dbversion,creator,var)
		values(pcharguid,phguid,plguid,pworld,pserver,pguid,pitemtype,ppos,pvisualid,pmaxgemid,
		pfixattr,pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8,pp9,pp10,
		pp11,pp12,pp13,pp14,pp15,pp16,pp17,pp18,pp19,pp20,pp21,pisvalid,pdbversion,pcreator,pvar);
	end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_petiteminfo`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_petiteminfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_petiteminfo`(pzoneworldid int,ppairdata text,ppoolid int,pisvalid int)
begin
declare rcount int;
start transaction;
select pindex into rcount from t_petcreate where pindex = ppoolid and zoneworldid=pzoneworldid;
if rcount = ppoolid then
		update t_petcreate set pairdata=ppairdata,isvalid=pisvalid
            	where pindex=ppoolid and zoneworldid=pzoneworldid;
else
		insert into t_petcreate(zoneworldid,pindex,pairdata,isvalid)  
		values(pzoneworldid,ppoolid,ppairdata,pisvalid);	
end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_shopinfo_new`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_shopinfo_new`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_shopinfo_new`(psid                  int,
pzoneworldid		  int,
ppoolid               int,
pshopguid             varchar(50),
pshopindex						int,
ptype                 int,
pstat                 int,
pmaxbmoney            int,
pbasemoney            int,
pprofit               int,
pcreatetime           int,
pshopname             varchar(50),
pshopdesc             varchar(50),
pownername            varchar(50),
pownerguid            int,
pisopen               int,
psale                 int,
psaleprice            int,
psaletype			  int,
ppartner              text,
pisvalid              int,
ppartnum              int,
psubtype              int,
pfreeze               smallint,
plockstatus           smallint,
punlocktime           int,
pownerlastlogtime			int,
pbuydesc              varchar(80),
pbuyreserve           varchar(50))
begin
declare rcount int;
declare rindex int;
start transaction;
select sid ,poolid into rcount,rindex from t_pshop_new where sid = psid and poolid=ppoolid and zoneworldid=pzoneworldid;
if rcount = psid then
		update t_pshop_new set  shopguid=pshopguid,
														shopindex=pshopindex,
                            type=ptype,
                            stat=pstat,
                            maxbmoney=pmaxbmoney,
                            basemoney=pbasemoney,
                            profit   =pprofit,
                            createtime=pcreatetime,
                            shopname=pshopname,
                            shopdesc=pshopdesc,
                            ownername=pownername,
                            ownerguid=pownerguid,
                            isopen=pisopen,
                            sale=psale,
                            saleprice=psaleprice,
							saletype=psaletype,
                            partner=ppartner,
                            isvalid=pisvalid,
                            partnum=ppartnum,
                            subtype=psubtype,
                            freeze=pfreeze,
														lockstat=plockstatus,
														unlocktime=punlocktime,
														ownerlastlogtime=pownerlastlogtime,
                            buydesc=pbuydesc,
                            buyreserve=pbuyreserve 
                            where sid=psid and poolid=ppoolid and zoneworldid=pzoneworldid;
else
		insert into t_pshop_new(sid,    
							zoneworldid,
                            poolid,    
                            shopguid,  
														shopindex,
                            type,      
                            stat,      
                            maxbmoney, 
                            basemoney, 
                            profit,
                            createtime,
                            shopname,  
                            shopdesc,  
                            ownername, 
                            ownerguid, 
                            isopen,    
                            sale,      
                            saleprice, 
							saletype,
                            partner,
														recoder,
                            isvalid,   
                            partnum,
                            subtype,
                            freeze,
														lockstat,
														unlocktime,
														ownerlastlogtime,
                            buydesc,
                            buyreserve)    values
                            (psid, 
							 pzoneworldid,
                             ppoolid,    
                             pshopguid,  
														 pshopindex,
                             ptype,      
                             pstat,      
                             pmaxbmoney, 
                             pbasemoney, 
                             pprofit,
                             pcreatetime,
                             pshopname,  
                             pshopdesc,  
                             pownername, 
                             pownerguid, 
                             pisopen,    
                             psale,      
                             psaleprice,
							 psaletype,
                             ppartner,
														 '',
                             pisvalid,   
                             ppartnum,
                             psubtype,
                             pfreeze,
														 plockstatus,
														 punlocktime,
														 pownerlastlogtime,
                             pbuydesc,
                             pbuyreserve); 
end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_shopinfo_stall`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_shopinfo_stall`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_shopinfo_stall`(pshopguid             varchar(50),
pstallid              int,
pBox_Status           smallint,
pBox_Type             smallint,
pBox_VldNum           smallint,
pBox_FstPage          int,
pBuy_StlRsv           varchar(50))
begin
declare _guid varchar(50) default NULL;
start transaction;
select shopguid into _guid from t_pshop_stall where shopguid = pshopguid and stallid = pstallid;
if _guid = pshopguid then
		update t_pshop_stall set  shopguid=pshopguid,
                            stallid=pstallid,
                            Box_Status=pBox_Status,
                            Box_Type=pBox_Type,
                            Box_VldNum=pBox_VldNum,
                            Box_FstPage=pBox_FstPage,
                            Buy_StlRsv=pBuy_StlRsv 
                            where shopguid = pshopguid and stallid = pstallid;
else
		insert into t_pshop_stall(shopguid,       
                            stallid,    
                            Box_Status,  
                            Box_Type,      
                            Box_VldNum,      
                            Box_FstPage, 
                            Buy_StlRsv)    values
                            (pshopguid,       
                             pstallid,    
                             pBox_Status,  
                             pBox_Type,      
                             pBox_VldNum,      
                             pBox_FstPage, 
                             pBuy_StlRsv); 
end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_shopinfo_stall_buy`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_shopinfo_stall_buy`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_shopinfo_stall_buy`(pshopguid             varchar(50),
pstallid              int,
pstallunitid          int,
pBuy_ItemNum          int,
pBuy_ItemIdx          int,
pBuy_Price            int,
pBuy_InStlNum         smallint,
pItm_charguid         int,
pItm_guid             int,
pItm_world            int,
pItm_server           int,
pItm_itemtype         int,
pItm_pos              smallint,
pItm_p1               int,
pItm_p2               int,
pItm_p3               int,
pItm_p4               int,
pItm_p5               int,
pItm_p6               int,
pItm_p7               int,
pItm_p8               int,
pItm_p9               int,
pItm_p10              int,
pItm_p11              int,
pItm_p12              int,
pItm_p13              int,
pItm_p14              int,
pItm_p15              int,
pItm_p16              int,
pItm_p17              int,
pItm_p18              int,
pItm_p19              int,
pItm_p20              int,
pItm_p21              int,
pItm_creator          varchar(180),
pItm_var              varchar(40),
pItm_visualid         int,
pItm_maxgemid         int)
begin
declare _guid varchar(50) default NULL;
start transaction;
select shopguid into _guid from t_pshop_stall_buy where shopguid = pshopguid and stallid = pstallid and stallunitid = pstallunitid;
if _guid = pshopguid then
		update t_pshop_stall_buy set  shopguid=pshopguid,
                            stallid=pstallid,
                            stallunitid=pstallunitid,
                            Buy_ItemNum=pBuy_ItemNum,
                            Buy_ItemIdx=pBuy_ItemIdx,
                            Buy_Price=pBuy_Price,
                            Buy_InStlNum=pBuy_InStlNum,
                            Itm_charguid=pItm_charguid,
                            Itm_guid=pItm_guid,
                            Itm_world=pItm_world,
                            Itm_server=pItm_server,
                            Itm_itemtype=pItm_itemtype,
                            Itm_pos=pItm_pos,
                            Itm_p1=pItm_p1,
                            Itm_p2=pItm_p2,
                            Itm_p3=pItm_p3,
                            Itm_p4=pItm_p4,
                            Itm_p5=pItm_p5,
                            Itm_p6=pItm_p6,
                            Itm_p7=pItm_p7,
                            Itm_p8=pItm_p8,
                            Itm_p9=pItm_p9,
                            Itm_p10=pItm_p10,
                            Itm_p11=pItm_p11,
                            Itm_p12=pItm_p12,
                            Itm_p13=pItm_p13,
                            Itm_p14=pItm_p14,
                            Itm_p15=pItm_p15,
                            Itm_p16=pItm_p16,
                            Itm_p17=pItm_p17,
														Itm_p18=pItm_p18,
														Itm_p19=pItm_p19,
														Itm_p20=pItm_p20,
														Itm_p21=pItm_p21,
                            Itm_creator=pItm_creator,
                            Itm_var=pItm_var,
                            Itm_visualid=pItm_visualid,
                            Itm_maxgemid=pItm_maxgemid 
                            where shopguid = pshopguid and stallid = pstallid and stallunitid = pstallunitid;
else
		insert into t_pshop_stall_buy(shopguid,       
                            stallid,    
                            stallunitid,  
                            Buy_ItemNum,      
                            Buy_ItemIdx, 
                            Buy_Price, 
                            Buy_InStlNum,
                            Itm_charguid,
                            Itm_guid,
                            Itm_world,
                            Itm_server,
                            Itm_itemtype,
                            Itm_pos,
                            Itm_p1,
                            Itm_p2,
                            Itm_p3,
                            Itm_p4,
                            Itm_p5,
                            Itm_p6,
                            Itm_p7,
                            Itm_p8,
                            Itm_p9,
                            Itm_p10,
                            Itm_p11,
                            Itm_p12,
                            Itm_p13,
                            Itm_p14,
                            Itm_p15,
                            Itm_p16,
                            Itm_p17,
														Itm_p18,
														Itm_p19,
														Itm_p20,
														Itm_p21,
                            Itm_creator,
                            Itm_var,
                            Itm_visualid,
                            Itm_maxgemid)    values
                            (pshopguid,       
                             pstallid,    
                             pstallunitid,  
                             pBuy_ItemNum,      
                             pBuy_ItemIdx,      
                             pBuy_Price,      
                             pBuy_InStlNum,
                             pItm_charguid,
                             pItm_guid,
                             pItm_world,
                             pItm_server,
                             pItm_itemtype,
                             pItm_pos,
                             pItm_p1,
                             pItm_p2,
                             pItm_p3,
                             pItm_p4,
                             pItm_p5,
                             pItm_p6,
                             pItm_p7,
                             pItm_p8,
                             pItm_p9,
                             pItm_p10,
                             pItm_p11,
                             pItm_p12,
                             pItm_p13,
                             pItm_p14,
                             pItm_p15,
                             pItm_p16,
                             pItm_p17,
														 pItm_p18,
														 pItm_p19,
														 pItm_p20,
														 pItm_p21,
                             pItm_creator,
                             pItm_var,
                             pItm_visualid,
                             pItm_maxgemid);
end if;
commit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_shopinfo_stall_itm`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_shopinfo_stall_itm`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_shopinfo_stall_itm`(pshopguid             varchar(50),
pstallid              int,
pstallunitid          int,
pBox_OnSale           smallint,
pBox_Price            int,
pItm_charguid         int,
pItm_guid             int,
pItm_world            int,
pItm_server           int,
pItm_itemtype         int,
pItm_pos              smallint,
pItm_p1               int,
pItm_p2               int,
pItm_p3               int,
pItm_p4               int,
pItm_p5               int,
pItm_p6               int,
pItm_p7               int,
pItm_p8               int,
pItm_p9               int,
pItm_p10              int,
pItm_p11              int,
pItm_p12              int,
pItm_p13              int,
pItm_p14              int,
pItm_p15              int,
pItm_p16              int,
pItm_p17              int,
pItm_p18              int,
pItm_p19              int,
pItm_p20              int,
pItm_p21              int,
pItm_creator          varchar(180),
pItm_var              varchar(40),
pItm_fixattr					varchar(200),
pItm_visualid         int,
pItm_maxgemid         int)
begin
declare _guid varchar(50) default NULL;
start transaction;
select shopguid into _guid from t_pshop_stall_itm where shopguid = pshopguid and stallid = pstallid and stallunitid = pstallunitid;
if _guid = pshopguid then
		update t_pshop_stall_itm set  shopguid=pshopguid,
                            stallid=pstallid,
                            stallunitid=pstallunitid,
                            Box_OnSale=pBox_OnSale,
                            Box_Price=pBox_Price,
                            Itm_charguid=pItm_charguid,
                            Itm_guid=pItm_guid,
                            Itm_world=pItm_world,
                            Itm_server=pItm_server,
                            Itm_itemtype=pItm_itemtype,
                            Itm_pos=pItm_pos,
                            Itm_p1=pItm_p1,
                            Itm_p2=pItm_p2,
                            Itm_p3=pItm_p3,
                            Itm_p4=pItm_p4,
                            Itm_p5=pItm_p5,
                            Itm_p6=pItm_p6,
                            Itm_p7=pItm_p7,
                            Itm_p8=pItm_p8,
                            Itm_p9=pItm_p9,
                            Itm_p10=pItm_p10,
                            Itm_p11=pItm_p11,
                            Itm_p12=pItm_p12,
                            Itm_p13=pItm_p13,
                            Itm_p14=pItm_p14,
                            Itm_p15=pItm_p15,
                            Itm_p16=pItm_p16,
                            Itm_p17=pItm_p17,
														Itm_p18=pItm_p18,
														Itm_p19=pItm_p19,
														Itm_p20=pItm_p20,
														Itm_p21=pItm_p21,
                            Itm_creator=pItm_creator,
                            Itm_var=pItm_var,
														Itm_fixattr=pItm_fixattr,
                            Itm_visualid=pItm_visualid,
                            Itm_maxgemid=pItm_maxgemid 
                            where shopguid = pshopguid and stallid = pstallid and stallunitid = pstallunitid;
else
		insert into t_pshop_stall_itm(shopguid,       
                             stallid,    
                             stallunitid,  
                             Box_OnSale,      
                             Box_Price,
                             Itm_charguid,
                             Itm_guid,
                             Itm_world,
                             Itm_server,
                             Itm_itemtype,
                             Itm_pos,
                             Itm_p1,
                             Itm_p2,
                             Itm_p3,
                             Itm_p4,
                             Itm_p5,
                             Itm_p6,
                             Itm_p7,
                             Itm_p8,
                             Itm_p9,
                             Itm_p10,
                             Itm_p11,
                             Itm_p12,
                             Itm_p13,
                             Itm_p14,
                             Itm_p15,
                             Itm_p16,
                             Itm_p17,
														 Itm_p18,
														 Itm_p19,
														 Itm_p20,
														 Itm_p21,
                             Itm_creator,
                             Itm_var,
														 Itm_fixattr,
                             Itm_visualid,
                             Itm_maxgemid)    values
                            (pshopguid,       
                             pstallid,    
                             pstallunitid,  
                             pBox_OnSale,      
                             pBox_Price,
                             pItm_charguid,
                             pItm_guid,
                             pItm_world,
                             pItm_server,
                             pItm_itemtype,
                             pItm_pos,
                             pItm_p1,
                             pItm_p2,
                             pItm_p3,
                             pItm_p4,
                             pItm_p5,
                             pItm_p6,
                             pItm_p7,
                             pItm_p8,
                             pItm_p9,
                             pItm_p10,
                             pItm_p11,
                             pItm_p12,
                             pItm_p13,
                             pItm_p14,
                             pItm_p15,
                             pItm_p16,
                             pItm_p17,
														 pItm_p18,
														 pItm_p19,
														 pItm_p20,
														 pItm_p21,
                             pItm_creator,
                             pItm_var,
														 pItm_fixattr,
                             pItm_visualid,
                             pItm_maxgemid); 
end if;                      
commit;                      
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `save_shopinfo_stall_pet`
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_shopinfo_stall_pet`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `save_shopinfo_stall_pet`(pshopguid             varchar(50),
pstallid              int,
pstallunitid          int,
pBox_OnSale           smallint,
pBox_Price            int,
pPet_charguid         int,
pPet_hpetguid         int,
pPet_lpetguid         int,
pPet_dataxid          int,
pPet_petname          varchar(50),
pPet_petnick          varchar(50),
pPet_level            int,
pPet_needlevel        int,
pPet_atttype          int,
pPet_aitype           int,
pPet_camp             varchar(30),
pPet_hp               int,
pPet_mp               int,
pPet_life             int,
pPet_pettype          smallint,
pPet_genera           smallint,
pPet_enjoy            smallint,
pPet_strper           int,
pPet_conper           int,
pPet_dexper           int,
pPet_sprper           int,
pPet_iprper           int,
pPet_gengu            int,
pPet_growrate         int,
pPet_repoint          int,
pPet_exp              int,
pPet_str              int,
pPet_con              int,
pPet_dex              int,
pPet_spr              int,
pPet_ipr              int,
pPet_skill            varchar(200),
pPet_pwflag           int,
pPet_pclvl            int,
pPet_hspetguid        int,
pPet_lspetguid        int,
pPet_savvy            int,
pPet_title            varchar(200),
pPet_curtitle         int,
pPet_us_unlock_time   int,
pPet_us_reserve       int,
pPet_olddataxid       int,
pPet_fitvalue   			int,
pPet_linxing       		int)
begin
declare _guid varchar(50) default NULL;
start transaction;
select shopguid into _guid from t_pshop_stall_pet where shopguid = pshopguid and stallid = pstallid and stallunitid = pstallunitid;
if _guid = pshopguid then
		update t_pshop_stall_pet set  shopguid=pshopguid,
                            stallid=pstallid,
                            stallunitid=pstallunitid,
                            Box_OnSale=pBox_OnSale,
                            Box_Price=pBox_Price,
                            Pet_charguid=pPet_charguid,      
                            Pet_hpetguid=pPet_hpetguid,      
                            Pet_lpetguid=pPet_lpetguid,      
                            Pet_dataxid=pPet_dataxid,       
                            Pet_petname=pPet_petname,       
                            Pet_petnick=pPet_petnick,       
                            Pet_level=pPet_level,         
                            Pet_needlevel=pPet_needlevel,     
                            Pet_atttype=pPet_atttype,       
                            Pet_aitype=pPet_aitype,        
                            Pet_camp=pPet_camp,          
                            Pet_hp=pPet_hp,            
                            Pet_mp=pPet_mp,            
                            Pet_life=pPet_life,          
                            Pet_pettype=pPet_pettype,       
                            Pet_genera=pPet_genera,        
                            Pet_enjoy=pPet_enjoy,         
                            Pet_strper=pPet_strper,        
                            Pet_conper=pPet_conper,        
                            Pet_dexper=pPet_dexper,        
                            Pet_sprper=pPet_sprper,        
                            Pet_iprper=pPet_iprper,        
                            Pet_gengu=pPet_gengu,         
                            Pet_growrate=pPet_growrate,      
                            Pet_repoint=pPet_repoint,       
                            Pet_exp=pPet_exp,           
                            Pet_str=pPet_str,           
                            Pet_con=pPet_con,           
                            Pet_dex=pPet_dex,           
                            Pet_spr=pPet_spr,           
                            Pet_ipr=pPet_ipr,           
                            Pet_skill=pPet_skill,         
                            Pet_pwflag=pPet_pwflag,        
                            Pet_pclvl=pPet_pclvl,         
                            Pet_hspetguid=pPet_hspetguid,     
                            Pet_lspetguid=pPet_lspetguid,     
                            Pet_savvy=pPet_savvy,         
                            Pet_title=pPet_title,         
                            Pet_curtitle=pPet_curtitle,      
                            Pet_us_unlock_time=pPet_us_unlock_time,
                            Pet_us_reserve=pPet_us_reserve,
													  Pet_olddataxid=pPet_olddataxid,      
                            Pet_fitvalue=pPet_fitvalue,	
														Pet_linxing=pPet_linxing
                            where shopguid = pshopguid and stallid = pstallid and stallunitid = pstallunitid;
else
		insert into t_pshop_stall_pet(shopguid,       
                            stallid,    
                            stallunitid,  
                            Box_OnSale,      
                            Box_Price,
                            Pet_charguid,
                            Pet_hpetguid,
                            Pet_lpetguid,
                            Pet_dataxid,
                            Pet_petname,
                            Pet_petnick,
                            Pet_level,
                            Pet_needlevel,
                            Pet_atttype,
                            Pet_aitype,
                            Pet_camp,
                            Pet_hp,
                            Pet_mp,
                            Pet_life,
                            Pet_pettype,
                            Pet_genera,
                            Pet_enjoy,
                            Pet_strper,
                            Pet_conper,
                            Pet_dexper,
                            Pet_sprper,
                            Pet_iprper,
                            Pet_gengu,
                            Pet_growrate,
                            Pet_repoint,
                            Pet_exp,
                            Pet_str,
                            Pet_con,
                            Pet_dex,
                            Pet_spr,
                            Pet_ipr,
                            Pet_skill,
                            Pet_pwflag,
                            Pet_pclvl,
                            Pet_hspetguid,
                            Pet_lspetguid,
                            Pet_savvy,
                            Pet_title,
                            Pet_curtitle,
                            Pet_us_unlock_time,
                            Pet_us_reserve,
														Pet_olddataxid,
														Pet_fitvalue,
														Pet_linxing)    values
                            (pshopguid,       
                             pstallid,    
                             pstallunitid,  
                             pBox_OnSale,      
                             pBox_Price,
                             pPet_charguid,
                             pPet_hpetguid,
                             pPet_lpetguid,
                             pPet_dataxid,
                             pPet_petname,
                             pPet_petnick,
                             pPet_level,
                             pPet_needlevel,
                             pPet_atttype,
                             pPet_aitype,
                             pPet_camp,
                             pPet_hp,
                             pPet_mp,
                             pPet_life,
                             pPet_pettype,
                             pPet_genera,
                             pPet_enjoy,
                             pPet_strper,
                             pPet_conper,
                             pPet_dexper,
                             pPet_sprper,
                             pPet_iprper,
                             pPet_gengu,
                             pPet_growrate,
                             pPet_repoint,
                             pPet_exp,
                             pPet_str,
                             pPet_con,
                             pPet_dex,
                             pPet_spr,
                             pPet_ipr,
                             pPet_skill,
                             pPet_pwflag,
                             pPet_pclvl,
                             pPet_hspetguid,
                             pPet_lspetguid,
                             pPet_savvy,
                             pPet_title,
                             pPet_curtitle,
                             pPet_us_unlock_time,
                             pPet_us_reserve,
														 pPet_olddataxid,
														 pPet_fitvalue,
														 pPet_linxing); 
end if;                      
commit;                      
end
;;
DELIMITER ;
