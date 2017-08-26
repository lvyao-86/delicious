/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : zyy

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-08-26 15:30:47
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
  `list` varchar(1000) NOT NULL,
  `state` varchar(255) NOT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `updateTime` varchar(255) NOT NULL DEFAULT '',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('1', '1', '小明', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"鱼香肉丝\",\"qty\":2,\"price\":10.1}]', '已完成', '未付款', '不要辣', '100.12', '', '2017-08-26 15:26:14');
INSERT INTO `indent` VALUES ('2', '2', '小红', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"鱼香肉丝\",\"qty\":2,\"price\":10.1}]', '已完成', '已付款', '要拉', '55.23', '', '2017-08-26 15:20:48');
INSERT INTO `indent` VALUES ('3', '3', '小红', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"鱼香肉丝\",\"qty\":2,\"price\":10.1}]', '未完成', '未付款', 'haha', '10.10', '', '2017-08-26 15:17:01');
INSERT INTO `indent` VALUES ('23', '1111111111', '1111111', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"鱼香肉丝\",\"qty\":2,\"price\":10.1}]', '未完成', null, null, null, '', '2017-08-26 15:17:05');
INSERT INTO `indent` VALUES ('24', '222222222', '2222222', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"鱼香肉丝\",\"qty\":2,\"price\":10.1}]', '已完成', null, 'test', null, '', '2017-08-26 15:11:45');
INSERT INTO `indent` VALUES ('25', '33333', '3333333', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8}]', '未完成', null, '333333333', null, '', '2017-08-26 15:16:27');
INSERT INTO `indent` VALUES ('26', '4444444', '444444', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8}]', '已完成', null, '呵呵', null, '', '2017-08-26 15:26:02');
INSERT INTO `indent` VALUES ('27', '55555555', '55555555', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8}]', '已完成', null, '哈哈', null, '', '2017-08-26 15:22:20');
INSERT INTO `indent` VALUES ('28', '555555555', '5555555', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8}]', '已完成', null, null, null, '', '2017-08-26 15:10:35');
INSERT INTO `indent` VALUES ('29', '666666', '66666666', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8}]', '已完成', null, '嘻嘻', null, '', '2017-08-26 14:54:39');
INSERT INTO `indent` VALUES ('30', '777777', '777777777', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8}]', '已完成', null, '毛主席', null, '', '2017-08-26 15:13:25');
INSERT INTO `indent` VALUES ('31', '8888', '8888888888', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8}]', '已完成', null, '123', null, '', '2017-08-26 14:44:35');
INSERT INTO `indent` VALUES ('32', '99999', '9999999', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8}]', '已完成', null, '12321', null, '', '2017-08-26 14:40:40');
INSERT INTO `indent` VALUES ('33', '1111111111', '1111111', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8}]', '未完成', null, 'hahahahha', null, '', '2017-08-26 15:26:48');
SET FOREIGN_KEY_CHECKS=1;
