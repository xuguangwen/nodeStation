/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : web

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-05-19 11:51:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aboutus_table
-- ----------------------------
DROP TABLE IF EXISTS `aboutus_table`;
CREATE TABLE `aboutus_table` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '团队名称或者企业名称',
  `content` text NOT NULL,
  `src` varchar(300) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aboutus_table
-- ----------------------------
INSERT INTO `aboutus_table` VALUES ('4', '成长', '天公路货运管理系统是华天软件为物流货运企业全力打造的一套物流网络信息化的实在营运解决方案，通过６年的不华天公路货运管理系统是华天软件为物流货运企业全力打造的一套物流网络信息化的实在营流网络信息化的实在营运解决\r\n天公路货运管理系统是华天软件为物流货运企业全力打造的一套物流网络信息化的实在营运解决方案，通过６年的不华天公路货运管理系统是华天软件为物流货运企业全力打造的一套物流网络信息化的实在营流网络信息化的实在营运解决\r\n天公路货运管理系统是华天软件为物流货运企业全力打造的一套物流网络信息化的实在营运解决方案，通过６年的不华天公路货运管理系统是华天软件为物流货运企业全力打造的一套物流网络信息化的实在营流网络信息化的实在营运解决\r\n天公路货运管理系统是华天软件为物流货运企业全力打造的一套物流网络信息化的实在营运解决方案，通过６年的不华天公路货运管理系统是华天软件为物流货运企业全力打造的一套物流网络信息化的实在营流网络信息化的实在营运解决', 'chengzhang.jpg');
INSERT INTO `aboutus_table` VALUES ('5', '创意', '天公路货运管理系统是华天软件为物流货运企业全力打造的一套物流网络信息化的实在营运解决方案，通过６年的不华天公路货运管理系统是华天软件为物流货运企业全力打造的一套物流网络信息化的实在营流网络信息化的实在营运解决<br/>\r\n天公路货运管理系统是华天软件为物流货运企业全力打造的一套物流网络信息化的实在营运解决方案，通过６年的不华天公路货运管理系统是华天软件为物流货运企业全力打造的一套物流网络信息化的实在营流网络信息化的实在营运解决', 'chuangyi.jpg');
INSERT INTO `aboutus_table` VALUES ('6', '服务', '1人的生命是有限的，可是，为人民服务是无限的，我要把有限的生命，投入到无限的为人民服务之中去。------雷锋\r\n2我的人生哲学是工作，我要揭示大自然的奥秘，并以此为人类服务。我们在世的短暂的一生中，我不知道还有什么比这种服务更好的了。------爱迪生\r\n3科学决不是一种自私自利的享乐。有幸能够致力于科学研究的人，首先应该拿自己的学识为人类服务。 ------马克思\r\n4一个人只要肯深入到事物表面以下去探索，哪怕他自己也许看得不对，却为旁人扫清了道路，甚至能使他的错误也终于为真理的事业服务。 ------博克\r\n5我们为祖国服务，也不能都采用同一方式，每个人应该按照资禀，各尽所能。 ------歌德\r\n6中国人搞出的理论，首先要为中国人服务。 ------吴仲华\r\n7我有我的人格、良心，不是钱能买的。我的音乐，要献给祖国，献给劳动人民大众，为挽救民族危机服务。 ------冼星海\r\n8我无论作什么，始终在想着，只要我的精力允许我的话，我就要首先为我的祖国服务。------巴甫洛夫\r\n9一个人对人民的服务不一定要站在大会上讲演或是作什么惊天动地的大事业，随时随地，点点滴滴地把自己知道的、想到的告诉人家，无形中就是替国家播种、垦植。 ------傅雷', 'fuwu.jpg');

-- ----------------------------
-- Table structure for admin_table
-- ----------------------------
DROP TABLE IF EXISTS `admin_table`;
CREATE TABLE `admin_table` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_table
-- ----------------------------
INSERT INTO `admin_table` VALUES ('1', 'xuguangwen', '10f38eac74359214334540452852cfb6');

-- ----------------------------
-- Table structure for banner_table
-- ----------------------------
DROP TABLE IF EXISTS `banner_table`;
CREATE TABLE `banner_table` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL COMMENT 'banner里面文字的标题',
  `description` varchar(300) NOT NULL COMMENT '描述',
  `href` varchar(300) NOT NULL COMMENT '链接',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner_table
-- ----------------------------
INSERT INTO `banner_table` VALUES ('1', '开括创新，领跑未来!', '中国科学计算机技术分享大会，与您相约纺大！', 'https://www.wtu.edu.cn/html/wwwindex.html');

-- ----------------------------
-- Table structure for contact_table
-- ----------------------------
DROP TABLE IF EXISTS `contact_table`;
CREATE TABLE `contact_table` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(20) NOT NULL COMMENT '公司名称',
  `person` varchar(20) NOT NULL COMMENT '联系人',
  `address` varchar(50) NOT NULL COMMENT '街道地址',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `tel` varchar(20) NOT NULL COMMENT '固定电话',
  `qq` varchar(20) NOT NULL,
  `email` varchar(64) NOT NULL COMMENT '邮箱',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact_table
-- ----------------------------
INSERT INTO `contact_table` VALUES ('3', '武汉恒望科技有限公司', '许广文', '武汉纺织大学阳光校区5栋418', '88888888', '15629151526', '326531916', '326531916@qq.com');

-- ----------------------------
-- Table structure for fuwu_table
-- ----------------------------
DROP TABLE IF EXISTS `fuwu_table`;
CREATE TABLE `fuwu_table` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `src` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fuwu_table
-- ----------------------------
INSERT INTO `fuwu_table` VALUES ('1', 'Android应用程序开发', '据统计，2013年，Android全球市场份额达到了78.6%，而中国市场也达到了78%。在移动操作市场，Android已经成为不可动摇的王者。 针对目前Android平台日益严重的碎片化问题，我们提供了多种解决方案，针对不同的系统版本，设备型号和设备分辨率，我们提供了全面 的兼容性测试。同时，我们为客户的App提供了多平台发布服务，包括Google play，亚马逊应用商店，91，应用汇，机锋网等等多个平台， 努力让更多的用户可以下载到。', 'android.png');
INSERT INTO `fuwu_table` VALUES ('2', '微信公众平台开发', '具腾讯官方统计，目前微信月活跃用户达到了3亿，其中海外用户更是达到了4千万。随着微信用户的不断增加，腾讯对其微信产品：公众平 台帐号的不断投入与推广，对于企业客户来说，拥有一款微信公众平台产品比拥有一个企业官方网站更重要。我们不但致力于高品质App的开 发，而且在微信公众平台二次开发方面拥有优秀开发人才和市场推广经验。迄今为止，我们已经为数十家企业开发了微信公众平台帐号。客户 可以结合微信公众平台，更好得去运营App平台和网站，不但提高了用户的数量，而且更好得拉近了与用户的距离', 'wechat.png');
INSERT INTO `fuwu_table` VALUES ('3', 'IOS(iPhone、iPad、Mac os)应用程序开发', '虽然Android的市场份额是绝对的王者，但是在高端手机市场领域，IOS同样成为市场的主导者。据统计，2013年，IOS全球市场份额达到 了17.6%。虽然Android市场份额要比IOS要高，在细分领域，比如教育市场、企业市场、高端市场等，IOS是绝对的王者。我们服务的客户 超过30家，他们来自不同的行业，包括房地产，服务，医疗等等。迄今为止已为客户开发了超过30款ios应用程序，其中有10款是iPad应用 程序，目前上架运营的超过20款。我们紧随时代潮流，将最新的设计理念和技术应用到项目中。', 'ios.png');
INSERT INTO `fuwu_table` VALUES ('4', '服务器接口开发', '无论ios平台、android平台、windows phone平台还是微信公众帐号平台，要想保持程序运行的稳定性、即时性，必须要有一个优良的服 务器平台作为支撑。我们为客户提供了全球领先的服务器开发语言PHP和JAVA。根据客户的不同需求选择不同的开发语言，我们的服务器接 口性能优良，支持十万百万级的用户并发量。', 'webservice.png');
INSERT INTO `fuwu_table` VALUES ('5', '企业网站开发', '作为企业形象的门面，一个好的企业网站为客户的产品。武汉恒望不断致力于移动互联网产品的开发服务，更注重企业网站。 我们不但致力于高品质App的开发，而且在微信公众平台二次开发方面拥有优秀开发人才和市场推广经验。迄今为止，我们已经为数十家企业 开发了微信公众平台帐号。客户可以结合微信公众平台，更好得去运营App平台和网站，不但提高了用户的数量，而且更好得拉近了与用户的距离。', 'website.png');
INSERT INTO `fuwu_table` VALUES ('6', '手机移动网站开发', '随着智能手机用户数量的爆发式增长，企业在拥有一个桌面版的网站的同时，更需要拥有一个适配智能手机的移动版网站。事实证明，拥有移 动版的网站，可以让您的网站在移动版百度搜索结果里面拥有更好的排名。我们为客户提供了基于HTML5+CSS3+JQuery Mobile的移动版网站开 发前端技术，使客户的网站在多种平台多种分辨率下拥有统一的显示效果，另外可以实现更炫的动态效果。', 'mwebsite.png');

-- ----------------------------
-- Table structure for nav_table
-- ----------------------------
DROP TABLE IF EXISTS `nav_table`;
CREATE TABLE `nav_table` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `href` varchar(64) NOT NULL COMMENT '地址',
  `parent_id` int(11) unsigned NOT NULL COMMENT 'parent记录的是上级导航的id,parent为0的话，表示一级菜单',
  `level` tinyint(3) unsigned NOT NULL COMMENT '菜单层级',
  `type` varchar(255) NOT NULL COMMENT '菜单的类别',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_table
-- ----------------------------
INSERT INTO `nav_table` VALUES ('1', '首页', 'index.html', '0', '1', '综合');
INSERT INTO `nav_table` VALUES ('2', '解决方案', 'solutions.html', '0', '1', 'solutions');
INSERT INTO `nav_table` VALUES ('3', '产品展示', 'product-show.html', '0', '1', 'product-show');
INSERT INTO `nav_table` VALUES ('4', '客户案例', 'customer-case.html', '0', '1', 'customer-case');
INSERT INTO `nav_table` VALUES ('5', '服务中心', 'service-center.html', '0', '1', 'service-center');
INSERT INTO `nav_table` VALUES ('6', '新闻动态', 'news.html', '0', '1', 'news');
INSERT INTO `nav_table` VALUES ('7', '关于我们', 'about-us.html', '0', '1', 'about-us');

-- ----------------------------
-- Table structure for news_table
-- ----------------------------
DROP TABLE IF EXISTS `news_table`;
CREATE TABLE `news_table` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `summary` varchar(500) NOT NULL COMMENT '新闻摘要',
  `content` text NOT NULL COMMENT '新闻内容',
  `src` varchar(300) NOT NULL COMMENT '摘要图像',
  `keyword` varchar(100) NOT NULL COMMENT '新闻关键字',
  `post_time` varchar(11) NOT NULL COMMENT '新闻上传的时间存成时间戳s为单位',
  `view` int(11) NOT NULL COMMENT '新闻被查看次数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_table
-- ----------------------------
INSERT INTO `news_table` VALUES ('1', '关于新品发布通知', '互联网，又称网际网路或音译因特网、英特网，是网络与网络之间所串连成的庞大网络网络与网络之。', '互联网，又称网际网路或音译因特网、英特网，是网络与网络之间所串连成的庞大网络网络与网络之。。。。互联网，又称网际网路或音译因特网、英特网，是网络与网络之间所串连成的庞大网络网络与网络之。。。。', 'xinwen01.jpg', '互联网新品', '2017-3-20', '5000');
INSERT INTO `news_table` VALUES ('2', '关于召开年会通知', '互联网，又称网际网路或音译因特网、英特网，是网络与网络之间所串连成的庞大网络网络与网络之...', '互联网，又称网际网路或音译因特网、英特网，是网络与网络之间所串连成的庞大网络网络与网络之...互联网，又称网际网路或音译因特网、英特网，是网络与网络之间所串连成的庞大网络网络与网络之...互联网，又称网际网路或音译因特网、英特网，是网络与网络之间所串连成的庞大网络网络与网络之...', 'xinwen02.png', '年会通知', '2017-01-12', '6000');
INSERT INTO `news_table` VALUES ('3', '关于论文查重通知', '论文查重,要重视啊！', '武汉纺织大学武汉纺织大学重要的事情说三次。\r\n恭喜：黄晓克先生获取温州软件协会第二届第四次《最佳项目经理奖》。\r\n恭喜：黄晓克先生获取温州软件协会第二届第四次《最佳项目经理奖》。\r\n恭喜：黄晓克先生获取温州软件协会第二届第四次《最佳项目经理奖》。', 'xinwen03.png', '论文查重', '2017-05-17', '1200');
INSERT INTO `news_table` VALUES ('4', '关于就业通知', '就业通知，真的很重要，你觉得呢？', '今天没有吃饭就跑去搞毕业设计真的累，我好心累，一个毕业设计天天搞。', 'xinwen04.png', '就业', '2017-06-12', '2322');
INSERT INTO `news_table` VALUES ('5', '关于公司发展方向通知', '公司是个好的公司，你觉得呢？所以我们发展', '关于公司发展方向通知关于公司发展方向通知关于公司发展方向通知关于公司发展方向通知关于公司发展方向通知关于公司发展方向通知关于公司发展方向通知', 'xinwen05.png', '发展', '2016-04-03', '4300');
INSERT INTO `news_table` VALUES ('6', '关于工资问题通知', '工资发放', '工资你打算开多少呢？你觉得多少号呢', 'xinwen06.png', '工资', '2017-04-27', '4522');

-- ----------------------------
-- Table structure for patner_table
-- ----------------------------
DROP TABLE IF EXISTS `patner_table`;
CREATE TABLE `patner_table` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '企业是名称',
  `src` varchar(300) NOT NULL COMMENT '企业的logo',
  `description` varchar(300) NOT NULL COMMENT '企业是简介',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patner_table
-- ----------------------------
INSERT INTO `patner_table` VALUES ('1', '爱创科技', 'ptn4.png', '爱创科技爱创科技爱创科技爱创科技爱创科技爱创科技爱创科技爱创科技');
INSERT INTO `patner_table` VALUES ('2', '爱我科技', 'ptn5.png', '爱创科技爱创科技爱创科技爱创科技爱创科技爱创科技爱创科技爱创科技爱创科技爱创科技爱创科技爱创科技');
INSERT INTO `patner_table` VALUES ('3', '姚式科技', 'ptn6.png', '爱创科技爱创科技爱创科技爱创科技爱创科技爱创科技');
INSERT INTO `patner_table` VALUES ('4', '刘式科技', 'ptn7.png', '爱创科技爱创科技爱创科技爱创科技爱创科技爱创科技爱创科技');
INSERT INTO `patner_table` VALUES ('5', '许式集团', 'ptn8.png', '爱创科技爱创科技爱创科技爱创科技爱创科技爱创科技爱创科技');
INSERT INTO `patner_table` VALUES ('6', '爱创科技', 'ptn4.png', '爱创科技爱创科技');
INSERT INTO `patner_table` VALUES ('7', '爱我科技', 'ptn5.png', '爱创科技爱创科技');
INSERT INTO `patner_table` VALUES ('8', '姚式科技', 'ptn6.png', '爱创科技爱创科技');

-- ----------------------------
-- Table structure for products_table
-- ----------------------------
DROP TABLE IF EXISTS `products_table`;
CREATE TABLE `products_table` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL COMMENT '大标题',
  `description` varchar(300) NOT NULL COMMENT '描述文字',
  `href` varchar(300) NOT NULL COMMENT '点击链接',
  `post_time` varchar(255) NOT NULL,
  `src` varchar(300) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products_table
-- ----------------------------
INSERT INTO `products_table` VALUES ('4', '响应式商城', '一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。', 'http://www.hwshop.com', '2017-3-27', 'case01.png');
INSERT INTO `products_table` VALUES ('5', '物流红娘', '一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。', 'www.baidu.com', '2017-3-29', 'case02.png');
INSERT INTO `products_table` VALUES ('6', '车型湖北', '一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。', 'www.bookschina.com', '2017-4-2', 'case03.png');
INSERT INTO `products_table` VALUES ('7', '管理系统', '一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。', 'www.wangyi.com', '2017-4-27', 'case04.png');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'username', 'password');
INSERT INTO `users` VALUES ('4', 'wwww', 'wwww');
INSERT INTO `users` VALUES ('6', 'yao', '123');
INSERT INTO `users` VALUES ('8', 'xuguangwen', 'xu.19930327');
INSERT INTO `users` VALUES ('9', '是是是', 'ssss');
