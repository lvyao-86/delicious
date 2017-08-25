/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : zyy

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-08-25 14:46:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for indent
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(100) NOT NULL,
  `boy` varchar(255) DEFAULT NULL,
  `list` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `updateTime` varchar(255) NOT NULL DEFAULT '',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('1', '1', '小明', '[{name:\'王老吉\',qty:5,price:18.8},{name:\'鱼香肉丝\',qty:2,price:10.10}]', '未完成', '未付款', '不要辣', '100.12', '', '2017-08-25 14:41:23');
INSERT INTO `indent` VALUES ('2', '2', '小红', '[{name:\'王老吉\',qty:5,price:18.8},{name:\'鱼香肉丝\',qty:2,price:10.10}]', '已完成', '已付款', '要拉', '55.23', '', '2017-08-25 14:41:57');
INSERT INTO `indent` VALUES ('3', '3', '小红', '[]', '未完成', '未付款', 'haha', '10.10', '', '2017-08-25 14:43:43');
SET FOREIGN_KEY_CHECKS=1;
