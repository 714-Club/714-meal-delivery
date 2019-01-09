/*
 Navicat MySQL Data Transfer

 Source Server         : id1
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : foodweb

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 09/01/2019 20:50:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cus_address
-- ----------------------------
DROP TABLE IF EXISTS `cus_address`;
CREATE TABLE `cus_address`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cusid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cusid`(`cusid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cus_address
-- ----------------------------
INSERT INTO `cus_address` VALUES ('00e96f5ca2a54ffb9565e002e329f918', '00e96f5ca2a54ffb9565e002e329f919', '韶关市浈江区', '1234', '和日系');
INSERT INTO `cus_address` VALUES ('73c75669e4504da7aadf977478497ca9', '00e96f5ca2a54ffb9565e002e329f919', '浈江区新韶镇韶关学院', '12324235', '朱永乐');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `foodkey` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('00e96f5ca2a54ffb9565e002e329f919', 'asd', 'asd', 'asd', 0);
INSERT INTO `customer` VALUES ('83f5aef2dca84772a503bf5eadb4076a', 'sdf', 'asd', 'sdf', 0);
INSERT INTO `customer` VALUES ('e2a4b8c50dfc407fa7d1dad2c225e9b4', 'bbb', 'bbb', 'bbbb', 0);
INSERT INTO `customer` VALUES ('f5780c30977344bf90b5467f34407529', 'dfg', 'dfg', 'dfg', 0);

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shopid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `direction` int(5) NULL DEFAULT 0,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` int(11) NULL DEFAULT 0,
  `status` int(2) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `shopid`(`shopid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('3fdba2d69aa144a789ac477d175c7b63', '1db7656a6bb14832b7d1bf487e754a6f', '饺子', 0, '/foodweb/upload/good/3fdba2d69aa144a789ac477d175c7b63.jpg', 12, 1);
INSERT INTO `good` VALUES ('479b0b5c5dc143e3bff24bdd336d5b62', '0af6f1442b264eda919ef48179d0ce60', '炒面', 0, '/foodweb/upload/good/479b0b5c5dc143e3bff24bdd336d5b62.jpg', 8, 1);
INSERT INTO `good` VALUES ('a4636b1e347146aa975985ab0475c6c1', '1db7656a6bb14832b7d1bf487e754a6f', '炸鸡', 0, '/foodweb/upload/good/a4636b1e347146aa975985ab0475c6c1.jpg', 8, 1);
INSERT INTO `good` VALUES ('a938fdb251cd468187a304572338312b', '0af6f1442b264eda919ef48179d0ce60', '啤酒', 3, '/foodweb/upload/good/a938fdb251cd468187a304572338312b.jpg', 10, 1);
INSERT INTO `good` VALUES ('c4e1ee2809a14aa6b940328f99e5b268', '1db7656a6bb14832b7d1bf487e754a6f', '三杯鸡', 0, '/foodweb/upload/good/c4e1ee2809a14aa6b940328f99e5b268.jpg', 15, 1);
INSERT INTO `good` VALUES ('dd3c73a2c8714fed968745893091679d', '0af6f1442b264eda919ef48179d0ce60', '芬达', 3, '/foodweb/upload/good/dd3c73a2c8714fed968745893091679d.jpg', 3, 1);
INSERT INTO `good` VALUES ('e165c9d49b764600a5b347160bd33b04', '1db7656a6bb14832b7d1bf487e754a6f', '麻婆豆腐', 0, '/foodweb/upload/good/e165c9d49b764600a5b347160bd33b04.gif', 8, 1);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shopid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `updatetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `motto` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` int(2) NULL DEFAULT 0,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updatetime` datetime(0) NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `username`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('0af6f1442b264eda919ef48179d0ce60', '好又来大排档', '19019234', 'haoancome@163.com', '提前预约包场8折优惠', '韶关市浈江区大学路123号', '/foodweb/upload/shop/0af6f1442b264eda919ef48179d0ce60.jpg', 1, 'shop2', '1234', '2019-01-05 13:26:58', '2019-01-05 13:27:01');
INSERT INTO `shop` VALUES ('1db7656a6bb14832b7d1bf487e754a6f', '韶关风味小吃', '1777777', 'fengweixiaochi@163.com', '欢迎光临', '韶关市浈江区大学路111号', '/foodweb/upload/shop/1db7656a6bb14832b7d1bf487e754a6f.jpg', 1, 'shop1', '1234', '2018-12-05 20:45:09', '2018-12-05 20:45:11');

-- ----------------------------
-- Table structure for shoppingcar
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcar`;
CREATE TABLE `shoppingcar`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shopid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `cusid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shoppingcar
-- ----------------------------
INSERT INTO `shoppingcar` VALUES ('30207e79abd5449d986a0fa7b7c5bf16', '479b0b5c5dc143e3bff24bdd336d5b62', '0af6f1442b264eda919ef48179d0ce60', 1, '00e96f5ca2a54ffb9565e002e329f919');
INSERT INTO `shoppingcar` VALUES ('44e2c6aeeb6a47428b08c3d61f61f41c', 'c4e1ee2809a14aa6b940328f99e5b268', '1db7656a6bb14832b7d1bf487e754a6f', 4, '00e96f5ca2a54ffb9565e002e329f919');

SET FOREIGN_KEY_CHECKS = 1;
