/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : delicious

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-08-29 15:14:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dinnertable
-- ----------------------------
DROP TABLE IF EXISTS `dinnertable`;
CREATE TABLE `dinnertable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 NOT NULL,
  `order` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dinnertable
-- ----------------------------
INSERT INTO `dinnertable` VALUES ('1', '1', '空闲', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"鱼香肉丝\",\"qty\":2,\"price\":10.1}]');
INSERT INTO `dinnertable` VALUES ('2', '2', '清理中', '[{\"name\":\"加多宝\",\"qty\":1,\"price\":18.8},{\"name\":\"鱼香肉丝\",\"qty\":2,\"price\":10.1}]');
INSERT INTO `dinnertable` VALUES ('3', '3', '使用中', '[{\"name\":\"起司千层猪排\",\"qty\":5,\"price\":18.8},{\"name\":\"鱼香肉丝\",\"qty\":2,\"price\":10.1}]');
INSERT INTO `dinnertable` VALUES ('4', '4', '空闲', '[{\"name\":\"春意小羊肘\",\"qty\":5,\"price\":18.8},{\"name\":\"鱼香肉丝\",\"qty\":2,\"price\":10.1}]');
INSERT INTO `dinnertable` VALUES ('5', '5', '空闲', '[{\"name\":\"火龙鱼\",\"qty\":5,\"price\":18.8},{\"name\":\"鱼香肉丝\",\"qty\":2,\"price\":10.1}]');
INSERT INTO `dinnertable` VALUES ('6', '6', '空闲', '[{\"name\":\"奶油南瓜浓汤\",\"qty\":5,\"price\":18.8},{\"name\":\"鱼香肉丝\",\"qty\":2,\"price\":10.1}]');
INSERT INTO `dinnertable` VALUES ('7', '7', '空闲', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"意大利海鲜烩饭\",\"qty\":2,\"price\":10.1}]');
INSERT INTO `dinnertable` VALUES ('8', '8', '空闲', '[{\"name\":\"王老吉\",\"qty\":5,\"price\":18.8},{\"name\":\"鱼香肉丝\",\"qty\":2,\"price\":10.1}]');
INSERT INTO `dinnertable` VALUES ('9', '9', '空闲', '[{\"name\":\"肉酱意大利面\",\"qty\":5,\"price\":18.8},{\"name\":\"鱼香肉丝\",\"qty\":2,\"price\":10.1}]');
INSERT INTO `dinnertable` VALUES ('10', '10', '空闲', '[{\"name\":\"牛肉海带汤\",\"qty\":5,\"price\":18.8},{\"name\":\"鱼香肉丝\",\"qty\":2,\"price\":10.1}]');

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
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('67', '2', '小明', '[{\"name\":\"蔓越莓华芙饼\",\"price\":\"40\",\"qty\":1},{\"name\":\"樱花和果子\",\"price\":\"40\",\"qty\":1},{\"name\":\"菠萝派\",\"price\":\"40\",\"qty\":1}]', '未完成', '未付款', '6666', '120.00', '', '2017-08-29 15:12:43');
INSERT INTO `indent` VALUES ('64', '2', '小明', '[{\"name\":\"八角茴香火烧鲷鱼\",\"price\":\"29\",\"qty\":1},{\"name\":\"奶油芝士焗龙虾\",\"price\":\"30\",\"qty\":1}]', '已完成', '未付款', '', '59.00', '', '2017-08-29 15:09:23');
INSERT INTO `indent` VALUES ('65', '2', '小明', '[{\"name\":\"奶油芝士焗龙虾\",\"price\":\"30\",\"qty\":1},{\"name\":\"红酒柠檬虾\",\"price\":\"31\",\"qty\":1}]', '未完成', '未付款', '', '61.00', '', '2017-08-29 14:50:06');
INSERT INTO `indent` VALUES ('66', '2', '小明', '[{\"name\":\"肉酱意大利面\",\"price\":\"40\",\"qty\":1},{\"name\":\"意大利海鲜烩饭\",\"price\":\"40\",\"qty\":1},{\"name\":\"土豆丝培根披萨\",\"price\":\"40\",\"qty\":1},{\"name\":\"樱花马卡龙\",\"price\":\"40\",\"qty\":1}]', '未完成', '未付款', '6666', '160.00', '', '2017-08-29 15:08:19');
INSERT INTO `indent` VALUES ('34', '4', '小明', '[{\"name\":\"意大利香草鸭腿\",\"price\":\"26\",\"qty\":1},{\"name\":\"迷迭香煎三文鱼\",\"price\":\"27\",\"qty\":1}]', '已完成', '未付款', '', '53.00', '', '2017-08-29 12:20:50');
INSERT INTO `indent` VALUES ('35', '1', '小明', '[{\"name\":\"意大利香草鸭腿\",\"price\":\"26\",\"qty\":1},{\"name\":\"迷迭香煎三文鱼\",\"price\":\"27\",\"qty\":1},{\"name\":\"花椰菜奶酪汤\",\"price\":\"40\",\"qty\":1},{\"name\":\"奶酪土豆浓汤\",\"price\":\"40\",\"qty\":1},{\"name\":\"奶油南瓜浓汤\",\"price\":\"40\",\"qty\":1}]', '已完成', '未付款', '', '173.00', '', '2017-08-29 14:08:04');
INSERT INTO `indent` VALUES ('36', '2', '小明', '[{\"name\":\"意大利香草鸭腿\",\"price\":\"26\",\"qty\":1},{\"name\":\"迷迭香煎三文鱼\",\"price\":\"27\",\"qty\":1},{\"name\":\"花椰菜奶酪汤\",\"price\":\"40\",\"qty\":2},{\"name\":\"奶酪土豆浓汤\",\"price\":\"40\",\"qty\":2},{\"name\":\"奶油南瓜浓汤\",\"price\":\"40\",\"qty\":1}]', '已完成', '未付款', '', '253.00', '', '2017-08-29 14:08:13');
INSERT INTO `indent` VALUES ('37', '3', '小明', '[{\"name\":\"意大利香草鸭腿\",\"price\":\"26\",\"qty\":1},{\"name\":\"迷迭香煎三文鱼\",\"price\":\"27\",\"qty\":1},{\"name\":\"花椰菜奶酪汤\",\"price\":\"40\",\"qty\":3},{\"name\":\"奶酪土豆浓汤\",\"price\":\"40\",\"qty\":3},{\"name\":\"奶油南瓜浓汤\",\"price\":\"40\",\"qty\":1}]', '已完成', '未付款', '1111111111111111111111111', '333.00', '', '2017-08-29 12:24:48');
INSERT INTO `indent` VALUES ('38', '4', '小明', '[{\"name\":\"芝士虾球\",\"price\":\"20\",\"qty\":1},{\"name\":\"薯条\",\"price\":\"21\",\"qty\":1},{\"name\":\"芝士焗土豆泥\",\"price\":\"22\",\"qty\":1},{\"name\":\"土豆培根奶酪球\",\"price\":\"22\",\"qty\":1},{\"name\":\"金沙番茄\",\"price\":\"23\",\"qty\":1}]', '已完成', '未付款', '与提供一个规划局', '108.00', '', '2017-08-29 12:24:49');
INSERT INTO `indent` VALUES ('49', '2', '小明', '[{\"name\":\"黑咖啡\",\"price\":\"40\",\"qty\":2},{\"name\":\"青柠苏打水\",\"price\":\"40\",\"qty\":4},{\"name\":\"苹果玫瑰醋\",\"price\":\"40\",\"qty\":1}]', '已完成', '未付款', '12', '280.00', '', '2017-08-29 14:47:54');
INSERT INTO `indent` VALUES ('58', '2', '小明', '[{\"name\":\"黑咖啡\",\"price\":\"40\",\"qty\":2},{\"name\":\"青柠苏打水\",\"price\":\"40\",\"qty\":10},{\"name\":\"苹果玫瑰醋\",\"price\":\"40\",\"qty\":3}]', '已完成', '未付款', '6666666666666', '600.00', '', '2017-08-29 14:48:06');
INSERT INTO `indent` VALUES ('59', '2', '小明', '[{\"name\":\"芝士虾球\",\"price\":\"20\",\"qty\":1},{\"name\":\"芝士焗土豆泥\",\"price\":\"22\",\"qty\":1}]', '已完成', '未付款', '12', '42.00', '', '2017-08-29 14:48:09');
INSERT INTO `indent` VALUES ('60', '2', '小明', '[]', '未完成', '未付款', '', '0.00', '', '2017-08-29 14:24:35');
INSERT INTO `indent` VALUES ('61', '2', '小明', '[{\"name\":\"西柚牛油果沙拉\",\"price\":\"38\",\"qty\":1},{\"name\":\"牛油果蔬菜沙拉\",\"price\":\"58\",\"qty\":1}]', '已完成', '未付款', '', '96.00', '', '2017-08-29 14:44:30');
INSERT INTO `indent` VALUES ('62', '2', '小明', '[{\"name\":\"牛油果蔬菜沙拉\",\"price\":\"58\",\"qty\":1},{\"name\":\"干果沙拉\",\"price\":\"38\",\"qty\":1},{\"name\":\"缤纷金枪鱼沙拉\",\"price\":\"58\",\"qty\":1}]', '已完成', '未付款', '', '154.00', '', '2017-08-29 14:44:35');
INSERT INTO `indent` VALUES ('63', '2', '小明', '[{\"name\":\"芝士焗土豆泥\",\"price\":\"22\",\"qty\":1},{\"name\":\"土豆培根奶酪球\",\"price\":\"22\",\"qty\":1},{\"name\":\"金沙番茄\",\"price\":\"23\",\"qty\":1}]', '已完成', '未付款', '', '67.00', '', '2017-08-29 14:50:50');

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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of letterbox
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `ID` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '西柚牛油果沙拉', '一款西柚牛油果沙拉是女性养颜美容果，即美味又零负担哦~常吃能丰富蛋白质和维生素，提高免疫力，是家人健康养生水果~', '沙拉', '38', '5', 'sala/Grapefruit-salad.jpg', '');
INSERT INTO `menu` VALUES ('2', '牛油果蔬菜沙拉', '天气越来越热，又是各种沙拉当道的季节，赏心悦目的搭配，富含丰富营养，就是这道清新的牛油果蔬菜沙拉，沙拉中更是添加了富含亚麻酸的亚麻籽油，为这道菜的营养美味加分。', '沙拉', '58', '5', 'sala/Avocado-salad.jpg', '');
INSERT INTO `menu` VALUES ('3', '干果沙拉', '简单又健康的干果沙拉，做起来一点也不费力，喜欢的亲们可以试试哦~干果除了做饼干、做蒸糕、或直接当零食，原来搭配胡萝卜和玉米做成沙拉也很好吃，嚼起来很有层次感。', '沙拉', '38', '5', 'sala/Dried-fruit-salad.jpg', '');
INSERT INTO `menu` VALUES ('4', '缤纷金枪鱼沙拉', '吞拿鱼沙拉是一道口味鲜美的家常菜，主要食材是黄瓜。', '沙拉', '58', '5', 'sala/Colorful-tuna-salad.jpg', '');
INSERT INTO `menu` VALUES ('5', '酸奶杂果沙拉', '西式饮食怎可以少了沙拉这一道，懒点的人可以用酸奶拌水果，快捷简便，易上手，外面卖的凝固型酸奶带甜味，可中和过酸或味淡的水果，非常好吃开胃。', '沙拉', '38', '5', 'sala/Yogurt-mixed-fruit-salad.jpg', '');
INSERT INTO `menu` VALUES ('6', '大虾沙拉', '春天来了，脱下厚重的冬装，发现腰围大了一大圈。晚上吃这道清爽的沙拉，可以控制一下热量。', '沙拉', '58', '5', 'sala/prawn-salad.jpg', '');
INSERT INTO `menu` VALUES ('7', '普罗旺斯海鲜沙拉', '多样的香料、丰富的蔬果、新鲜的海鲜、橄榄油与大蒜，构成了普罗旺斯料理的特色，再搭配当地产的优质葡萄酒，组合成了食客的天堂', '沙拉', '58', '5', 'sala/Provence-seafood-salad.jpg', '');
INSERT INTO `menu` VALUES ('8', '什蔬鲜虾沙拉', '这款沙拉是很西式的做法，虽然食材都常见，但偏西式的调料却能做出不一样的味道。我们不常吃橄榄油，第一口吃的时候会觉得味道怪怪的，但越吃就觉得越好吃，回味无穷的感觉！', '沙拉', '38', '5', 'sala/Veggie-Fresh-shrimp-salad.jpg', '');
INSERT INTO `menu` VALUES ('9', '夏日风情沙拉', '夏日风情沙拉', '沙拉', '58', '5', 'sala/Summer-Featured-Salad.jpg', '');
INSERT INTO `menu` VALUES ('10', '芒果沙拉', '芒果沙拉', '沙拉', '38', '5', 'sala/Mango-Salad.jpg', '');
INSERT INTO `menu` VALUES ('11', '芝士虾球', '「膳小姐 | 芝士虾球」的做法', '小吃', '20', '5', 'snack/Cheese-Shrimp-balls.jpg', '');
INSERT INTO `menu` VALUES ('12', '薯条', '以后不用特意跑去麦某劳吃薯条', '小吃', '21', '5', 'snack/french-fries.jpg', '');
INSERT INTO `menu` VALUES ('13', '芝士焗土豆泥', '芝士焗土豆泥', '小吃', '22', '6', 'snack/Baked-mashed-potatoes-with-cheese.jpg', '');
INSERT INTO `menu` VALUES ('14', '土豆培根奶酪球', '奶酪是含钙最多的奶制品，能促进代谢，增强活力，保护眼睛健康并保持肌肤健美。奶酪中的脂肪和热能都比较多，但是其胆固醇含量却比较低，对心血管健康也有有利的一面', '小吃', '22', '5', 'snack/Potato-bacon-cheesecake.jpg', '');
INSERT INTO `menu` VALUES ('15', '金沙番茄', '金沙番茄', '小吃', '23', '5', 'snack/Sands-of-tomatoes.jpg', '');
INSERT INTO `menu` VALUES ('16', '肉汁脆皮小土豆', '加入黄油和肉汤来炖煮小豆土，让黄油和肉汤的味道充分渗透到土豆里，使土豆更香浓绵软。再利用剩余的油脂煎香小土豆，混杂着孜然、辣椒和黑椒三种香料，使土豆外皮香脆、内里绵软，好吃得停不下来。', '小吃', '22', '5', 'snack/Crispy-potato-with-gravy.jpg', '');
INSERT INTO `menu` VALUES ('17', '香酥鱿鱼圈', '用牛奶泡过的鱿鱼圈外酥里嫩，口感超棒。', '小吃', '22', '5', 'snack/Spiced-squid-circle.jpg', '');
INSERT INTO `menu` VALUES ('18', '鲜虾天妇罗', '鲜虾天妇罗', '小吃', '22', '5', 'snack/Shrimp-Tempura.jpg', '');
INSERT INTO `menu` VALUES ('19', '芝士焗马铃薯', '芝士焗马铃薯', '小吃', '23', '5', 'snack/Baked-potato-with-cheese.jpg', '');
INSERT INTO `menu` VALUES ('20', '拿破里肉酱', '拿破里肉酱', '小吃', '24', '6', 'snack/Napoli-Meat-sauce.jpg', '');
INSERT INTO `menu` VALUES ('21', '木瓜籽煎西冷牛扒肉质鲜嫩多汁，有弹性，略有嚼劲，我还特别用了木瓜籽来软化牛肉，成品带有淡淡的果香，非常美味，煎的时候可以去掉木瓜籽', '', '主菜', '25', '7', 'main-course/Fried-papaya-seeds-Fried-west-cold-steak.jpg', '');
INSERT INTO `menu` VALUES ('22', '意大利香草鸭腿', '意大利香草鸭腿', '主菜', '26', '8', 'main-course/Italian-vanilla-duck-leg.jpg', '');
INSERT INTO `menu` VALUES ('23', '迷迭香煎三文鱼', '亚麻籽油富含多不饱和脂肪酸α亚麻酸，有“健康素鱼油”之称。配上含omega-3不饱和脂肪酸三文鱼，健康、美味双丰收。这道菜有调节血脂、保护心脏、防止老化等功效。', '主菜', '27', '8', 'main-course/Rosemary-Fried-salmon.jpg', '');
INSERT INTO `menu` VALUES ('24', '牛排第二定律', '低温烹饪，是近年西方厨房的一个潮流。一来烟少了，pm2.5就降低了；二来更能保持食物的营养。', '主菜', '28', '8', 'main-course/The-second-law-of-steak.jpg', '');
INSERT INTO `menu` VALUES ('25', '八角茴香火烧鲷鱼', '八角又称大料，中国人常用来炖肉、制卤等。口语里有时会简称为茴香，但事实上除了气味相似之外，八角茴香与茴香(fennel)并无血缘关系。尽管是土生土长的中国香料，法国人却也亦爱食八角的香气，这道八角茴香火烧鲷鱼便是一个例子。', '主菜', '29', '8', 'main-course/The-star-anise-on-fire-snapper.jpg', '');
INSERT INTO `menu` VALUES ('26', '奶油芝士焗龙虾', '正宗奶油芝士焗龙虾', '主菜', '30', '8', 'main-course/Roasted-lobster-with-cream-cheese.jpg', '');
INSERT INTO `menu` VALUES ('27', '红酒柠檬虾', '红酒柠檬虾', '主菜', '31', '8', 'main-course/Red-wine-lemon-shrimp.jpg', '');
INSERT INTO `menu` VALUES ('28', '法式香煎龙利鱼', '龙利鱼营养丰富，低胆固醇，又没有刺', '主菜', '32', '8', 'main-course/French-Fried-dragon-fish.jpeg', '');
INSERT INTO `menu` VALUES ('29', '红酒黑椒牛排', '红酒中含的酚类物质，可以解腻。红酒中的单宁与红肉中的蛋白质相结合，可以很好的促进消化。', '主菜', '33', '8', 'main-course/Red-wine-black-pepper-steak.jpeg', '');
INSERT INTO `menu` VALUES ('30', '法式香煎鹅肝', '法式香煎鹅肝', '主菜', '34', '8', 'main-course/French-Fried-goose-liver.jpg', '');
INSERT INTO `menu` VALUES ('31', '法式红酒烩鸡', '高贵冷艳镇场菜，逼格超高的法国料理', '主菜', '35', '8', 'main-course/Braised-chicken-with-French-wine.jpg', '');
INSERT INTO `menu` VALUES ('32', '咖喱焗北极虾', '用咖喱的方法来做这个菜是非常非常棒的', '主菜', '36', '8', 'main-course/Curry-roasted-arctic-shrimp.jpg', '');
INSERT INTO `menu` VALUES ('33', '起司千层猪排', '', '主菜', '37', '8', 'main-course/A-thousand-layers-of-pork-chop.jpg', '');
INSERT INTO `menu` VALUES ('34', '烤虾扇贝', '烤虾扇贝', '主菜', '38', '8', 'main-course/Grilled-shrimp-scallops.jpg', '');
INSERT INTO `menu` VALUES ('35', '春意小羊肘', '春意小羊肘', '主菜', '39', '8', 'main-course/Spring-means-little-lamb-elbow.jpg', '');
INSERT INTO `menu` VALUES ('36', '火龙鱼', '火龙鱼', '主菜', '40', '8', 'main-course/red-port-fish.jpg', '');
INSERT INTO `menu` VALUES ('37', '奶酪土豆浓汤', '冬天喝碗浓汤，全身暖暖的。', '汤品', '40', '8', 'soup/Cheese-Potato-Soup.jpg', '');
INSERT INTO `menu` VALUES ('38', '花椰菜奶酪汤', '打芝士又叫切达芝士。就是小时候动画片常看到的黄色芝士，也是麦当劳汉堡里那片黄色的芝士，车打芝士极具“全能性”，几乎可以取代所有的奶酪', '汤品', '40', '8', 'soup/Cauliflower-cheese-soup.jpg', '');
INSERT INTO `menu` VALUES ('39', '海鲜浓汤', '爱与恨交织，辛与辣共存，漂泊数年，难悟人生之真谛', '汤品', '40', '8', 'soup/Clam-chowder.jpg', '');
INSERT INTO `menu` VALUES ('40', '奶油南瓜浓汤', '南瓜富含维生素和锌，常食用能保护胃黏膜，并且具有防癌抗癌的功效，奶制品也是极具营养的食材之一，将二者结合制作出来的美食光凭着它们的营养价值就特别值得一试', '汤品', '40', '8', 'soup/Cream-Pumpkin-Soup.jpg', '');
INSERT INTO `menu` VALUES ('41', '马赛鱼汤', '一种盛行于普罗旺斯地区的鱼汤类菜肴，最初源自马赛渔民将当日渔获炖作一锅的做法', '汤品', '40', '8', 'soup/bouillabaisse.jpg', '');
INSERT INTO `menu` VALUES ('42', '奶油蘑菇汤', '奶油蘑菇汤是法式大餐中的一道经典浓汤，以白蘑菇为主料，辅以洋葱和动物淡奶油的香。蘑菇有增强免疫力的功能，是非常健康的食材。', '汤品', '40', '8', 'soup/Cream-of-Mushroom-Soup.jpg', '');
INSERT INTO `menu` VALUES ('43', '番茄海鲜浓汤', 'Tomato-seafood-soup', '汤品', '40', '8', 'soup/Tomato-seafood-soup.jpg', '');
INSERT INTO `menu` VALUES ('44', '法式洋葱汤', '/French-Onion-Soup', '汤品', '40', '8', 'soup/French-Onion-Soup.jpg', '');
INSERT INTO `menu` VALUES ('45', '罗宋汤', 'Borsch', '汤品', '40', '8', 'soup/Borsch.jpg', '');
INSERT INTO `menu` VALUES ('46', '花菜浓汤', 'cauliflower-soup', '汤品', '40', '8', 'soup/cauliflower-soup.jpg', '');
INSERT INTO `menu` VALUES ('47', '西兰花牛奶浓汤', '一半的奶油一半的牛奶', '汤品', '40', '8', 'soup/Broccoli-and-milk-soup.jpg', '');
INSERT INTO `menu` VALUES ('48', '牛肉海带汤', '牛肉海带汤', '汤品', '40', '8', 'soup/Beef-kelp-soup.jpg', '');
INSERT INTO `menu` VALUES ('49', '肉酱意大利面', 'Spaghetti-bolognese', '主食', '40', '8', 'staple-food/Spaghetti-bolognese.jpg', '');
INSERT INTO `menu` VALUES ('50', '意大利海鲜烩饭', '一道味道很好的意式烩饭', '主食', '40', '8', 'staple-food/seafood-risotto.jpg', '');
INSERT INTO `menu` VALUES ('51', '土豆丝培根披萨', '美味可口的土豆丝披萨', '主食', '40', '8', 'staple-food/Bacon-pizza-wit-potato-chips.jpg', '');
INSERT INTO `menu` VALUES ('52', '鲜菇芝士焗面条的做法', '蘑菇香菇不仅营养丰富味道鲜美，还含有大量的蛋白质和氨基酸，以及多种维生素，且热能量相对较低，做成各种美食都是会受到大家欢迎的。', '主食', '40', '8', 'staple-food/Baked-noodles-with-fresh-mushroom-cheese.jpg', '');
INSERT INTO `menu` VALUES ('53', '火腿沙拉意面', '你说它是意面呢还是沙拉呢？合二为一，省时省力，重要滴是，好吃呀！', '主食', '40', '8', 'staple-food/Ham-salad-pasta.jpg', '');
INSERT INTO `menu` VALUES ('54', '牛扒意大利面', 'Steak-pasta', '主食', '40', '8', 'staple-food/Steak-pasta.jpg', '');
INSERT INTO `menu` VALUES ('55', '芝士焗通心粉', '加州，阳光，沙滩，美景与美食，一个不能少！', '主食', '40', '8', 'staple-food/Baked-macaroni-with-cheese.jpg', '');
INSERT INTO `menu` VALUES ('56', '奥尔良鸡腿披萨', '肉嫩，汁多，皮薄，热腾腾', '主食', '40', '8', 'staple-food/Orlean-Chicken-Pizza.jpg', '');
INSERT INTO `menu` VALUES ('57', '春日田园披萨', 'Spring-pizza', '主食', '40', '8', 'staple-food/Spring-pizza.jpg', '');
INSERT INTO `menu` VALUES ('58', '蔬菜培根披萨', '蔬菜培根披萨', '主食', '40', '8', 'staple-food/Vegetable-Bacon-pizza.jpg', '');
INSERT INTO `menu` VALUES ('59', '芝士焗饭', '芝士焗饭', '主食', '40', '8', 'staple-food/Baked-rice-with-cheese.jpg', '');
INSERT INTO `menu` VALUES ('60', '贝壳粉起司', '意大利通心粉煮好后口感劲道，自制白酱以及干酪的奶香味、罗勒特殊的香气混合一体，撒上面包屑焗一下，口感层次非常丰富。', '主食', '40', '8', 'staple-food/Shell-cheese.jpg', '');
INSERT INTO `menu` VALUES ('61', '吐司披萨', '吐司披萨', '主食', '40', '8', 'staple-food/Toast-pizza.jpg', '');
INSERT INTO `menu` VALUES ('62', '茄汁焗饭', 'Tomato-Baked-rice', '主食', '40', '8', 'staple-food/Tomato-Baked-ricea.jpg', '');
INSERT INTO `menu` VALUES ('63', '培根鸡肉卷', '配上酱汁，喜欢吃鸡胸肉来', '主食', '40', '8', 'staple-food/Bacon-chicken-rol.jpg', '');
INSERT INTO `menu` VALUES ('64', '意大利烟斗面', '这道偏西式的意面，采用黄油和培根搭配，好味道，好意面', '主食', '40', '8', 'staple-food/Italy-pipe-noodles.jpg', '');
INSERT INTO `menu` VALUES ('65', '蔓越莓华芙饼', '华夫饼，又叫窝夫、格子饼、格仔饼、压花蛋饼；是一种烤饼源于比利时，用专用的烤盘烤制。烤盘上下两面呈格子状，一凹一凸，把倒进去的面糊压出格子来。', '甜点', '40', '8', 'dessert/Cranberry-waffles.jpg', '');
INSERT INTO `menu` VALUES ('66', '樱花和果子', '樱花和果子', '甜点', '40', '8', 'dessert/Sakura-and-fruit.jpg', '');
INSERT INTO `menu` VALUES ('67', '樱花马卡龙', '樱花马卡龙', '甜点', '40', '8', 'dessert/Sakura-Macarons.jpg', '');
INSERT INTO `menu` VALUES ('68', '菠萝派', '菠萝派', '甜点', '40', '8', 'dessert/Pineapple-pie.jpg', '');
INSERT INTO `menu` VALUES ('69', '牧羊人派', '牧羊人派(Shepherd\'s pie)，又称为农舍派(cottage pie)，是英国的一种传统料理。它并不像西点中的派一样有酥皮，而是用土豆、肉类和蔬菜做的不含面粉的派，被当作主食。', '甜点', '40', '8', 'dessert/Shepherd-pie.jpg', '');
INSERT INTO `menu` VALUES ('70', '玫瑰苹果派', '玫瑰苹果派', '甜点', '40', '8', 'dessert/Rose-apple-pie.jpg', '');
INSERT INTO `menu` VALUES ('71', '草莓酸奶松饼', '草莓酸奶松饼', '甜点', '40', '8', 'dessert/Strawberry-yogurt-Muffin.jpg', '');
INSERT INTO `menu` VALUES ('72', '抹茶豆腐布丁', '配方中没有鸡蛋，只用奶油和鱼骨胶煮沸后放凉，结成果冻状后加水果等一起享用。', '甜点', '40', '8', 'dessert/Matcha-tofu-pudding.jpg', '');
INSERT INTO `menu` VALUES ('73', '杏仁樱桃小脆饼', '这个是一道意大利甜品，比较偏甜，硬脆型的小饼干', '甜点', '40', '8', 'dessert/Almond-cherry-crackers.jpg', '');
INSERT INTO `menu` VALUES ('74', '黑白双色巧克力慕斯', '黑与白，永恒的经典搭配!黑色，纯正的巧克力慕斯!厚重的味道，挑战你的味蕾!白色，却似那婀娜的少女，轻盈，恬淡!', '甜点', '40', '8', 'dessert/Black-and-white-chocolate-mousse.jpg', '');
INSERT INTO `menu` VALUES ('75', '卡士达泡芙', '卡士达泡芙外皮酥酥的，里面包裹的卡士达酱滑滑的，一口咬下去，外酥内滑，口感非常好，保准让你一口爱上它。', '甜点', '40', '8', 'dessert/Custard-puff.jpg', '');
INSERT INTO `menu` VALUES ('76', '木瓜酥皮派', '木瓜酥皮派', '甜点', '40', '8', 'dessert/Papaya-meringue-pie.jpg', '');
INSERT INTO `menu` VALUES ('77', '苹果脆塔', '苹果脆塔', '甜点', '40', '8', 'dessert/Apple-crisp-tower.jpg', '');
INSERT INTO `menu` VALUES ('78', '香梨煎饼', '香梨煎饼', '甜点', '40', '8', 'dessert/Fragrant-pear-pancake.jpg', '');
INSERT INTO `menu` VALUES ('79', '芝士布朗尼', '芝士布朗尼', '甜点', '40', '8', 'dessert/Cheesecake-Brownie.jpg', '');
INSERT INTO `menu` VALUES ('80', '溏心草莓慕司', '溏心草莓慕司', '甜点', '40', '8', 'dessert/Soft-strawberry-mousse.jpg', '');
INSERT INTO `menu` VALUES ('81', '阿拉棒', '阿拉棒', '甜点', '40', '8', 'dessert/Grissini.jpg', '');
INSERT INTO `menu` VALUES ('82', '玫瑰花酱林茨塔', '玫瑰花酱林茨塔', '甜点', '40', '8', 'dessert/Rose-sauce-Linz-tower.jpg', '');
INSERT INTO `menu` VALUES ('83', '百香果马卡龙', '百香果马卡龙', '甜点', '40', '8', 'dessert/Passionfruit-Macarons.jpg', '');
INSERT INTO `menu` VALUES ('84', '黑咖啡', '黑咖啡', '饮品', '40', '8', 'drink/black-coffee.jpg', '');
INSERT INTO `menu` VALUES ('85', '青柠苏打水', 'Lime-soda-water', '饮品', '40', '8', 'drink/Lime-soda-water.jpg', '');
INSERT INTO `menu` VALUES ('86', '苹果玫瑰醋', 'Apple-rose-vinegar', '饮品', '40', '8', 'drink/Apple-rose-vinegar.jpg', '');
INSERT INTO `menu` VALUES ('87', '圣诞红酒', 'Gluehwein是加热了的红酒，除了一般红酒的成分外，更增添了不同的风味，比如加入肉桂、蜂蜜、柠檬，以及水果等，令口味变化更多，人们在圣诞夜做完子夜弥撒后，也会马上喝一杯热乎乎的圣诞红酒来暖身，是个非常好喝保健的饮料', '饮品', '40', '8', 'drink/Mulled-Wine.jpg', '');
INSERT INTO `menu` VALUES ('88', '茄果梨冰饮', 'ced-fruit-and-pear-ice', '饮品', '40', '8', 'drink/ced-fruit-and-pear-ice.jpg', '');
INSERT INTO `menu` VALUES ('89', '菠萝木瓜汁', 'Pineapple-and-papaya-juice', '饮品', '40', '8', 'drink/Pineapple-and-papaya-juice.jpg', '');
INSERT INTO `menu` VALUES ('90', '巴西果蜂蜜饮', 'Brazil-fruit-honey-drink', '饮品', '40', '8', 'drink/Brazil-fruit-honey-drink.jpg', '');
INSERT INTO `menu` VALUES ('91', '香蕉咖啡奶茶', 'Banana-coffee-milk-tea', '饮品', '40', '8', 'drink/Banana-coffee-milk-tea.jpg', '');
INSERT INTO `menu` VALUES ('92', '花生豆奶', 'Peanut-soy-milk', '饮品', '40', '8', 'drink/Peanut-soy-milk.jpg', '');
INSERT INTO `menu` VALUES ('93', '草莓奶茶', 'Strawberry-Milk-Tea', '饮品', '40', '8', 'drink/Strawberry-Milk-Tea.jpg', '');
INSERT INTO `menu` VALUES ('94', '罗汉果五花茶', 'Momordica-grosvenori-Tea', '饮品', '40', '8', 'drink/Momordica-grosvenori-Tea.jpg', '');
INSERT INTO `menu` VALUES ('95', '银耳菠萝糖羹', '菠萝含有大量的果糖，葡萄糖，维生素A、B、C，磷，柠檬酸和蛋白酶等物。味甘性温，具有解暑止渴、消食止泻。饭后来碗银耳菠萝糖羹，有助于消化。', '饮品', '40', '8', 'drink/Silver-ear-pineapple-sugar-soup.jpg', '');
INSERT INTO `menu` VALUES ('96', '石斛香瓜汁', '石斛，滋养阴经、增强体质、强壮筋骨。石斛香瓜汁融入了香瓜的香甜和牛油果的顺滑，是非常美味的一款药膳类饮品。', '饮品', '40', '8', 'drink/Dendrobius-melon-juice.jpg', '');
INSERT INTO `menu` VALUES ('97', '牛油果养乐多奶昔', '用牛油果和养乐多搅打均匀后成奶昔，味道一级棒！', '饮品', '40', '8', 'drink/avocado-Yakult-milk-shake.jpg', '');
INSERT INTO `menu` VALUES ('98', '香蕉奶昔', '感香浓幼滑、营养丰富、IQ益智美食', '饮品', '40', '8', 'drink/banana-milkshake.jpg', '');
INSERT INTO `menu` VALUES ('99', '葡萄菠萝蜜奶', '葡萄菠萝蜜奶', '饮品', '40', '8', 'drink/Grape-jackfruit-milk.jpg', '');
INSERT INTO `menu` VALUES ('100', '芒果酸奶', '芒果酸奶', '饮品', '40', '8', 'drink/Mango-Lassi.jpg', '');
INSERT INTO `menu` VALUES ('101', '格兰诺拉酸奶杯', 'The-granola-yogurt-cup', '饮品', '40', '8', 'drink/The-granola-yogurt-cup.jpg', '');
INSERT INTO `menu` VALUES ('102', '桑格利亚鸡尾酒', '桑格利亚（sangría）是西班牙的一种汽酒，也是西班牙的国酒，适宜冰冻饮用，口感稍甜。该酒继承了费城葡萄酒的精神。', '饮品', '40', '8', 'drink/Sangria-Cocktail.jpeg', '');
INSERT INTO `menu` VALUES ('103', '水果风味醋饮', '水果风味醋饮', '饮品', '40', '8', 'drink/Fruit-flavors-vinegar.jpg', '');
INSERT INTO `menu` VALUES ('104', '无花果养颜茶', '玫瑰花具有比较强的活血散瘀的功效，干苹果花功效:温润、舒缓、帮助消化等，干千日红可以治疗头痛风、尿道不畅等疾病，尤其是对慢性气管炎等病症有很好地针对治疗作用，干迷迭香可提神醒脑，祛斑除皱。无花果干能够起到健胃清肠、清热解毒的作用。', '饮品', '40', '8', 'drink/Figs-for-tea.jpg', '');
INSERT INTO `menu` VALUES ('105', '金桔酒', '金桔是很好的自然保健食品，可预防色素沉淀、增进皮肤光泽与弹性、减缓衰老、避免肌肤松弛生皱。食用酒是一种保健饮料，能促进血液循环，通经活络，祛风湿。金桔酒更是浓缩成了精华，有着很好的化痰止咳、开胃健脾的功效。', '饮品', '40', '8', 'drink/Kumquat-wine.jpg', '');
INSERT INTO `menu` VALUES ('106', '山楂陈皮饮', '陈皮和山楂都是中药,它们之间没有配伍禁忌,陈皮属于理气药,味辛,苦,性温,归脾肺经,具有理气,调中,燥湿,化痰的作用;山楂是消食类药,味酸,甘,性微温,归脾.胃,肝经.具有消食化积,活血散瘀的功效.', '饮品', '40', '8', 'drink/Chinese hawthorn wine.jpg', '');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `timeConsuming` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `imgurl` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', '西柚牛油果沙拉', '一款西柚牛油果沙拉是女性养颜美容果，即美味又零负担哦~常吃能丰富蛋白质和维生素，提高免疫力，是家人健康养生水果~', '沙拉', '38.00', '5', 'sala/Grapefruit-salad.jpg', '');
INSERT INTO `products` VALUES ('2', '牛油果蔬菜沙拉', '天气越来越热，又是各种沙拉当道的季节，赏心悦目的搭配，富含丰富营养，就是这道清新的牛油果蔬菜沙拉，沙拉中更是添加了富含亚麻酸的亚麻籽油，为这道菜的营养美味加分。', '沙拉', '58.00', '5', 'sala/Avocado-salad.jpg', '');
INSERT INTO `products` VALUES ('3', '干果沙拉', '简单又健康的干果沙拉，做起来一点也不费力，喜欢的亲们可以试试哦~干果除了做饼干、做蒸糕、或直接当零食，原来搭配胡萝卜和玉米做成沙拉也很好吃，嚼起来很有层次感。', '沙拉', '38.00', '5', 'sala/Dried-fruit-salad.jpg', '');
INSERT INTO `products` VALUES ('4', '缤纷金枪鱼沙拉', '吞拿鱼沙拉是一道口味鲜美的家常菜，主要食材是黄瓜。', '沙拉', '58.00', '5', 'sala/Colorful-tuna-salad.jpg', '');
INSERT INTO `products` VALUES ('5', '酸奶杂果沙拉', '西式饮食怎可以少了沙拉这一道，懒点的人可以用酸奶拌水果，快捷简便，易上手，外面卖的凝固型酸奶带甜味，可中和过酸或味淡的水果，非常好吃开胃。', '沙拉', '38.00', '5', 'sala/Yogurt-mixed-fruit-salad.jpg', '');
INSERT INTO `products` VALUES ('6', '大虾沙拉', '春天来了，脱下厚重的冬装，发现腰围大了一大圈。晚上吃这道清爽的沙拉，可以控制一下热量。', '沙拉', '58.00', '5', 'sala/prawn-salad.jpg', '');
INSERT INTO `products` VALUES ('7', '普罗旺斯海鲜沙拉', '多样的香料、丰富的蔬果、新鲜的海鲜、橄榄油与大蒜，构成了普罗旺斯料理的特色，再搭配当地产的优质葡萄酒，组合成了食客的天堂', '沙拉', '58.00', '5', 'sala/Provence-seafood-salad.jpg', '');
INSERT INTO `products` VALUES ('8', '什蔬鲜虾沙拉', '这款沙拉是很西式的做法，虽然食材都常见，但偏西式的调料却能做出不一样的味道。我们不常吃橄榄油，第一口吃的时候会觉得味道怪怪的，但越吃就觉得越好吃，回味无穷的感觉！', '沙拉', '38.00', '5', 'sala/Veggie-Fresh-shrimp-salad.jpg', '');
INSERT INTO `products` VALUES ('9', '夏日风情沙拉', '夏日风情沙拉', '沙拉', '58.00', '5', 'sala/Summer-Featured-Salad.jpg', '');
INSERT INTO `products` VALUES ('10', '芒果沙拉', '芒果沙拉', '沙拉', '38.00', '5', 'sala/Mango-Salad.jpg', '');
INSERT INTO `products` VALUES ('11', '芝士虾球', '「膳小姐 | 芝士虾球」的做法', '小吃', '20.00', '5', 'snack/Cheese-Shrimp-balls.jpg', '');
INSERT INTO `products` VALUES ('12', '薯条', '以后不用特意跑去麦某劳吃薯条', '小吃', '21.00', '5', 'snack/french-fries.jpg', '');
INSERT INTO `products` VALUES ('13', '芝士焗土豆泥', '芝士焗土豆泥', '小吃', '22.00', '6', 'snack/Baked-mashed-potatoes-with-cheese.jpg', '');
INSERT INTO `products` VALUES ('14', '土豆培根奶酪球', '奶酪是含钙最多的奶制品，能促进代谢，增强活力，保护眼睛健康并保持肌肤健美。奶酪中的脂肪和热能都比较多，但是其胆固醇含量却比较低，对心血管健康也有有利的一面', '小吃', '22.00', '5', 'snack/Potato-bacon-cheesecake.jpg', '');
INSERT INTO `products` VALUES ('15', '金沙番茄', '金沙番茄', '小吃', '23.00', '5', 'snack/Sands-of-tomatoes.jpg', '');
INSERT INTO `products` VALUES ('16', '肉汁脆皮小土豆', '加入黄油和肉汤来炖煮小豆土，让黄油和肉汤的味道充分渗透到土豆里，使土豆更香浓绵软。再利用剩余的油脂煎香小土豆，混杂着孜然、辣椒和黑椒三种香料，使土豆外皮香脆、内里绵软，好吃得停不下来。', '小吃', '22.00', '5', 'snack/Crispy-potato-with-gravy.jpg', '');
INSERT INTO `products` VALUES ('17', '香酥鱿鱼圈', '用牛奶泡过的鱿鱼圈外酥里嫩，口感超棒。', '小吃', '22.00', '5', 'snack/Spiced-squid-circle.jpg', '');
INSERT INTO `products` VALUES ('18', '鲜虾天妇罗', '鲜虾天妇罗', '小吃', '22.00', '5', 'snack/Shrimp-Tempura.jpg', '');
INSERT INTO `products` VALUES ('19', '芝士焗马铃薯', '芝士焗马铃薯', '小吃', '23.00', '5', 'snack/Baked-potato-with-cheese.jpg', '');
INSERT INTO `products` VALUES ('20', '拿破里肉酱', '拿破里肉酱', '小吃', '24.00', '6', 'snack/Napoli-Meat-sauce.jpg', '');
INSERT INTO `products` VALUES ('21', '木瓜籽煎西冷牛扒', '肉质鲜嫩多汁，有弹性，略有嚼劲，我还特别用了木瓜籽来软化牛肉，成品带有淡淡的果香，非常美味，煎的时候可以去掉木瓜籽', '主菜', '25.00', '7', 'main-course/Fried-papaya-seeds-Fried-west-cold-steak.jpg', '');
INSERT INTO `products` VALUES ('22', '意大利香草鸭腿', '意大利香草鸭腿', '主菜', '26.00', '8', 'main-course/Italian-vanilla-duck-leg.jpg', '');
INSERT INTO `products` VALUES ('23', '迷迭香煎三文鱼', '亚麻籽油富含多不饱和脂肪酸α亚麻酸，有“健康素鱼油”之称。配上含omega-3不饱和脂肪酸三文鱼，健康、美味双丰收。这道菜有调节血脂、保护心脏、防止老化等功效。', '主菜', '27.00', '8', 'main-course/Rosemary-Fried-salmon.jpg', '');
INSERT INTO `products` VALUES ('24', '牛排第二定律', '低温烹饪，是近年西方厨房的一个潮流。一来烟少了，pm2.5就降低了；二来更能保持食物的营养。', '主菜', '28.00', '8', 'main-course/The-second-law-of-steak.jpg', '');
INSERT INTO `products` VALUES ('25', '八角茴香火烧鲷鱼', '八角又称大料，中国人常用来炖肉、制卤等。口语里有时会简称为茴香，但事实上除了气味相似之外，八角茴香与茴香(fennel)并无血缘关系。尽管是土生土长的中国香料，法国人却也亦爱食八角的香气，这道八角茴香火烧鲷鱼便是一个例子。', '主菜', '29.00', '8', 'main-course/The-star-anise-on-fire-snapper.jpg', '');
INSERT INTO `products` VALUES ('26', '奶油芝士焗龙虾', '正宗奶油芝士焗龙虾', '主菜', '30.00', '8', 'main-course/Roasted-lobster-with-cream-cheese.jpg', '');
INSERT INTO `products` VALUES ('27', '红酒柠檬虾', '红酒柠檬虾', '主菜', '31.00', '8', 'main-course/Red-wine-lemon-shrimp.jpg', '');
INSERT INTO `products` VALUES ('28', '法式香煎龙利鱼', '龙利鱼营养丰富，低胆固醇，又没有刺', '主菜', '32.00', '8', 'main-course/French-Fried-dragon-fish.jpeg', '');
INSERT INTO `products` VALUES ('29', '红酒黑椒牛排', '红酒中含的酚类物质，可以解腻。红酒中的单宁与红肉中的蛋白质相结合，可以很好的促进消化。', '主菜', '33.00', '8', 'main-course/Red-wine-black-pepper-steak.jpeg', '');
INSERT INTO `products` VALUES ('30', '法式香煎鹅肝', '法式香煎鹅肝', '主菜', '34.00', '8', 'main-course/French-Fried-goose-liver.jpg', '');
INSERT INTO `products` VALUES ('31', '法式红酒烩鸡', '高贵冷艳镇场菜，逼格超高的法国料理', '主菜', '35.00', '8', 'main-course/Braised-chicken-with-French-wine.jpg', '');
INSERT INTO `products` VALUES ('32', '咖喱焗北极虾', '用咖喱的方法来做这个菜是非常非常棒的', '主菜', '36.00', '8', 'main-course/Curry-roasted-arctic-shrimp.jpg', '');
INSERT INTO `products` VALUES ('33', '起司千层猪排', '', '主菜', '37.00', '8', 'main-course/A-thousand-layers-of-pork-chop.jpg', '');
INSERT INTO `products` VALUES ('34', '烤虾扇贝', '烤虾扇贝', '主菜', '38.00', '8', 'main-course/Grilled-shrimp-scallops.jpg', '');
INSERT INTO `products` VALUES ('35', '春意小羊肘', '春意小羊肘', '主菜', '39.00', '8', 'main-course/Spring-means-little-lamb-elbow.jpg', '');
INSERT INTO `products` VALUES ('36', '火龙鱼', '火龙鱼', '主菜', '40.00', '8', 'main-course/red-port-fish.jpg', '');
INSERT INTO `products` VALUES ('37', '奶酪土豆浓汤', '冬天喝碗浓汤，全身暖暖的。', '汤品', '40.00', '8', 'main-course/Braised-chicken-with-French-wine.jpg', '');
INSERT INTO `products` VALUES ('38', '花椰菜奶酪汤', '打芝士又叫切达芝士。就是小时候动画片常看到的黄色芝士，也是麦当劳汉堡里那片黄色的芝士，车打芝士极具“全能性”，几乎可以取代所有的奶酪', '汤品', '40.00', '8', 'soup/Cauliflower-cheese-soup.jpg', '');
INSERT INTO `products` VALUES ('39', '海鲜浓汤', '爱与恨交织，辛与辣共存，漂泊数年，难悟人生之真谛', '汤品', '40.00', '8', 'soup/Clam-chowder.jpg', '');
INSERT INTO `products` VALUES ('40', '奶油南瓜浓汤', '南瓜富含维生素和锌，常食用能保护胃黏膜，并且具有防癌抗癌的功效，奶制品也是极具营养的食材之一，将二者结合制作出来的美食光凭着它们的营养价值就特别值得一试', '汤品', '40.00', '8', 'soup/Cream-Pumpkin-Soup.jpg', '');
INSERT INTO `products` VALUES ('41', '马赛鱼汤', '一种盛行于普罗旺斯地区的鱼汤类菜肴，最初源自马赛渔民将当日渔获炖作一锅的做法', '汤品', '40.00', '8', 'soup/bouillabaisse.jpg', '');
INSERT INTO `products` VALUES ('42', '奶油蘑菇汤', '奶油蘑菇汤是法式大餐中的一道经典浓汤，以白蘑菇为主料，辅以洋葱和动物淡奶油的香。蘑菇有增强免疫力的功能，是非常健康的食材。', '汤品', '40.00', '8', 'soup/Cream-of-Mushroom-Soup.jpg', '');
INSERT INTO `products` VALUES ('43', '番茄海鲜浓汤', 'Tomato-seafood-soup', '汤品', '40.00', '8', 'soup/Tomato-seafood-soup.jpg', '');
INSERT INTO `products` VALUES ('44', '法式洋葱汤', '/French-Onion-Soup', '汤品', '40.00', '8', 'soup/French-Onion-Soup.jpg', '');
INSERT INTO `products` VALUES ('45', '罗宋汤', 'Borsch', '汤品', '40.00', '8', 'soup/Borsch.jpg', '');
INSERT INTO `products` VALUES ('46', '花菜浓汤', 'cauliflower-soup', '汤品', '40.00', '8', 'soup/cauliflower-soup.jpg', '');
INSERT INTO `products` VALUES ('47', '西兰花牛奶浓汤', '一半的奶油一半的牛奶', '汤品', '40.00', '8', 'soup/Broccoli-and-milk-soup.jpg', '');
INSERT INTO `products` VALUES ('48', '牛肉海带汤', '牛肉海带汤', '汤品', '40.00', '8', 'soup/Beef-kelp-soup.jpg', '');
INSERT INTO `products` VALUES ('49', '肉酱意大利面', 'Spaghetti-bolognese', '主食', '40.00', '8', 'staple-food/Spaghetti-bolognese.jpg', '');
INSERT INTO `products` VALUES ('50', '意大利海鲜烩饭', '一道味道很好的意式烩饭', '主食', '40.00', '8', 'staple-food/seafood-risotto.jpg', '');
INSERT INTO `products` VALUES ('51', '土豆丝培根披萨', '美味可口的土豆丝披萨', '主食', '40.00', '8', 'staple-food/Bacon-pizza-wit-potato-chips.jpg', '');
INSERT INTO `products` VALUES ('52', '鲜菇芝士焗面条的做法', '蘑菇香菇不仅营养丰富味道鲜美，还含有大量的蛋白质和氨基酸，以及多种维生素，且热能量相对较低，做成各种美食都是会受到大家欢迎的。', '主食', '40.00', '8', 'staple-food/Baked-noodles-with-fresh-mushroom-cheese.jpg', '');
INSERT INTO `products` VALUES ('53', '火腿沙拉意面', '你说它是意面呢还是沙拉呢？合二为一，省时省力，重要滴是，好吃呀！', '主食', '40.00', '8', 'staple-food/Ham-salad-pasta.jpg', '');
INSERT INTO `products` VALUES ('54', '牛扒意大利面', 'Steak-pasta', '主食', '40.00', '8', 'staple-food/Steak-pasta.jpg', '');
INSERT INTO `products` VALUES ('55', '芝士焗通心粉', '加州，阳光，沙滩，美景与美食，一个不能少！', '主食', '40.00', '8', 'staple-food/Baked-macaroni-with-cheese.jpg', '');
INSERT INTO `products` VALUES ('56', '奥尔良鸡腿披萨', '肉嫩，汁多，皮薄，热腾腾', '主食', '40.00', '8', 'staple-food/Orlean-Chicken-Pizza.jpg', '');
INSERT INTO `products` VALUES ('57', '春日田园披萨', 'Spring-pizza', '主食', '40.00', '8', 'staple-food/Spring-pizza.jpg', '');
INSERT INTO `products` VALUES ('58', '蔬菜培根披萨', '蔬菜培根披萨', '主食', '40.00', '8', 'staple-food/Vegetable-Bacon-pizza.jpg', '');
INSERT INTO `products` VALUES ('59', '芝士焗饭', '芝士焗饭', '主食', '40.00', '8', 'staple-food/Baked-rice-with-cheese.jpg', '');
INSERT INTO `products` VALUES ('60', '贝壳粉起司', '意大利通心粉煮好后口感劲道，自制白酱以及干酪的奶香味、罗勒特殊的香气混合一体，撒上面包屑焗一下，口感层次非常丰富。', '主食', '40.00', '8', 'staple-food/Shell-cheese.jpg', '');
INSERT INTO `products` VALUES ('61', '吐司披萨', '吐司披萨', '主食', '40.00', '8', 'staple-food/Toast-pizza.jpg', '');
INSERT INTO `products` VALUES ('64', '意大利烟斗面', '这道偏西式的意面，采用黄油和培根搭配，好味道，好意面', '主食', '40.00', '8', 'staple-food/Italy-pipe-noodles.jpg', '');
INSERT INTO `products` VALUES ('65', '蔓越莓华芙饼', '华夫饼，又叫窝夫、格子饼、格仔饼、压花蛋饼；是一种烤饼源于比利时，用专用的烤盘烤制。烤盘上下两面呈格子状，一凹一凸，把倒进去的面糊压出格子来。', '甜点', '40.00', '8', 'dessert/Cranberry-waffles.jpg', '');
INSERT INTO `products` VALUES ('66', '樱花和果子', '樱花和果子', '甜点', '40.00', '8', 'dessert/Sakura-and-fruit.jpg', '');
INSERT INTO `products` VALUES ('67', '樱花马卡龙', '樱花马卡龙', '甜点', '40.00', '8', 'dessert/Sakura-Macarons.jpg', '');
INSERT INTO `products` VALUES ('68', '菠萝派', '菠萝派', '甜点', '40.00', '8', 'dessert/Pineapple-pie.jpg', '');
INSERT INTO `products` VALUES ('69', '牧羊人派', '牧羊人派(Shepherd\'s pie)，又称为农舍派(cottage pie)，是英国的一种传统料理。它并不像西点中的派一样有酥皮，而是用土豆、肉类和蔬菜做的不含面粉的派，被当作主食。', '甜点', '40.00', '8', 'dessert/Shepherd-pie.jpg', '');
INSERT INTO `products` VALUES ('70', '玫瑰苹果派', '玫瑰苹果派', '甜点', '40.00', '8', 'dessert/Rose-apple-pie.jpg', '');
INSERT INTO `products` VALUES ('71', '草莓酸奶松饼', '草莓酸奶松饼', '甜点', '40.00', '8', 'dessert/Strawberry-yogurt-Muffin.jpg', '');
INSERT INTO `products` VALUES ('72', '抹茶豆腐布丁', '配方中没有鸡蛋，只用奶油和鱼骨胶煮沸后放凉，结成果冻状后加水果等一起享用。', '甜点', '40.00', '8', 'dessert/Matcha-tofu-pudding.jpg', '');
INSERT INTO `products` VALUES ('73', '杏仁樱桃小脆饼', '这个是一道意大利甜品，比较偏甜，硬脆型的小饼干', '甜点', '40.00', '8', 'dessert/Almond-cherry-crackers.jpg', '');
INSERT INTO `products` VALUES ('74', '黑白双色巧克力慕斯', '黑与白，永恒的经典搭配!黑色，纯正的巧克力慕斯!厚重的味道，挑战你的味蕾!白色，却似那婀娜的少女，轻盈，恬淡!', '甜点', '40.00', '8', 'dessert/Black-and-white-chocolate-mousse.jpg', '');
INSERT INTO `products` VALUES ('75', '卡士达泡芙', '卡士达泡芙外皮酥酥的，里面包裹的卡士达酱滑滑的，一口咬下去，外酥内滑，口感非常好，保准让你一口爱上它。', '甜点', '40.00', '8', 'dessert/Custard-puff.jpg', '');
INSERT INTO `products` VALUES ('76', '木瓜酥皮派', '木瓜酥皮派', '甜点', '40.00', '8', 'dessert/Papaya-meringue-pie.jpg', '');
INSERT INTO `products` VALUES ('77', '苹果脆塔', '苹果脆塔', '甜点', '40.00', '8', 'dessert/Apple-crisp-tower.jpg', '');
INSERT INTO `products` VALUES ('78', '香梨煎饼', '香梨煎饼', '甜点', '40.00', '8', 'dessert/Fragrant-pear-pancake.jpg', '');
INSERT INTO `products` VALUES ('79', '芝士布朗尼', '芝士布朗尼', '甜点', '40.00', '8', 'dessert/Cheesecake-Brownie.jpg', '');
INSERT INTO `products` VALUES ('80', '溏心草莓慕司', '溏心草莓慕司', '甜点', '40.00', '8', 'dessert/Soft-strawberry-mousse.jpg', '');
INSERT INTO `products` VALUES ('81', '阿拉棒', '阿拉棒', '甜点', '40.00', '8', 'dessert/Grissini.jpg', '');
INSERT INTO `products` VALUES ('82', '玫瑰花酱林茨塔', '玫瑰花酱林茨塔', '甜点', '40.00', '8', 'dessert/Rose-sauce-Linz-tower.jpg', '');
INSERT INTO `products` VALUES ('83', '百香果马卡龙', '百香果马卡龙', '甜点', '40.00', '8', 'dessert/Passionfruit-Macarons.jpg', '');
INSERT INTO `products` VALUES ('84', '黑咖啡', '黑咖啡', '饮品', '40.00', '8', 'drink/black-coffee.jpg', '');
INSERT INTO `products` VALUES ('85', '青柠苏打水', 'Lime-soda-water', '饮品', '40.00', '8', 'drink/Lime-soda-water.jpg', '');
INSERT INTO `products` VALUES ('86', '苹果玫瑰醋', 'Apple-rose-vinegar', '饮品', '40.00', '8', 'drink/Apple-rose-vinegar.jpg', '');
INSERT INTO `products` VALUES ('87', '圣诞红酒', 'Gluehwein是加热了的红酒，除了一般红酒的成分外，更增添了不同的风味，比如加入肉桂、蜂蜜、柠檬，以及水果等，令口味变化更多，人们在圣诞夜做完子夜弥撒后，也会马上喝一杯热乎乎的圣诞红酒来暖身，是个非常好喝保健的饮料', '饮品', '40.00', '8', 'drink/Mulled-Wine.jpg', '');
INSERT INTO `products` VALUES ('88', '茄果梨冰饮', 'ced-fruit-and-pear-ice', '饮品', '40.00', '8', 'drink/ced-fruit-and-pear-ice.jpg', '');
INSERT INTO `products` VALUES ('89', '菠萝木瓜汁', 'Pineapple-and-papaya-juice', '饮品', '40.00', '8', 'drink/Pineapple-and-papaya-juice.jpg', '');
INSERT INTO `products` VALUES ('90', '巴西果蜂蜜饮', 'Brazil-fruit-honey-drink', '饮品', '40.00', '8', 'drink/Brazil-fruit-honey-drink.jpg', '');
INSERT INTO `products` VALUES ('93', '草莓奶茶', 'Strawberry-Milk-Tea', '饮品', '40.00', '8', 'drink/Strawberry-Milk-Tea.jpg', '');
INSERT INTO `products` VALUES ('94', '罗汉果五花茶', 'Momordica-grosvenori-Tea', '饮品', '40.00', '8', 'drink/Momordica-grosvenori-Tea.jpg', '');
INSERT INTO `products` VALUES ('95', '银耳菠萝糖羹', '菠萝含有大量的果糖，葡萄糖，维生素A、B、C，磷，柠檬酸和蛋白酶等物。味甘性温，具有解暑止渴、消食止泻。饭后来碗银耳菠萝糖羹，有助于消化。', '饮品', '40.00', '8', 'drink/Silver-ear-pineapple-sugar-soup.jpg', '');
INSERT INTO `products` VALUES ('96', '石斛香瓜汁', '石斛，滋养阴经、增强体质、强壮筋骨。石斛香瓜汁融入了香瓜的香甜和牛油果的顺滑，是非常美味的一款药膳类饮品。', '饮品', '40.00', '8', 'drink/Dendrobius-melon-juice.jpg', '');
INSERT INTO `products` VALUES ('97', '牛油果养乐多奶昔', '用牛油果和养乐多搅打均匀后成奶昔，味道一级棒！', '饮品', '40.00', '8', 'drink/avocado-Yakult-milk-shake.jpg', '');
INSERT INTO `products` VALUES ('98', '香蕉奶昔', '感香浓幼滑、营养丰富、IQ益智美食', '饮品', '40.00', '8', 'drink/banana-milkshake.jpg', '');
INSERT INTO `products` VALUES ('99', '葡萄菠萝蜜奶', '葡萄菠萝蜜奶', '饮品', '40.00', '8', 'drink/Grape-jackfruit-milk.jpg', '');
INSERT INTO `products` VALUES ('100', '芒果酸奶', '芒果酸奶', '饮品', '40.00', '8', 'drink/Mango-Lassi.jpg', '');
INSERT INTO `products` VALUES ('101', '格兰诺拉酸奶杯', 'The-granola-yogurt-cup', '饮品', '40.00', '8', 'drink/The-granola-yogurt-cup.jpg', '');
INSERT INTO `products` VALUES ('102', '桑格利亚鸡尾酒', '桑格利亚（sangría）是西班牙的一种汽酒，也是西班牙的国酒，适宜冰冻饮用，口感稍甜。该酒继承了费城葡萄酒的精神。', '饮品', '40.00', '8', 'drink/Sangria-Cocktail.jpeg', '');
INSERT INTO `products` VALUES ('103', '水果风味醋饮', '水果风味醋饮', '饮品', '40.00', '8', 'drink/Fruit-flavors-vinegar.jpg', '');
INSERT INTO `products` VALUES ('104', '无花果养颜茶', '玫瑰花具有比较强的活血散瘀的功效，干苹果花功效:温润、舒缓、帮助消化等，干千日红可以治疗头痛风、尿道不畅等疾病，尤其是对慢性气管炎等病症有很好地针对治疗作用，干迷迭香可提神醒脑，祛斑除皱。无花果干能够起到健胃清肠、清热解毒的作用。', '饮品', '40.00', '8', 'drink/Figs-for-tea.jpg', '');
INSERT INTO `products` VALUES ('105', '金桔酒', '金桔是很好的自然保健食品，可预防色素沉淀、增进皮肤光泽与弹性、减缓衰老、避免肌肤松弛生皱。食用酒是一种保健饮料，能促进血液循环，通经活络，祛风湿。金桔酒更是浓缩成了精华，有着很好的化痰止咳、开胃健脾的功效。', '饮品', '40.00', '8', 'drink/Kumquat-wine.jpg', '');
