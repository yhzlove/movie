/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : db_movie

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-04-27 10:49:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_attach`
-- ----------------------------
DROP TABLE IF EXISTS `sys_attach`;
CREATE TABLE `sys_attach` (
  `id` int(11) NOT NULL COMMENT '主键',
  `newName` varchar(255) DEFAULT NULL COMMENT '新名称',
  `oldName` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` double(10,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `attach_size` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_934jr32xon3a3u99bgxeqnmk2` (`movie_id`),
  CONSTRAINT `FK_934jr32xon3a3u99bgxeqnmk2` FOREIGN KEY (`movie_id`) REFERENCES `sys_movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_attach
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_comment`
-- ----------------------------
DROP TABLE IF EXISTS `sys_comment`;
CREATE TABLE `sys_comment` (
  `id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dteq75n1wraue3k254ks03p9l` (`member_id`),
  KEY `FK_6o4sl82vcfjw4ddsqa6l74lvy` (`movie_id`),
  CONSTRAINT `FK_6o4sl82vcfjw4ddsqa6l74lvy` FOREIGN KEY (`movie_id`) REFERENCES `sys_movie` (`id`),
  CONSTRAINT `FK_dteq75n1wraue3k254ks03p9l` FOREIGN KEY (`member_id`) REFERENCES `sys_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_comment
-- ----------------------------
INSERT INTO `sys_comment` VALUES ('1', '挺期待的', null, '2017-04-23 20:07:15', null, '1', '2');
INSERT INTO `sys_comment` VALUES ('2', '万众瞩目', null, '2017-04-23 20:20:47', null, '1', '1');
INSERT INTO `sys_comment` VALUES ('3', '万众瞩目', null, '2017-04-23 20:20:47', null, '1', '2');
INSERT INTO `sys_comment` VALUES ('4', '和期待', null, '2017-04-23 20:21:46', null, '1', '1');
INSERT INTO `sys_comment` VALUES ('5', '非常好看', null, '2017-04-23 20:22:03', null, '1', '1');
INSERT INTO `sys_comment` VALUES ('6', '非常好看', null, '2017-04-23 20:24:01', null, '1', '2');
INSERT INTO `sys_comment` VALUES ('7', '好看', null, '2017-04-23 20:30:21', null, '1', '9');

-- ----------------------------
-- Table structure for `sys_hall`
-- ----------------------------
DROP TABLE IF EXISTS `sys_hall`;
CREATE TABLE `sys_hall` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `seatCount` int(11) DEFAULT NULL,
  `seats` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `classify` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `registTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `flag` int(11) DEFAULT NULL,
  `seatRows` int(11) DEFAULT NULL,
  `seatCols` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_hall
-- ----------------------------
INSERT INTO `sys_hall` VALUES ('1', '1号厅', '82', 'aa_aaaaaa_aa,aa_aaaaaa_aa,aa_aaaaaa_aa,aa_aaaaaa_aa,aa_aaaaaa_aa,aa_aaaaaa_aa,aa_aaaaaa_aa,aaaaaaaaaaaa', '入口北侧', '3D', '', '2017-04-23 19:46:58', '1', '8', '12');
INSERT INTO `sys_hall` VALUES ('2', '2号厅', '64', 'aa_aaaaaaa,aa_aaaaaaa,aa_aaaaaaa,aa_aaaaaaa,aa_aaaaaaa,aa_aaaaaaa,aaaaaaaaaa', '入口南侧', 'IMAX', '', '2017-04-23 19:48:13', '1', '7', '10');
INSERT INTO `sys_hall` VALUES ('3', '3号厅', '41', 'aa_aaaa,___aaaa,aa_aaaa,aa_aaaa,aa_aaaa,aa_aaaa,aaaaaaa', '进门直走南侧', '2D', '', '2017-04-23 19:49:00', '1', '7', '7');

-- ----------------------------
-- Table structure for `sys_member`
-- ----------------------------
DROP TABLE IF EXISTS `sys_member`;
CREATE TABLE `sys_member` (
  `id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `realName` varchar(100) DEFAULT NULL,
  `registTime` date DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `headImgUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_member
-- ----------------------------
INSERT INTO `sys_member` VALUES ('1', '1@163.com', null, '1', '王小二', '2017-04-23', null, '', '1', '/files/4a9a1596-e7aa-483b-a982-0d2ff3b589b6.png');

-- ----------------------------
-- Table structure for `sys_movie`
-- ----------------------------
DROP TABLE IF EXISTS `sys_movie`;
CREATE TABLE `sys_movie` (
  `id` int(11) NOT NULL,
  `movieName` varchar(255) DEFAULT NULL,
  `shortName` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `showTime` datetime DEFAULT NULL,
  `creatTime` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `storyLine` varchar(2000) DEFAULT NULL,
  `starRating` varchar(255) DEFAULT NULL,
  `videoUrl` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `actor` varchar(255) DEFAULT NULL,
  `length` varchar(255) DEFAULT NULL,
  `imgHead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_movie
-- ----------------------------
INSERT INTO `sys_movie` VALUES ('1', '速度与激情8', '玩命关头', '动作|飞车', '2017-04-24 00:00:00', null, '', '1', '多米尼克与莱蒂共度蜜月，布莱恩与米娅退出了赛车界，这支曾环游世界的顶级飞车家族队伍的生活正渐趋平淡。然而，一位神秘女子Cipher的出', '8.5', '', '/files/1492932935942.jpg', 'F·加里·格雷', '范·迪塞尔,道恩·强森,泰瑞斯·吉布森,杰森·斯坦森,查理兹·塞隆,米歇尔', '136', '1');
INSERT INTO `sys_movie` VALUES ('2', '蓝精灵：寻找神秘村', '蓝精灵对战格格巫', '动漫', '2017-04-29 00:00:00', null, '', '1', '聪聪、笨笨和健健将和蓝妹妹一起，出发前去寻找传说中“失落的蓝精灵村庄”，而格格巫也在寻找这座村庄。另外，健健还将会和蓝妹妹有一段罗曼史。', '10', '/files/1492937185459.mp4', '/files/1492933043752.jpg', '凯利·阿斯博瑞', '曼迪·帕廷金,黛米·洛瓦托,雷恩·威尔森,乔·曼根尼罗,杰克·麦克布瑞尔,丹尼·普迪', '123', '1');
INSERT INTO `sys_movie` VALUES ('3', '傲娇与偏见', '怼出真爱', '爱情', '2017-04-25 00:00:00', null, '', '1', '北漂网络写手唐楠楠（迪丽热巴 饰）脑洞大于常人，整日穿行在各种“白日梦”之中，梦想着有一天能成为网文大神，然而在她误打误撞毁掉了贱萌海龟男朱侯（张云龙 饰）为追求女神精心布置的告白仪式之后，这对冤家阴差阳错之下被迫带着各自的傲娇与偏见开始了同居生活。朱侯的高富帅好基友萧见君（高伟光 饰）因对唐楠楠一见钟情展开猛烈攻势，却不料遭到朱侯再三阻挠。当“傲娇”任性撞上“偏见”无理，一场鸡飞狗跳的脱线恋情正在袭来，一次跨越银河系的世纪大和解即将上演。', '8.5', '', '/files/1492933109341.jpg', '李海蜀,黄彦威', '迪丽热巴,张云龙,高伟光,金晨,马薇薇,范湉湉,披拉·尼迪裴善官,周海媚', '120', '2');
INSERT INTO `sys_movie` VALUES ('4', '大话西游之大圣娶亲', '一生所爱 此生无憾', '爱情', '2017-04-26 00:00:00', null, '', '1', '至尊宝（周星驰 饰）被月光宝盒带回到五百年前，遇见紫霞仙子（朱茵 饰），被对方打上烙印成为对方的人，并发觉自己已变成孙悟空。紫霞与青霞（朱茵 饰）本是如来佛祖座前日月神灯的灯芯（白天是紫霞，晚上是青霞），二人虽然同一肉身却仇恨颇深，因此紫霞立下誓言，谁能拔出她手中的紫青宝剑，谁就是她的意中人。紫青宝剑被至尊宝于不经意间拔出，紫霞决定以身相许，却遭一心记挂白晶晶（莫文蔚 饰）的至尊宝拒绝。后牛魔王救下迷失在沙漠中的紫霞，并逼紫霞与他成婚，关键时刻，至尊宝现身。', '6.5', '', '/files/1492933174943.jpg', '刘镇伟', '周星驰,朱茵,莫文蔚,蔡少芬,陆树铭,吴孟达,罗家英,蓝洁瑛,刘镇伟,江约诚,吴珏瑾,李健仁', '134', '1');
INSERT INTO `sys_movie` VALUES ('6', '血狼犬', '有温度 见血性', '动物', '2017-04-28 00:00:00', null, '', '1', '中国西北天山林场，护林员朱广生（黄宏饰）驯养勇猛的狼犬来防止偷木盗猎，为此倾尽家产、维继艰难。一只流浪小狗（哈雷饰）无意间走进了老朱的生活，老朱为它取名“蓝波”，并开始训练它成为护林犬。极通人性的蓝波很快成为了老朱的好帮手。 因老朱举报其盗猎野狼而入狱的张彪（刘向京饰）刑满释放后，开始找老朱寻仇、不断威胁老朱两个女儿和蓝波的安危，张彪的几次下毒、猎杀都被机智的蓝波化解，张彪狗急跳墙带人强行将蓝波抢走，老朱与派出所刘所长（孙涛饰）找到张彪，看到桌上一盆狗肉悲愤不已。而真相是蓝波被劫后与歹徒斗智斗勇，在厨房中寻机逃走，胖子（肥龙饰）和厨子（秦伟饰）率众人各路围追堵截，蓝波翻墙越顶、“飞檐走壁”最终成功的逃脱。为了让蓝波有个好归宿，姐妹二人含泪将蓝波送到城里被人收养，而忠犬蓝波挣脱锁链长途奔行几十公里又回到了老朱身边。张彪对老朱女儿朱丛（赵婷婷饰）心生爱慕，将她“绑架”到情人谷，发誓痛改前非、真心示爱。老朱与小女儿朱林（朱琳饰）进山寻找遭遇车祸，被狼群围攻。蓝波冒死冲出狼群回去报信，并率领群犬返回深山营救老朱。一场惨烈的狼犬大战震撼上演……', '10', '', '/files/1492933276697.jpg', '刘建华 ', '黄宏,刘向京,赵婷婷,孙涛,王海燕,肥龙,朱琳,秦艺伟,党晨,哈雷', '135', '1');
INSERT INTO `sys_movie` VALUES ('7', '喜欢你', '喜欢你 吃定你', '青春|爱情', '2017-04-28 00:00:00', null, '', '1', '掌管跨国经济体的路晋（金城武 饰）刻薄挑剔，仅有美食这一个爱好。创意厨师顾胜男（周冬雨 饰）迷糊邋遢得过且过。一次收购，一道女巫汤，路晋喜欢上了顾胜男的菜却讨厌极了她这个人。喜欢还是讨厌究竟何去何从？', '3.6', '', '/files/1492933343133.jpg', '许宏宇', '金城武,周冬雨,孙艺洲,奚梦瑶,高晓松,杨祐宁,张国柱,林志玲', '120', '2');
INSERT INTO `sys_movie` VALUES ('8', '神秘家族', '眼见未必为实', '动作|飞车', '2017-04-24 00:00:00', null, '', '1', '《神秘家族》讲述了苗苗（林依晨饰）一家本来有着平静的生活，谁知在平安夜，家族的温馨聚餐却成为最后的晚餐。整个家族惨遭灭门，只有少女苗苗一人幸存。当她寻找惨案真相时，却发现家族中的每个人都在极力隐藏一个巨大的秘密，父亲（姜武饰）、母亲（惠英红 饰）、弟弟（陈晓 饰）之间的关系愈发扑朔迷离，而这一切都要从几个月前苗苗被神秘男子性侵的那个雨夜说起……', '6.5', '', '/files/1492933406876.jpg', '导演', '林依晨,姜武,陈晓,惠英红,蓝正龙,张蚰云,马国华,王道南,陈万号,安琥,郭耀仁,楼学贤,刘芷凌,杜知晨,张哲豪', '136', '2');
INSERT INTO `sys_movie` VALUES ('9', '金刚：骷髅岛', '史上最大金刚', '动物', '2017-05-01 00:00:00', null, '', '1', '上世纪70年代，一支集结了科考队员、探险家、战地摄影记者、军人的探险队，冒险前往南太平洋上的神秘岛屿——骷髅岛。他们的到来惊扰了岛上之神——史上最大金刚。经过一番惨烈的激战之后，探险队员散落在了岛屿各处。此时，队员们才意识到这次探险并不是一次单纯的科考任务，而是去探索怪兽存在的证明。在这片与世隔绝、危险密布的丛林，无数怪异的史前生物暗藏其中，时刻威胁着他们的生命。队员们还遇到了神秘的原始部落，金刚的身世和其守护岛屿的原因也被逐渐揭开，原来，恐怖阴森的骷髅岛上还蛰伏着更凶狠残暴的怪兽……', '10', '', '/files/1492933473029.jpg', '乔丹·沃格特-罗伯茨', '汤姆·希德勒斯顿,布丽·拉尔森,塞缪尔·杰克逊,约翰·古德曼,景甜,约翰·C·赖利,托比·凯贝尔', '123', '2');
INSERT INTO `sys_movie` VALUES ('10', '窦娥奇冤', '千古奇冤 今朝解谜', '爱情', '2017-04-28 00:00:00', null, '', '1', '讲述了东海郡窦娥被冤杀之后，血溅白练、六月飞雪、大旱三年的故事，而后怪事频发闹得民不聊生。皇帝命重臣周天章（邱心志饰演）赴东海郡调查缘由并查办此案，险象环生、蹊跷不断，众多离奇事件、怪异人物纷纷登场，随着窦娥案的层层剥开，幕后的真相让周天章目瞪口呆。', '3.6', '', '/files/1492933532452.jpg', '杨真', '王力可,邱心志,杨昆,田重,刘挺,肖天', '136', '2');
INSERT INTO `sys_movie` VALUES ('11', '攻壳机动队', '未来已到来', '动作|飞车', '2017-04-26 00:00:00', null, '', '1', '故事设定在未来的日本。那时全世界被庞大信息网络连为一体，人类的各种组织器官均可被人造化。生化人、仿生人、人类共存在地球上，单凭肉眼无法识别。很多人的身体都有着与网络连接的端口（在脖子后面），身体纯粹成为了一个容纳人类灵魂的容器。在这样的背景下，犯罪活动也有了新的动向，日本国家公共安全委员会下属的秘密行动小组“攻壳机动队”就是专门为对付此类犯罪而成立的，主人公素子就是其中的一员。', '6.9', '', '/files/1492934841597.jpg', '鲁伯特·山德斯', '斯嘉丽·约翰逊,皮鲁·埃斯贝克,迈克尔·皮特,北野武,朱丽叶·比诺什,黄经汉,Danusia Samal,福岛莉拉', '107', '2');
INSERT INTO `sys_movie` VALUES ('12', '记忆大师', '记忆迷局 人人都有嫌疑！', '动作|飞车', '2017-05-01 00:00:00', null, '', '1', '公元2019 年一种记忆存取手术在全球推广，作家江丰与妻子张代晨感情破裂，江丰删除了他们十年婚姻的爱情片段。妻子要求他取回记忆，重新载入脑海的竟然是一个连环杀人犯的记忆..', '8.5', '', '/files/1492934931014.jpg', '陈正道', '黄渤,徐静蕾,段奕宏,杨子姗,许玮甯', '119', '1');

-- ----------------------------
-- Table structure for `sys_order`
-- ----------------------------
DROP TABLE IF EXISTS `sys_order`;
CREATE TABLE `sys_order` (
  `id` int(11) NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `pay` varchar(255) DEFAULT NULL,
  `buyTime` datetime DEFAULT NULL,
  `payTime` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `showFilm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8v1vu2yr019n9pvh7mo6dxhes` (`member_id`),
  KEY `FK_s0uv9os5arepf3ctd5tyae815` (`movie_id`),
  KEY `FK_4axpxx3mmp18cp673n57ooeul` (`showFilm_id`),
  CONSTRAINT `FK_4axpxx3mmp18cp673n57ooeul` FOREIGN KEY (`showFilm_id`) REFERENCES `sys_showfilm` (`id`),
  CONSTRAINT `FK_8v1vu2yr019n9pvh7mo6dxhes` FOREIGN KEY (`member_id`) REFERENCES `sys_member` (`id`),
  CONSTRAINT `FK_s0uv9os5arepf3ctd5tyae815` FOREIGN KEY (`movie_id`) REFERENCES `sys_movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_order
-- ----------------------------
INSERT INTO `sys_order` VALUES ('1', '240', null, '2017-04-23 20:03:50', '2017-04-23 21:55:20', null, null, '1', '2', '4');
INSERT INTO `sys_order` VALUES ('2', '240', null, '2017-04-23 20:06:42', '2017-04-23 21:55:25', null, null, '1', '2', '4');
INSERT INTO `sys_order` VALUES ('3', '240', null, '2017-04-23 20:20:20', '2017-04-23 21:55:29', null, null, '1', '2', '4');
INSERT INTO `sys_order` VALUES ('4', '70', null, '2017-04-23 22:30:08', null, null, null, '1', '2', '4');
INSERT INTO `sys_order` VALUES ('5', '70', null, '2017-04-23 22:35:04', null, null, null, '1', '2', '4');
INSERT INTO `sys_order` VALUES ('6', '70', null, '2017-04-23 22:35:45', null, null, null, '1', '2', '4');
INSERT INTO `sys_order` VALUES ('7', '35', null, '2017-04-23 22:40:48', null, null, null, '1', '2', '4');
INSERT INTO `sys_order` VALUES ('8', '70', null, '2017-04-23 22:44:46', null, null, null, '1', '2', '4');
INSERT INTO `sys_order` VALUES ('9', '70', '1', '2017-04-23 22:46:03', '2017-04-24 14:07:17', null, null, '1', '2', '4');

-- ----------------------------
-- Table structure for `sys_order_seat`
-- ----------------------------
DROP TABLE IF EXISTS `sys_order_seat`;
CREATE TABLE `sys_order_seat` (
  `id` int(10) NOT NULL DEFAULT '0',
  `order_id` int(10) DEFAULT NULL,
  `seatRow` varchar(200) DEFAULT NULL,
  `seatCol` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bp1bdkmt3smaouigtygblk3w4` (`order_id`),
  CONSTRAINT `FK_bp1bdkmt3smaouigtygblk3w4` FOREIGN KEY (`order_id`) REFERENCES `sys_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_order_seat
-- ----------------------------
INSERT INTO `sys_order_seat` VALUES ('1', '1', '1', '10');
INSERT INTO `sys_order_seat` VALUES ('2', '1', '2', '10');
INSERT INTO `sys_order_seat` VALUES ('3', '1', '3', '10');
INSERT INTO `sys_order_seat` VALUES ('4', '2', '1', '9');
INSERT INTO `sys_order_seat` VALUES ('5', '2', '2', '9');
INSERT INTO `sys_order_seat` VALUES ('6', '2', '3', '9');
INSERT INTO `sys_order_seat` VALUES ('7', '3', '1', '8');
INSERT INTO `sys_order_seat` VALUES ('8', '3', '2', '8');
INSERT INTO `sys_order_seat` VALUES ('9', '3', '3', '8');
INSERT INTO `sys_order_seat` VALUES ('10', '4', '4', '8');
INSERT INTO `sys_order_seat` VALUES ('11', '4', '4', '7');
INSERT INTO `sys_order_seat` VALUES ('12', '5', '4', '12');
INSERT INTO `sys_order_seat` VALUES ('13', '6', '4', '12');
INSERT INTO `sys_order_seat` VALUES ('14', '7', '4', '12');
INSERT INTO `sys_order_seat` VALUES ('15', '8', '4', '12');
INSERT INTO `sys_order_seat` VALUES ('16', '8', '5', '12');
INSERT INTO `sys_order_seat` VALUES ('17', '9', '4', '12');
INSERT INTO `sys_order_seat` VALUES ('18', '9', '5', '12');

-- ----------------------------
-- Table structure for `sys_showfilm`
-- ----------------------------
DROP TABLE IF EXISTS `sys_showfilm`;
CREATE TABLE `sys_showfilm` (
  `id` int(11) NOT NULL,
  `showFilmName` varchar(255) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `hall_id` int(11) DEFAULT NULL,
  `seatCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `FK_2vo4l1o46ijq1vj96gtc3n4n9` (`hall_id`),
  CONSTRAINT `FK_2vo4l1o46ijq1vj96gtc3n4n9` FOREIGN KEY (`hall_id`) REFERENCES `sys_hall` (`id`),
  CONSTRAINT `movie_id` FOREIGN KEY (`movie_id`) REFERENCES `sys_movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_showfilm
-- ----------------------------
INSERT INTO `sys_showfilm` VALUES ('1', '速8开场001', '2017-04-29 19:49:00', '2017-04-29 22:05:00', '80', '', null, '1', '1', '1', null);
INSERT INTO `sys_showfilm` VALUES ('2', '速8开场002', '2017-04-24 19:55:00', '2017-04-24 22:11:00', '80', '', null, '1', '1', '1', null);
INSERT INTO `sys_showfilm` VALUES ('3', '速8开场003', '2017-04-24 19:55:00', '2017-04-24 22:11:00', '70', '', '2017-04-23 19:56:11', '1', '1', '2', '64');
INSERT INTO `sys_showfilm` VALUES ('4', '速8开场003', '2017-04-24 19:56:00', '2017-04-24 21:59:00', '35', '', '2017-04-23 19:56:27', '1', '2', '1', '80');
INSERT INTO `sys_showfilm` VALUES ('5', '蓝精灵004', '2017-04-25 19:56:00', '2017-04-25 21:59:00', '35', '', '2017-04-23 19:57:02', '1', '2', '1', '82');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(10) NOT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `realName` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `roleid` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `registTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `flag` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '系统管理员', 'admin', '1', null, null, null, null);
