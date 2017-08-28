/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : zyy

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-08-28 11:05:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for letterbox
-- ----------------------------
DROP TABLE IF EXISTS `letterbox`;
CREATE TABLE `letterbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `who` varchar(255) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of letterbox
-- ----------------------------
INSERT INTO `letterbox` VALUES ('1', 'cook', '1号桌，鱼香肉丝，已制成', '2017-08-28 11:04:07');
INSERT INTO `letterbox` VALUES ('2', 'cook', null, '2017-08-28 11:04:16');
SET FOREIGN_KEY_CHECKS=1;
