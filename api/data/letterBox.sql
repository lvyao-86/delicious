/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : zyy

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-08-28 12:05:42
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of letterbox
-- ----------------------------
INSERT INTO `letterbox` VALUES ('1', 'cook', '1号桌:[鱼香肉丝]已制成', '2017-08-28 11:20:31');
INSERT INTO `letterbox` VALUES ('2', 'cook', '1号桌:[鱼香肉丝]已制成', '2017-08-28 11:20:23');
INSERT INTO `letterbox` VALUES ('3', 'cook', '123', null);
INSERT INTO `letterbox` VALUES ('4', 'cook', '123', '2017-08-28 11:44:45');
INSERT INTO `letterbox` VALUES ('5', '\'123\'', '\'哈哈\'', '2017-08-28 11:46:28');
INSERT INTO `letterbox` VALUES ('6', 'cook', '33333号桌: [王老吉]  数量：5 已制成，速速来拿！', '2017-08-28 12:00:42');
INSERT INTO `letterbox` VALUES ('7', 'cook', '555555555号桌: [王老吉]  数量：5 已制成，速速来拿！', '2017-08-28 12:03:03');
INSERT INTO `letterbox` VALUES ('8', 'cook', '666666号桌: 全部已制成，速速来拿！', '2017-08-28 12:03:11');
SET FOREIGN_KEY_CHECKS=1;
