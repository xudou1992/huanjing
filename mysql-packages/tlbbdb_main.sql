/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.199
Source Server Version : 80044
Source Host           : 192.168.1.199:3306
Source Database       : tlbbdb_main

Target Server Type    : MYSQL
Target Server Version : 80044
File Encoding         : 65001

Date: 2026-01-02 10:57:26
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
) ENGINE=InnoDB AUTO_INCREMENT=3029 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=2083 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=488 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=5920 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=2551 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=5584 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
INSERT INTO `t_var` VALUES ('10', '100000002');

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
) ENGINE=InnoDB AUTO_INCREMENT=997 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=3378 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

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
