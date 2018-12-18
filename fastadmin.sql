/*
 Navicat MySQL Data Transfer

 Source Server         : qq
 Source Server Type    : MySQL
 Source Server Version : 50557
 Source Host           : 118.24.119.49:3306
 Source Schema         : fastadmin

 Target Server Type    : MySQL
 Target Server Version : 50557
 File Encoding         : 65001

 Date: 18/12/2018 15:57:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `logintime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录时间',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `token` varchar(59) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
INSERT INTO `fa_admin` VALUES (1, 'admin', 'Admin', '075eaec83636846f51c152f29b98a2fd', 's4f3', '/assets/img/avatar.png', 'admin@fastadmin.net', 0, 1545093792, 1492186163, 1545093792, '51b1967d-eac8-4ffd-be64-b81ac4d58573', 'normal');

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 189 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_admin_log
-- ----------------------------
INSERT INTO `fa_admin_log` VALUES (1, 0, 'Unknown', '/admin/index/login.html', '', '{\"__token__\":\"03ab213311cbc8297bd9f2fda4cfe3fe\",\"username\":\"admin\",\"captcha\":\"uium\",\"keeplogin\":\"1\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545057396);
INSERT INTO `fa_admin_log` VALUES (2, 0, 'Unknown', '/admin/index/login.html', '', '{\"__token__\":\"f68f3c8c6df2dbc9add776139bc71a7c\",\"username\":\"admin\",\"captcha\":\"yeu6\",\"keeplogin\":\"1\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545057405);
INSERT INTO `fa_admin_log` VALUES (3, 1, 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"1ba6644485e4d996f3842ea61a59a8a7\",\"username\":\"admin\",\"captcha\":\"5apk\",\"keeplogin\":\"1\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545057414);
INSERT INTO `fa_admin_log` VALUES (4, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"name\":\"DroneNews\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{\\\"backend\\\":\\\"zh-cn\\\",\\\"frontend\\\":\\\"zh-cn\\\"}\",\"fixedpage\":\"dashboard\"}}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545057579);
INSERT INTO `fa_admin_log` VALUES (5, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"name\":\"DroneNews\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{\\\"backend\\\":\\\"zh-cn\\\",\\\"frontend\\\":\\\"zh-cn\\\"}\",\"fixedpage\":\"dashboard\"}}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545057607);
INSERT INTO `fa_admin_log` VALUES (6, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"name\":\"DroneNews\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{\\\"backend\\\":\\\"zh-cn\\\",\\\"frontend\\\":\\\"zh-cn\\\"}\",\"fixedpage\":\"dashboard\"}}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545057651);
INSERT INTO `fa_admin_log` VALUES (7, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"cms\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.20\",\"faversion\":\"1.0.0.20181210_beta\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545057704);
INSERT INTO `fa_admin_log` VALUES (8, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"cms\",\"force\":\"0\",\"uid\":\"9913\",\"token\":\"5f06a69d-349e-4bda-87ae-56c37412694d\",\"version\":\"1.0.20\",\"faversion\":\"1.0.0.20181210_beta\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545061739);
INSERT INTO `fa_admin_log` VALUES (10, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545061785);
INSERT INTO `fa_admin_log` VALUES (11, 1, 'admin', '/admin/addon/config?name=cms&dialog=1', '插件管理 配置', '{\"name\":\"cms\",\"dialog\":\"1\",\"row\":{\"sitename\":\"DroneChina\",\"title\":\"\\u5f00\\u6e90\\u65e0\\u4eba\\u673a\\u70ed\\u70b9\\u805a\\u5408\",\"keywords\":\"\\u65e0\\u4eba\\u673a\",\"description\":\"\\u6700\\u65b0\\u5f00\\u53d1\\u6d88\\u606f\",\"theme\":\"default\",\"qrcode\":\"\",\"default_archives_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_channel_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_block_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_page_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"domain\":\"\",\"rewrite\":\"{\\\"index\\\\\\/index\\\":\\\"\\\\\\/cms\\\\\\/$\\\",\\\"archives\\\\\\/index\\\":\\\"\\\\\\/cms\\\\\\/a\\\\\\/[:diyname]\\\",\\\"tags\\\\\\/index\\\":\\\"\\\\\\/cms\\\\\\/t\\\\\\/[:name]\\\",\\\"page\\\\\\/index\\\":\\\"\\\\\\/cms\\\\\\/p\\\\\\/[:diyname]\\\",\\\"search\\\\\\/index\\\":\\\"\\\\\\/cms\\\\\\/s\\\",\\\"channel\\\\\\/index\\\":\\\"\\\\\\/cms\\\\\\/c\\\\\\/[:diyname]\\\",\\\"diyform\\\\\\/index\\\":\\\"\\\\\\/cms\\\\\\/d\\\\\\/[:diyname]\\\"}\",\"wxappid\":\"wx61795b817cd4dee3\",\"wxappsecret\":\"971d4e31b5a65eceaabf3d6fad72246c\",\"apikey\":\"\",\"archiveseditmode\":\"dialog\"}}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545062051);
INSERT INTO `fa_admin_log` VALUES (12, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"third\",\"force\":\"0\",\"uid\":\"9913\",\"token\":\"5f06a69d-349e-4bda-87ae-56c37412694d\",\"version\":\"1.0.5\",\"faversion\":\"1.0.0.20181210_beta\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545062809);
INSERT INTO `fa_admin_log` VALUES (13, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545062810);
INSERT INTO `fa_admin_log` VALUES (14, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\",\"archives_id\":\"35\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545063400);
INSERT INTO `fa_admin_log` VALUES (15, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545063401);
INSERT INTO `fa_admin_log` VALUES (16, 1, 'admin', '/admin/cms/tags/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"\\u667a\\u80fd\\u8bbe\\u5907,AR\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"\\u667a\\u80fd\\u8bbe\\u5907,AR\",\"searchField\":[\"name\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545063401);
INSERT INTO `fa_admin_log` VALUES (17, 1, 'admin', '/admin/addon/config?name=cms&dialog=1', '插件管理 配置', '{\"name\":\"cms\",\"dialog\":\"1\",\"row\":{\"sitename\":\"DroneChina\",\"title\":\"\\u5f00\\u6e90\\u65e0\\u4eba\\u673a\\u70ed\\u70b9\\u805a\\u5408\",\"keywords\":\"\\u65e0\\u4eba\\u673a\",\"description\":\"\\u6700\\u65b0\\u5f00\\u53d1\\u6d88\\u606f\",\"theme\":\"default\",\"qrcode\":\"\",\"default_archives_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_channel_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_block_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"default_page_img\":\"\\/assets\\/addons\\/cms\\/img\\/noimage.jpg\",\"domain\":\"\",\"rewrite\":\"{\\\"index\\/index\\\":\\\"\\/$\\\",\\\"archives\\/index\\\":\\\"\\/cms\\/a\\/[:diyname]\\\",\\\"tags\\/index\\\":\\\"\\/cms\\/t\\/[:name]\\\",\\\"page\\/index\\\":\\\"\\/cms\\/p\\/[:diyname]\\\",\\\"search\\/index\\\":\\\"\\/cms\\/s\\\",\\\"channel\\/index\\\":\\\"\\/cms\\/c\\/[:diyname]\\\",\\\"diyform\\/index\\\":\\\"\\/cms\\/d\\/[:diyname]\\\"}\",\"wxappid\":\"wx61795b817cd4dee3\",\"wxappsecret\":\"971d4e31b5a65eceaabf3d6fad72246c\",\"apikey\":\"\",\"archiveseditmode\":\"dialog\"}}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545065355);
INSERT INTO `fa_admin_log` VALUES (18, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"channel\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545066546);
INSERT INTO `fa_admin_log` VALUES (19, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"q_word\":[\"channel.html\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"channel.html\",\"type\":\"channel\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545066552);
INSERT INTO `fa_admin_log` VALUES (20, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"list\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545066555);
INSERT INTO `fa_admin_log` VALUES (21, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"show\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545066563);
INSERT INTO `fa_admin_log` VALUES (22, 1, 'admin', '/admin/cms/modelx/add?dialog=1', 'CMS管理 模型管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5f00\\u53d1\\u8005\",\"table\":\"cms_dronedev\",\"channeltpl\":\"channel.html\",\"listtpl\":\"list_news.html\",\"showtpl\":\"show_news.html\"}}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545066697);
INSERT INTO `fa_admin_log` VALUES (23, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel.html\",\"searchField\":[\"name\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545066781);
INSERT INTO `fa_admin_log` VALUES (24, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel.html\",\"searchField\":[\"name\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545066935);
INSERT INTO `fa_admin_log` VALUES (25, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"id\":\"2\",\"name\":\"row[diyname]\",\"value\":\"product\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545066963);
INSERT INTO `fa_admin_log` VALUES (26, 1, 'admin', '/admin/cms/channel/edit/ids/2?dialog=1', 'CMS管理 栏目管理 修改', '{\"dialog\":\"1\",\"row\":{\"parent_id\":\"0\",\"name\":\"\\u5f00\\u53d1\\u8005\\u6d88\\u606f\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"product\",\"outlink\":\"\",\"channeltpl\":\"channel.html\",\"listtpl\":\"\",\"showtpl\":\"\",\"pagesize\":\"10\",\"weigh\":\"10\",\"status\":\"normal\"},\"ids\":\"2\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545066963);
INSERT INTO `fa_admin_log` VALUES (27, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel.html\",\"searchField\":[\"name\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545067084);
INSERT INTO `fa_admin_log` VALUES (28, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_product.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_product.html\",\"searchField\":[\"name\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545067084);
INSERT INTO `fa_admin_log` VALUES (29, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_product.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_product.html\",\"searchField\":[\"name\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545067084);
INSERT INTO `fa_admin_log` VALUES (30, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"id\":\"10\",\"name\":\"row[diyname]\",\"value\":\"drone\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545067103);
INSERT INTO `fa_admin_log` VALUES (31, 1, 'admin', '/admin/cms/channel/edit/ids/10?dialog=1', 'CMS管理 栏目管理 修改', '{\"dialog\":\"1\",\"row\":{\"parent_id\":\"2\",\"name\":\"\\u65e0\\u4eba\\u673a\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"drone\",\"outlink\":\"\",\"channeltpl\":\"channel.html\",\"listtpl\":\"list_product.html\",\"showtpl\":\"show_product.html\",\"pagesize\":\"10\",\"weigh\":\"44\",\"status\":\"normal\"},\"ids\":\"10\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545067103);
INSERT INTO `fa_admin_log` VALUES (32, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel.html\",\"searchField\":[\"name\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545067107);
INSERT INTO `fa_admin_log` VALUES (33, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_product.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_product.html\",\"searchField\":[\"name\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545067107);
INSERT INTO `fa_admin_log` VALUES (34, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_product.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_product.html\",\"searchField\":[\"name\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545067107);
INSERT INTO `fa_admin_log` VALUES (35, 1, 'admin', '/admin/cms/channel/check_element_available', '', '{\"id\":\"9\",\"name\":\"row[diyname]\",\"value\":\"util\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545067117);
INSERT INTO `fa_admin_log` VALUES (36, 1, 'admin', '/admin/cms/channel/edit/ids/9?dialog=1', 'CMS管理 栏目管理 修改', '{\"dialog\":\"1\",\"row\":{\"parent_id\":\"2\",\"name\":\"\\u5916\\u8bbe\\u5468\\u8fb9\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"diyname\":\"util\",\"outlink\":\"\",\"channeltpl\":\"channel.html\",\"listtpl\":\"list_product.html\",\"showtpl\":\"show_product.html\",\"pagesize\":\"10\",\"weigh\":\"7\",\"status\":\"normal\"},\"ids\":\"9\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545067118);
INSERT INTO `fa_admin_log` VALUES (37, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"10\",\"archives_id\":\"23\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545067637);
INSERT INTO `fa_admin_log` VALUES (38, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545067637);
INSERT INTO `fa_admin_log` VALUES (39, 1, 'admin', '/admin/cms/tags/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"Google,\\u4e92\\u8054\\u7f51\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"Google,\\u4e92\\u8054\\u7f51\",\"searchField\":[\"name\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545067637);
INSERT INTO `fa_admin_log` VALUES (40, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545067640);
INSERT INTO `fa_admin_log` VALUES (41, 1, 'admin', '/admin/cms/channel/del/ids/43', 'CMS管理 栏目管理 删除', '{\"action\":\"del\",\"ids\":\"43\",\"params\":\"\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545069277);
INSERT INTO `fa_admin_log` VALUES (42, 1, 'admin', '/admin/cms/block/selectpage_type', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"type\",\"searchValue\":\"focus\",\"orderBy\":[[\"type\",\"ASC\"]],\"showField\":\"type\",\"keyField\":\"type\",\"keyValue\":\"focus\",\"searchField\":[\"type\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545071296);
INSERT INTO `fa_admin_log` VALUES (43, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"WechatIMG3.jpeg\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545071305);
INSERT INTO `fa_admin_log` VALUES (44, 1, 'admin', '/admin/cms/block/edit/ids/3?dialog=1', 'CMS管理 区块管理 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"focus\",\"name\":\"focus\",\"title\":\"\\u5e7b\\u706f\\u56fe\\u72473\",\"image\":\"\\/uploads\\/20181218\\/053db5248874954d4faa978ab1d80338.jpeg\",\"url\":\"http:\\/\\/www.baidu.com\",\"content\":\"333\",\"status\":\"normal\"},\"ids\":\"3\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545071319);
INSERT INTO `fa_admin_log` VALUES (45, 1, 'admin', '/admin/cms/block/selectpage_type', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"type\",\"searchValue\":\"focus\",\"orderBy\":[[\"type\",\"ASC\"]],\"showField\":\"type\",\"keyField\":\"type\",\"keyValue\":\"focus\",\"searchField\":[\"type\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545071443);
INSERT INTO `fa_admin_log` VALUES (46, 1, 'admin', '/admin/cms/block/edit/ids/3?dialog=1', 'CMS管理 区块管理 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"focus\",\"name\":\"focus\",\"title\":\"\\u5e7b\\u706f\\u56fe\\u72473\",\"image\":\"\\/uploads\\/20181218\\/053db5248874954d4faa978ab1d80338.jpeg\",\"url\":\"http:\\/\\/www.baidu.com\",\"content\":\"333\",\"status\":\"normal\"},\"ids\":\"3\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545071448);
INSERT INTO `fa_admin_log` VALUES (47, 1, 'admin', '/admin/cms/block/selectpage_type', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"type\",\"searchValue\":\"focus\",\"orderBy\":[[\"type\",\"ASC\"]],\"showField\":\"type\",\"keyField\":\"type\",\"keyValue\":\"focus\",\"searchField\":[\"type\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545071453);
INSERT INTO `fa_admin_log` VALUES (48, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"\\u6c34\\u7535\\u7ad92.jpg\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545071474);
INSERT INTO `fa_admin_log` VALUES (49, 1, 'admin', '/admin/cms/block/edit/ids/2?dialog=1', 'CMS管理 区块管理 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"focus\",\"name\":\"focus\",\"title\":\"\\u5e7b\\u706f\\u56fe\\u72472\",\"image\":\"\\/uploads\\/20181218\\/6f469699521fee6dc336949f78c63755.jpg\",\"url\":\"http:\\/\\/www.baidu.com\",\"content\":\"222\",\"status\":\"normal\"},\"ids\":\"2\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545071484);
INSERT INTO `fa_admin_log` VALUES (50, 1, 'admin', '/admin/cms/block/selectpage_type', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"type\",\"searchValue\":\"focus\",\"orderBy\":[[\"type\",\"ASC\"]],\"showField\":\"type\",\"keyField\":\"type\",\"keyValue\":\"focus\",\"searchField\":[\"type\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545071665);
INSERT INTO `fa_admin_log` VALUES (51, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"\\u6c34\\u7535\\u7ad92.jpg\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545071679);
INSERT INTO `fa_admin_log` VALUES (52, 1, 'admin', '/admin/cms/block/edit/ids/3?dialog=1', 'CMS管理 区块管理 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"focus\",\"name\":\"focus\",\"title\":\"\\u5e7b\\u706f\\u56fe\\u72473\",\"image\":\"\\/uploads\\/20181218\\/6f469699521fee6dc336949f78c63755.jpg\",\"url\":\"http:\\/\\/www.baidu.com\",\"content\":\"333\",\"status\":\"normal\"},\"ids\":\"3\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545071682);
INSERT INTO `fa_admin_log` VALUES (53, 1, 'admin', '/admin/cms/block/selectpage_type', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"type\",\"searchValue\":\"focus\",\"orderBy\":[[\"type\",\"ASC\"]],\"showField\":\"type\",\"keyField\":\"type\",\"keyValue\":\"focus\",\"searchField\":[\"type\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545071847);
INSERT INTO `fa_admin_log` VALUES (54, 1, 'admin', '/admin/cms/block/edit/ids/1?dialog=1', 'CMS管理 区块管理 修改', '{\"dialog\":\"1\",\"row\":{\"type\":\"focus\",\"name\":\"focus\",\"title\":\"\\u5e7b\\u706f\\u56fe\\u72471\",\"image\":\"\\/uploads\\/20181218\\/053db5248874954d4faa978ab1d80338.jpeg\",\"url\":\"http:\\/\\/www.fastadmin.net\",\"content\":\"111\",\"status\":\"normal\"},\"ids\":\"1\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545071898);
INSERT INTO `fa_admin_log` VALUES (55, 1, 'admin', '/admin/cms/block/selectpage_type', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"type\",\"searchValue\":\"other\",\"orderBy\":[[\"type\",\"ASC\"]],\"showField\":\"type\",\"keyField\":\"type\",\"keyValue\":\"other\",\"searchField\":[\"type\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545071950);
INSERT INTO `fa_admin_log` VALUES (56, 1, 'admin', '/admin/cms/modelx/index', 'CMS管理 模型管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"3\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"3\",\"searchField\":[\"name\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545072301);
INSERT INTO `fa_admin_log` VALUES (57, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545072309);
INSERT INTO `fa_admin_log` VALUES (58, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545072309);
INSERT INTO `fa_admin_log` VALUES (59, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel.html\",\"searchField\":[\"name\"]}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545072309);
INSERT INTO `fa_admin_log` VALUES (60, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"channel\"}', '219.144.189.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 1545072311);
INSERT INTO `fa_admin_log` VALUES (61, 0, 'Unknown', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"c5da58bc0aa147a3796e03076587a646\",\"username\":\"riddle911\",\"captcha\":\"xkhj\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545093751);
INSERT INTO `fa_admin_log` VALUES (62, 0, 'Unknown', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"1e87c9c3d1e44a8f40ca3de147ce0745\",\"username\":\"riddle911\",\"captcha\":\"unxf\",\"keeplogin\":\"1\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545093761);
INSERT INTO `fa_admin_log` VALUES (63, 0, 'Unknown', '/admin/index/login?url=%2Fadmin', '', '{\"url\":\"\\/admin\",\"__token__\":\"39e2ef9f7a2ca70e07ee4e974d9bf7c2\",\"username\":\"riddle911\",\"captcha\":\"unxf\",\"keeplogin\":\"1\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545093770);
INSERT INTO `fa_admin_log` VALUES (64, 0, 'Unknown', '/admin/index/login?url=%2Fadmin', '', '{\"url\":\"\\/admin\",\"__token__\":\"3d09e2b18c00e9c7c70c6192fed3c21e\",\"username\":\"admin\",\"captcha\":\"unxf\",\"keeplogin\":\"1\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545093786);
INSERT INTO `fa_admin_log` VALUES (65, 1, 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"a13d1b451ce1ec8c635165ce6fdf8034\",\"username\":\"admin\",\"captcha\":\"xbxx\",\"keeplogin\":\"1\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545093792);
INSERT INTO `fa_admin_log` VALUES (66, 1, 'admin', '/admin/cms/block/selectpage_type', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"type\",\"searchValue\":\"focus\",\"orderBy\":[[\"type\",\"ASC\"]],\"showField\":\"type\",\"keyField\":\"type\",\"keyValue\":\"focus\",\"searchField\":[\"type\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545093839);
INSERT INTO `fa_admin_log` VALUES (67, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545093881);
INSERT INTO `fa_admin_log` VALUES (68, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545093881);
INSERT INTO `fa_admin_log` VALUES (69, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545093881);
INSERT INTO `fa_admin_log` VALUES (70, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"channel\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545093884);
INSERT INTO `fa_admin_log` VALUES (71, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"10\",\"archives_id\":\"23\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545093936);
INSERT INTO `fa_admin_log` VALUES (72, 1, 'admin', '/admin/cms/tags/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"Google,\\u4e92\\u8054\\u7f51\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"Google,\\u4e92\\u8054\\u7f51\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545093936);
INSERT INTO `fa_admin_log` VALUES (73, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545093936);
INSERT INTO `fa_admin_log` VALUES (74, 1, 'admin', '/admin/cms/block/selectpage_type', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"type\",\"searchValue\":\"focus\",\"orderBy\":[[\"type\",\"ASC\"]],\"showField\":\"type\",\"keyField\":\"type\",\"keyValue\":\"focus\",\"searchField\":[\"type\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545094418);
INSERT INTO `fa_admin_log` VALUES (75, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"10\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545100684);
INSERT INTO `fa_admin_log` VALUES (76, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"10\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545100709);
INSERT INTO `fa_admin_log` VALUES (77, 1, 'admin', '/admin/cms/tags/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545100721);
INSERT INTO `fa_admin_log` VALUES (78, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\",\"archives_id\":\"35\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545101090);
INSERT INTO `fa_admin_log` VALUES (79, 1, 'admin', '/admin/cms/tags/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"\\u667a\\u80fd\\u8bbe\\u5907,AR\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"\\u667a\\u80fd\\u8bbe\\u5907,AR\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545101090);
INSERT INTO `fa_admin_log` VALUES (80, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545101090);
INSERT INTO `fa_admin_log` VALUES (81, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"channel\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545101283);
INSERT INTO `fa_admin_log` VALUES (82, 1, 'admin', '/admin/cms/modelx/index', 'CMS管理 模型管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"3\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"3\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545101349);
INSERT INTO `fa_admin_log` VALUES (83, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_news.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545101355);
INSERT INTO `fa_admin_log` VALUES (84, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_news.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_news.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545101355);
INSERT INTO `fa_admin_log` VALUES (85, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545101355);
INSERT INTO `fa_admin_log` VALUES (86, 1, 'admin', '/admin/cms/fields/multi/model_id/1/ids/136', 'CMS管理 模型管理 字段管理 批量更新', '{\"action\":\"\",\"ids\":\"136\",\"params\":\"isfilter=0\",\"model_id\":\"1\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545101379);
INSERT INTO `fa_admin_log` VALUES (87, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"10\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545104522);
INSERT INTO `fa_admin_log` VALUES (88, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545104527);
INSERT INTO `fa_admin_log` VALUES (89, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"q_word\":[\"a\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"a\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545104625);
INSERT INTO `fa_admin_log` VALUES (90, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"q_word\":[\"c\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"c\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545104627);
INSERT INTO `fa_admin_log` VALUES (91, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"q_word\":[\"cc\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"cc\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545104627);
INSERT INTO `fa_admin_log` VALUES (92, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545104631);
INSERT INTO `fa_admin_log` VALUES (93, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"9\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545106059);
INSERT INTO `fa_admin_log` VALUES (94, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545106061);
INSERT INTO `fa_admin_log` VALUES (95, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545106175);
INSERT INTO `fa_admin_log` VALUES (96, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"required\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"required\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545106206);
INSERT INTO `fa_admin_log` VALUES (97, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"required\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"required\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545106494);
INSERT INTO `fa_admin_log` VALUES (98, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"required\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"required\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545106618);
INSERT INTO `fa_admin_log` VALUES (99, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545106654);
INSERT INTO `fa_admin_log` VALUES (100, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_product.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_product.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545106655);
INSERT INTO `fa_admin_log` VALUES (101, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_product.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_product.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545106655);
INSERT INTO `fa_admin_log` VALUES (102, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545106867);
INSERT INTO `fa_admin_log` VALUES (103, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545106873);
INSERT INTO `fa_admin_log` VALUES (104, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545109118);
INSERT INTO `fa_admin_log` VALUES (105, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"8\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545109195);
INSERT INTO `fa_admin_log` VALUES (106, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"10\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545109199);
INSERT INTO `fa_admin_log` VALUES (107, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545109204);
INSERT INTO `fa_admin_log` VALUES (108, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545109245);
INSERT INTO `fa_admin_log` VALUES (109, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545110081);
INSERT INTO `fa_admin_log` VALUES (110, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_product.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_product.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545110082);
INSERT INTO `fa_admin_log` VALUES (111, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_product.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_product.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545110082);
INSERT INTO `fa_admin_log` VALUES (112, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545110780);
INSERT INTO `fa_admin_log` VALUES (113, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111178);
INSERT INTO `fa_admin_log` VALUES (114, 1, 'admin', '/admin/cms/tags/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111190);
INSERT INTO `fa_admin_log` VALUES (115, 1, 'admin', '/admin/cms/tags/selectpage', '', '{\"q_word\":[\"wu\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"wu\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111192);
INSERT INTO `fa_admin_log` VALUES (116, 1, 'admin', '/admin/cms/tags/selectpage', '', '{\"q_word\":[\"\\u65e0\\u4eba\\u673a\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\\u65e0\\u4eba\\u673a\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111196);
INSERT INTO `fa_admin_log` VALUES (117, 1, 'admin', '/admin/cms/archives/add?dialog=1', 'CMS管理 内容管理 添加', '{\"dialog\":\"1\",\"row\":{\"channel_id\":\"7\",\"user_id\":\"1\",\"title\":\"\\u8fd9\\u91cc\\u662f\\u6d4b\\u8bd5\\u7684\\u65e0\\u4eba\\u673a\\u5149\\u7535\\u7ad9\\u8fd0\\u884c\",\"image\":\"\",\"tags\":\"\",\"diyname\":\"\",\"content\":\"\\u963f\\u4e09\\u5927\\u795e\\u5927\\u82cf\\u6253\\u963f\\u745f\\u4e1c\\u963f\\u745f\\u4e1c\\u554a\\u662f\\u5927\\u4e8b\\u6253\\u662f\\u989d\\u5982\\u4e2a\\u4eba\\u98ce\\u683c\\u7ed9\\u5bf9\\u65b9\\u662f\\u7684\\u53d1\\u5c04\\u70b9\\u662f\",\"keywords\":\"\",\"description\":\"\",\"price\":\"699\",\"device\":\"ar\",\"area\":\"domestic\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"status\":\"normal\",\"publishtime\":\"2018-12-18 00:00:00\",\"flag\":[\"\"]}}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111220);
INSERT INTO `fa_admin_log` VALUES (118, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\",\"archives_id\":\"35\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111264);
INSERT INTO `fa_admin_log` VALUES (119, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111264);
INSERT INTO `fa_admin_log` VALUES (120, 1, 'admin', '/admin/cms/tags/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"\\u667a\\u80fd\\u8bbe\\u5907,AR\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"\\u667a\\u80fd\\u8bbe\\u5907,AR\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111264);
INSERT INTO `fa_admin_log` VALUES (121, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"7\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111293);
INSERT INTO `fa_admin_log` VALUES (122, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"5\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111296);
INSERT INTO `fa_admin_log` VALUES (123, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111296);
INSERT INTO `fa_admin_log` VALUES (124, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"q_word\":[\"hahahahah\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"hahahahah\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111299);
INSERT INTO `fa_admin_log` VALUES (125, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"q_word\":[\"ad\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"ad\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111301);
INSERT INTO `fa_admin_log` VALUES (126, 1, 'admin', '/admin/cms/tags/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111311);
INSERT INTO `fa_admin_log` VALUES (127, 1, 'admin', '/admin/cms/tags/selectpage', '', '{\"q_word\":[\"\\u4f60\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\\u4f60\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111313);
INSERT INTO `fa_admin_log` VALUES (128, 1, 'admin', '/admin/cms/archives/add?dialog=1', 'CMS管理 内容管理 添加', '{\"dialog\":\"1\",\"row\":{\"channel_id\":\"5\",\"user_id\":\"1\",\"title\":\"\\u6211\\u6ca1\\u6709\\u94b1\",\"image\":\"\",\"tags\":\"\",\"diyname\":\"\",\"content\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"keywords\":\"\",\"description\":\"\",\"price\":\"0\",\"device\":\"vr\",\"area\":\"domestic\",\"author\":\"\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"status\":\"normal\",\"publishtime\":\"2018-12-18 00:00:00\",\"flag\":[\"\"]}}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111336);
INSERT INTO `fa_admin_log` VALUES (129, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"5\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545111419);
INSERT INTO `fa_admin_log` VALUES (130, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545112517);
INSERT INTO `fa_admin_log` VALUES (131, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"show_product.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"show_product.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545112517);
INSERT INTO `fa_admin_log` VALUES (132, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"list_product.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"list_product.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545112517);
INSERT INTO `fa_admin_log` VALUES (133, 1, 'admin', '/admin/cms/modelx/index', 'CMS管理 模型管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545112522);
INSERT INTO `fa_admin_log` VALUES (134, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"required\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"required\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545112580);
INSERT INTO `fa_admin_log` VALUES (135, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545112608);
INSERT INTO `fa_admin_log` VALUES (136, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545112610);
INSERT INTO `fa_admin_log` VALUES (137, 1, 'admin', '/admin/cms/fields/add/model_id/2?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"2\",\"diyform_id\":\"0\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4ef7\\u683c\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"255\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"2\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545112651);
INSERT INTO `fa_admin_log` VALUES (138, 1, 'admin', '/admin/cms/fields/add/model_id/2?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"2\",\"diyform_id\":\"0\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4ef7\\u683c\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"2\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545112667);
INSERT INTO `fa_admin_log` VALUES (139, 1, 'admin', '/admin/cms/fields/edit/model_id/1/ids/140?dialog=1', 'CMS管理 模型管理 字段管理 修改', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"1\",\"diyform_id\":\"0\",\"oldname\":\"price\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"0\",\"maximum\":\"0\",\"title\":\"\\u4ef7\\u683c\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"1\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"1\",\"ids\":\"140\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545112735);
INSERT INTO `fa_admin_log` VALUES (140, 1, 'admin', '/admin/cms/fields/add/model_id/2?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"2\",\"diyform_id\":\"0\",\"name\":\"price0\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4ef7\\u683c\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"2\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545112797);
INSERT INTO `fa_admin_log` VALUES (141, 1, 'admin', '/admin/cms/fields/add/model_id/2?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"2\",\"diyform_id\":\"0\",\"name\":\"price0\",\"type\":\"string\",\"decimals\":\"0\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4ef7\\u683c\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"2\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545113697);
INSERT INTO `fa_admin_log` VALUES (142, 1, 'admin', '/admin/cms/fields/add/model_id/2?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"2\",\"diyform_id\":\"0\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4ef7\\u683ca\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"0\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"2\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545113730);
INSERT INTO `fa_admin_log` VALUES (143, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"required\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"required\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545113896);
INSERT INTO `fa_admin_log` VALUES (144, 1, 'admin', '/admin/cms/fields/edit/model_id/2/ids/144?dialog=1', 'CMS管理 模型管理 字段管理 修改', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"2\",\"diyform_id\":\"0\",\"oldname\":\"price0\",\"name\":\"price0\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"0\",\"maximum\":\"0\",\"title\":\"\\u4ef7\\u683c\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"2\",\"ids\":\"144\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545113899);
INSERT INTO `fa_admin_log` VALUES (145, 1, 'admin', '/admin/cms/fields/edit/model_id/2/ids/144?dialog=1', 'CMS管理 模型管理 字段管理 修改', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"2\",\"diyform_id\":\"0\",\"oldname\":\"price0\",\"name\":\"price0\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"0\",\"maximum\":\"0\",\"title\":\"\\u4ef7\\u683ca\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"2\",\"ids\":\"144\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545113909);
INSERT INTO `fa_admin_log` VALUES (146, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545115435);
INSERT INTO `fa_admin_log` VALUES (147, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545115436);
INSERT INTO `fa_admin_log` VALUES (148, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545115438);
INSERT INTO `fa_admin_log` VALUES (149, 1, 'admin', '/admin/cms/fields/add/model_id/2?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"2\",\"diyform_id\":\"0\",\"name\":\"author\",\"type\":\"string\",\"decimals\":\"0\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4f5c\\u8005\\u5927\\u4eba\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"2\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545115446);
INSERT INTO `fa_admin_log` VALUES (150, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"required\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"required\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545115469);
INSERT INTO `fa_admin_log` VALUES (151, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545115507);
INSERT INTO `fa_admin_log` VALUES (152, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545115508);
INSERT INTO `fa_admin_log` VALUES (153, 1, 'admin', '/admin/cms/fields/add/model_id/3?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"3\",\"diyform_id\":\"0\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4ef7\\u683c\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"3\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545115511);
INSERT INTO `fa_admin_log` VALUES (154, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545115546);
INSERT INTO `fa_admin_log` VALUES (155, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545115547);
INSERT INTO `fa_admin_log` VALUES (156, 1, 'admin', '/admin/cms/fields/add/model_id/3?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"3\",\"diyform_id\":\"0\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4ef7\\u94b1\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"3\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545115553);
INSERT INTO `fa_admin_log` VALUES (157, 1, 'admin', '/admin/cms/fields/add/model_id/3?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"3\",\"diyform_id\":\"0\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4ef7\\u94b1\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"3\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545115558);
INSERT INTO `fa_admin_log` VALUES (158, 1, 'admin', '/admin/cms/fields/add/model_id/3?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"3\",\"diyform_id\":\"0\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4ef7\\u94b1\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"3\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545115574);
INSERT INTO `fa_admin_log` VALUES (159, 1, 'admin', '/admin/cms/fields/add/model_id/3?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"3\",\"diyform_id\":\"0\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"1\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4ef7\\u94b1\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"3\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545115620);
INSERT INTO `fa_admin_log` VALUES (160, 1, 'admin', '/admin/cms/fields/add/model_id/3?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"3\",\"diyform_id\":\"0\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4ef7\\u94b1\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"3\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116309);
INSERT INTO `fa_admin_log` VALUES (161, 1, 'admin', '/admin/cms/fields/add/model_id/2?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"2\",\"diyform_id\":\"0\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u8d39\\u7528\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"0\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"2\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116382);
INSERT INTO `fa_admin_log` VALUES (162, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"5\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116426);
INSERT INTO `fa_admin_log` VALUES (163, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"5\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116441);
INSERT INTO `fa_admin_log` VALUES (164, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"4\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116456);
INSERT INTO `fa_admin_log` VALUES (165, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"9\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116461);
INSERT INTO `fa_admin_log` VALUES (166, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"nickname\",\"keyField\":\"id\",\"searchField\":[\"nickname\"],\"nickname\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116469);
INSERT INTO `fa_admin_log` VALUES (167, 1, 'admin', '/admin/cms/tags/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116476);
INSERT INTO `fa_admin_log` VALUES (168, 1, 'admin', '/admin/cms/tags/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116478);
INSERT INTO `fa_admin_log` VALUES (169, 1, 'admin', '/admin/cms/archives/add?dialog=1', 'CMS管理 内容管理 添加', '{\"dialog\":\"1\",\"row\":{\"channel_id\":\"9\",\"user_id\":\"1\",\"title\":\"\\u5f00\\u6e90\\u65e0\\u4eba\\u673a\\u70ed\\u70b9\\u805a\\u5408\",\"image\":\"\",\"tags\":\"\\u4e91\\u8ba1\\u7b97\",\"diyname\":\"\",\"content\":\"cccccccccccccccccccccaaaaaaaaaaaaaaaaaaaaasssssssssssssssss\",\"keywords\":\"\",\"description\":\"\",\"author\":\"wwww\",\"price0\":\"10\",\"productdata\":\"\\/uploads\\/20181218\\/6f469699521fee6dc336949f78c63755.jpg\",\"views\":\"0\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"status\":\"normal\",\"publishtime\":\"2018-12-18 00:00:00\",\"flag\":[\"\"]}}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116508);
INSERT INTO `fa_admin_log` VALUES (170, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\",\"archives_id\":\"33\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116724);
INSERT INTO `fa_admin_log` VALUES (171, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116724);
INSERT INTO `fa_admin_log` VALUES (172, 1, 'admin', '/admin/cms/tags/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"\\u4e92\\u8054\\u7f51,\\u5b89\\u5168\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"\\u4e92\\u8054\\u7f51,\\u5b89\\u5168\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116724);
INSERT INTO `fa_admin_log` VALUES (173, 1, 'admin', '/admin/cms/archives/edit/ids/33?dialog=1', 'CMS管理 内容管理 修改', '{\"dialog\":\"1\",\"row\":{\"channel_id\":\"3\",\"user_id\":\"1\",\"title\":\"GitHub \\u53bb\\u5e74\\u4e3a\\u6f0f\\u6d1e\\u652f\\u4ed8\\u4e86 16.6 \\u4e07\\u7f8e\\u5143\\u8d4f\\u91d1\",\"image\":\"https:\\/\\/cdn.fastadmin.net\\/uploads\\/20180416\\/5ad4412a798700.jpg\",\"tags\":\"\\u4e92\\u8054\\u7f51,\\u5b89\\u5168\",\"diyname\":\"\",\"content\":\"<p>\\u636e\\u5916\\u5a92\\u62a5\\u9053\\uff0c\\u53bb\\u5e74\\uff0cGitHub \\u5411\\u5b89\\u5168\\u7814\\u7a76\\u4eba\\u5458\\u652f\\u4ed8\\u4e86\\u603b\\u8ba1 166495 \\u7f8e\\u5143\\u7684\\u5956\\u52b1\\uff0c\\u9488\\u5bf9\\u00a0GitHub \\u8fd9\\u4e2a\\u4e3a\\u671f\\u56db\\u5e74\\u7684\\u201c\\u6f0f\\u6d1e\\u8d4f\\u91d1\\u201d\\u9879\\u76ee\\uff0c\\u5b89\\u5168\\u7814\\u7a76\\u4eba\\u5458\\u4f1a\\u4e0a\\u62a5\\u81ea\\u5df1\\u53d1\\u73b0\\u7684\\u7cfb\\u7edf\\u95ee\\u9898\\u548c\\u6f0f\\u6d1e\\u30022016 \\u5e74\\uff0cGitHub \\u4e00\\u5171\\u652f\\u4ed8\\u4e8681.7\\u4e07\\u7f8e\\u5143\\uff0c\\u800c\\u53bb\\u5e74\\u7684\\u652f\\u51fa\\u603b\\u989d\\u663e\\u7136\\u5df2\\u7ecf\\u7ffb\\u4e86\\u4e00\\u500d\\u591a\\uff0c\\u51e0\\u4e4e\\u76f8\\u5f53\\u4e8e\\u524d\\u4e09\\u5e74\\u7684\\u603b\\u652f\\u51fa\\uff0817.7\\u4e07\\u7f8e\\u5143\\uff09\\u3002\\u5728 2014 \\u548c 2015 \\u4e24\\u5e74\\u65f6\\u95f4\\u91cc\\uff0c\\u4ed6\\u4eec\\u4e00\\u5171\\u652f\\u4ed8\\u4e8695.3\\u4e07\\u7f8e\\u5143\\u7684\\u5956\\u91d1\\u3002<\\/p>\\r\\n<p><img src=\\\"https:\\/\\/cdn.fastadmin.net\\/uploads\\/20180416\\/5ad4412a798700.jpg\\\" \\/><\\/p>\\r\\n<p>2017 \\u5e74\\uff0cGitHub \\u4e00\\u5171\\u6536\\u5230\\u4e86 840 \\u4efd\\u6f0f\\u6d1e\\u62a5\\u544a\\u610f\\u89c1\\u4e66\\uff0c\\u4f46\\u662f\\u6700\\u7ec8\\u89e3\\u51b3\\u95ee\\u9898\\u5e76\\u83b7\\u5f97\\u5956\\u91d1\\u7684\\u6bd4\\u4f8b\\u53ea\\u670915%\\uff08\\u7ea6121\\u4efd\\uff09\\u30022016\\u5e74\\uff0cGitHub \\u5171\\u6536\\u5230\\u4e86 795 \\u4efd\\u6f0f\\u6d1e\\u62a5\\u544a\\u610f\\u89c1\\u4e66\\uff0c\\u6700\\u7ec8\\u83b7\\u5f97\\u5956\\u52b1\\u7684\\u53ea\\u6709 73 \\u4efd\\uff0c\\u800c\\u5176\\u4e2d\\u53ea\\u6709 48 \\u4efd\\u6709\\u6548\\u62a5\\u544a\\u6700\\u7ec8\\u88ab\\u7f57\\u5217\\u5728\\u4e86\\u6f0f\\u6d1e\\u8d4f\\u91d1\\u9879\\u76ee\\u7684\\u4e3b\\u9875\\u4e0a\\u3002<\\/p>\\r\\n<p>\\u6709\\u6548\\u62a5\\u544a\\u7684\\u6570\\u91cf\\u4e0a\\u5347\\u63a8\\u52a8\\u4e86\\u603b\\u652f\\u51fa\\u7684\\u589e\\u52a0\\uff0c\\u4e5f\\u5bfc\\u81f4\\u4e86 GitHub \\u5728\\u53bb\\u5e74\\u5341\\u6708\\u91cd\\u65b0\\u8bc4\\u4f30\\u5176\\u652f\\u4ed8\\u7ed3\\u6784\\u3002\\u7ed3\\u679c\\u5c31\\u662f\\uff0c\\u5956\\u91d1\\u589e\\u52a0\\u4e86\\u4e00\\u500d\\uff0c\\u5176\\u4e2d\\u6700\\u4f4e\\u5956\\u91d1\\u4e3a 555 \\u7f8e\\u5143\\uff0c\\u6700\\u9ad8\\u5956\\u91d1\\u9ad8\\u8fbe 20000 \\u7f8e\\u5143\\u3002<\\/p>\\r\\n<p>GitHub \\u7684 Greg Ose \\u6307\\u51fa\\uff0c\\u968f\\u7740\\u53c2\\u4e0e\\u7684\\u9879\\u76ee\\u3001\\u8ba1\\u5212\\u548c\\u7814\\u7a76\\u4eba\\u5458\\u89c4\\u6a21\\u4e0d\\u65ad\\u589e\\u52a0\\uff0c\\u53bb\\u5e74\\u662f\\u8fc4\\u4eca\\u4e3a\\u6b62\\u652f\\u4ed8\\u8d4f\\u91d1\\u6700\\u591a\\u7684\\u4e00\\u5e74\\u3002\\u4e0d\\u4ec5\\u5982\\u6b64\\uff0c\\u4ed6\\u4eec\\u8fd8\\u628a GitHub Enterprise \\u5f15\\u5165\\u5230\\u6f0f\\u6d1e\\u8d4f\\u91d1\\u9879\\u76ee\\u4e4b\\u4e2d\\uff0c\\u8ba9\\u7814\\u7a76\\u4eba\\u5458\\u80fd\\u591f\\u5728 GitHub.com \\u5e73\\u53f0\\u4e0a\\u4e00\\u4e9b\\u672a\\u516c\\u5f00\\u7684\\u3001\\u6216\\u662f\\u7279\\u5b9a\\u4e8e\\u67d0\\u4e2a\\u4f01\\u4e1a\\u90e8\\u7f72\\u7684\\u9886\\u57df\\u91cc\\u627e\\u5230\\u6f0f\\u6d1e\\u3002Ose\\u8bf4\\u9053\\uff1a<\\/p>\\r\\n<blockquote>\\r\\n<p>\\u201c\\u53bb\\u5e74\\u5e74\\u521d\\uff0c\\u5f88\\u591a\\u6f0f\\u6d1e\\u62a5\\u544a\\u6d89\\u53ca\\u5230\\u4e86\\u6211\\u4eec\\u7684\\u4f01\\u4e1a\\u8ba4\\u8bc1\\u65b9\\u6cd5\\uff0c\\u8fd9\\u4e5f\\u4fc3\\u4f7f\\u6211\\u4eec\\u4e0d\\u5f97\\u4e0d\\u5728\\u5185\\u90e8\\u5173\\u6ce8\\u8fd9\\u4e2a\\u95ee\\u9898\\uff0c\\u800c\\u4e14\\u6211\\u4eec\\u4e5f\\u5728\\u7814\\u7a76\\u5982\\u4f55\\u8ba9\\u7814\\u7a76\\u4eba\\u5458\\u4e5f\\u5173\\u6ce8\\u8fd9\\u4e2a\\u529f\\u80fd\\u3002\\u201d<\\/p>\\r\\n<\\/blockquote>\\r\\n<p>\\u6b64\\u5916\\uff0cOse\\u8fd8\\u8868\\u793a\\uff0cGitHub \\u5df2\\u7ecf\\u53d1\\u5e03\\u4e86\\u9996\\u4e2a\\u7814\\u7a76\\u4eba\\u5458\\u6350\\u8d60\\uff0c\\u4e5f\\u662f\\u4ed6\\u4eec\\u957f\\u671f\\u4ee5\\u6765\\u5173\\u6ce8\\u7684\\u4e00\\u9879\\u4e3e\\u63aa\\u3002\\u8fd9\\u9879\\u5de5\\u4f5c\\u4f1a\\u4e3a\\u6316\\u6398\\u5e94\\u7528\\u7a0b\\u5e8f\\u7279\\u5b9a\\u529f\\u80fd\\u6216\\u9886\\u57df\\u7684\\u7814\\u7a76\\u4eba\\u5458\\u652f\\u4ed8\\u56fa\\u5b9a\\u91d1\\u989d\\u3002\\u5f53\\u7136\\uff0c\\u5176\\u4ed6\\u4efb\\u4f55\\u53d1\\u73b0\\u6f0f\\u6d1e\\u7684\\u4eba\\u4e5f\\u80fd\\u591f\\u901a\\u8fc7\\u6f0f\\u6d1e\\u8d4f\\u91d1\\u9879\\u76ee\\u83b7\\u5f97\\u5956\\u52b1\\u3002<\\/p>\\r\\n<p>\\u53bb\\u5e74\\uff0cGitHub \\u8fd8\\u63a8\\u51fa\\u4e86\\u79c1\\u4eba\\u6f0f\\u6d1e\\u8865\\u4e01\\u670d\\u52a1\\uff0c\\u8ba9\\u7528\\u6237\\u80fd\\u591f\\u9650\\u5236\\u751f\\u4ea7\\u6f0f\\u6d1e\\u7684\\u5f71\\u54cd\\u8303\\u56f4\\u3002\\u4e0d\\u4ec5\\u5982\\u6b64\\uff0c\\u4ed6\\u4eec\\u8fd8\\u8fdb\\u884c\\u4e86\\u5185\\u90e8\\u6539\\u8fdb\\uff0c\\u4ee5\\u66f4\\u6709\\u6548\\u8fdb\\u884c\\u6f0f\\u6d1e\\u5206\\u7c7b\\u548c\\u4fee\\u590d\\u63d0\\u4ea4\\uff0c\\u5e76\\u8ba1\\u5212\\u5728\\u4eca\\u5e74\\u8fdb\\u4e00\\u6b65\\u5b8c\\u5584\\u6d41\\u7a0b\\u3002<\\/p>\\r\\n<p>\\u73b0\\u5728\\uff0cGitHub \\u5e0c\\u671b\\u8fdb\\u4e00\\u6b65\\u6269\\u5927 2017 \\u5e74\\u6240\\u53d6\\u5f97\\u6210\\u7ee9\\uff0c\\u63a8\\u51fa\\u66f4\\u591a\\u79c1\\u4eba\\u5956\\u52b1\\u548c\\u7814\\u7a76\\u8865\\u52a9\\u91d1\\uff0c\\u4ee5\\u4fbf\\u5728\\u4ee3\\u7801\\u516c\\u5f00\\u53d1\\u5e03\\u4e4b\\u524d\\u53ca\\u4e4b\\u540e\\u5f15\\u8d77\\u5927\\u5bb6\\u7684\\u5173\\u6ce8\\u3002\\u8be5\\u516c\\u53f8\\u8fd8\\u8ba1\\u5212\\u5728\\u4eca\\u5e74\\u665a\\u4e9b\\u65f6\\u5019\\uff0c\\u63a8\\u51fa\\u989d\\u5916\\u7684\\u5956\\u52b1\\u8ba1\\u5212\\u3002Ose\\u603b\\u7ed3\\u9053\\uff1a<\\/p>\\r\\n<blockquote>\\r\\n<p>\\u201c\\u9274\\u4e8e\\u6f0f\\u6d1e\\u8d4f\\u91d1\\u9879\\u76ee\\u53d6\\u5f97\\u4e86\\u6210\\u529f\\uff0c\\u6211\\u4eec\\u73b0\\u5728\\u6b63\\u8003\\u8651\\u5982\\u4f55\\u6269\\u5927\\u5176\\u8303\\u56f4\\uff0c\\u4e3a\\u6211\\u4eec\\u7684\\u751f\\u4ea7\\u670d\\u52a1\\u63d0\\u4f9b\\u66f4\\u591a\\u5e2e\\u52a9\\uff0c\\u540c\\u65f6\\u4fdd\\u62a4\\u6574\\u4e2aGitHub\\u751f\\u6001\\u7cfb\\u7edf\\u3002\\u6211\\u4eec\\u5f88\\u671f\\u5f85\\u4e0b\\u4e00\\u6b65\\u5de5\\u4f5c\\uff0c\\u5e76\\u4e14\\u4f1a\\u5728\\u4eca\\u5e74\\u5bf9\\u63d0\\u4ea4\\u7684\\u6f0f\\u6d1e\\u5185\\u5bb9\\u8fdb\\u884c\\u5206\\u7c7b\\u548c\\u4fee\\u6b63\\u3002\\u201d<\\/p>\\r\\n<\\/blockquote>\",\"keywords\":\"\",\"description\":\"\\u636e\\u5916\\u5a92\\u62a5\\u9053\\uff0c\\u53bb\\u5e74\\uff0cGitHub \\u5411\\u5b89\\u5168\\u7814\\u7a76\\u4eba\\u5458\\u652f\\u4ed8\\u4e86\\u603b\\u8ba1 166495 \\u7f8e\\u5143\\u7684\\u5956\\u52b1\\uff0c\\u9488\\u5bf9\\u00a0GitHub \\u8fd9\\u4e2a\\u4e3a\\u671f\\u56db\\u5e74\\u7684\\u201c\\u6f0f\\u6d1e\\u8d4f\\u91d1\\u201d\\u9879\\u76ee\\uff0c\\u5b89\\u5168\\u7814\\u7a76\\u4eba\\u5458\\u4f1a\\u4e0a\\u62a5\\u81ea\\u5df1\\u53d1\\u73b0\\u7684\\u7cfb\\u7edf\\u95ee\\u9898\\u548c\\u6f0f\\u6d1e\\u30022016 \\u5e74\\uff0cGitHub \\u4e00\\u5171\\u652f\\u4ed8\\u4e8681.7\\u4e07\\u7f8e\\u5143\\uff0c\\u800c\\u53bb\\u5e74\\u7684\\u652f\\u51fa\\u603b\\u989d\\u663e\\u7136\\u5df2\\u7ecf\\u7ffb\\u4e86\\u4e00\\u500d\\u591a\\uff0c\\u51e0\\u4e4e\\u76f8\\u5f53\\u4e8e\\u524d\\u4e09\\u5e74\\u7684\\u603b\\u652f\\u51fa\\uff0817.7\\u4e07\\u7f8e\\u5143\\uff09\\u3002\\u5728 2014 \\u548c 2015 \\u4e24\\u5e74\\u65f6\\u95f4\\u91cc\\uff0c\\u4ed6\\u4eec\\u4e00\\u5171\\u652f\\u4ed8\\u4e8695.3\\u4e07\\u7f8e\\u5143\\u7684\\u5956\\u91d1\\u3002\",\"price\":\"10\",\"device\":\"ar\",\"area\":\"overseas\",\"author\":\"cnbeta1\",\"views\":\"26\",\"comments\":\"0\",\"likes\":\"1\",\"dislikes\":\"1\",\"weigh\":\"33\",\"status\":\"normal\",\"publishtime\":\"2018-04-17 00:00:00\",\"flag\":[\"\"]},\"ids\":\"33\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116741);
INSERT INTO `fa_admin_log` VALUES (174, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"3\",\"archives_id\":\"33\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116757);
INSERT INTO `fa_admin_log` VALUES (175, 1, 'admin', '/admin/cms/tags/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"\\u4e92\\u8054\\u7f51,\\u5b89\\u5168\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"\\u4e92\\u8054\\u7f51,\\u5b89\\u5168\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116757);
INSERT INTO `fa_admin_log` VALUES (176, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116757);
INSERT INTO `fa_admin_log` VALUES (177, 1, 'admin', '/admin/cms/archives/get_channel_fields', '', '{\"channel_id\":\"5\",\"archives_id\":\"37\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116816);
INSERT INTO `fa_admin_log` VALUES (178, 1, 'admin', '/admin/user/user/index', '会员管理 会员管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"showField\":\"nickname\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"nickname\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116817);
INSERT INTO `fa_admin_log` VALUES (179, 1, 'admin', '/admin/cms/archives/edit/ids/37?dialog=1', 'CMS管理 内容管理 修改', '{\"dialog\":\"1\",\"row\":{\"channel_id\":\"5\",\"user_id\":\"1\",\"title\":\"\\u6211\\u6ca1\\u6709\\u94b1\",\"image\":\"\",\"tags\":\"\",\"diyname\":\"\",\"content\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"keywords\":\"\",\"description\":\"\",\"price\":\"12\",\"device\":\"vr\",\"area\":\"domestic\",\"author\":\"\",\"views\":\"1\",\"comments\":\"0\",\"likes\":\"0\",\"dislikes\":\"0\",\"weigh\":\"37\",\"status\":\"normal\",\"publishtime\":\"2018-12-18 00:00:00\",\"flag\":[\"\"]},\"ids\":\"37\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116828);
INSERT INTO `fa_admin_log` VALUES (180, 1, 'admin', '/admin/cms/ajax/get_template_list', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"channel.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"channel.html\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545116997);
INSERT INTO `fa_admin_log` VALUES (181, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545117031);
INSERT INTO `fa_admin_log` VALUES (182, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545117032);
INSERT INTO `fa_admin_log` VALUES (183, 1, 'admin', '/admin/cms/fields/add/model_id/3?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"3\",\"diyform_id\":\"0\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"2\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4ef7\\u683c\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"3\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545117037);
INSERT INTO `fa_admin_log` VALUES (184, 1, 'admin', '/admin/cms/fields/rulelist', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"required\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"required\",\"searchField\":[\"name\"]}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545117092);
INSERT INTO `fa_admin_log` VALUES (185, 1, 'admin', '/admin/cms/fields/add/model_id/3?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"3\",\"diyform_id\":\"0\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4ef7\\u683c\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"3\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545117126);
INSERT INTO `fa_admin_log` VALUES (186, 1, 'admin', '/admin/cms/fields/add/model_id/3?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"3\",\"diyform_id\":\"0\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4ef7\\u683c\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"3\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545117132);
INSERT INTO `fa_admin_log` VALUES (187, 1, 'admin', '/admin/cms/fields/edit/model_id/1/ids/140?dialog=1', 'CMS管理 模型管理 字段管理 修改', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"1\",\"diyform_id\":\"0\",\"oldname\":\"price\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"0\",\"minimum\":\"0\",\"maximum\":\"0\",\"title\":\"\\u4ef7\\u683c\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"1\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"1\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"1\",\"ids\":\"140\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545117240);
INSERT INTO `fa_admin_log` VALUES (188, 1, 'admin', '/admin/cms/fields/add/model_id/3?dialog=1', 'CMS管理 模型管理 字段管理 添加', '{\"dialog\":\"1\",\"row\":{\"model_id\":\"3\",\"diyform_id\":\"0\",\"name\":\"price\",\"type\":\"number\",\"decimals\":\"2\",\"minimum\":\"\",\"maximum\":\"\",\"title\":\"\\u4ef7\\u683c\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"defaultvalue\":\"2\",\"rule\":\"required\",\"msg\":\"\",\"ok\":\"\",\"tip\":\"\",\"length\":\"10\",\"isfilter\":\"0\",\"iscontribute\":\"1\",\"extend\":\"\",\"status\":\"normal\"},\"model_id\":\"3\"}', '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', 1545117262);

-- ----------------------------
-- Table structure for fa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fa_attachment`;
CREATE TABLE `fa_attachment`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `mimetype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建日期',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `uploadtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上传时间',
  `storage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_attachment
-- ----------------------------
INSERT INTO `fa_attachment` VALUES (1, 1, 0, '/assets/img/qrcode.png', '150', '150', 'png', 0, 21859, 'image/png', '', 1499681848, 1499681848, 1499681848, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `fa_attachment` VALUES (2, 1, 0, '/uploads/20181218/053db5248874954d4faa978ab1d80338.jpeg', '511', '511', 'jpeg', 0, 40954, 'image/jpeg', '', 1545071305, 1545071305, 1545071305, 'local', '81ad01acab8c389aed090225a1e4df84a973ce67');
INSERT INTO `fa_attachment` VALUES (3, 1, 0, '/uploads/20181218/6f469699521fee6dc336949f78c63755.jpg', '1600', '1133', 'jpg', 0, 363753, 'image/jpeg', '', 1545071473, 1545071473, 1545071473, 'local', '648bb907a80f3858b69bc947753bc7eade6cac10');
INSERT INTO `fa_attachment` VALUES (4, 1, 0, '/uploads/20181218/6f469699521fee6dc336949f78c63755.jpg', '1600', '1133', 'jpg', 0, 363753, 'image/jpeg', '', 1545071679, 1545071679, 1545071679, 'local', '648bb907a80f3858b69bc947753bc7eade6cac10');

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
INSERT INTO `fa_auth_group` VALUES (1, 0, 'Admin group', '*', 1490883540, 149088354, 'normal');
INSERT INTO `fa_auth_group` VALUES (2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1490883540, 1505465692, 'normal');
INSERT INTO `fa_auth_group` VALUES (3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1490883540, 1502205322, 'normal');
INSERT INTO `fa_auth_group` VALUES (4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1490883540, 1502205350, 'normal');
INSERT INTO `fa_auth_group` VALUES (5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1490883540, 1502205344, 'normal');

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限分组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
INSERT INTO `fa_auth_group_access` VALUES (1, 1);

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
INSERT INTO `fa_auth_rule` VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', 1, 1497429920, 1497429920, 143, 'normal');
INSERT INTO `fa_auth_rule` VALUES (2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', 1, 1497429920, 1497430169, 137, 'normal');
INSERT INTO `fa_auth_rule` VALUES (3, 'file', 0, 'category', 'Category', 'fa fa-list', '', 'Category tips', 1, 1497429920, 1497429920, 119, 'normal');
INSERT INTO `fa_auth_rule` VALUES (4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', 1, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', 1, 1497429920, 1497430092, 99, 'normal');
INSERT INTO `fa_auth_rule` VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1497430683, 60, 'normal');
INSERT INTO `fa_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', 1, 1497429920, 1497430699, 53, 'normal');
INSERT INTO `fa_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', 1, 1497429920, 1497429920, 34, 'normal');
INSERT INTO `fa_auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', 1, 1497429920, 1497430320, 118, 'normal');
INSERT INTO `fa_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', 1, 1497429920, 1497430307, 113, 'normal');
INSERT INTO `fa_auth_rule` VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', 1, 1497429920, 1497429920, 109, 'normal');
INSERT INTO `fa_auth_rule` VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', 1, 1497429920, 1497430581, 104, 'normal');
INSERT INTO `fa_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 136, 'normal');
INSERT INTO `fa_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 135, 'normal');
INSERT INTO `fa_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 133, 'normal');
INSERT INTO `fa_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 134, 'normal');
INSERT INTO `fa_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 132, 'normal');
INSERT INTO `fa_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 52, 'normal');
INSERT INTO `fa_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 51, 'normal');
INSERT INTO `fa_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 50, 'normal');
INSERT INTO `fa_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 49, 'normal');
INSERT INTO `fa_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 48, 'normal');
INSERT INTO `fa_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', 0, 1497429920, 1497429920, 59, 'normal');
INSERT INTO `fa_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 58, 'normal');
INSERT INTO `fa_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 57, 'normal');
INSERT INTO `fa_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 56, 'normal');
INSERT INTO `fa_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 55, 'normal');
INSERT INTO `fa_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 54, 'normal');
INSERT INTO `fa_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 33, 'normal');
INSERT INTO `fa_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 32, 'normal');
INSERT INTO `fa_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 31, 'normal');
INSERT INTO `fa_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 30, 'normal');
INSERT INTO `fa_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 29, 'normal');
INSERT INTO `fa_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 28, 'normal');
INSERT INTO `fa_auth_rule` VALUES (35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', 0, 1497429920, 1497429920, 142, 'normal');
INSERT INTO `fa_auth_rule` VALUES (36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 141, 'normal');
INSERT INTO `fa_auth_rule` VALUES (37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 140, 'normal');
INSERT INTO `fa_auth_rule` VALUES (38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 139, 'normal');
INSERT INTO `fa_auth_rule` VALUES (39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 138, 'normal');
INSERT INTO `fa_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', 0, 1497429920, 1497429920, 117, 'normal');
INSERT INTO `fa_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 116, 'normal');
INSERT INTO `fa_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 115, 'normal');
INSERT INTO `fa_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 114, 'normal');
INSERT INTO `fa_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', 0, 1497429920, 1497429920, 112, 'normal');
INSERT INTO `fa_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 111, 'normal');
INSERT INTO `fa_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 110, 'normal');
INSERT INTO `fa_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', 0, 1497429920, 1497429920, 108, 'normal');
INSERT INTO `fa_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 107, 'normal');
INSERT INTO `fa_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 106, 'normal');
INSERT INTO `fa_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 105, 'normal');
INSERT INTO `fa_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', 0, 1497429920, 1497429920, 103, 'normal');
INSERT INTO `fa_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 102, 'normal');
INSERT INTO `fa_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 101, 'normal');
INSERT INTO `fa_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 100, 'normal');
INSERT INTO `fa_auth_rule` VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (59, 'file', 4, 'addon/local', 'Local install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (61, 'file', 4, 'addon/install', 'Install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (62, 'file', 4, 'addon/uninstall', 'Uninstall', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (66, 'file', 0, 'user', 'User', 'fa fa-list', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (85, 'file', 0, 'cms', 'CMS管理', 'fa fa-list', '', '', 1, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (86, 'file', 85, 'cms/archives', '内容管理', 'fa fa-file-text-o', '', '', 1, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (87, 'file', 86, 'cms/archives/index', '查看', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (88, 'file', 86, 'cms/archives/content', '副表管理', 'fa fa-circle-o', '', '用于管理模型副表的数据列表,不建议在此进行删除操作', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (89, 'file', 86, 'cms/archives/add', '添加', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (90, 'file', 86, 'cms/archives/edit', '修改', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (91, 'file', 86, 'cms/archives/del', '删除', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (92, 'file', 86, 'cms/archives/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (93, 'file', 85, 'cms/channel', '栏目管理', 'fa fa-list', '', '用于管理网站的分类，可进行无限级分类，注意只有类型为列表的才可以添加文章', 1, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (94, 'file', 93, 'cms/channel/index', '查看', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (95, 'file', 93, 'cms/channel/add', '添加', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (96, 'file', 93, 'cms/channel/edit', '修改', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (97, 'file', 93, 'cms/channel/del', '删除', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (98, 'file', 93, 'cms/channel/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (99, 'file', 93, 'cms/channel/admin', '栏目授权', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (100, 'file', 85, 'cms/modelx', '模型管理', 'fa fa-th', '', '在线添加修改删除模型，管理模型字段和相关模型数据', 1, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (101, 'file', 100, 'cms/modelx/index', '查看', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (102, 'file', 100, 'cms/modelx/add', '添加', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (103, 'file', 100, 'cms/modelx/edit', '修改', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (104, 'file', 100, 'cms/modelx/del', '删除', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (105, 'file', 100, 'cms/modelx/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (106, 'file', 100, 'cms/fields', '字段管理', 'fa fa-fields', '', '用于管理模型或表单的字段，进行相关的增删改操作', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (107, 'file', 106, 'cms/fields/index', '查看', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (108, 'file', 106, 'cms/fields/add', '添加', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (109, 'file', 106, 'cms/fields/edit', '修改', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (110, 'file', 106, 'cms/fields/del', '删除', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (111, 'file', 106, 'cms/fields/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (112, 'file', 85, 'cms/tags', '标签管理', 'fa fa-tags', '', '用于管理文章关联的标签,标签的添加在添加文章时自动维护,无需手动添加标签', 1, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (113, 'file', 112, 'cms/tags/index', '查看', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (114, 'file', 112, 'cms/tags/add', '添加', 'fa fa-circle-o', '', '', 0, 1545061782, 1545061782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (115, 'file', 112, 'cms/tags/edit', '修改', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (116, 'file', 112, 'cms/tags/del', '删除', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (117, 'file', 112, 'cms/tags/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (118, 'file', 85, 'cms/block', '区块管理', 'fa fa-th-large', '', '用于管理站点的自定义区块内容,常用于广告、JS脚本、焦点图、片段代码等', 1, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (119, 'file', 118, 'cms/block/index', '查看', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (120, 'file', 118, 'cms/block/add', '添加', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (121, 'file', 118, 'cms/block/edit', '修改', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (122, 'file', 118, 'cms/block/del', '删除', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (123, 'file', 118, 'cms/block/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (124, 'file', 85, 'cms/page', '单页管理', 'fa fa-file', '', '用于管理网站的单页面，可任意创建修改删除单页面', 1, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (125, 'file', 124, 'cms/page/index', '查看', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (126, 'file', 124, 'cms/page/add', '添加', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (127, 'file', 124, 'cms/page/edit', '修改', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (128, 'file', 124, 'cms/page/del', '删除', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (129, 'file', 124, 'cms/page/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (130, 'file', 85, 'cms/comment', '评论管理', 'fa fa-comment', '', '用于管理用户在网站上发表的评论，可任意修改或隐藏评论', 1, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (131, 'file', 130, 'cms/comment/index', '查看', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (132, 'file', 130, 'cms/comment/add', '添加', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (133, 'file', 130, 'cms/comment/edit', '修改', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (134, 'file', 130, 'cms/comment/del', '删除', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (135, 'file', 130, 'cms/comment/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (136, 'file', 85, 'cms/diyform', '自定义表单管理', 'fa fa-list', '', '可在线创建自定义表单，管理表单字段和数据列表', 1, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (137, 'file', 136, 'cms/diyform/index', '查看', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (138, 'file', 136, 'cms/diyform/add', '添加', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (139, 'file', 136, 'cms/diyform/edit', '修改', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (140, 'file', 136, 'cms/diyform/del', '删除', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (141, 'file', 136, 'cms/diyform/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (142, 'file', 85, 'cms/diydata', '自定义表单数据管理', 'fa fa-list', '', '可在线管理自定义表单的数据列表', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (143, 'file', 142, 'cms/diydata/index', '查看', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (144, 'file', 142, 'cms/diydata/add', '添加', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (145, 'file', 142, 'cms/diydata/edit', '修改', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (146, 'file', 142, 'cms/diydata/del', '删除', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (147, 'file', 142, 'cms/diydata/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (148, 'file', 85, 'cms/order', '订单管理', 'fa fa-cny', '', '可在线管理付费查看所产生的订单', 1, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (149, 'file', 148, 'cms/order/index', '查看', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (150, 'file', 148, 'cms/order/add', '添加', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (151, 'file', 148, 'cms/order/edit', '修改', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (152, 'file', 148, 'cms/order/del', '删除', 'fa fa-circle-o', '', '', 0, 1545061783, 1545061783, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (153, 'file', 148, 'cms/order/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1545061784, 1545061784, 0, 'normal');

-- ----------------------------
-- Table structure for fa_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_category`;
CREATE TABLE `fa_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `weigh`(`weigh`, `id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_category
-- ----------------------------
INSERT INTO `fa_category` VALUES (1, 0, 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', 1495262190, 1495262190, 1, 'normal');
INSERT INTO `fa_category` VALUES (2, 0, 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', 1495262244, 1495262244, 2, 'normal');
INSERT INTO `fa_category` VALUES (3, 2, 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', 1495262288, 1495262288, 3, 'normal');
INSERT INTO `fa_category` VALUES (4, 2, 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', 1495262317, 1495262317, 4, 'normal');
INSERT INTO `fa_category` VALUES (5, 0, 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', 1495262336, 1499681850, 5, 'normal');
INSERT INTO `fa_category` VALUES (6, 5, 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', 1495262357, 1495262357, 6, 'normal');
INSERT INTO `fa_category` VALUES (7, 5, 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', 1495262391, 1495262391, 7, 'normal');
INSERT INTO `fa_category` VALUES (8, 6, 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', 1495262424, 1495262424, 8, 'normal');
INSERT INTO `fa_category` VALUES (9, 6, 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', 1495262456, 1495262456, 9, 'normal');
INSERT INTO `fa_category` VALUES (10, 7, 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', 1495262487, 1495262487, 10, 'normal');
INSERT INTO `fa_category` VALUES (11, 7, 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', 1495262515, 1495262515, 11, 'normal');
INSERT INTO `fa_category` VALUES (12, 0, 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', 1497015727, 1497015727, 12, 'normal');
INSERT INTO `fa_category` VALUES (13, 0, 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', 1497015738, 1497015738, 13, 'normal');

-- ----------------------------
-- Table structure for fa_cms_addonnews
-- ----------------------------
DROP TABLE IF EXISTS `fa_cms_addonnews`;
CREATE TABLE `fa_cms_addonnews`  (
  `id` int(10) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '作者',
  `area` enum('domestic','overseas','local') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'domestic' COMMENT '地区',
  `device` enum('vr','ar') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'vr' COMMENT '设备',
  `price` int(10) NULL DEFAULT 1 COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_cms_addonnews
-- ----------------------------
INSERT INTO `fa_cms_addonnews` VALUES (1, '<div class=\"o-article_block pb-15 pb-5@m- o-subtle_divider\">\r\n<div class=\"grid@tl+\">\r\n<div class=\"grid@tl+__cell col-8-of-12@tl+\">\r\n<div class=\"article-text c-gray-1\">\r\n<p>据悉，驰为 HiGame 迷你 PC 配备了英特尔八代酷睿 i5-8305G 处理器，集成了移动版 Radeon Vega M 显卡和 4GB HMB 显存，性能不弱于 Nvidia GTX 1050 。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4412814b010.jpg\" /></p>\r\n<p>存储方面，入门机型从 8GB DDR4 RAM + 128GB M.2 SSD 起跳，消费者可根据实际需要后续升级，此外厂家宣称该机支持 VR 与 AR 系统。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad441284dbe71.jpg\" /></p>\r\n<p>扩展性方面，该机提供了 1&times;雷电 3、5&times;USB 3.0、2&times;HDMI 2.0、2&times;DisplayPort 1.3、以及耳机 / 麦克风插孔。</p>\r\n<p>驰为将于 5 月中旬发起 Indiegogo 众筹，感兴趣的朋友可以拿出 999 美元支持下，且可享受早鸟特惠。</p>\r\n<p>[编译自：<a href=\"https://www.slashgear.com/chuwi-higame-steps-up-from-tablets-laptops-to-mini-pc-market-13527274/\" target=\"_self\">SlashGear</a>]</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"js-notMobileReferredByFbTw\"><footer class=\"o-article_block\">\r\n<div class=\"grid@tl+ mt-n40\">\r\n<div class=\"grid@tl+__cell col-8-of-12@tl+ pb-80@tp+ pb-120@d \">\r\n<div class=\"pb-35 border-top mt-20 mt-35@s pt-35 pt-30@m pt-25@s pb-25@s break-out@s\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</footer></div>', '', 'overseas', 'vr', 0);
INSERT INTO `fa_cms_addonnews` VALUES (2, '<p>Chromebox CXI3 价钱实惠，很适合在课堂上使用。但在教育市场之外，它也有着一番用武之地。</p>\r\n<p>宏碁为该系列机型提供了多种配置，入门款搭载的是英特尔赛扬 3865U 处理器，顶配版则是英特尔八代酷睿 i7-8550U 。</p>\r\n<p>存储方面，其提供了 4~16GB RAM + 32~64GB ROM 的组合。扩展方面，则有 2&times;USB 2.1、3&times;USB 3.0、1&times; USB-C 端口，以及 HDMI&nbsp;输出、以太网、音频复合插孔。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44127cc3810.jpg\" /></p>\r\n<p>Chromebox CXI3 支持 VESA 壁挂、垂直摆放、还有一根无线天线。</p>\r\n<p>CXI3 最先由 Chrome Unboxed 在 TigerDirect 上发现，网页给出的发货时间为 4 月 19 号起。赛扬版本售价 279 美元，酷睿 i3 / i5 / i7 版本则是 279 / 469 / 511 / 744 美元。</p>\r\n<p>[编译自：<a href=\"https://www.slashgear.com/acer-chromebox-cxi3-mini-chrome-os-desktops-go-up-for-preorder-12527240/\" target=\"_self\">SlashGear</a>&nbsp;, 来源：<a href=\"https://chromeunboxed.com/acer-chromebox-cxi3-available-shipping-april-19\" target=\"_self\">Chrome Unboxed</a>]</p>', '', 'overseas', 'vr', 0);
INSERT INTO `fa_cms_addonnews` VALUES (3, '<p>您可以跟踪您的步数，睡眠，消耗的卡路里以及全天行走的距离，并将所有数据同步到Misfit的移动应用程序。它的防水深度可达50米，可以使用可更换的纽扣电池，使用寿命长达六个月。</p>\r\n<p>混合手表变得越来越流行，因为它们看起来比传统智能手表更时尚。对于那些觉得自己不能持续充电的人来说，它们也特别方便。当然，你必须放弃一些功能，以便照顾它们圆滑的外观，比如阅读和回复邮件或电子邮件的能力。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44125f364e0.png\" /></p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44126723cd1.png\" /></p>\r\n<p><img title=\"\" src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4412731d5f2.jpg\" alt=\"\" /><img title=\"\" src=\"https://cdn.fastadmin.net/uploads/20180416/5ad441278753c3.jpg\" /></p>', '', 'overseas', 'vr', 0);
INSERT INTO `fa_cms_addonnews` VALUES (4, '<p>大多数消费者可能熟悉UE推出的色彩鲜艳的蓝牙音箱，<strong>但该公司也有一系列定制入耳式耳机，UE刚刚推出了一款新的顶级旗舰机型：2,200美元的UE Live。</strong>UE Live耳机是该公司以前的旗舰UE18 Pro型号的进化版本，将每个耳机的扬声器数量从6个增加到8个，共计6个平衡电枢，一个True Tone Plus驱动器和一个6mm钕制动态扬声器，以提供更好的声音。</p>\r\n<p>但是，这些改进需要付出代价：UE Live耳机的起价为2,199美元，自定义选项价格可能会更高。</p>\r\n<p>Ultimate Ears的定制入耳式耳机倾向于专业音乐家在工作室或舞台上使用，而UE Live也不例外。 Ultimate Ears表示，新款耳机专为在音乐节，舞台和体育场举办音乐会的音乐家而设计 - 尽管如果您只是在家里听音乐，他们听起来也会非常出色。</p>\r\n<p>与UE Live一起，Ultimate Ears还宣布推出Ultimate Ears 6 PRO，这是一款价格为699美元的入耳式监听音箱，该监听音箱专为鼓手，贝斯手，DJ和嘻哈音乐家设计，并配有两个动态驱动程序中音和低音。</p>\r\n<p>这两款耳返将于2018年5月开始发货。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad441258ab510.png\" alt=\"QQ图片20180413011632.png\" /></p>', '', 'overseas', 'vr', 0);
INSERT INTO `fa_cms_addonnews` VALUES (5, '<p>想必大家都遇到过这样尴尬的事情：家里有很多电池，用的时候也分不清哪个有电、哪个没电，扔了又怕浪费。于是旧的不丢掉，新的买来用，这样家里的电池越积攒越多，造成恶性循环。而现在，南孚带来了一款全新产品&mdash;&mdash;南孚测电器装电池，包含南孚测电器和南孚碱性电池，轻轻松松测一测，电池电量一目了然。</p>\r\n<p>而且测电器5号电池和7号电池均可以测量，一器双用。</p>\r\n<p>这款南孚测电器体积非常小巧，仅有<a href=\"http://aos.prf.hn/click/camref:100lcC/creativeref:305226\" target=\"_blank\" rel=\"noopener\" data-link=\"1\">iPhone</a>&nbsp;8手机的四分之一大小（长60mm、宽36mm、厚12mm）。测电器通体白色，侧边有纹路处理，方便持握。</p>\r\n<p>正面有&ldquo;南孚聚能环&rdquo;字样、电池放置正负极标志、电池剩余电量指示灯；背面有测试结果说明&mdash;&mdash;3灯全亮表示电量充足，2灯为还能用，1灯为建议更换，不亮则代表没电，显示结果简单易懂，学习成本几乎为0。</p>\r\n<p>对于正在使用的电池，我们也可以用南孚测电器去测试它的剩余电量，以达到心中有数的目的。比如家里孩子玩的玩具车，对于电池电量要求比较高，我们可以在玩具使用一段时间后，测试电池剩余电量，若指示为&ldquo;2灯亮&rdquo;及以下时，将该电池换到那些功率小的玩具上继续使用，让电池不至于浪费，物尽其用。</p>\r\n<p>最关键的是，这个测电器是南孚免费赠送的。从18年开始，南孚将狂送150万个测电器。只要在线下商超或者线上旗舰店购买南孚大包装，就能免费获得测电器。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad441222f2370.jpg\" /></p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad441229f34b1.jpg\" /></p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44123130772.jpg\" /></p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44123724f83.jpg\" /></p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44123d13154.jpg\" /></p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad441242fa2e5.jpg\" /></p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44124821496.jpg\" /></p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44124d91187.jpg\" /></p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4412530fd08.jpg\" /></p>', '', 'domestic', 'vr', 0);
INSERT INTO `fa_cms_addonnews` VALUES (6, '<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44121af36d0.jpeg\" alt=\"acuvue-oasys-tinting-contacts-1.jpeg\" /></p>\r\n<p>据了解，这款叫做Acuvue Oasys With Ttransitions的隐形镜片由强生和Transitions Potical合作研发。除了像普通隐形眼镜一样能够帮助佩戴者看清东西而且还能在光线条件发生变化时做出快速、无缝的调整，它能过滤掉蓝光并阻断紫外线的进入。</p>\r\n<p>不过强生强调，这款隐形眼镜并不是为取代太阳镜而开发，毕竟它们不能覆盖住整个眼睛。</p>\r\n<p>据悉，Acuvue Oasys With Transitions隐形眼镜已经获得美国食品与药物管理局批准，其佩戴周期为2周，预计会在今年上半年进入市场。</p>', '', 'domestic', 'vr', 0);
INSERT INTO `fa_cms_addonnews` VALUES (7, '<p>据 Variety 报道，FCC 辐射实验室刚刚证实了一副来自 Snap 的新眼镜。<strong>今日曝光的这款穿戴设备的文档称，这是一款由 Snap Inc. 制作的穿戴式视频拍摄装置。从印刷标签来看，其品牌名称为 Spectacles，型号为 Model 002 。</strong>尽管文件中所附的大部分内容都以保密为由被遮掩，但还是可以知道它支持低功耗蓝牙 4.2 和 802.11ac Wi-Fi 。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44121495860.jpg\" alt=\"DSC_2124_2040b.0.jpg\" /></p>\r\n<p>2016 年发布的初代 Spectacles 眼镜</p>\r\n<p>上个月的时候，Cheddar 爆料了两款即将到来的 Spectacles 眼镜。其中一款是计划在 2018 年发布的二代产品，改进了性能并修复了 bug 。</p>\r\n<p>另外还有一款计划在 2019 年发布的第三代产品，据说它配备了 2 个摄像头、支持 GPS、售价 300 美元。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4412189f8c1.jpg\" alt=\"screenshot_2018_04_11_08.31.06_1024.png.jpg\" /></p>\r\n<p>2016 年发布的初代 Spectacles 在营销上一度相当成功，很多人排着长队、甚至愿意出高价购买一副。即便炒作的热度很快就消散，但至少为该公司赚到了 4000 万美元。</p>\r\n<p>从 FCC 文件来看，Spectacles 二代产品的发布应该无需等待太久。当然，通过 FCC 认证也不见得产品会真的上市。</p>\r\n<p>[编译自：<a href=\"https://www.theverge.com/circuitbreaker/2018/4/11/17223426/snapchat-spectacles-second-generation-model-002\" target=\"_self\">TheVerge</a>]</p>', '', 'overseas', 'vr', 0);
INSERT INTO `fa_cms_addonnews` VALUES (8, '<p>云存储服务商Dropbox今日宣布，由于投资者需求强劲，现将IPO(数次公开招股)发行价区间调高2美元。上周一，Dropbox宣布将IPO发行价区间定为每股16美元至18美元，最高融资6.48亿美元，公司市值将达到约71亿美元。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44120f16870.jpg\" /></p>\r\n<p>但Dropbox今日宣布，由于投资者需求强劲，现将发行价区间调高2美元，至每股18美元至20美元。这意味着Dropbox此次IPO最多将融资7.2亿美元，公司市值将达到约78.5亿美元。</p>\r\n<p>业内专家杰伊&middot;瑞特(Jay Ritter)称，与Box等竞争对手相比，Dropbox最初给出的IPO发行价区间确实有些保守。</p>\r\n<p>虽然调高了发行价区间，但Dropbox当前估值仍低于2014年100亿美元的估值。</p>\r\n<p>昨日就有报道称，Dropbox IPO股票已被超额认购，表明今年市场对第一大科技股的需求十分旺盛。</p>\r\n<p>Dropbox成立于2007年，上个月提交了IPO招股书。Dropbox计划在纳斯达克上市，证券代码为&ldquo;DBX&rdquo;。</p>', '', 'overseas', 'ar', 0);
INSERT INTO `fa_cms_addonnews` VALUES (9, '<p>著名云存储服务提供商Dropbox在上市交易首日股价大涨36%，开盘定价为21美元每股，在当日最高时达到31.6美元每股，最终以28.48美元每股的价格收盘，现在市值超过120亿美元。可以明显看出公开市场投资者十分看好Dropbox这家主营业务为云存储服务和内容协作平台的公司。Dropbox最先对自己股价的预期是16到18美元每股，后来提升到18到20美元每股。而由于上市交易首日表现出色，超过了2014年私募时100亿美元的估值。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44120cd28e0.jpg\" /></p>\r\n<p>在2017年，Dropbox实现营收11亿美元。较2016年的8.45亿美元和2015年的6.04亿美元的年度总营收增长不少。不过，Dropbox至今尚未实现盈利，去年净亏损为1.12亿美元。该数字在2016年和2015年分别是2.1亿美元和3.26亿美元，可以看出其净亏损在逐年减少。其从每个付费用户获得的平均收入为111.91美元。</p>\r\n<div id=\"cbhahaha\" class=\"otherContent_01\">&nbsp;</div>\r\n<p>由于Dropbox采用的是免费+付费模式，既有面向消费者的业务也有面向企业的业务。Dropbox曾表示其所有5亿注册用户中只有1100万为其产品付费。</p>\r\n<p>著名风投公司红杉资本合伙人、Dropbox董事会成员布莱恩&middot;施莱尔（Bryan Schreier）称：&ldquo;Dropbox结合了一家消费者公司该有的规模和影响力和一家软件公司该有的长期收益的优势。&rdquo;他表示现在正是Dropbox上市的最佳时机，因为&ldquo;其业务规模和现金流都已经达到一定程度，足以支撑其上市计划&rdquo;。</p>\r\n<p>作为Dropbox的早期投资机构，红杉资本如今持有Dropbox 23.2%的股份。另一家风投公司Accel是第二大机构股东，持有5%的股份。Dropbox创始人兼首席执行官德鲁&middot;休斯敦（Drew Houston）持有公司25.3%的股份。</p>\r\n<p>投资机构Greylock Partners也拥有少量Dropbox股份，其合伙人约翰&middot;里利（John Lilly）说：&ldquo;之所以投资Dropbox，是因为德鲁和他的团队对未来的工作模式有着清晰的认识，并打造了一个满足现代生产力需求的产品。&rdquo;</p>\r\n<p>不过，目前市场上有大量与Dropbox相似的产品。Dropbox称：&ldquo;内容协作平台市场竞争激烈且变化很快。在云存储业务方面，我们面临来自<a href=\"http://t.cn/R61I7ap\" target=\"_blank\" rel=\"noopener\" data-link=\"1\">亚马逊</a>、苹果、谷歌、和<a href=\"http://clkde.tradedoubler.com/click?p=235167&amp;a=2355305&amp;g=21862034\" target=\"_blank\" rel=\"noopener\" data-link=\"1\">微软</a>公司同类产品的竞争。而在内容协作市场则有来自Atlassian、谷歌、和微软公司的竞争。我们与Box的竞争则主要局限在面向大型企业用户的云存储服务领域。&rdquo;</p>\r\n<p>Box是一家从事与Dropbox类似业务的公司，经常与Dropbox一起被提到。不过Box商业模式与Dropbox不同，其更专注于企业用户。在Dropbox上市首日，Box股价下跌了8.2%。</p>', '', 'overseas', 'ar', 0);
INSERT INTO `fa_cms_addonnews` VALUES (10, '<p><strong>云存储公司Dropbox周五向美国证券交易委员会（SEC）提交了IPO（首次公开招股）申请文件，寻求筹集5亿美元资金。</strong>Dropbox的IPO交易长期以来备受市场期待，该公司四年前在私募投资市场上的估值就已高达100亿美元。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44120825a50.jpg\" /></p>\r\n<p>这家硅谷创业公司成立于2007年。在IPO申请文件中，该公司披露信息称其过去三年的营收分别为6.038亿美元、8.448亿美元和11.1亿美元，而亏损则从3.259亿美元渐次收窄到了2.102亿美元和1.117亿美元。</p>\r\n<p>据《华尔街日报》报道，Dropbox此前通过私募融资回合已经筹集到6亿美元资金。在2014年1月进行的最后一个融资回合中，该公司估值达100亿美元。</p>\r\n<div id=\"cbhahaha\" class=\"otherContent_01\">&nbsp;</div>\r\n<p>Dropbox计划在纳斯达克挂牌上市，股票代码为&ldquo;DBX&rdquo;。共有12家银行将担任该公司IPO交易的承销商，其中主承销商是高盛集团和摩根大通。</p>\r\n<p>文件还披露信息称，Dropbox去年每付费用户平均收入为11.91美元，高于2016年，但低于2015年；注册用户总数达5亿人，自2017年初以来的新注册用户人数为1亿人；付费用户总数达1100万人以上；毛利率为67%。</p>\r\n<p>Dropbox此前就已秘密向美国证券交易委员会提交了IPO申请文件，后者在周五对外公布了该文件。文件显示，Dropbox联合创始人及CEO德鲁&middot;休斯顿（Drew Houston）持有24.4%具备投票权的股票，风投公司红杉资本（Sequoia Capital）持有24.8%股权。</p>\r\n<p>受研发预算扩大的影响，Dropbox的支出有所增长，但该公司已在2016年实现了正向的自由现金流。很多云公司都依靠企业销售团队来获取收入，但Dropbox则与众不同，该公司90%以上营收都来自购买自己的订阅服务的用户。不过，这家仍未摆脱亏损的公司仍面临约17亿美元的合同义务，如租约和未偿还债务等。</p>\r\n<p>另外，Dropbox还面临着严峻的竞争压力，其各方面业务与<a href=\"http://t.cn/R61I7ap\" target=\"_blank\" rel=\"noopener\" data-link=\"1\">亚马逊</a>、苹果公司、谷歌和<a href=\"http://clkde.tradedoubler.com/click?p=235167&amp;a=2355305&amp;g=21862034\" target=\"_blank\" rel=\"noopener\" data-link=\"1\">微软</a>等科技巨头之间存在竞争关系。</p>\r\n<p>来自于IPO交易的收入将被用于融资一项扩张计划，内容包括将更多用户升级至订阅用户，以及扩大与第三方软件之间的整合等。</p>\r\n<p>在Dropbox的IPO申请文件公布以后，其竞争对手Box的股价上涨2.8%。Dropbox曾五次入选&ldquo;CNBC Disruptor 50&rdquo;榜单，该榜单每年公布一次，评选出50家最有影响力、最具有开拓精神的创业公司。</p>', '', 'overseas', 'ar', 0);
INSERT INTO `fa_cms_addonnews` VALUES (11, '<p>通用电气（GE）为推广Predix云平台的应用开发，在国内推出首期\"Predix星火计划\"，以奖励基于该平台的工业互联网开发者。首期有4家企业获奖，将进驻GE孵化器并获得技术支持和潜在投资机会。</p>\r\n<p><img title=\"\" src=\"https://cdn.fastadmin.net/uploads/20180416/5ad441204c1c20.png\" /></p>\r\n<p>参与该计划的团队需基于GE Predix平台，开发适合工业领域的资产绩效管理（APM）应用，用于工业企业实时、安全地收集和分析数据，增加正常运行时间、降低成本、减少运营风险。</p>\r\n<p>GE Predix是一个基于Cloud Foundry(CF)的云平台，专攻制造业。跟Azure，AWS的PaaS服务相比，Predix的优势在于对于工业数据的导入做了专门优化。</p>\r\n<p>2017年\"Predix星火计划\"采用提名邀请，共有16家GE合作伙伴及创业公司提交了内容涵盖包括能源、医疗、设备制造等领域的工业应用项目方案。</p>\r\n<p>获奖企业中，广采科技由思科参与投资，提供货物与集装箱的全球跟踪服务。实视科技面向汽车、装备制造等客户开发用于智能眼镜的AR应用。华瑞特信息主要开发企业业务管理流程整合应用。华中思能主要针对电力企业开发节能减排、运营优化、故障诊断应用。</p>\r\n<p>四家获奖企业将获得的资源支持包括，进驻位于上海的GE数字创新坊孵化1个月、期间将有GE技术团队支持和GE创投部门考察进一步投资机会。</p>', '', 'local', 'ar', 0);
INSERT INTO `fa_cms_addonnews` VALUES (12, '<p><strong>据外媒报道，Cloudflare 公司正将其业务拓展到网站和云应用之外的互联网安全领域。</strong>此前，Cloudflare 帮助过企业屏蔽恶意流量，并且让它们的线上内容加载得更加迅速。而根据今日披露的内容，这项新服务旨在保护那些在公共网络背景下运行的联网基础设施，涵盖了从企业内部电子邮件服务器、到领域内部署的联网设备等各个方面。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4411fb836c0.png\" alt=\"cloudflare.png\" /></p>\r\n<p>尽管其中有一些是在孤立的网络中运行，但又许多这样的系统是通过开放的 Web 进行通讯的。如此一来，它们就和网站一样，很容易受到分布式拒绝服务攻击的影响。</p>\r\n<p>Cloudflare 表示，Spectrum 允许企业通过相同的 DDoS 缓解功能（其一直为在线服务提供的那种），来应付这些威胁。</p>\r\n<p><strong>对于这些攻击的抵御，Cloudflare 的解决方案其实很简单：</strong></p>\r\n<blockquote>\r\n<p>当流量突然激增的时候，系统会猜测事件可能由 DDoS 引发，然后将请求转发到自家的 150 个数据中心网络。</p>\r\n<p>Cloudflare 的基础设施相当强大，能够承受住巨量的攻击而不被斩断。</p>\r\n</blockquote>\r\n<p>当然，这么做还有另一个好处 &mdash;&mdash; 即便企业没有一个内置的连接保护机制，Spectrum 服务也允许企业对系统传输的数据进行加密。</p>\r\n<blockquote>\r\n<p>对企业来说，Cloudflare 提供的这项服务极具吸引力。作为附加措施，Spectrum 还提供了 Cloudflare 防火墙工具的集成。</p>\r\n</blockquote>\r\n<p>后者可以自动阻止某些 IP 地址的流量，比如那些被网络安全机构标记的恶意来源。</p>\r\n<p>Cloudflare 早就声称担负了 10% 的全 Web 流量，此前该公司还推出了一项免费的系统服务，承诺让人们浏览的互联网更具隐私。</p>\r\n<p>[编译自：<a href=\"https://siliconangle.com/blog/2018/04/12/cloudflare-moves-beyond-web-services-new-spectrum-security-service/\" target=\"_self\">SiliconAngle</a>]</p>', '', 'overseas', 'ar', 0);
INSERT INTO `fa_cms_addonnews` VALUES (13, '<p>当英特尔上周推出更多更多 Coffee Lake CPU 和配套主板时，传说中的 Z390 芯片组却意外缺席了。<strong>不过有眼尖的人们发现，主板厂商映泰（Biostar）在自家 B360 Racing GT5 手册中，竟然清楚地列明了另一款名叫&ldquo;Z390GT5&rdquo;主板的存在。</strong>作为一个二线品牌，映泰的产品主打平价而不是古怪的设计。不过它与现有的 Z370 系列没有太大差别，而且最高支持的 CPU TDP 也仅为 95W，刚好够酷睿 i7-8700K 使用而已。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4411ecab1c0.jpg\" alt=\"Biostar-Z390-Racing-GT3-1000x658.jpg\" /></p>\r\n<p>此前有传闻称，某款八核 Coffee Lake 芯片的 TDP 可能超过这个数值。若真如此，Z390 芯片组存在的意义，可能就是比 H370 系列多一些 PCIe 通道、内建 USB 3.1 Gen 2、以及 CNVi Wi-Fi 支持。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4411f2854d1.png\" alt=\"z390gt5.png\" /></p>\r\n<p>映泰的公告中并未详细给出这些特性，所以仍有待证实。去年的泄露似乎表明，该公司的 Z390 芯片组会包含自家的音频硬件，但这块板子仍然采用了老旧的瑞昱（Realtek）编解码器。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4411f72b3d2.png\" alt=\"Biostar-Z390-GT5-layout.png\" /></p>\r\n<p>[编译自：<a href=\"https://techreport.com/news/33492/rumor-biostar-manual-tips-off-the-existence-of-a-z390-chipset\" target=\"_self\">TechReport</a>&nbsp;, 来源：<a href=\"https://videocardz.com/75858/biostar-confirms-z390-racing-gt3-gt5-motherboards\" target=\"_self\">VideoCardz</a>]</p>', '', 'overseas', 'ar', 0);
INSERT INTO `fa_cms_addonnews` VALUES (14, '<p>4 月 11 日，Valve 宣布旗下著名的 PC 游戏发行平台 Steam 会推出新的用户数据隐私安全措施。今后玩家们可以选择隐藏你的游戏库内容，也可以隐藏你的活动细节，具体到最近收藏什么游戏，买了什么游戏，玩了什么游戏以及在某游戏上花了多少小时等等。</p>\r\n<p>此前，这些信息全部是公开的，不仅你的好友可以看到，发表评论的时候社区用户可以看到，而且第三方可以采用 Steam API 轻而易举的获得，那些 PC 游戏数据提供商（Steam Spy 之类）就是依靠这些用户数据提供服务的。</p>\r\n<p>新的隐私措施实行后，不管是其他用户还是第三方，将无法轻易获取这些数据。也就是说，如果你想要隐藏，那就永远不会有第三者知道你在某成人视觉小说游戏上面花了多少时间。</p>\r\n<div id=\"cbhahaha\" class=\"otherContent_01\">&nbsp;</div>\r\n<p>这对 Steam 用户当然是个不错的消息，而受影响最大的是 Steam Spy 这种收集并分析数据的第三方。Steam Spy 说起来大家都不会太陌生，很多相关新闻也会引用 Steam Spy 的数据报告。他们根据过滤器筛选数据，然后将 Steam 上的游戏统计呈现给更多人浏览，但随着 Valve 关闭 Steam 可用库数据，包括 Steam Spy 在内的第三方可能都要面临倒闭。</p>\r\n<p>目前还未清楚 Valve 有没有其他替代方案，用以让第三方继续提供数据服务，或者单独推出面向开发者的数据统计工具。</p>\r\n<p>Steam Spy 的创始人 Sergey Galyonkin 在接受外媒采访时说，&ldquo;如果他们真的想遵守法律，应该隐藏所有的个人资料信息。目前他们有默认情况下暴露的敏感信息，只有游戏库被隐藏。这并不合理。&rdquo;默认情况下，你的 Steam 个人资料仍会向所有人显示识别信息，例如你的社交媒体帐户。</p>\r\n<p>Steam Spy 创始人提到的&ldquo;法律&rdquo;，其实是 5 月 25 日生效的欧盟&ldquo;GPDR&rdquo;，全称&ldquo;通用数据保护条例&rdquo;，欧盟的新规定要求公司加密所有&ldquo;非公开信息&rdquo;。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4411e749b30.jpg\" /></p>\r\n<p>所以我们可以认为 Valve 做出这一决定并不绝对与近期爆发的 Facebook 数据泄露事件有关，但是这一事件肯定推动了 G 胖尽快落实自己的隐私安全措施。在这个时期，恰到好处地透露给用户&ldquo;我们是一家坚定保护用户信息安全的公司&rdquo;这样的信息，就是一颗很好的定心丸了。</p>\r\n<p>可以想见 Facebook 数据泄露以及后来的 Cambridge Analytica 丑闻给各大科技公司带来了怎样的压力。尽管 Steam 光是卖游戏就能保证自己足够赚钱，看起来完全没有出卖数据的必要，Steam Spy 上收集的游戏数据和用户游戏行为，于操弄政治的 Cambridge Analytica（剑桥分析公司）之流也产生不了什么价值，但谁敢说有朝一日不会因金钱诱惑发生与 Facebook 丑闻类似的事情呢？</p>\r\n<p>Valve 宁愿让一家第三方数据服务商去死，也不会冒着 G 胖走进国会接受听证的风险，无数玩家还在苦苦等待《半条命3》呢。放整个业界来讲，不管是哪家公司，都不敢再承担一次这样的&ldquo;风暴潮&rdquo;。</p>\r\n<p><strong>Facebook的教训</strong></p>\r\n<p>Facebook 身处争议漩涡，人们的抗议达到了顶峰。有人怀疑它的用处，有人直接否认它的用处，在当前的信任危机下，一切情绪都持续放大，公司和公司的使命被极端质疑。Facebook的市值自从指控以来已经减少超过500亿美元，情况简直糟糕。</p>\r\n<p>上个月，根据纽约时报、卫报曝光 Facebook 发生了严重的数据泄露，波及用户有 5000 万人之多，外泄信息被商业公司利用建立成性格模型，用来操纵了 2016 年的美国大选。</p>\r\n<p>Facebook 日前承诺 ，对于受 Cambridge Analytica 数据丑闻影响的用户，该公司会专门进行通知。毫无疑问，自 Facebook 泄密丑闻曝光以来，许多人都在等待这样的消息。随着马克&middot;扎克伯格（Mark Zuckerberg）在美国参议院听证会上作证，更多关于数据丑闻的细节浮出水面。</p>\r\n<p>在过去一年的动荡中，Facebook 广告的基本理念，即基于用户隐藏性格特征来投放广告，已被证明是一种恶意利用用户信息，且容易遭到滥用的做法。Facebook 对此的回应与其他科技行业巨头的态度类似：感到震惊，向用户保证这绝对不是有意的行为，以及承诺采取行动。</p>\r\n<p>扎克伯格面对数不清的镜头提出的观点也颇有意思，他说经过此事希望美国数据处理和隐私规则能发生演化，其中包括直接呼吁放松监管来避免美国公司落后于中国竞争对手&mdash;&mdash;在西方人的脑子里，中国好像是毫无个人信息隐私而言的地方。</p>\r\n<p>他谈到了&ldquo;让人们完全控制&rdquo;自己所分享内容的概念，声称这是&ldquo;Facebook 最重要的原则&rdquo;。</p>\r\n<p>&ldquo;你在 Facebook 上分享的所有内容都归你自己所有，而且你完全控制着谁能看到它以及如何进行分享。此外，你还可以随时删除它。&rdquo;扎克伯格说道，并未提及该公司在其发展早期阶段距离这样的原则有多遥远。</p>\r\n<p>国外媒体纷纷认为扎克伯格的辩解不太含蓄，因为其他平台泄漏数据的规模都比不上 Facebook，而用户是否会买扎克伯格这个账还有待观察。</p>\r\n<p><strong>怼怼苹果 更开心</strong></p>\r\n<p>一般大公司的 CEO 都充当了企业发言人的角色，经常在各种访谈、社交媒体上发表自己的言论，甚至是向竞争对手开炮。</p>\r\n<p>Facebook 因为用户隐私泄露被网友围攻的时候，苹果 CEO 库克自然也被媒体围着追问对这件事情的看法，库克的回答十分尖锐：</p>\r\n<p>&ldquo;对我们来说用户隐私等同于用户的权利和公民自由，但是 Facebook 是一个免费服务，所以用户在这个服务中反而成了卖给广告商的商品，如果苹果这么做，我们将能赚到很多钱，但苹果最好不、也永远不会这么做。&rdquo;</p>\r\n<p>在隐私方面，苹果一直奉行着严格的标准，而且它自己也一直以这种严格为傲，苹果的隐私方案多次承诺&ldquo;我们不会根据你的电子邮件内容或网页浏览习惯来建立档案，然后出售给广告商。我们不会用你存放在&nbsp;<a href=\"http://aos.prf.hn/click/camref:100lcC/creativeref:305226\" target=\"_blank\" rel=\"noopener\" data-link=\"1\">iPhone</a>&nbsp;或 iCloud 上的信息来赚钱。&rdquo;</p>\r\n<p>他们有时甚至把美国政府搞得灰头土脸。在对发生在加利福尼亚州圣贝纳迪诺的大规模枪击案调查期间，苹果拒绝帮助美国联邦调查局解锁一名嫌犯的 iPhone，甚至不惜为此与政府对簿公堂。解锁嫌犯的 iPhone 要求开发专门软件，苹果认为影响所有用户手机的安全功能。美国司法部随后在没有苹果帮助的情况下自己找到解锁嫌犯手机的方法。</p>\r\n<p>直到现在，FBI 还在想方设法的要破解 iPhone。库克的态度肯定是&mdash;&mdash;抗争到底。</p>\r\n<p>当然，苹果对用户隐私的严格保护也是经过惨痛教训的，2014 年好莱坞女星照片泄露事件波及众多大腕，在全球引起了极大的注意，让苹果和 iCloud 都摊上了大事。虽然那一次隐私泄露是由于黑客行为，和今天说的用户数据泄露、滥用态度有所区别，但那一次事件让所有人开始思考应该如何给个人信息添加更严实的门锁，更谨慎细致地保护云端安全。</p>\r\n<p>所以，记住这些教训，可以让苹果和 Facebook 们以后不再那么惨痛。这次也一样。</p>', '', 'local', 'vr', 0);
INSERT INTO `fa_cms_addonnews` VALUES (15, '<p>今天，W3C和FIDO联盟标准机构宣布，Web浏览器正在构建一种新的登录方式。这款名为WebAuthn所呈现的新开放标准将在最新版本的Firefox中得到支持，并将在未来几个月发布的Chrome和Edge的版本中得到支持。<strong>这是多年来的最新举措，目的是让用户远离密码，转向更安全的登录方式，如生物识别和USB令牌。</strong></p>\r\n<p>该系统已经在谷歌和Facebook等主要服务上就位，在那里你可以使用符合FIDO标准的Yubikey设备登录。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4411e3a7db0.png\" alt=\"Security-Key-by-Yubico.png\" /></p>\r\n<p>WebAuthn将无疑将加速安全登录的实现，无论是将这些技术作为备用登陆方式，还是完全取代密码。随着更多的开源代码为新标准而编写出来，开发者将更容易实现新的登录方式。</p>\r\n<p>&ldquo;以前，USB令牌登陆的模式只运用于谷歌、<a href=\"http://clkde.tradedoubler.com/click?p=235167&amp;a=2355305&amp;g=21862034\" target=\"_blank\" rel=\"noopener\" data-link=\"1\">微软</a>和Facebook等大公司，&rdquo;参与Firefox工作的Selena Deckelmann说。&ldquo;现在，通过WebAuthn，更多的用户将能够体验安全登录。&rdquo;</p>\r\n<p>因为FIDO标准是建立在零知识的基础上的，所以没有一串字符可以保证对一个账户的访问，这使得传统的钓鱼攻击变得更加困难。它为有安全意识的用户和企业提供了保护自己的重要途径。随着越来越多的服务转向支持更安全的登录方式，FIDO-ready用户的数量会越来越多。</p>\r\n<p>Deckelmann说：&ldquo;它能真正的规避安全隐患，但现在我们还没到那一步，这将是我们的美好未来。&rdquo;</p>', '', 'overseas', 'vr', 0);
INSERT INTO `fa_cms_addonnews` VALUES (16, '<p>Github 去年推出的<a href=\"https://www.oschina.net/news/90737/security-alerts-on-github\">安全警告</a>，极大减少了开发人员消除 Ruby 和 JavaScript 项目漏洞的时间。<strong>GitHub 安全警告服务，可以搜索依赖寻找已知漏洞然后通过开发者，以便帮助开发者尽可能快的打上补丁修复漏洞，消除有漏洞的依赖或者转到安全版本。</strong></p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4411db71750.png\" alt=\"36836206-97565a64-1ced-11e8-990f-d12cb4b003e5.png\" /></p>\r\n<p>根据 Github 的说法，目前安全警告已经报告了 50 多万个库中的 400 多万个漏洞。在所有显示的警告中，有将近一半的在一周之内得到了响应，前7天的漏洞解决率大约为30%。实际上，情况可能更好，因为当把统计限制在最近有贡献的库时，也就是说过去90天中有贡献的库，98%的库在7天之内打上了补丁。</p>\r\n<p>这个安全警报服务会扫描所有公共库，对于私有库，只扫描依赖图。每当发现有漏洞，库管理员都可以收到消息提示，其中还有漏洞级别及解决步骤提供。</p>\r\n<p>安全警告服务现在只支持 Ruby 和 JavaScript，不过 Github 表示 2018 年计划支持 Python。</p>', '', 'domestic', 'ar', 0);
INSERT INTO `fa_cms_addonnews` VALUES (17, '<p>AV-TEST公布了2018年1~2月杀毒软件的最新测试情况，稍稍有点不接地气的是，基于Windows 10企业版平台。排名第一的依然是铁打的卡巴斯基，3个满分总计18分无悬念。不过，这次Symantec和Trend Micro也是18满分，令人刮目相看。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4411cec01d0.jpg\" /></p>\r\n<p><a href=\"http://img1.mydrivers.com/img/20180329/989bd28efaea4c2f831fe5f2405b4b8b.jpg\" target=\"_blank\" rel=\"noopener\" data-index=\"1\" data-lightbox-gallery=\"cbc-gallery\"><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4411d587af1.jpg\" /></a></p>\r\n<p>Bitdefender稍稍遗憾，以0.5分的差距（易用性非满分）排名第二，第三名17分也有3名，分别是你Avast、McAfee和<a href=\"http://clkde.tradedoubler.com/click?p=235167&amp;a=2355305&amp;g=21862034\" target=\"_blank\" rel=\"noopener\" data-link=\"1\">微软</a>。</p>\r\n<p><strong>是的，你没有看错，微软自带的Defender居然防护力满分和性能/易用性两个5.5分并列第三名。</strong></p>\r\n<p>这次排名最后的是F-Seecure，仅拿到14.5分。</p>', '', 'domestic', 'ar', 1);
INSERT INTO `fa_cms_addonnews` VALUES (19, '<p>今日，谷歌分享了 Semantic Experiences，在博客中展示了两大关于自然语言理解的互动工具。Talk to Books 是一个可以从书中的句子层面搜索书籍的全新检索模式；另一个互动内容则是 Semantris，一个由机器学习驱动的单词联想游戏。</p>\r\n<p>地址：</p>\r\n<div id=\"cbhahaha\" class=\"otherContent_01\">&nbsp;</div>\r\n<p><a href=\"https://research.google.com/semanticexperiences/\" target=\"_blank\" rel=\"noopener\">https://research.google.com/semanticexperiences/</a></p>\r\n<p>谷歌还发布了「通用语句编码器」（Universal Sentence Encoder），更加详细地呈现了上述示例所使用的模型；当然，谷歌还为开源社区提供了一个预训练的 TensorFlow 模型，开发者可以测试自己的句子及短语编码。</p>\r\n<p>地址：</p>\r\n<p><a href=\"https://tfhub.dev/google/universal-sentence-encoder/\" target=\"_blank\" rel=\"noopener\">https://tfhub.dev/google/universal-sentence-encoder/</a></p>\r\n<p>自然语言理解在近年已经有了极大进步，这得益于词向量（word vectors）的发展，这一技术使算法能根据实际语言使用的例子来学习单词之间的关系。这些向量模型根据概念和语言的等价性、相似性或关联性，将语义相似的词或短语投影到临近点。</p>\r\n<p><strong>建模方法</strong></p>\r\n<p>谷歌拓展了在向量空间中表征语言（language）的构想，这一想法通过为像完整句子或段落为代表的较大语言块创建向量来实现。语言是由具有概念的层次结构组成的，因此团队采用模块的层次结构来构建向量，每一模块都要考虑与不同时间尺度序列所对应的特征。各种类型的关系，如关联、同/反义、部分/整体等都可以用向量空间语言表示。团队在论文《Efficient Natural Language Response for Smart Reply》有更多介绍。</p>\r\n<p>论文地址：</p>\r\n<p><a href=\"https://arxiv.org/abs/1803.11175\" target=\"_blank\" rel=\"noopener\">https://arxiv.org/abs/1803.11175</a></p>\r\n<p>Talk to Books</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4411b4c3960.jpg\" /></p>\r\n<p>以往我们在检索书籍时，通常会从书名、作者、主题等表面标签入手。而谷歌发布的「Talk to Books」可以为用户提供一种检索书籍的全新方法。用户只需要做一段相关描述，或是提一个相关的问题，那么 Talk to Books 可以在不依赖关键词匹配的情况下，从超过 10 万本书籍中检索所有句子，并根据句子层面的语义，找到能匹配用户陈述或问题的句子。从某种意义上来说，Talk to Books 是一种用户与书「交谈」的新模式，系统给出的回答也能帮助用户确定自己是否对相关主题感兴趣。</p>\r\n<p>模型在正式发布前经历了超十亿次的对话训练，以打磨更好的用户体验&mdash;&mdash;对用户的提问或陈述给出更加合适的回答。这一方式相比起普通的谷歌检索，可能会帮助用户找到一些更有趣的书籍，特别是在关键字搜索中并不会显示的一些结果。</p>\r\n<p>不过，这一模型还有更多的改进空间，比如搜索范围局限在句子层面上，而不是段落，因此可能会产生「断章取义」的情况。另外，因为只看某一句子的匹配程度，这也可能导致某些众所周知的、「符合口味」的书并不会出现在检索结果的前列。谷歌团队此举，更多的是希望帮助人们以一种新的探索方式，发现不曾料想过的作者和书名，竟然会有读者感兴趣的内容。</p>\r\n<p>地址：<a href=\"https://books.google.com/talktobooks\" target=\"_blank\" rel=\"noopener\">https://books.google.com/talktobooks</a></p>\r\n<p>Semantris</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4411c8b9211.gif\" /></p>\r\n<p>Semantris 是一个由相同技术驱动的单词联想游戏。屏幕上会呈现所有单词，用户可以输入某个单词，随即系统会根据屏幕上单词与用户输入单词的关联程度进行重新排序。不论是近义词、反义词还是相近概念，系统都能找到对应的排序模式。</p>\r\n<p>如图所示，用户输入「Photo」时，最顶部的「Camara」因为与输入单词的关联最为紧密，因此会更替排序调整到第一位「消掉」。这确实是一个锻炼联想能力的好机会，此外还有限时模式和不限时模式供用户体验。</p>\r\n<p>地址：<a href=\"https://research.google.com/semantris\" target=\"_blank\" rel=\"noopener\">https://research.google.com/semantris</a></p>\r\n<p>相信在这两个工具的驱动下，人工智能能够与用户更好地进行交互学习，并且帮助人类在现实生活中更好地理解科技，使用科技，并受惠于科技。</p>', '', 'domestic', 'ar', 1);
INSERT INTO `fa_cms_addonnews` VALUES (20, '<p><strong>针对新兴市场，Google希望通过Google Go轻量级应用帮助身处网络速度慢、流量资费高昂地区的用户获得更流畅的网络搜索体验</strong>。现在谷歌正向在26个撒哈拉以南非洲国家/地区推广，Google Go轻量级应用可以让搜索数据用流量减少40%，并且支持对以往搜索记录的脱机访问。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4411b10d540.png\" alt=\"TIM截图20180413142756.png\" /></p>\r\n<p>Google Go 应用本身只有 5MB 大小，对于低存储空间设备很友好，这款应用也是不意外地有离线模式，主要针对的是网络条件不好地区的用户。除了应用本身的性能优化以外，Google Go 还能显示搜索结果的主题摘要信息，同时也会向用户推荐更多可能会感兴趣的内容，也拥有当前流行趋势主题推荐和语音搜索功能。</p>\r\n<p>Google Go 还可配合 YouTube Go 和文件管理应用 Files Go 使用，该应用将在 Android Oreo（ Go Edition ）设备中预装进行分发，让非洲等新兴市场的消费者得到更流畅、更便捷的 Android 系统体验。</p>', '', 'domestic', 'ar', 10);
INSERT INTO `fa_cms_addonnews` VALUES (21, '<p>尽管已经研发两年多时间，但对于Fuchsia系统Google始终缄口不言。不过今天，公司发表了名为&ldquo;<a href=\"https://fuchsia.googlesource.com/docs/+/master/the-book/\" target=\"_blank\" rel=\"noopener\">The Book</a>&rdquo;的深度解析文档，详细介绍了这款计划取代Android和Chrome OS的操作系统。 目前Android和Chrome OS都是使用Linux内核，不过在最新发布的文档中谷歌明确Fuchsia并非基于Linux内核。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4411ab103e0.jpg\" alt=\"google-says-its-upcoming-fuchsia-os-is-not-linux-uses-zircon-kernel-520641-2.jpg\" /></p>\r\n<p>根据公布的文档，Fuchsia是基于功能的模块化系统，使用名为&ldquo;Zircon&rdquo;（锆石）的内核，该微内核为Fuchsia系统提供核心驱动以及C Library（libc）实例。</p>\r\n<p>虽然文档仍未完成，但是我们也注意到Google正在打造的Fuchsia OS非常独特，极具创新且前途无限。这款系统从头构建自己的库和组件，通过POSIX向后兼容性和使用基于Vulkan的驱动打造出类UNIX系统。</p>\r\n<p>Fuchsia系统使用名为&ldquo;Escher&rdquo;的物理渲染器，提供物体的Soft Shadows，镜头特效、光影扩散和色彩外溢等功能。此外Fuchsia的文件系统完全在用户空间之间进行操作，并没有链接或者加载到内核中。</p>\r\n<p>在文档中写道：&ldquo;Fuchsia的文件系统本身可以很容易的进行更改--修改不需要重新编译内核。事实上，对Fuchsia的文件系统更新可以不需要重启。&rdquo;</p>', '', 'domestic', 'vr', 10);
INSERT INTO `fa_cms_addonnews` VALUES (22, '<p>谷歌手机应用程序在2月份收到了主要更新，为快速通话控件添加了便捷的聊天功能。<strong>在接下来的几周里，Pixel，Nexus和Android One设备的默认拨号程序正在添加垃圾邮件过滤功能，并附带一个新的测试版程序，现在就可以试用该功能。</strong></p>\r\n<p>2016年，该应用程序开始通过将来电屏幕以鲜红色闪烁，并通过电话号码下方的另一个&ldquo;怀疑垃圾邮件来电者&rdquo;警报来提醒用户潜在的垃圾邮件来电者。现在，测试中新的垃圾邮件过滤功能更进一步增强，不再打扰用户。当检测到潜在的垃圾邮件呼叫时，将直接把它发送到语音邮件。因此，手机不会响铃，用户也不会被打搅。</p>\r\n<p>同时，用户不会收到未接电话或语音邮件通知，但已过滤的电话将出现在通话记录中，并且任何留下的语音邮件仍将显示在相应的选项卡中。此功能将在未来几周内在全球范围内推出，但加入新版测试户可以率先使用该功能。和其他程序一样，Google指出允许用户在发布之前使用这种实验性功能。</p>\r\n<p>谷歌警告说，功能仍然在开发中，可能不稳定，并且存在&ldquo;一些问题&rdquo;。同时，用户将需要有能力在整个过程中提交应用内反馈。想要参与测试的用户可以前往电话应用的Google Play列表，然后向下滚动到&ldquo;成为测试人员&rdquo;以加入。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4411a368920.jpg\" /></p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4411a76c4f1.jpg\" /></p>', '', 'domestic', 'ar', 10);
INSERT INTO `fa_cms_addonnews` VALUES (24, '<p>谷歌正在与美国医学协会（美国的一个医师游说团体）进行合作，双方达成一项挑战计划，其内容是让初创企业能够想出&ldquo;促进健康监测设备数据共享的最佳新思路&rdquo;。美国医学协会于周一表示，最终的挑战成果将会是一款手机应用或可穿戴设备。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44119d944a0.png\" /></p>\r\n<p>这两者可以让慢性病患者更轻松地与医生分享数据。</p>\r\n<div id=\"cbhahaha\" class=\"otherContent_01\">&nbsp;</div>\r\n<p>该声明称：&ldquo;获奖作品将展示申请人是如何通过病人的健康数据，借助有效的方式，改善医生工作流程临床效果、降低医疗保健系统成本的。&rdquo;</p>\r\n<p>为了在3万亿美元的医疗保健市场中分得一杯羹，一些科技巨头对于医疗保健该行业的公司展开跨界合作显示出越来越强烈的意向，以促进创新。</p>\r\n<p>&nbsp;</p>\r\n<p>去年，亚马逊公司与默克公司共同发起了一项创新挑战计划，以鼓励Alexa的开发人员们提出新的&ldquo;技能&rdquo;，以帮助在家中接受治疗以及医院中接受治疗的糖尿病患者。</p>\r\n<p>亚马逊并没有过多透露其意图，但CNBC在3月份报道了该公司下一步的宏伟目标：针对老龄人口发展其技术。与年轻人相比，老年人在不同程度上更容易罹患糖尿病等慢性病。</p>\r\n<p>Alphabet选择将本次挑战计划集中在医疗数据的互操作性问题上。这样做的目的，是让患者和提供者能够更容易以计算机可读的格式（而不是PDF格式）共享实验室结果或医学成像这样的数据。从历史角度看，许多医院和他们的技术供应商都倾向于选择将病人&ldquo;锁定&rdquo;到他们独家的设备上，而不是为病人提供便捷的数据访问服务。</p>\r\n<p>值得一提的是，苹果公司也正在通过其医疗记录产品来解决这个问题。</p>\r\n<p>本次&ldquo;谷歌&mdash;&mdash;美国医疗协会&rdquo;挑战赛最终将会产生出3个最佳创意，来共同分享5万美元的谷歌云奖金。</p>', '', 'domestic', 'ar', 10);
INSERT INTO `fa_cms_addonnews` VALUES (25, '<p>最近 Google 在帮助开发者提升 App 可用性上可谓是动作频频，不只发布了无障碍技术指导方案，成立无障碍支援团队，近日还在<a href=\"https://opensource.googleblog.com/2018/03/open-sourcing-gtxilib-accessibility.html\" target=\"_blank\" rel=\"noopener\">博客上宣布</a>开源&nbsp;iOS&nbsp;专用的自动化测试框架 GTXiLib ，以帮助开发者打造无障碍 App 。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad441196ddc60.png\" alt=\"logo_accessibility_checker_color_3x_ios_133in167dp.png\" /></p>\r\n<p>GTXiLib&nbsp;采用&nbsp;Objective-C&nbsp;编写，能与现存的 XCTest 测试框架整合，并在 XCTest 结束调用 tearDown 前，执行所有注册的可用性检查。当 GTXiLib 检测失败时，XCTest 的测试也会失败，两者相辅相成，能够更好地修补和发现问题。</p>\r\n<p>GTXiLib&nbsp;可用于：</p>\r\n<ul class=\" list-paddingleft-2\">\r\n<li>\r\n<p><strong>重用测试：</strong>&nbsp;GTXiLib 集成整合到现有的功能测试流程中，能大幅提升现有测试价值。</p>\r\n</li>\r\n<li>\r\n<p><strong>增量可访问性测试：</strong>&nbsp;GTXiLib 可安装在单一测试用例、测试类或测试的特定子集上，以允许灵活地增加可访问性测试。</p>\r\n</li>\r\n<li>\r\n<p><strong>编写属于自己的检查：</strong>&nbsp;GTXiLib 有一个简单的 API 来根据你的应用的特定需求创建自定义检查。比如，可以检测应用中的每一个按钮是否都具备 accessibilityHint 属性。</p>\r\n</li>\r\n</ul>\r\n<p>Google&nbsp;还表示，为了改进 GTXiLib ，该框架会收集一些使用数据上传至 Google Analytics ，像是测试应用通过或失败的状态，以及应用绑定 ID的 MD5 哈希值，这些信息会让 Google 知道 GTXiLib 的使用情况。若是用户不愿意，则可以选择添加代码片段来停用 Google Analytics 。</p>\r\n<p>相关链接</p>\r\n<ul class=\" list-paddingleft-2\">\r\n<li>\r\n<p>GTXiLib 的详细介绍：<a href=\"https://www.oschina.net/p/gtxilib\" target=\"_blank\" rel=\"noopener\">点击查看</a></p>\r\n</li>\r\n<li>\r\n<p>GTXiLib 的下载地址：<a href=\"https://www.oschina.net/home/login?goto_page=https%3A%2F%2Fwww.oschina.net%2Fnews%2F94948%2Fgoogle-opensource-gtxilib\" target=\"_blank\" rel=\"noopener\">点击下载</a></p>\r\n</li>\r\n</ul>', '', 'domestic', 'vr', 2);
INSERT INTO `fa_cms_addonnews` VALUES (26, '<p><strong>Let\'s Encrypt 宣布 ACME v2 正式支持通配符证书。Let\'s Encrypt 宣称将继续清除 Web 上采用 HTTPS 的障碍，让每个网站轻松获取管理证书。</strong>ACMEv21.6k 是 ACME 协议的更新版本，考虑到行业专家和其他组织可能希望在某天使用 ACME 协议进行证书颁发和管理，它已经通过 IETF 标准流程。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44119326fd0.jpg\" alt=\"Wildcard_certificate.jpg\" /></p>\r\n<p>（配图来自：维基百科）</p>\r\n<p><a href=\"https://en.wikipedia.org/wiki/Wildcard_certificate\" target=\"_self\">Wildcard certificates</a>&nbsp;1.9k&nbsp;允许使用单个证书来保护域的所有子域。在某些情况下，通配符证书可以使证书更容易管理，以帮助使 Web 达到100％ 的 HTTPS 协议。但是对于大多数用例，Let\'s Encrypt 仍然推荐使用非通配符证书。</p>\r\n<p>通配符证书只能通过&nbsp;<a href=\"https://github.com/ietf-wg-acme/acme\" target=\"_self\">ACME</a>v2 获得。为了将 ACMEv2 用于通配符或非通配符证书，你需要一个已更新且支持 ACMEv23.5k 的客户端。Let\'s Encrypt 希望所有客户和订户转换为 ACMEv2，尽管 ACMEv1 API 还没有&ldquo;报废&rdquo;。</p>\r\n<p>另外，通配符域必须使用 DNS-01 质询类型进行验证。这表明你需要修改 DNS TXT 记录才能演示对域的控制以获得通配符证书。</p>\r\n<p>[via&nbsp;<a href=\"https://arstechnica.com/information-technology/2018/03/lets-encrypt-takes-free-wildcard-certificates-live/\" target=\"_self\">ArsTechnica</a>]</p>', '', 'domestic', 'vr', 1);
INSERT INTO `fa_cms_addonnews` VALUES (27, '<p><strong>欧洲电力传输系统运营商网络（ENTSOE）是建立内部能源市场并确保其最佳运作的机构，为解释欧洲的电子钟表运行缓慢超过一个月的原因发表了一份声明。</strong>在一篇引人入胜的题为&ldquo;欧洲大陆的频率偏差对频率控制的电子钟表影响&rdquo;新闻稿中，该组织解释说，频率偏差导致一些数字时钟滞后。</p>\r\n<p>许多数字时钟，主要是那些数字闹钟，烤箱和微波炉，使用电网的频率来保持时间。欧洲的电网运行稳定在50Hz，所有时钟都在计算电源周期。如果频率持续下降一段时间，这就造成电子钟表运行缓慢，这种问题在欧洲似乎已经发生。</p>\r\n<p>根据维基百科，频率随着电网负载而变化，但每24小时的周期数保持严格恒定，以使这些电子时钟保持长时间准确。ENTSOE表示，供应短缺是由东南欧的一个未指定的电力分销商造成的。由于欧洲电网相互连接，自1月中旬以来，这导致整个大陆出现频率问题，这些问题导致钟表回落至五分钟。</p>\r\n<p>在问题解决之前，重置你的时钟几乎是不值得的，因为它们只会滞后。 ENTSOE声明确实承诺欧洲的传输系统运营商为了让时钟恢复正常运行，将实施补偿计划，以纠正未来的时间，，需要多长时间仍然不得而知。与此同时，用户仍然可以依赖任何不联网的石英钟，或者通常通过互联网保持正确时间的电脑，智能手机时钟来查看时间。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44118ca9c40.jpg\" alt=\"1024px-Digital-clock-alarm-796x562.jpg\" /></p>', '', 'domestic', 'vr', 1);
INSERT INTO `fa_cms_addonnews` VALUES (30, '<p>北京时间4月11日早间消息，谷歌母公司Alphabet有望在2018进行新的投资，目前，该公司仍在研究如何优化电池的存储价值。作为世界上风能和太阳能的最大企业买家，谷歌可能很快要进行一项新的清洁能源投资，这次他们锁定的目标是电池。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4412a357f60.jpg\" alt=\"Solarpanel.jpg\" /></p>\r\n<p>资料图</p>\r\n<p>本周二，Alphabet公司能源策略主管奈哈&middot;帕尔默（Neha Palmer）在纽约彭博新能源财经机构举办的未来能源峰会上接受采访时说，&ldquo;2018年我们想有所作为，我们正在对几个项目展开调研。&rdquo;</p>\r\n<p>帕尔默指出，谷歌根据几个选项来决定合理的投资方向。其中一些项目包括：独立的可供给电网的电池场；用于家庭或企业的电表后端设备；一套与太阳能或风力发电场相连的系统。</p>\r\n<p>这一项目需要依靠一项长达数年的供应合同来保证营收，该公司仍在审查这种投资的市场需求。帕尔默说：&ldquo;决策团队尚未搞清楚如何优化电力储存的价值。&rdquo;</p>', NULL, 'domestic', 'ar', 1);
INSERT INTO `fa_cms_addonnews` VALUES (32, '<p>北京时间4月11日早间消息，谷歌母公司Alphabet有望在2018进行新的投资，目前，该公司仍在研究如何优化电池的存储价值。作为世界上风能和太阳能的最大企业买家，谷歌可能很快要进行一项新的清洁能源投资，这次他们锁定的目标是电池。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4412a357f60.jpg\" alt=\"Solarpanel.jpg\" /></p>\r\n<p>资料图</p>\r\n<p>本周二，Alphabet公司能源策略主管奈哈&middot;帕尔默（Neha Palmer）在纽约彭博新能源财经机构举办的未来能源峰会上接受采访时说，&ldquo;2018年我们想有所作为，我们正在对几个项目展开调研。&rdquo;</p>\r\n<p>帕尔默指出，谷歌根据几个选项来决定合理的投资方向。其中一些项目包括：独立的可供给电网的电池场；用于家庭或企业的电表后端设备；一套与太阳能或风力发电场相连的系统。</p>\r\n<p>这一项目需要依靠一项长达数年的供应合同来保证营收，该公司仍在审查这种投资的市场需求。帕尔默说：&ldquo;决策团队尚未搞清楚如何优化电力储存的价值。&rdquo;</p>', '', 'overseas', 'vr', 1);
INSERT INTO `fa_cms_addonnews` VALUES (33, '<p>据外媒报道，去年，GitHub 向安全研究人员支付了总计 166495 美元的奖励，针对 GitHub 这个为期四年的“漏洞赏金”项目，安全研究人员会上报自己发现的系统问题和漏洞。2016 年，GitHub 一共支付了81.7万美元，而去年的支出总额显然已经翻了一倍多，几乎相当于前三年的总支出（17.7万美元）。在 2014 和 2015 两年时间里，他们一共支付了95.3万美元的奖金。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4412a798700.jpg\" /></p>\r\n<p>2017 年，GitHub 一共收到了 840 份漏洞报告意见书，但是最终解决问题并获得奖金的比例只有15%（约121份）。2016年，GitHub 共收到了 795 份漏洞报告意见书，最终获得奖励的只有 73 份，而其中只有 48 份有效报告最终被罗列在了漏洞赏金项目的主页上。</p>\r\n<p>有效报告的数量上升推动了总支出的增加，也导致了 GitHub 在去年十月重新评估其支付结构。结果就是，奖金增加了一倍，其中最低奖金为 555 美元，最高奖金高达 20000 美元。</p>\r\n<p>GitHub 的 Greg Ose 指出，随着参与的项目、计划和研究人员规模不断增加，去年是迄今为止支付赏金最多的一年。不仅如此，他们还把 GitHub Enterprise 引入到漏洞赏金项目之中，让研究人员能够在 GitHub.com 平台上一些未公开的、或是特定于某个企业部署的领域里找到漏洞。Ose说道：</p>\r\n<blockquote>\r\n<p>“去年年初，很多漏洞报告涉及到了我们的企业认证方法，这也促使我们不得不在内部关注这个问题，而且我们也在研究如何让研究人员也关注这个功能。”</p>\r\n</blockquote>\r\n<p>此外，Ose还表示，GitHub 已经发布了首个研究人员捐赠，也是他们长期以来关注的一项举措。这项工作会为挖掘应用程序特定功能或领域的研究人员支付固定金额。当然，其他任何发现漏洞的人也能够通过漏洞赏金项目获得奖励。</p>\r\n<p>去年，GitHub 还推出了私人漏洞补丁服务，让用户能够限制生产漏洞的影响范围。不仅如此，他们还进行了内部改进，以更有效进行漏洞分类和修复提交，并计划在今年进一步完善流程。</p>\r\n<p>现在，GitHub 希望进一步扩大 2017 年所取得成绩，推出更多私人奖励和研究补助金，以便在代码公开发布之前及之后引起大家的关注。该公司还计划在今年晚些时候，推出额外的奖励计划。Ose总结道：</p>\r\n<blockquote>\r\n<p>“鉴于漏洞赏金项目取得了成功，我们现在正考虑如何扩大其范围，为我们的生产服务提供更多帮助，同时保护整个GitHub生态系统。我们很期待下一步工作，并且会在今年对提交的漏洞内容进行分类和修正。”</p>\r\n</blockquote>', 'cnbeta1', 'overseas', 'ar', 10);
INSERT INTO `fa_cms_addonnews` VALUES (34, '<p>本周我们正在研究Leap Motion为增强现实带来的新东西。<strong>我们已经看到他们之前创造了一些令人难以置信的技术，尤其是当涉及到运动跟踪和控制时。现在看起来他们认为他们是以面向优先的方式进入AR增强现实世界。</strong></p>\r\n<p>Leap Motion有一款在性能和外形之间达到平衡的头显，这款头显达到了Leap Motion所说最高技术规格所在的平衡点。换句话说，他们创造了一款人们可以使用的产品，与当今世界上大多数其他消费类产品不同。</p>\r\n<p>为了制造这款头显，Leap Motion的团队使用了几款5.5英寸的智能手机。他们将这些智能手机放在佩戴者脸部的两侧，并将其内部的图像反映出来。通过这种设置，最终他们发现他们需要创建自己的LED显示系统。他们决定采用Analogix显示驱动器和两个&ldquo;快速切换&rdquo;BOE 3.5英寸显示屏的架构。</p>\r\n<p>他们已经创造了一款头显，正如他们所描述的那样，它会让所有其他头显（VR，AR等）感到羞耻。两个120 fps，1600x1440显示屏，100+视角范围和150 fps手动追踪180 x 180度FOV，打开这个头显，当今系统的分辨率，等待时间和视野限制就会消失。</p>\r\n<p>那么你可以在哪里购买这种现代技术的奇迹？你不能。目前，Leap Motion将此项目称为&ldquo;北极星计划&rdquo;，并将其作为一个跳板点。他们正在使用这个项目来表明我们所有人都关注于AR硬件是错误的，他们的产品可以带来最佳体验。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44129495250.jpg\" /></p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44129bb3621.png\" /></p>', 'ks', 'domestic', 'ar', 1);
INSERT INTO `fa_cms_addonnews` VALUES (35, '<p>据外媒报道，研究人员正在利用VR技术帮助教师们了解自闭症学s生进而能够真正地去帮助他们。近日，来自马耳他大学的一个研究小组决定通过VR技术帮助教师理解自闭症儿童的生活体验。通过利用自闭症儿童的音频和视觉技巧，研究团队开发出一个VR应用，它能模拟出自闭症儿童在教室里的体验情况。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44128db3ed0.png\" alt=\"austim.png\" /></p>\r\n<p>参与了软件开发工作的马耳他大学人工智能系讲师Vanessa Camilleri博士表示，他们希望让教师走进自闭症儿童的世界里了解他们的真实情况同时也希望VR能够成为一台同理心机器。与此同时，他们还希望能从中学到更多的东西进而能设计出能帮助改善自闭症儿童生活质量的工具。</p>\r\n<p>实际上将VR作为一种共情工具的想法已经存在一段时间了。电影制作人Chris Milk就曾和联合国联合制作过一部展示叙利亚难民营生活的VR影片《Clouds Over Sidra》。</p>\r\n<p>目前，研究小组的这款软件还不能使用，但他们希望未来能通过Samsung Gear头套让教师们用上它。</p>\r\n<p>Camilleri还强调，该项目并不能做到模拟出自闭症儿童的各个方面，如嗅觉、触觉。另外他还表示，他们开发的应用更多的是让老师们去了解他们的学生而不是教授他们如何去帮助自闭症学生。</p>\r\n<p>获悉，该团队希望最终还能为父母或家庭成员开发出另一个不同版本的同类型软件。</p>', 'cnbeta', 'domestic', 'ar', 1);
INSERT INTO `fa_cms_addonnews` VALUES (36, '阿三大神大苏打阿瑟东阿瑟东啊是大事打是额如个人风格给对方是的发射点是', '', 'domestic', 'ar', 699);
INSERT INTO `fa_cms_addonnews` VALUES (37, '测试测试测试', '', 'domestic', 'vr', 12);

-- ----------------------------
-- Table structure for fa_cms_addonproduct
-- ----------------------------
DROP TABLE IF EXISTS `fa_cms_addonproduct`;
CREATE TABLE `fa_cms_addonproduct`  (
  `id` int(10) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productdata` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品列表',
  `price0` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '价格',
  `author` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '作者大人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_cms_addonproduct
-- ----------------------------
INSERT INTO `fa_cms_addonproduct` VALUES (18, '<p>据外媒报道，去年，GitHub 向安全研究人员支付了总计 166495 美元的奖励，针对&nbsp;GitHub 这个为期四年的&ldquo;漏洞赏金&rdquo;项目，安全研究人员会上报自己发现的系统问题和漏洞。2016 年，GitHub 一共支付了81.7万美元，而去年的支出总额显然已经翻了一倍多，几乎相当于前三年的总支出（17.7万美元）。在 2014 和 2015 两年时间里，他们一共支付了95.3万美元的奖金。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4412a798700.jpg\" /></p>\r\n<p>2017 年，GitHub 一共收到了 840 份漏洞报告意见书，但是最终解决问题并获得奖金的比例只有15%（约121份）。2016年，GitHub 共收到了 795 份漏洞报告意见书，最终获得奖励的只有 73 份，而其中只有 48 份有效报告最终被罗列在了漏洞赏金项目的主页上。</p>\r\n<p>有效报告的数量上升推动了总支出的增加，也导致了 GitHub 在去年十月重新评估其支付结构。结果就是，奖金增加了一倍，其中最低奖金为 555 美元，最高奖金高达 20000 美元。</p>\r\n<p>GitHub 的 Greg Ose 指出，随着参与的项目、计划和研究人员规模不断增加，去年是迄今为止支付赏金最多的一年。不仅如此，他们还把 GitHub Enterprise 引入到漏洞赏金项目之中，让研究人员能够在 GitHub.com 平台上一些未公开的、或是特定于某个企业部署的领域里找到漏洞。Ose说道：</p>\r\n<blockquote>\r\n<p>&ldquo;去年年初，很多漏洞报告涉及到了我们的企业认证方法，这也促使我们不得不在内部关注这个问题，而且我们也在研究如何让研究人员也关注这个功能。&rdquo;</p>\r\n</blockquote>\r\n<p>此外，Ose还表示，GitHub 已经发布了首个研究人员捐赠，也是他们长期以来关注的一项举措。这项工作会为挖掘应用程序特定功能或领域的研究人员支付固定金额。当然，其他任何发现漏洞的人也能够通过漏洞赏金项目获得奖励。</p>\r\n<p>去年，GitHub 还推出了私人漏洞补丁服务，让用户能够限制生产漏洞的影响范围。不仅如此，他们还进行了内部改进，以更有效进行漏洞分类和修复提交，并计划在今年进一步完善流程。</p>\r\n<p>现在，GitHub 希望进一步扩大 2017 年所取得成绩，推出更多私人奖励和研究补助金，以便在代码公开发布之前及之后引起大家的关注。该公司还计划在今年晚些时候，推出额外的奖励计划。Ose总结道：</p>\r\n<blockquote>\r\n<p>&ldquo;鉴于漏洞赏金项目取得了成功，我们现在正考虑如何扩大其范围，为我们的生产服务提供更多帮助，同时保护整个GitHub生态系统。我们很期待下一步工作，并且会在今年对提交的漏洞内容进行分类和修正。&rdquo;</p>\r\n</blockquote>', 'https://cdn.fastadmin.net/uploads/20180401/1f059faa0ba3bb502d7dd012565321e2.jpg,https://cdn.fastadmin.net/uploads/20180401/05e374fd1f784f9c4f634889bd7028ac.jpg,https://cdn.fastadmin.net/uploads/20180401/fdaca158bf96ed0fd59879f2c7f673d3.jpg,https://cdn.fastadmin.net/uploads/20180401/33b63f123cdee4c251590b73c2464fa9.jpg', '', '');
INSERT INTO `fa_cms_addonproduct` VALUES (23, '<p>北京时间4月11日早间消息，谷歌母公司Alphabet有望在2018进行新的投资，目前，该公司仍在研究如何优化电池的存储价值。作为世界上风能和太阳能的最大企业买家，谷歌可能很快要进行一项新的清洁能源投资，这次他们锁定的目标是电池。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad4412a357f60.jpg\" alt=\"Solarpanel.jpg\" /></p>\r\n<p>资料图</p>\r\n<p>本周二，Alphabet公司能源策略主管奈哈&middot;帕尔默（Neha Palmer）在纽约彭博新能源财经机构举办的未来能源峰会上接受采访时说，&ldquo;2018年我们想有所作为，我们正在对几个项目展开调研。&rdquo;</p>\r\n<p>帕尔默指出，谷歌根据几个选项来决定合理的投资方向。其中一些项目包括：独立的可供给电网的电池场；用于家庭或企业的电表后端设备；一套与太阳能或风力发电场相连的系统。</p>\r\n<p>这一项目需要依靠一项长达数年的供应合同来保证营收，该公司仍在审查这种投资的市场需求。帕尔默说：&ldquo;决策团队尚未搞清楚如何优化电力储存的价值。&rdquo;</p>', 'https://cdn.fastadmin.net/uploads/20180416/5ad4412a357f60.jpg,https://cdn.fastadmin.net/uploads/20180404/9dcbcd9ca1fce9f184ee12aea36351de.jpg,https://cdn.fastadmin.net/uploads/20180401/e5f3f6312c360f4c851daf99b1208515.jpg,https://cdn.fastadmin.net/uploads/20180401/26558a3bffe6960768350f2202885955.jpg,https://cdn.fastadmin.net/uploads/20180401/2d184becba222eb8406aadd72b004c5e.jpg,https://cdn.fastadmin.net/uploads/20180401/8cb318ead26ae66086953f1c0bcf0275.jpg', '', '');
INSERT INTO `fa_cms_addonproduct` VALUES (28, '<p>本周我们正在研究Leap Motion为增强现实带来的新东西。<strong>我们已经看到他们之前创造了一些令人难以置信的技术，尤其是当涉及到运动跟踪和控制时。现在看起来他们认为他们是以面向优先的方式进入AR增强现实世界。</strong></p>\r\n<p>Leap Motion有一款在性能和外形之间达到平衡的头显，这款头显达到了Leap Motion所说最高技术规格所在的平衡点。换句话说，他们创造了一款人们可以使用的产品，与当今世界上大多数其他消费类产品不同。</p>\r\n<p>为了制造这款头显，Leap Motion的团队使用了几款5.5英寸的智能手机。他们将这些智能手机放在佩戴者脸部的两侧，并将其内部的图像反映出来。通过这种设置，最终他们发现他们需要创建自己的LED显示系统。他们决定采用Analogix显示驱动器和两个&ldquo;快速切换&rdquo;BOE 3.5英寸显示屏的架构。</p>\r\n<p>他们已经创造了一款头显，正如他们所描述的那样，它会让所有其他头显（VR，AR等）感到羞耻。两个120 fps，1600x1440显示屏，100+视角范围和150 fps手动追踪180 x 180度FOV，打开这个头显，当今系统的分辨率，等待时间和视野限制就会消失。</p>\r\n<p>那么你可以在哪里购买这种现代技术的奇迹？你不能。目前，Leap Motion将此项目称为&ldquo;北极星计划&rdquo;，并将其作为一个跳板点。他们正在使用这个项目来表明我们所有人都关注于AR硬件是错误的，他们的产品可以带来最佳体验。</p>\r\n<p><a href=\"https://static.cnbetacdn.com/article/2018/0410/bd9058b4bbe7a4c.jpg\" target=\"_blank\" rel=\"noopener\" data-index=\"0\" data-lightbox-gallery=\"cbc-gallery\"><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44129495250.jpg\" /></a></p>\r\n<p><a href=\"https://static.cnbetacdn.com/article/2018/0410/e4a1b9dfd59d1ae.png\" target=\"_blank\" rel=\"noopener\" data-index=\"1\" data-lightbox-gallery=\"cbc-gallery\"><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44129bb3621.png\" /></a></p>', 'https://cdn.fastadmin.net/uploads/20180416/5ad44129495250.jpg', '', '');
INSERT INTO `fa_cms_addonproduct` VALUES (29, '<p>据外媒报道，研究人员正在利用VR技术帮助教师们了解自闭症学生进而能够真正地去帮助他们。近日，来自马耳他大学的一个研究小组决定通过VR技术帮助教师理解自闭症儿童的生活体验。通过利用自闭症儿童的音频和视觉技巧，研究团队开发出一个VR应用，它能模拟出自闭症儿童在教室里的体验情况。</p>\r\n<p><img src=\"https://cdn.fastadmin.net/uploads/20180416/5ad44128db3ed0.png\" alt=\"austim.png\" /></p>\r\n<p>参与了软件开发工作的马耳他大学人工智能系讲师Vanessa Camilleri博士表示，他们希望让教师走进自闭症儿童的世界里了解他们的真实情况同时也希望VR能够成为一台同理心机器。与此同时，他们还希望能从中学到更多的东西进而能设计出能帮助改善自闭症儿童生活质量的工具。</p>\r\n<p>实际上将VR作为一种共情工具的想法已经存在一段时间了。电影制作人Chris Milk就曾和联合国联合制作过一部展示叙利亚难民营生活的VR影片《Clouds Over Sidra》。</p>\r\n<p>目前，研究小组的这款软件还不能使用，但他们希望未来能通过Samsung Gear头套让教师们用上它。</p>\r\n<p>Camilleri还强调，该项目并不能做到模拟出自闭症儿童的各个方面，如嗅觉、触觉。另外他还表示，他们开发的应用更多的是让老师们去了解他们的学生而不是教授他们如何去帮助自闭症学生。</p>\r\n<p>获悉，该团队希望最终还能为父母或家庭成员开发出另一个不同版本的同类型软件。</p>', 'https://cdn.fastadmin.net/uploads/20180416/5ad44128db3ed0.png', '', '');
INSERT INTO `fa_cms_addonproduct` VALUES (38, 'cccccccccccccccccccccaaaaaaaaaaaaaaaaaaaaasssssssssssssssss', '/uploads/20181218/6f469699521fee6dc336949f78c63755.jpg', '10', 'wwww');

-- ----------------------------
-- Table structure for fa_cms_archives
-- ----------------------------
DROP TABLE IF EXISTS `fa_cms_archives`;
CREATE TABLE `fa_cms_archives`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `channel_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目ID',
  `model_id` int(10) NOT NULL DEFAULT 0 COMMENT '模型ID',
  `title` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `flag` set('hot','new','recommend') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标志',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'TAG',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览次数',
  `comments` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论次数',
  `likes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞数',
  `dislikes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点踩数',
  `diyname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '自定义URL',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `publishtime` int(10) NULL DEFAULT NULL COMMENT '发布时间',
  `deletetime` int(10) NULL DEFAULT NULL COMMENT '删除时间',
  `memo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `status` enum('normal','hidden','rejected','pulloff') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`channel_id`, `status`) USING BTREE,
  INDEX `channel`(`channel_id`, `weigh`, `id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_cms_archives
-- ----------------------------
INSERT INTO `fa_cms_archives` VALUES (1, 1, 7, 1, '驰为发布HiGame迷你PC新品 小身材大能量', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4412814b010.jpg', '驰为,笔记本,HiGame', '说到驰为（Chuwi），很多人第一时间想到的就是该公司的 Windows 笔记本或 Android 平板电脑。但是最近，该厂家又凭借 HiGame 子品牌进军了迷你游戏 PC 市场。作为一款迷你 PC，它的三围只有 17.3×15.8×7.3 CM（约 7×6×3 英寸）。即便如此，它的硬件配置也让我们眼前一亮。', 'HiGame,PC,驰为', 1, 9, 1, 0, 0, '', 1523718809, 1523879174, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (2, 1, 7, 1, '宏碁Chromebox CXI3迷你台式机现已开放预定', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad44127cc3810.jpg', '宏基,台式机', '今年 1 月的时候，宏碁（Acer）发布了多款新产品，其中就包括 Chromebox CXI3 。与 Chromebook 笔记本不同，Chromebox CXI3 是一款运行 Chrome OS 的小型台式机。不占地方，显然是它的最大卖点，用户甚至可以将它背挂到显示器后面。如果你想要拥有一台，那么现在宏碁也已经开放预定了。', 'Chromebox,台式机,宏基', 2, 20, 0, 0, 0, '', 1523718936, 1523879158, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (3, 1, 7, 1, 'Misfit最新的混合动力手表Path现已上市', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad44125f364e0.png', '手表,混合动力', 'Misfit的混合动力手表今天通过公司网站发售。它的售价为149.99美元，将有四种颜色可供选择：不锈钢，玫瑰金，黄金和带金色调的不锈钢。该公司首先在CES首次推出手表，在那里我们看到了这款小巧的新设备。这是该公司最小的手表 -  38毫米 - 并没有触摸屏，但它通过蓝牙与智能手机配对。', '智能手表,混合动力', 3, 2, 0, 0, 0, '', 1523719020, 1523879142, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (4, 1, 7, 1, 'UE为现场演出者推出了价值2200美元的舞台耳返设备', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad441258ab510.png', '耳返,智能设备', '大多数消费者可能熟悉UE推出的色彩鲜艳的蓝牙音箱，但该公司也有一系列定制入耳式耳机，UE刚刚推出了一款新的顶级旗舰机型：2,200美元的UE Live。UE Live耳机是该公司以前的旗舰UE18 Pro型号的进化版本，将每个耳机的扬声器数量从6个增加到8个，共计6个平衡电枢，一个True Tone Plus驱动器和一个6mm钕制动态扬声器，以提供更好的声音。', '智能设备,耳返', 4, 3, 0, 1, 0, '', 1523719106, 1523879126, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (5, 1, 7, 1, '南孚推出全球首款测电器装电池：可秒分电池新旧', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4412530fd08.jpg', '电池,南孚', '想必大家都遇到过这样尴尬的事情：家里有很多电池，用的时候也分不清哪个有电、哪个没电，扔了又怕浪费。于是旧的不丢掉，新的买来用，这样家里的电池越积攒越多，造成恶性循环。而现在，南孚带来了一款全新产品——南孚测电器装电池，包含南孚测电器和南孚碱性电池，轻轻松松测一测，电池电量一目了然。', '南孚,电池', 5, 2, 0, 0, 0, '', 1523719198, 1523879107, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (6, 1, 7, 1, '强生将推能根据光线条件自动变色的隐形镜片', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad44121af36d0.jpeg', '智能设备,强生', '据外媒报道，多年来，人们已经习惯于使用变色镜片的眼镜，然而这在隐形眼镜中却不存在。不过就在日前，强生终于打破了这个技术壁垒，这家公司宣布即将向市场推出具备变色功能的隐形镜片。', '智能设备', 6, 0, 0, 0, 0, '', 1523719286, 1523879078, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (7, 1, 7, 1, 'Snap新一代Spectacles眼镜文档已被FCC曝光', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad44121495860.jpg', '', '据 Variety 报道，FCC 辐射实验室刚刚证实了一副来自 Snap 的新眼镜。今日曝光的这款穿戴设备的文档称，这是一款由 Snap Inc. 制作的穿戴式视频拍摄装置。从印刷标签来看，其品牌名称为 Spectacles，型号为 Model 002 。尽管文件中所附的大部分内容都以保密为由被遮掩，但还是可以知道它支持低功耗蓝牙 4.2 和 802.11ac Wi-Fi 。', '智能设备,眼镜', 7, 2, 0, 1, 0, '', 1523719403, 1523879062, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (8, 1, 5, 1, '投资者需求旺盛 Dropbox将IPO发行价区间调高2美元', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad44120f16870.jpg', '', '云存储服务商Dropbox今日宣布，由于投资者需求强劲，现将IPO(数次公开招股)发行价区间调高2美元。上周一，Dropbox宣布将IPO发行价区间定为每股16美元至18美元，最高融资6.48亿美元，公司市值将达到约71亿美元。', 'dropbox,投资', 8, 1, 0, 0, 0, '', 1523719527, 1523879042, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (9, 1, 5, 1, 'Dropbox股价上市首日大涨36% 市值超120亿美元', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad44120cd28e0.jpg', '', '著名云存储服务提供商Dropbox在上市交易首日股价大涨36%，开盘定价为21美元每股，在当日最高时达到31.6美元每股，最终以28.48美元每股的价格收盘，现在市值超过120亿美元。可以明显看出公开市场投资者十分看好Dropbox这家主营业务为云存储服务和内容协作平台的公司。Dropbox最先对自己股价的预期是16到18美元每股，后来提升到18到20美元每股。而由于上市交易首日表现出色，超过了2014年私募时100亿美元的估值。', 'dropbox,投资', 9, 0, 0, 0, 0, '', 1523719610, 1523879028, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (10, 1, 5, 1, '云存储公司Dropbox在美提交IPO申请：拟筹资5亿美元', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad44120825a50.jpg', '', '云存储公司Dropbox周五向美国证券交易委员会（SEC）提交了IPO（首次公开招股）申请文件，寻求筹集5亿美元资金。Dropbox的IPO交易长期以来备受市场期待，该公司四年前在私募投资市场上的估值就已高达100亿美元。', 'dropbox', 10, 0, 0, 0, 0, '', 1523719716, 1523879000, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (11, 1, 5, 1, '通用电气针对Predix云平台的创业者推出奖励计划', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad441204c1c20.png', '', '通用电气（GE）为推广Predix云平台的应用开发，在国内推出首期\"Predix星火计划\"，以奖励基于该平台的工业互联网开发者。首期有4家企业获奖，将进驻GE孵化器并获得技术支持和潜在投资机会。', '云计算,互联网', 11, 0, 0, 0, 0, '', 1523719810, 1523878981, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (12, 1, 5, 1, '超越Web服务 Cloudflare推出全新的Spectrum安全服务', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4411fb836c0.png', '', '据外媒报道，Cloudflare 公司正将其业务拓展到网站和云应用之外的互联网安全领域。此前，Cloudflare 帮助过企业屏蔽恶意流量，并且让它们的线上内容加载得更加迅速。而根据今日披露的内容，这项新服务旨在保护那些在公共网络背景下运行的联网基础设施，涵盖了从企业内部电子邮件服务器、到领域内部署的联网设备等各个方面。', '云计算,安全', 12, 1, 0, 0, 0, '', 1523719980, 1523878966, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (13, 1, 5, 1, '映泰Z390GT5主板手册曝光 英特尔Z390芯片组或即将到来 当', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4411ecab1c0.jpg', '', '当英特尔上周推出更多更多 Coffee Lake CPU 和配套主板时，传说中的 Z390 芯片组却意外缺席了。不过有眼尖的人们发现，主板厂商映泰（Biostar）在自家 B360 Racing GT5 手册中，竟然清楚地列明了另一款名叫“Z390GT5”主板的存在。作为一个二线品牌，映泰的产品主打平价而不是古怪的设计。不过它与现有的 Z370 系列没有太大差别，而且最高支持的 CPU TDP 也仅为 95W，刚好够酷睿 i7-8700K 使用而已。', '智能设备', 13, 5, 0, 0, 0, '', 1523720694, 1523878951, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (14, 1, 4, 1, '在数据黑箱和信赖危机面前 谁更应该战战兢兢？', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4411e749b30.jpg', '', '4 月 11 日，Valve 宣布旗下著名的 PC 游戏发行平台 Steam 会推出新的用户数据隐私安全措施。今后玩家们可以选择隐藏你的游戏库内容，也可以隐藏你的活动细节，具体到最近收藏什么游戏，买了什么游戏，玩了什么游戏以及在某游戏上花了多少小时等等。', '安全', 14, 2, 0, 0, 0, '', 1523720913, 1523878935, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (15, 1, 4, 1, 'Google Chrome和Mozilla Firefox将支持全新无密码登录规范', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4411e3a7db0.png', '', '今天，W3C和FIDO联盟标准机构宣布，Web浏览器正在构建一种新的登录方式。这款名为WebAuthn所呈现的新开放标准将在最新版本的Firefox中得到支持，并将在未来几个月发布的Chrome和Edge的版本中得到支持。这是多年来的最新举措，目的是让用户远离密码，转向更安全的登录方式，如生物识别和USB令牌。', '互联网,安全', 15, 2, 1, 1, 0, '', 1523720991, 1523878915, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (16, 1, 4, 1, 'GitHub 安全警告计划已检测出 400 多万个漏洞', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4411db71750.png', '', 'Github 去年推出的安全警告，极大减少了开发人员消除 Ruby 和 JavaScript 项目漏洞的时间。GitHub 安全警告服务，可以搜索依赖寻找已知漏洞然后通过开发者，以便帮助开发者尽可能快的打上补丁修复漏洞，消除有漏洞的依赖或者转到安全版本。', '互联网,安全', 16, 2, 0, 0, 0, '', 1523721095, 1523878887, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (17, 1, 4, 1, 'Windows 10杀毒软件大PK：Defender首入前三', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4411cec01d0.jpg', '', 'AV-TEST公布了2018年1~2月杀毒软件的最新测试情况，稍稍有点不接地气的是，基于Windows 10企业版平台。排名第一的依然是铁打的卡巴斯基，3个满分总计18分无悬念。不过，这次Symantec和Trend Micro也是18满分，令人刮目相看。', '云计算,安全', 17, 3, 0, 0, 0, '', 1523721137, 1523878857, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (18, 1, 10, 2, 'GitHub 去年为漏洞支付了 16.6 万美元赏金', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4412a798700.jpg', '', '据外媒报道，去年，GitHub 向安全研究人员支付了总计 166495 美元的奖励，针对 GitHub 这个为期四年的“漏洞赏金”项目，安全研究人员会上报自己发现的系统问题和漏洞。2016 年，GitHub 一共支付了81.7万美元，而去年的支出总额显然已经翻了一倍多，几乎相当于前三年的总支出（17.7万美元）。在 2014 和 2015 两年时间里，他们一共支付了95.3万美元的奖金。', '互联网,安全', 18, 24, 0, 1, 0, '', 1523721203, 1523895458, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (19, 1, 3, 1, '谷歌发布“与书对话”检索引擎 从字里行间邂逅心仪书籍', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4411b4c3960.jpg', '', '今日，谷歌分享了 Semantic Experiences，在博客中展示了两大关于自然语言理解的互动工具。Talk to Books 是一个可以从书中的句子层面搜索书籍的全新检索模式；另一个互动内容则是 Semantris，一个由机器学习驱动的单词联想游戏。', 'Google,互联网', 19, 3, 0, 0, 0, '', 1523721303, 1523878822, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (20, 1, 3, 1, '节省40%搜索流量:Google Go轻量级应用将于非洲市场推出', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4411b10d540.png', '', '针对新兴市场，Google希望通过Google Go轻量级应用帮助身处网络速度慢、流量资费高昂地区的用户获得更流畅的网络搜索体验。现在谷歌正向在26个撒哈拉以南非洲国家/地区推广，Google Go轻量级应用可以让搜索数据用流量减少40%，并且支持对以往搜索记录的脱机访问。', 'Google,互联网', 20, 0, 0, 0, 0, '', 1523721344, 1523878791, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (21, 1, 3, 1, '谷歌公布Fuchsia文档：并非Linux内核 从头构建自己的库和组件', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4411ab103e0.jpg', '', '尽管已经研发两年多时间，但对于Fuchsia系统Google始终缄口不言。不过今天，公司发表了名为“The Book”的深度解析文档，详细介绍了这款计划取代Android和Chrome OS的操作系统。 目前Android和Chrome OS都是使用Linux内核，不过在最新发布的文档中谷歌明确Fuchsia并非基于Linux内核。', 'Google,互联网', 21, 2, 0, 0, 0, '', 1523721408, 1523878779, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (22, 1, 3, 1, '谷歌手机应用可直接过滤语音垃圾邮件', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4411a368920.jpg', '', '谷歌手机应用程序在2月份收到了主要更新，为快速通话控件添加了便捷的聊天功能。在接下来的几周里，Pixel，Nexus和Android One设备的默认拨号程序正在添加垃圾邮件过滤功能，并附带一个新的测试版程序，现在就可以试用该功能。', 'Google,互联网', 22, 2, 0, 0, 0, '', 1523721460, 1523878762, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (23, 1, 10, 2, '谷歌母公司继续投资清洁能源领域：或押注于电池', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4412a357f60.jpg', '', '北京时间4月11日早间消息，谷歌母公司Alphabet有望在2018进行新的投资，目前，该公司仍在研究如何优化电池的存储价值。作为世界上风能和太阳能的最大企业买家，谷歌可能很快要进行一项新的清洁能源投资，这次他们锁定的目标是电池。', 'Google,互联网', 23, 51, 0, 0, 0, '', 1523721500, 1523895423, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (24, 1, 3, 1, '谷歌携手美国医学协会 促进健康监测设备数据共享', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad44119d944a0.png', '', '谷歌正在与美国医学协会（美国的一个医师游说团体）进行合作，双方达成一项挑战计划，其内容是让初创企业能够想出“促进健康监测设备数据共享的最佳新思路”。美国医学协会于周一表示，最终的挑战成果将会是一款手机应用或可穿戴设备。', 'Google,互联网', 24, 5, 0, 0, 0, '', 1523721555, 1523878724, 1523635200, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (25, 1, 3, 1, '谷歌开源 iOS 自动测试框架 GTXiLib，主打无障碍使用', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad441196ddc60.png', '', '最近 Google 在帮助开发者提升 App 可用性上可谓是动作频频，不只发布了无障碍技术指导方案，成立无障碍支援团队，近日还在博客上宣布开源 iOS 专用的自动化测试框架 GTXiLib ，以帮助开发者打造无障碍 App 。', 'Google,互联网', 25, 7, 0, 0, 0, '', 1523754040, 1523878710, 1523721600, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (26, 1, 4, 1, 'Let\'s Encrypt发布ACME v2 正式支持通配符证书', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad44119326fd0.jpg', '', 'Let\'s Encrypt 宣布 ACME v2 正式支持通配符证书。Let\'s Encrypt 宣称将继续清除 Web 上采用 HTTPS 的障碍，让每个网站轻松获取管理证书。ACMEv21.6k 是 ACME 协议的更新版本，考虑到行业专家和其他组织可能希望在某天使用 ACME 协议进行证书颁发和管理，它已经通过 IETF 标准流程。', '互联网,安全', 26, 41, 0, 1, 0, '', 1523754142, 1523878676, 1523721600, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (27, 1, 4, 1, '因为电网问题 欧洲的电子钟表运行缓慢超过一个月时间', 'recommend', 'https://cdn.fastadmin.net/uploads/20180416/5ad44118ca9c40.jpg', '', '欧洲电力传输系统运营商网络（ENTSOE）是建立内部能源市场并确保其最佳运作的机构，为解释欧洲的电子钟表运行缓慢超过一个月的原因发表了一份声明。在一篇引人入胜的题为“欧洲大陆的频率偏差对频率控制的电子钟表影响”新闻稿中，该组织解释说，频率偏差导致一些数字时钟滞后。', '互联网,安全', 27, 147, 7, 1, 0, '', 1523754196, 1523878659, 1523721600, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (28, 1, 9, 2, 'Leap Motion AR头显看起来很疯狂但可能是奇迹', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad44129495250.jpg', '', '本周我们正在研究Leap Motion为增强现实带来的新东西。我们已经看到他们之前创造了一些令人难以置信的技术，尤其是当涉及到运动跟踪和控制时。现在看起来他们认为他们是以面向优先的方式进入AR增强现实世界。', 'AR,VR,互联网', 28, 21, 0, 1, 0, '', 1523755374, 1523878629, 1523721600, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (29, 1, 9, 2, '研究人员利用VR技术帮助教师更好了解自闭症学生', 'hot,new', 'https://cdn.fastadmin.net/uploads/20180416/5ad44128db3ed0.png', '', '据外媒报道，研究人员正在利用VR技术帮助教师们了解自闭症学生进而能够真正地去帮助他们。近日，来自马耳他大学的一个研究小组决定通过VR技术帮助教师理解自闭症儿童的生活体验。通过利用自闭症儿童的音频和视觉技巧，研究团队开发出一个VR应用，它能模拟出自闭症儿童在教室里的体验情况。', 'AR,互联网', 29, 43, 0, 0, 0, '', 1523755471, 1523878608, 1523721600, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (30, 1, 3, 1, '谷歌母公司继续投资清洁能源领域：或押注于电池', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4412a357f60.jpg', '', '', '互联网,Google', 30, 11, 0, 0, 0, '', 1523895691, 1523895691, 1523894400, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (33, 1, 3, 1, 'GitHub 去年为漏洞支付了 16.6 万美元赏金', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad4412a798700.jpg', '', '据外媒报道，去年，GitHub 向安全研究人员支付了总计 166495 美元的奖励，针对 GitHub 这个为期四年的“漏洞赏金”项目，安全研究人员会上报自己发现的系统问题和漏洞。2016 年，GitHub 一共支付了81.7万美元，而去年的支出总额显然已经翻了一倍多，几乎相当于前三年的总支出（17.7万美元）。在 2014 和 2015 两年时间里，他们一共支付了95.3万美元的奖金。', '互联网,安全', 33, 27, 0, 1, 1, '', 1523895893, 1545116741, 1523894400, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (34, 1, 7, 1, 'Leap Motion AR头显看起来很疯狂但可能是奇迹', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad44129495250.jpg', '', '本周我们正在研究Leap Motion为增强现实带来的新东西。我们已经看到他们之前创造了一些令人难以置信的技术，尤其是当涉及到运动跟踪和控制时。现在看起来他们认为他们是以面向优先的方式进入AR增强现实世界。', '互联网,AR', 34, 30, 0, 2, 0, '', 1523895990, 1523895990, 1523894400, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (35, 1, 7, 1, '研究人员利用VR技术帮助教师更好了解自闭症学生', '', 'https://cdn.fastadmin.net/uploads/20180416/5ad44128db3ed0.png', '', '据外媒报道，研究人员正在利用VR技术帮助教师们了解自闭症学生进而能够真正地去帮助他们。近日，来自马耳他大学的一个研究小组决定通过VR技术帮助教师理解自闭症儿童的生活体验。通过利用自闭症儿童的音频和视觉技巧，研究团队开发出一个VR应用，它能模拟出自闭症儿童在教室里的体验情况。', '智能设备,AR', 35, 169, 1, 22, 14, '', 1523896040, 1523896040, 1523894400, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (36, 1, 7, 1, '这里是测试的无人机光电站运行', '', '', '', '', '', 36, 2, 0, 0, 0, '', 1545111219, 1545111219, 1545062400, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (37, 1, 5, 1, '我没有钱', '', '', '', '', '', 37, 3, 0, 0, 0, '', 1545111336, 1545116828, 1545062400, NULL, '', 'normal');
INSERT INTO `fa_cms_archives` VALUES (38, 1, 9, 2, '开源无人机热点聚合', '', '', '', '', '云计算', 38, 1, 0, 0, 0, '', 1545116508, 1545116508, 1545062400, NULL, '', 'normal');

-- ----------------------------
-- Table structure for fa_cms_block
-- ----------------------------
DROP TABLE IF EXISTS `fa_cms_block`;
CREATE TABLE `fa_cms_block`  (
  `id` smallint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区块表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_cms_block
-- ----------------------------
INSERT INTO `fa_cms_block` VALUES (1, 'focus', 'focus', '幻灯图片1', '/uploads/20181218/053db5248874954d4faa978ab1d80338.jpeg', 'http://www.fastadmin.net', '111', 0, 1545071898, 'normal');
INSERT INTO `fa_cms_block` VALUES (2, 'focus', 'focus', '幻灯图片2', '/uploads/20181218/6f469699521fee6dc336949f78c63755.jpg', 'http://www.baidu.com', '222', 0, 1545071483, 'normal');
INSERT INTO `fa_cms_block` VALUES (3, 'focus', 'focus', '幻灯图片3', '/uploads/20181218/6f469699521fee6dc336949f78c63755.jpg', 'http://www.baidu.com', '333', 0, 1545071682, 'normal');
INSERT INTO `fa_cms_block` VALUES (4, 'other', 'contactus', '联系我们', '', '', '', 0, 0, 'normal');
INSERT INTO `fa_cms_block` VALUES (6, 'other', 'footer', '底部链接', '', '', '<div class=\"col-md-3 col-sm-3\">\n                            <div class=\"footer-logo\">\n                                <a href=\"#\"><i class=\"fa fa-bookmark\"></i></a>\n                            </div>\n                            <p class=\"copyright\"><small>© 2017. All Rights Reserved. <br>\n                                    FastAdmin\n                                </small>\n                            </p>\n                        </div>\n                        <div class=\"col-md-5 col-md-push-1 col-sm-5 col-sm-push-1\">\n                            <div class=\"row\">\n                                <div class=\"col-md-4 col-sm-4\">\n                                    <ul class=\"links\">\n                                        <li><a href=\"#\">关于我们</a></li>\n                                        <li><a href=\"#\">发展历程</a></li>\n                                        <li><a href=\"#\">服务项目</a></li>\n                                        <li><a href=\"#\">团队成员</a></li>\n                                    </ul>\n                                </div>\n                                <div class=\"col-md-4 col-sm-4\">\n                                    <ul class=\"links\">\n                                        <li><a href=\"#\">新闻</a></li>\n                                        <li><a href=\"#\">资讯</a></li>\n                                        <li><a href=\"#\">推荐</a></li>\n                                        <li><a href=\"#\">博客</a></li>\n                                    </ul>\n                                </div>\n                                <div class=\"col-md-4 col-sm-4\">\n                                    <ul class=\"links\">\n                                        <li><a href=\"#\">服务</a></li>\n                                        <li><a href=\"#\">圈子</a></li>\n                                        <li><a href=\"#\">论坛</a></li>\n                                        <li><a href=\"#\">广告</a></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                        <div class=\"col-md-3 col-sm-3 col-md-push-1 col-sm-push-1\">\n                            <div class=\"footer-social\">\n                                <a href=\"#\"><i class=\"fa fa-weibo\"></i></a>\n                                <a href=\"#\"><i class=\"fa fa-qq\"></i></a>\n                                <a href=\"#\"><i class=\"fa fa-wechat\"></i></a>\n                            </div>\n                        </div>', 0, 0, 'normal');
INSERT INTO `fa_cms_block` VALUES (7, 'other', 'bannerad', '通栏广告', '/assets/addons/cms/img/banner/1.jpg', 'http://www.fastadmin.net', '', 0, 0, 'normal');
INSERT INTO `fa_cms_block` VALUES (8, 'other', 'sidebarad1', '边栏广告1', '/assets/addons/cms/img/sidebar/1.jpg', 'http://www.fastadmin.net', '', 0, 0, 'normal');
INSERT INTO `fa_cms_block` VALUES (9, 'other', 'sidebarad2', '边栏广告2', '/assets/addons/cms/img/sidebar/2.jpg', 'http://www.fastadmin.net', '', 0, 0, 'normal');

-- ----------------------------
-- Table structure for fa_cms_channel
-- ----------------------------
DROP TABLE IF EXISTS `fa_cms_channel`;
CREATE TABLE `fa_cms_channel`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('channel','page','link','list') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `model_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '模型ID',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `flag` set('hot','new','recommend') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标志',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '自定义名称',
  `outlink` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '外部链接',
  `items` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章数量',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `channeltpl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '栏目页模板',
  `listtpl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表页模板',
  `showtpl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详情页模板',
  `pagesize` smallint(5) NOT NULL DEFAULT 0 COMMENT '分页大小',
  `iscontribute` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否可投稿',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `diyname`(`diyname`) USING BTREE,
  INDEX `weigh`(`weigh`, `id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_cms_channel
-- ----------------------------
INSERT INTO `fa_cms_channel` VALUES (1, 'channel', 1, 0, '新闻中心', '', '', '', '', 'news', '', 0, 9, 'channel.html', '', '', 10, 1, 1508990697, 1508992553, 'normal');
INSERT INTO `fa_cms_channel` VALUES (2, 'channel', 2, 0, '开发者消息', '', '', '', '', 'product', '', 0, 10, 'channel.html', '', '', 10, 1, 1508992541, 1545066963, 'normal');
INSERT INTO `fa_cms_channel` VALUES (3, 'list', 1, 1, '互联网', '', 'recommend', '', '', 'internet', '', 8, 47, 'channel.html', 'list_news.html', 'show_news.html', 10, 1, 1523718032, 1523718032, 'normal');
INSERT INTO `fa_cms_channel` VALUES (4, 'list', 1, 1, ' 安全', '', 'recommend', '', '', 'security', '', 8, 5, 'channel.html', 'list_news.html', 'show_news.html', 10, 1, 1508990707, 1523720840, 'normal');
INSERT INTO `fa_cms_channel` VALUES (5, 'list', 1, 1, '投资', '', 'recommend', '', '', 'investment', '', 9, 8, 'channel.html', 'list_news.html', 'show_news.html', 10, 1, 1508990716, 1523717837, 'normal');
INSERT INTO `fa_cms_channel` VALUES (7, 'list', 1, 1, '硬件', '', 'recommend', '', '', 'hardware', '', 10, 46, 'channel.html', 'list_news.html', 'show_news.html', 10, 1, 1523717893, 1523717893, 'normal');
INSERT INTO `fa_cms_channel` VALUES (8, 'list', 2, 2, '可穿戴设备', '', '', '', '', 'wearable', '', 2, 4, 'channel.html', 'list_product.html', 'show_product.html', 10, 1, 1508992598, 1523718084, 'normal');
INSERT INTO `fa_cms_channel` VALUES (9, 'list', 2, 2, '外设周边', '', '', '', '', 'util', '', 3, 7, 'channel.html', 'list_product.html', 'show_product.html', 10, 1, 1508992623, 1545067117, 'normal');
INSERT INTO `fa_cms_channel` VALUES (10, 'list', 2, 2, '无人机', '', 'recommend', '', '', 'drone', '', 2, 44, 'channel.html', 'list_product.html', 'show_product.html', 10, 1, 1522157583, 1545067103, 'normal');
INSERT INTO `fa_cms_channel` VALUES (40, 'link', 1, 0, '普通单页', '', '', '', '', 'aboutus', '/cms/p/aboutus.html', 0, 8, 'channel.html', '', '', 10, 1, 1508994681, 1508994681, 'normal');
INSERT INTO `fa_cms_channel` VALUES (41, 'link', 1, 0, '自定义表单', '', '', '', '', 'message', '/cms/d/message.html', 0, 7, 'channel.html', '', '', 10, 1, 1508994681, 1508994681, 'normal');
INSERT INTO `fa_cms_channel` VALUES (42, 'link', 1, 0, '官网首页', '', '', '', '', 'official', 'http://www.fastadmin.net', 0, 6, 'channel.html', '', '', 10, 1, 1508994753, 1508994753, 'normal');
INSERT INTO `fa_cms_channel` VALUES (44, 'link', 1, 0, '文档', '', '', '', '', 'docs', 'http://doc.fastadmin.net', 0, 2, 'channel.html', '', '', 10, 1, 1508994788, 1508994788, 'normal');

-- ----------------------------
-- Table structure for fa_cms_channel_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_cms_channel_admin`;
CREATE TABLE `fa_cms_channel_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `channel_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_id`(`admin_id`, `channel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fa_cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `fa_cms_comment`;
CREATE TABLE `fa_cms_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `type` enum('archives','page') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'archives' COMMENT '类型',
  `aid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联ID',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '父ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `comments` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论数',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'User Agent',
  `subscribe` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订阅',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`aid`, `pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_cms_comment
-- ----------------------------
INSERT INTO `fa_cms_comment` VALUES (1, 1, 'archives', 27, 0, '这是测试内容。', 0, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 0, 1523758108, 1523758108, 'normal');
INSERT INTO `fa_cms_comment` VALUES (2, 1, 'archives', 27, 0, '我是测试评论内容。', 0, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 0, 1523796231, 1523796231, 'normal');
INSERT INTO `fa_cms_comment` VALUES (3, 1, 'archives', 27, 2, '测试回复他人内容！', 0, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 0, 1523796706, 1523796706, 'normal');
INSERT INTO `fa_cms_comment` VALUES (4, 1, 'archives', 27, 0, '测试评论内容', 0, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 0, 1523805202, 1523805202, 'normal');
INSERT INTO `fa_cms_comment` VALUES (5, 1, 'archives', 27, 0, '测试评论内容', 0, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1 wechatdevtools/1.02.1804120 MicroMessenger/6.5.7 Language/zh_CN webview/', 0, 1523806163, 1523806163, 'normal');
INSERT INTO `fa_cms_comment` VALUES (6, 1, 'archives', 27, 0, '测试评论内容2', 0, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1 wechatdevtools/1.02.1804120 MicroMessenger/6.5.7 Language/zh_CN webview/', 0, 1523806277, 1523806277, 'normal');
INSERT INTO `fa_cms_comment` VALUES (7, 1, 'archives', 27, 0, '测试评论内容22', 0, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1 wechatdevtools/1.02.1804120 MicroMessenger/6.5.7 Language/zh_CN webview/', 0, 1523806323, 1523806323, 'normal');
INSERT INTO `fa_cms_comment` VALUES (8, 3, 'archives', 35, 0, '我不是黄蓉', 0, '219.144.189.248', 'Mozilla/5.0 (Linux; Android 9; MI 8 UD Build/PKQ1.180729.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.98 Mobile Safari/537.36 MicroMessenger/6.7.3.1360(0x260703F2) NetType/WIFI Language/zh_CN Process/appbrand0', 0, 1545066196, 1545066196, 'normal');
INSERT INTO `fa_cms_comment` VALUES (9, 3, 'archives', 15, 0, '没有稿源', 0, '219.144.189.248', 'Mozilla/5.0 (Linux; Android 9; MI 8 UD Build/PKQ1.180729.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.98 Mobile Safari/537.36 MicroMessenger/6.7.3.1360(0x260703F2) NetType/WIFI Language/zh_CN Process/appbrand3', 0, 1545067772, 1545067772, 'normal');

-- ----------------------------
-- Table structure for fa_cms_diyform
-- ----------------------------
DROP TABLE IF EXISTS `fa_cms_diyform`;
CREATE TABLE `fa_cms_diyform`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表单名称',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单标题',
  `keywords` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `table` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表名',
  `fields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '字段列表',
  `needlogin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否需要登录',
  `successtips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成功提示文字',
  `redirecturl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成功后跳转链接',
  `formtpl` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表单页模板',
  `diyname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义名称',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `setting` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单配置',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'hidden' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自定义表单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_cms_diyform
-- ----------------------------
INSERT INTO `fa_cms_diyform` VALUES (1, '站内留言', '发表留言', '留言板', '欢迎给我们留言反馈你的问题', 'cms_message', 'name,telephone,qq,content', 0, '留言已成功提交，我们会在第一时间进行处理', NULL, 'diyform.html', 'message', 1540091957, 1540092155, NULL, 'normal');

-- ----------------------------
-- Table structure for fa_cms_dronedev
-- ----------------------------
DROP TABLE IF EXISTS `fa_cms_dronedev`;
CREATE TABLE `fa_cms_dronedev`  (
  `id` int(10) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT 2.00 COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '开发者' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fa_cms_fields
-- ----------------------------
DROP TABLE IF EXISTS `fa_cms_fields`;
CREATE TABLE `fa_cms_fields`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_id` int(10) NOT NULL DEFAULT 0 COMMENT '模型ID',
  `diyform_id` int(10) NOT NULL DEFAULT 0 COMMENT '表单ID',
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `defaultvalue` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '默认值',
  `rule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '验证规则',
  `msg` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '错误消息',
  `ok` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '成功消息',
  `tip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `decimals` tinyint(1) NULL DEFAULT NULL COMMENT '小数点',
  `length` mediumint(8) NULL DEFAULT NULL COMMENT '长度',
  `minimum` smallint(6) NULL DEFAULT NULL COMMENT '最小数量',
  `maximum` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大数量',
  `extend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '扩展信息',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `iscontribute` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否可投稿',
  `isfilter` tinyint(1) NOT NULL DEFAULT 0 COMMENT '筛选',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `model_id`(`model_id`) USING BTREE,
  INDEX `diyform_id`(`diyform_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型字段表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_cms_fields
-- ----------------------------
INSERT INTO `fa_cms_fields` VALUES (132, 0, 1, 'name', 'string', '姓名', 'value1|title1\r\nvalue2|title2', '', 'required', '', '', '', 0, 50, 0, 0, '', 136, 1540110334, 1540110334, 1, 0, 'normal');
INSERT INTO `fa_cms_fields` VALUES (133, 0, 1, 'telephone', 'string', '手机', 'value1|title1\r\nvalue2|title2', '', 'required,mobile', '', '', '', 0, 50, 0, 0, '', 135, 1540110369, 1540110369, 1, 0, 'normal');
INSERT INTO `fa_cms_fields` VALUES (134, 0, 1, 'qq', 'string', 'QQ', 'value1|title1\r\nvalue2|title2', '', 'digits', '', '', '', 0, 30, 0, 0, '', 134, 1540110394, 1540110394, 1, 0, 'normal');
INSERT INTO `fa_cms_fields` VALUES (135, 0, 1, 'content', 'editor', '内容', 'value1|title1\r\nvalue2|title2', '', 'required', '', '', '', 0, 255, 0, 0, '', 133, 1540110415, 1540110415, 1, 0, 'normal');
INSERT INTO `fa_cms_fields` VALUES (136, 1, 0, 'author', 'string', '作者', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', 136, 1508990735, 1508991985, 1, 1, 'normal');
INSERT INTO `fa_cms_fields` VALUES (137, 1, 0, 'area', 'select', '地区', 'domestic|国内\r\noverseas|国外\r\nlocal|本地', '', '', '', '', '', 0, 255, 0, 0, '', 137, 1508990746, 1523723221, 1, 1, 'normal');
INSERT INTO `fa_cms_fields` VALUES (138, 1, 0, 'device', 'radio', '设备', 'vr|智能设备\r\nar|虚拟设备', '', 'required', '', '', '', 0, 255, 0, 0, '', 138, 1508992093, 1508992093, 1, 1, 'normal');
INSERT INTO `fa_cms_fields` VALUES (139, 2, 0, 'productdata', 'images', '产品列表', 'value1|title1\r\nvalue2|title2', '', 'required', '', '', '', 0, 1500, 0, 20, '', 139, 1508992518, 1508992518, 1, 1, 'normal');
INSERT INTO `fa_cms_fields` VALUES (140, 1, 0, 'price', 'number', '价格', 'value1|title1\r\nvalue2|title2', '1', 'required', '', '', '', 0, 10, 0, 0, '', 140, 1508992093, 1545117240, 1, 1, 'normal');
INSERT INTO `fa_cms_fields` VALUES (144, 2, 0, 'price0', 'number', '价格a', 'value1|title1\r\nvalue2|title2', '', 'required', '', '', '', 0, 10, 0, 0, '', 144, 1545113697, 1545113909, 1, 0, 'normal');
INSERT INTO `fa_cms_fields` VALUES (146, 2, 0, 'author', 'string', '作者大人', 'value1|title1\r\nvalue2|title2', '', 'required', '', '', '', 0, 10, 0, 0, '', 146, 1545115445, 1545115445, 1, 0, 'normal');
INSERT INTO `fa_cms_fields` VALUES (157, 3, 0, 'price', 'number', '价格', 'value1|title1\r\nvalue2|title2', '2', 'required', '', '', '', 2, 10, 0, 0, '', 157, 1545117261, 1545117261, 1, 0, 'normal');

-- ----------------------------
-- Table structure for fa_cms_message
-- ----------------------------
DROP TABLE IF EXISTS `fa_cms_message`;
CREATE TABLE `fa_cms_message`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NULL DEFAULT NULL COMMENT '会员ID',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '姓名',
  `telephone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '电话',
  `qq` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'QQ',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站内留言' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_cms_message
-- ----------------------------
INSERT INTO `fa_cms_message` VALUES (1, NULL, 1540107249, 1540107249, 'FastAdmin', '13811111111', '123456', '我是来自前台提交的信息');

-- ----------------------------
-- Table structure for fa_cms_model
-- ----------------------------
DROP TABLE IF EXISTS `fa_cms_model`;
CREATE TABLE `fa_cms_model`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模型名称',
  `table` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表名',
  `fields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '字段列表',
  `channeltpl` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '栏目页模板',
  `listtpl` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表页模板',
  `showtpl` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详情页模板',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模型配置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容模型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_cms_model
-- ----------------------------
INSERT INTO `fa_cms_model` VALUES (1, '新闻', 'cms_addonnews', 'author,area,device,price', 'channel.html', 'list_news.html', 'show_news.html', 1508990659, 1523723221, '');
INSERT INTO `fa_cms_model` VALUES (2, '产品', 'cms_addonproduct', 'productdata,price0,author', 'channel.html', 'list_product.html', 'show_product.html', 1508992445, 1545115446, '');
INSERT INTO `fa_cms_model` VALUES (3, '开发者', 'cms_dronedev', 'price', 'channel.html', 'list_news.html', 'show_news.html', 1545066697, 1545117262, NULL);

-- ----------------------------
-- Table structure for fa_cms_order
-- ----------------------------
DROP TABLE IF EXISTS `fa_cms_order`;
CREATE TABLE `fa_cms_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `user_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '会员ID',
  `archives_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '文档ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单标题',
  `amount` double(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '订单金额',
  `payamount` double(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '支付金额',
  `paytype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `paytime` int(10) NULL DEFAULT NULL COMMENT '支付时间',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `useragent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'UserAgent',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('created','paid','expired') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'created' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `archives_id`(`archives_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_cms_order
-- ----------------------------
INSERT INTO `fa_cms_order` VALUES (1, 0, 36, '这里是测试的无人机光电站运行', 699.00, 0.00, 'wechat', NULL, '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', NULL, 1545111237, 1545111237, 'created');
INSERT INTO `fa_cms_order` VALUES (2, 0, 37, '我没有钱', 12.00, 0.00, 'wechat', NULL, '124.114.178.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36', NULL, 1545116839, 1545116839, 'created');

-- ----------------------------
-- Table structure for fa_cms_page
-- ----------------------------
DROP TABLE IF EXISTS `fa_cms_page`;
CREATE TABLE `fa_cms_page`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` int(10) NOT NULL DEFAULT 0 COMMENT '分类ID',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `flag` set('hot','index','recommend') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标志',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击',
  `comments` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论',
  `diyname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '自定义',
  `showtpl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '视图模板',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单页表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_cms_page
-- ----------------------------
INSERT INTO `fa_cms_page` VALUES (28, 0, 'page', '基于ThinkPHP5和Bootstrap的极速后台开发框架', '', '', '', 'fds', '<p>基于ThinkPHP5和Bootstrap进行二次开发,手机、平板、PC均自动适配,无需要担心兼容性问题</p>', '', 0, 0, 'aboutus', 'page', 1508933935, 1508934150, 28, 'normal');

-- ----------------------------
-- Table structure for fa_cms_tags
-- ----------------------------
DROP TABLE IF EXISTS `fa_cms_tags`;
CREATE TABLE `fa_cms_tags`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `archives` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文档ID集合',
  `nums` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `nums`(`nums`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_cms_tags
-- ----------------------------
INSERT INTO `fa_cms_tags` VALUES (1, '驰为', '1', 1);
INSERT INTO `fa_cms_tags` VALUES (2, 'HiGame', '1', 1);
INSERT INTO `fa_cms_tags` VALUES (3, 'PC', '1', 1);
INSERT INTO `fa_cms_tags` VALUES (4, '宏基', '2', 1);
INSERT INTO `fa_cms_tags` VALUES (5, '台式机', '2', 1);
INSERT INTO `fa_cms_tags` VALUES (6, 'Chromebox', '2', 1);
INSERT INTO `fa_cms_tags` VALUES (7, '智能手表', '3', 1);
INSERT INTO `fa_cms_tags` VALUES (8, '混合动力', '3', 1);
INSERT INTO `fa_cms_tags` VALUES (9, '耳返', '4', 1);
INSERT INTO `fa_cms_tags` VALUES (10, '智能设备', '4,6,7,13,35', 5);
INSERT INTO `fa_cms_tags` VALUES (11, '电池', '5', 1);
INSERT INTO `fa_cms_tags` VALUES (12, '南孚', '5', 1);
INSERT INTO `fa_cms_tags` VALUES (13, '眼镜', '7', 1);
INSERT INTO `fa_cms_tags` VALUES (14, 'dropbox', '8,9,10', 3);
INSERT INTO `fa_cms_tags` VALUES (15, '投资', '8,9', 2);
INSERT INTO `fa_cms_tags` VALUES (16, '互联网', '11,15,16,18,19,20,21,22,23,24,25,26,27,28,29,32,31,33,34', 19);
INSERT INTO `fa_cms_tags` VALUES (17, '云计算', '11,12,17,38', 4);
INSERT INTO `fa_cms_tags` VALUES (18, '安全', '12,14,15,16,17,18,26,27,33', 9);
INSERT INTO `fa_cms_tags` VALUES (19, 'Google', '19,20,21,22,23,24,25,32,31', 9);
INSERT INTO `fa_cms_tags` VALUES (20, 'AR', '28,29,34,35', 4);
INSERT INTO `fa_cms_tags` VALUES (21, 'VR', '28', 1);

-- ----------------------------
-- Table structure for fa_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_config`;
CREATE TABLE `fa_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变量值',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_config
-- ----------------------------
INSERT INTO `fa_config` VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'DroneNews', '', 'required', '');
INSERT INTO `fa_config` VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15054802号-4', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `fa_config` VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `fa_config` VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `fa_config` VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `fa_config` VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `fa_config` VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `fa_config` VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `fa_config` VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `fa_config` VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `fa_config` VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `fa_config` VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `fa_config` VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `fa_config` VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `fa_config` VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- ----------------------------
-- Table structure for fa_ems
-- ----------------------------
DROP TABLE IF EXISTS `fa_ems`;
CREATE TABLE `fa_ems`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮箱验证码表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fa_sms
-- ----------------------------
DROP TABLE IF EXISTS `fa_sms`;
CREATE TABLE `fa_sms`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短信验证码表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fa_test
-- ----------------------------
DROP TABLE IF EXISTS `fa_test`;
CREATE TABLE `fa_test`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类ID(单选)',
  `category_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省市',
  `price` float(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '价格',
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击',
  `startdate` date NULL DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime NULL DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) NULL DEFAULT NULL COMMENT '年',
  `times` time NULL DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '刷新时间(int)',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT 0 COMMENT '开关',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_test
-- ----------------------------
INSERT INTO `fa_test` VALUES (1, 0, 12, '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', 0.00, 0, '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1499682285, 1499682526, 1499682526, 0, 1, 'normal', '1');

-- ----------------------------
-- Table structure for fa_third
-- ----------------------------
DROP TABLE IF EXISTS `fa_third`;
CREATE TABLE `fa_third`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `platform` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方应用',
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方唯一ID',
  `openname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方会员昵称',
  `access_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'AccessToken',
  `refresh_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'RefreshToken',
  `expires_in` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '有效期',
  `createtime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  `logintime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '登录时间',
  `expiretime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `platform`(`platform`, `openid`) USING BTREE,
  INDEX `user_id`(`user_id`, `platform`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '第三方登录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_third
-- ----------------------------
INSERT INTO `fa_third` VALUES (1, 3, 'wxapp', 'ojd83412icIEZBkOSqJE9teeevxQ', 'riddle', 'jeuvM/lUjWkUzGDElTY+zg==', '', 0, 1545065827, 1545067752, 1545067752, 1545067752);

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '组别ID',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '余额',
  `score` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '最大连续登录天数',
  `prevtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上次登录时间',
  `logintime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `joinip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '加入时间',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_user
-- ----------------------------
INSERT INTO `fa_user` VALUES (1, 1, 'admin', 'admin', 'c13f62012fd6a8fdf06b3452a94430e5', 'rpR6Bv', 'admin@163.com', '13888888888', '/assets/img/avatar.png', 0, 0, '2017-04-15', '', 0.00, 0, 1, 1, 1516170492, 1516171614, '127.0.0.1', 0, '127.0.0.1', 1491461418, 0, 1516171614, '', 'normal', '');
INSERT INTO `fa_user` VALUES (2, 0, 'riddle911', 'riddle911', '28f5fc084fa31a86a431d872c6d3e0b6', 'bAvwgs', 'riddle911@foxmail.com', '18591881597', '', 1, 0, NULL, '', 0.00, 0, 1, 1, 1545060611, 1545060611, '219.144.189.248', 0, '219.144.189.248', 1545060611, 1545060611, 1545060611, '', 'normal', '');
INSERT INTO `fa_user` VALUES (3, 0, 'u3', 'riddle', '26c1979060c53e32ce9d5615a73c24f3', 'Pn4YE0', 'u3@fastadmin.net', '', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKmj2hibqrMD5ZFCduAyMDGxGXFQIBTuYRbasicNzicf8cuP5ykgdDq2axFkLPrlu2SbXxXsjhhqP4nw/132', 1, 1, NULL, '', 0.00, 0, 1, 1, 1545067487, 1545067752, '219.144.189.248', 0, '219.144.189.248', 1545065827, 1545065827, 1545067752, '', 'normal', '');

-- ----------------------------
-- Table structure for fa_user_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_group`;
CREATE TABLE `fa_user_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限节点',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_user_group
-- ----------------------------
INSERT INTO `fa_user_group` VALUES (1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1515386468, 1516168298, 'normal');

-- ----------------------------
-- Table structure for fa_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_money_log`;
CREATE TABLE `fa_user_money_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更余额',
  `before` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更前余额',
  `after` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更后余额',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员余额变动表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fa_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_rule`;
CREATE TABLE `fa_user_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) NULL DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标题',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) NULL DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NULL DEFAULT 0 COMMENT '权重',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_user_rule
-- ----------------------------
INSERT INTO `fa_user_rule` VALUES (1, 0, 'index', '前台', '', 1, 1516168079, 1516168079, 1, 'normal');
INSERT INTO `fa_user_rule` VALUES (2, 0, 'api', 'API接口', '', 1, 1516168062, 1516168062, 2, 'normal');
INSERT INTO `fa_user_rule` VALUES (3, 1, 'user', '会员模块', '', 1, 1515386221, 1516168103, 12, 'normal');
INSERT INTO `fa_user_rule` VALUES (4, 2, 'user', '会员模块', '', 1, 1515386221, 1516168092, 11, 'normal');
INSERT INTO `fa_user_rule` VALUES (5, 3, 'index/user/login', '登录', '', 0, 1515386247, 1515386247, 5, 'normal');
INSERT INTO `fa_user_rule` VALUES (6, 3, 'index/user/register', '注册', '', 0, 1515386262, 1516015236, 7, 'normal');
INSERT INTO `fa_user_rule` VALUES (7, 3, 'index/user/index', '会员中心', '', 0, 1516015012, 1516015012, 9, 'normal');
INSERT INTO `fa_user_rule` VALUES (8, 3, 'index/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 4, 'normal');
INSERT INTO `fa_user_rule` VALUES (9, 4, 'api/user/login', '登录', '', 0, 1515386247, 1515386247, 6, 'normal');
INSERT INTO `fa_user_rule` VALUES (10, 4, 'api/user/register', '注册', '', 0, 1515386262, 1516015236, 8, 'normal');
INSERT INTO `fa_user_rule` VALUES (11, 4, 'api/user/index', '会员中心', '', 0, 1516015012, 1516015012, 10, 'normal');
INSERT INTO `fa_user_rule` VALUES (12, 4, 'api/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 3, 'normal');

-- ----------------------------
-- Table structure for fa_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_score_log`;
CREATE TABLE `fa_user_score_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT 0 COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT 0 COMMENT '变更后积分',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员积分变动表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fa_user_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_token`;
CREATE TABLE `fa_user_token`  (
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `expiretime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '过期时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员Token表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_user_token
-- ----------------------------
INSERT INTO `fa_user_token` VALUES ('1537937019905f19e5ae43e3bd78dafda94c5853', 3, 1545065827, 0);
INSERT INTO `fa_user_token` VALUES ('42b0a66c135327ae9bd6c7fdc36e754e070067e5', 2, 1545060611, 1547652611);
INSERT INTO `fa_user_token` VALUES ('8fc74d89fa90fef57fd0c21bd18d9938ef259144', 3, 1545067752, 0);
INSERT INTO `fa_user_token` VALUES ('d3939aca063fbd6c6ebacbcdb3d01bba7a9a8912', 3, 1545067487, 0);
INSERT INTO `fa_user_token` VALUES ('e1f41de9c80d1e69fef25d0b4595544a3ef543a4', 3, 1545065827, 0);

-- ----------------------------
-- Table structure for fa_version
-- ----------------------------
DROP TABLE IF EXISTS `fa_version`;
CREATE TABLE `fa_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '版本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fa_version
-- ----------------------------
INSERT INTO `fa_version` VALUES (1, '1.1.1,2', '1.2.1', '20M', '更新内容', 'https://www.fastadmin.net/download.html', 1, 1520425318, 0, 0, 'normal');

SET FOREIGN_KEY_CHECKS = 1;
