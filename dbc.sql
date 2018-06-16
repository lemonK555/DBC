/*
MySQL Data Transfer
Source Host: localhost
Source Database: dbc
Target Host: localhost
Target Database: dbc
Date: 2018/1/16 21:12:16
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryId` int(5) NOT NULL,
  `categoryName` char(20) DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collectId` int(5) NOT NULL AUTO_INCREMENT,
  `userName` varchar(15) DEFAULT NULL,
  `productId` int(20) DEFAULT NULL,
  `collectInTime` datetime DEFAULT NULL,
  PRIMARY KEY (`collectId`),
  KEY `collectProductId` (`productId`),
  KEY `collectUserName` (`userName`),
  CONSTRAINT `collectProductId` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  CONSTRAINT `collectUserName` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for marketcart
-- ----------------------------
DROP TABLE IF EXISTS `marketcart`;
CREATE TABLE `marketcart` (
  `marketCartId` int(10) NOT NULL AUTO_INCREMENT,
  `userCookId` varchar(25) NOT NULL,
  `productId` int(20) DEFAULT NULL,
  `userName` varchar(15) DEFAULT NULL,
  `marketProductNum` int(5) DEFAULT NULL,
  `marketProductPrice` double(5,2) DEFAULT NULL,
  `marketInTime` datetime DEFAULT NULL,
  `marketReTime` datetime DEFAULT NULL,
  PRIMARY KEY (`marketCartId`,`userCookId`),
  KEY `marketUserID` (`userName`),
  KEY `marketProductId` (`productId`),
  KEY `userCookId` (`userCookId`),
  CONSTRAINT `marketProductId` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist` (
  `orderId` int(10) NOT NULL AUTO_INCREMENT,
  `productId` int(15) DEFAULT NULL,
  `userName` varchar(15) DEFAULT NULL,
  `userCookId` varchar(25) DEFAULT NULL,
  `orderPrice` double(5,2) DEFAULT NULL,
  `orderUserRealName` varchar(20) DEFAULT NULL,
  `orderUserAddress` varchar(50) DEFAULT NULL,
  `orderUserMobil` varchar(11) DEFAULT NULL,
  `orderReTime` datetime DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `orderUserId` (`userName`),
  KEY `userCookId` (`userCookId`),
  KEY `orderProductId` (`productId`),
  CONSTRAINT `orderProductId` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  CONSTRAINT `userCookId` FOREIGN KEY (`userCookId`) REFERENCES `marketcart` (`userCookId`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `PID` int(10) NOT NULL AUTO_INCREMENT,
  `picId` char(10) DEFAULT NULL,
  `picName` varchar(30) DEFAULT NULL,
  `picFunctionName` varchar(30) DEFAULT NULL,
  `picAddress` char(20) DEFAULT NULL,
  `picIsChecked` tinyint(2) DEFAULT NULL,
  `picReTime` datetime DEFAULT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productId` int(20) NOT NULL AUTO_INCREMENT,
  `productImgId` int(10) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `productKeys` varchar(40) DEFAULT NULL,
  `productDescription` varchar(100) DEFAULT NULL,
  `productPriceUser` double(10,2) DEFAULT NULL,
  `productIsVouch` tinyint(2) DEFAULT NULL,
  `productHits` int(10) DEFAULT NULL,
  `productReviews` int(10) DEFAULT NULL,
  `productOrderNum` int(10) DEFAULT NULL,
  `productBuyNum` int(10) DEFAULT NULL,
  `productInTime` datetime DEFAULT NULL,
  `categoryId` int(5) NOT NULL,
  `productReTime` datetime DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `categoryID` (`categoryId`),
  KEY `productImgId` (`productImgId`),
  CONSTRAINT `categoryID` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`),
  CONSTRAINT `productImgId` FOREIGN KEY (`productImgId`) REFERENCES `picture` (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` int(15) NOT NULL AUTO_INCREMENT,
  `vipID` int(3) DEFAULT NULL,
  `userName` varchar(15) DEFAULT NULL,
  `userPwd` varchar(20) DEFAULT NULL,
  `userRealName` varchar(20) DEFAULT NULL,
  `userSex` char(5) DEFAULT NULL,
  `userBirthday` date DEFAULT NULL,
  `userMobile` varchar(11) DEFAULT NULL,
  `userEmail` varchar(30) DEFAULT NULL,
  `userPoint` int(20) DEFAULT NULL,
  `userCreatTime` date DEFAULT NULL,
  `userBlackList` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  KEY `vipID` (`vipID`),
  KEY `userName` (`userName`),
  CONSTRAINT `vipID` FOREIGN KEY (`vipID`) REFERENCES `vip` (`vipID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000060 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `vipID` int(3) NOT NULL,
  `vipName` char(10) DEFAULT NULL,
  `vipPer` double(5,2) DEFAULT NULL,
  PRIMARY KEY (`vipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `category` VALUES ('1001', '普通');
INSERT INTO `category` VALUES ('1002', '热门');
INSERT INTO `category` VALUES ('1003', 'TOP');
INSERT INTO `category` VALUES ('1004', '新品');
INSERT INTO `category` VALUES ('1005', '欢迎');
INSERT INTO `collect` VALUES ('1', 'dbcM_001', '10', '2018-01-10 17:14:37');
INSERT INTO `collect` VALUES ('4', '一颗两颗糖丶', '8', '2018-01-15 18:13:30');
INSERT INTO `collect` VALUES ('5', '我们的演绎_', '2', '2018-01-15 19:42:18');
INSERT INTO `collect` VALUES ('10', '我们的演绎_', '1', '2018-01-16 20:33:50');
INSERT INTO `collect` VALUES ('12', '万里长征啊啊', '1', '2018-01-16 20:51:42');
INSERT INTO `collect` VALUES ('13', '万里长征啊啊', '8', '2018-01-16 20:52:05');
INSERT INTO `collect` VALUES ('15', '万里长征啊啊啊', '8', '2018-01-16 20:57:15');
INSERT INTO `marketcart` VALUES ('9', '1我们的演绎_', '1', '我们的演绎_', '1', '20.00', '2018-01-16 20:33:48', '2018-01-16 20:33:48');
INSERT INTO `marketcart` VALUES ('10', '10我们的演绎_', '10', '我们的演绎_', '1', '20.00', '2018-01-16 20:34:16', '2018-01-16 20:34:16');
INSERT INTO `orderlist` VALUES ('4', '1', '我们的演绎_', '9我们的演绎_', '70.00', '卢柯洁', '西南财经大学天府学院', '12315', '2018-01-13 17:40:53');
INSERT INTO `orderlist` VALUES ('62', '8', '万里长征啊啊啊', '8万里长征啊啊啊', '58.00', '卢柯洁', '西财天府', '12315', '2018-01-16 20:58:06');
INSERT INTO `picture` VALUES ('3', 'l00002', '冷吃兔', 'hot', 'rabbit.jpg', '0', '2018-01-15 16:26:09');
INSERT INTO `picture` VALUES ('5', 'l00003', '龚扇', 'show', 'shan.jpg', '0', '2018-01-09 23:36:28');
INSERT INTO `picture` VALUES ('6', 'l00005', '火边子牛肉', 'hot', 'hotBeef.jpg', '0', '2018-01-07 21:00:15');
INSERT INTO `picture` VALUES ('8', 'l00001', '富顺豆花蘸水', 'hot', 'tofu.jpg', '0', '2018-01-15 13:45:09');
INSERT INTO `picture` VALUES ('10', 'l00007', '冷吃兔-欢迎图', 'welcome', 'rabbitTop.jpg', '1', '2018-01-09 21:58:35');
INSERT INTO `picture` VALUES ('12', 'l00010', '冷吃牛肉', 'hot', 'beef.jpg', '1', '2018-01-15 13:47:35');
INSERT INTO `picture` VALUES ('13', 'l00011', '冷吃掌中宝', 'welcome', 'baoWelcome.jpg', '1', '2018-01-16 15:58:02');
INSERT INTO `picture` VALUES ('14', 'l00012', '冷吃兔腿', 'show', 'jitui.jpg', '0', '2018-01-15 13:33:11');
INSERT INTO `picture` VALUES ('15', 'biu', '燊海井', 'welcome', 'welcome.jpg', '0', '2018-01-16 15:55:13');
INSERT INTO `product` VALUES ('1', '3', '冷吃兔', '肉兔，麻辣焦香', '四川自贡特色小吃，送礼佳品', '20.00', '1', '10', '0', '3', '0', '2018-01-15 00:00:00', '1002', '2018-01-15 17:45:47');
INSERT INTO `product` VALUES ('2', '6', '火边子牛肉', '牛肉，薄脆', '四川自贡特色小吃，送礼佳品', '30.00', '1', '5', '0', '3', '0', '2018-01-15 00:00:00', '1002', '2018-01-15 17:56:52');
INSERT INTO `product` VALUES ('7', '5', '龚扇', '自贡小三绝之一', '竹制品，已经有100多年历史', '99999.00', '0', '2', '0', '0', '0', '2018-01-09 23:48:54', '1001', '2018-01-09 23:48:54');
INSERT INTO `product` VALUES ('8', '8', '富顺豆花蘸水', '豆腐 蘸水 辣', '给平淡的豆腐增添一抹美味', '29.00', '1', '7', '0', '2', '0', '2018-01-15 23:50:41', '1002', '2018-01-15 17:57:02');
INSERT INTO `product` VALUES ('9', '12', '冷吃牛肉', '牛肉，嚼劲', '正宗自贡特产，原材料都是新鲜牛肉加上五香料制作而成。', '35.00', '0', '29', '0', '2', '0', '2018-01-10 14:19:46', '1002', '2018-01-10 14:19:46');
INSERT INTO `product` VALUES ('10', '13', '冷吃掌中宝', '掌中宝', '肉质饱满有嚼劲，色香味俱全', '20.00', '1', '4', '0', '10', '0', '2018-01-16 14:23:06', '1005', '2018-01-16 15:57:25');
INSERT INTO `product` VALUES ('11', '14', '冷吃兔腿', '兔 辣椒', '辣椒香味与兔肉的完美结合', '10.00', '0', '2', '0', '5', '0', '2018-01-15 14:50:24', '1001', '2018-01-15 17:57:22');
INSERT INTO `product` VALUES ('17', '3', '冷吃兔首页', '兔兔', '好吃', '26.00', '0', '0', '0', '0', '0', '2018-01-15 18:12:36', '1005', '2018-01-15 19:45:05');
INSERT INTO `user` VALUES ('1000000', '1000', 'LKJ', '123', 'LKJ', '女', '1997-09-23', null, '111', '0', '2017-12-01', '1');
INSERT INTO `user` VALUES ('1000001', '1000', 'dbcM_001', 'lkjkkkkk', '卢柯洁', '女', '1997-09-23', '17777775581', '932684335@qq.com', '60', '2017-12-15', '0');
INSERT INTO `user` VALUES ('1000044', '1000', '狗爪爪ztzt', '12345678', 'ZT', '男', '1996-11-10', '15115115115', '999@qq.com', '0', '2017-11-22', '0');
INSERT INTO `user` VALUES ('1000045', '1000', 'gouzhauzhua', 'input0923!', 'zt', '男', '1996-10-16', '12345678901', '3037988799@qq.com', '0', '2017-11-22', '0');
INSERT INTO `user` VALUES ('1000047', '1000', '111111', '11111111', 'aa', '女', '2017-05-19', '0.0', '999@qq.com', '0', '2017-12-01', '1');
INSERT INTO `user` VALUES ('1000048', '1000', '一颗两颗糖丶', 'lkjkkkkk', '卢柯洁', '女', '2010-02-14', '17744445581', '999@qq.com', '190', '2018-01-04', '0');
INSERT INTO `user` VALUES ('1000049', '1000', '我们的演绎_', 'lkjkkkkk', '发任务', '男', '1999-01-13', '12345678901', '999@qq.com', '2352', '2018-01-04', '0');
INSERT INTO `user` VALUES ('1000058', '1000', '万里长征啊啊', 'lkjkkkkk', '了jog', '男', '2003-03-08', '11111111111', '999@qq.com', '89', '2018-01-16', '0');
INSERT INTO `user` VALUES ('1000059', '1000', '万里长征啊啊啊', 'lkjkkkkk', '卢柯洁', '男', '2004-03-10', '11111112222', '999@qq.com', '58', '2018-01-16', '0');
INSERT INTO `vip` VALUES ('1000', '普通会员', '1.00');
INSERT INTO `vip` VALUES ('1001', '黄铜会员', '0.98');
