-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2019-09-23 13:13:13
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hldy`
--

-- --------------------------------------------------------

--
-- 表的结构 `hldy_index_carousel`
--

CREATE TABLE `hldy_index_carousel` (
  `carid` int(11) NOT NULL,
  `img` varchar(128) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `href` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `hldy_index_carousel`
--

INSERT INTO `hldy_index_carousel` (`carid`, `img`, `title`, `href`) VALUES
(1, 'img/index/carousel/1.jpg', '轮播广告商品1', NULL),
(2, 'img/index/carousel/2.jpg', '轮播广告商品2', NULL),
(3, 'img/index/carousel/3.jpg', '轮播广告商品3', NULL),
(4, 'img/index/carousel/4.jpg', '轮播广告商品4', NULL),
(5, 'img/index/carousel/5.jpg', '轮播广告商品5', NULL),
(6, 'img/index/carousel/6.jpg', '轮播广告商品6', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `hldy_index_cinema`
--

CREATE TABLE `hldy_index_cinema` (
  `cid` int(11) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `location` varchar(128) DEFAULT NULL,
  `profile` varchar(128) DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `hldy_index_cinema`
--

INSERT INTO `hldy_index_cinema` (`cid`, `title`, `location`, `profile`, `distance`) VALUES
(1, '广州万达影城花都融创茂店', '广东省广州市花都区凤凰北路63号融创茂购物中心3楼万达影城', NULL, '<500m'),
(2, '广州万达影城天河万科广场店', '广州市天河区华观路天河万科广场4层', NULL, '<1km'),
(3, '广州新塘万达广场店', '广东省广州市增城区新塘镇新福路9号新塘万达广场4F万达影城', NULL, '<2km'),
(4, '广州亚运城广场店', '广州市番禺区石楼镇康体路43号亚运城广场3楼（海傍地铁站A出口）', NULL, '<3km'),
(5, '广州万达影城永和里享家店', '广州市黄埔区新业路25号自编S1栋万科里享家二楼', NULL, '<4km'),
(6, '广州万达影城万胜围店', '广东省广州市海珠区新港东路1236号万胜广场五楼', NULL, '<5km'),
(7, '广州万达影城海珠佳永广场店', '广州海珠区江南大道南689-709号盈熙广场二楼万达影城', NULL, '<10km'),
(8, '广州白云万达广场店', '广东省广州市白云区云城东路万达广场娱乐楼3楼万达影城', NULL, '<20km'),
(9, '广州增城万达广场店', '广东省广州市增城荔城街增城大道69号万达广场1幢娱乐楼4A-5A', NULL, '<30km'),
(10, '广州番禺万达广场店', '广东省广州市番禺区南村镇汉溪大道东389号万达广场四层万达影城', NULL, '<60km'),
(11, '广州萝岗万达广场店', '广东省广州市黄埔区科丰路89号萝岗万达广场娱乐楼四层万达影城', NULL, '<100km'),
(12, '广州南沙万达广场店', '广州市南沙区双山大道3号万达广场娱乐楼4楼', NULL, '>100km');

-- --------------------------------------------------------

--
-- 表的结构 `hldy_index_details`
--

CREATE TABLE `hldy_index_details` (
  `did` int(11) NOT NULL,
  `family_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `score` decimal(2,1) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `time` varchar(128) DEFAULT NULL,
  `subtitle` varchar(128) DEFAULT NULL,
  `brief` varchar(128) DEFAULT NULL,
  `profile` varchar(128) DEFAULT NULL,
  `castImg_url` varchar(255) DEFAULT NULL,
  `stillImg_url` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `img` varchar(128) NOT NULL,
  `like` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `hldy_index_details`
--

INSERT INTO `hldy_index_details` (`did`, `family_id`, `title`, `score`, `type`, `time`, `subtitle`, `brief`, `profile`, `castImg_url`, `stillImg_url`, `video_url`, `img`, `like`) VALUES
(1, 2, '罗小黑战记', '9.8', '动画/奇幻', '09月07日', NULL, '妖精一直和人类共同生活在这片土地上，而人类并不知道妖精的存在。小黑就是一只小猫妖，这是关于他的故事。', '[{name:''木头''},{name:''山新'',act:''罗小黑''},{name:''皇贞季'',act:''谛听''},{name:''郝祥海'',act:''风息''},{name:''刘明月''}]', '[{img/details/1.jpg},{img/details/2.jpg},{img/details/3.jpg},{img/details/4.jpg}]', '[{img/details/j01.jpg},{img/details/j02.jpg},{img/details/j03.jpg},{img/details/j04.jpg},{img/details/j05.jpg},{img/details/j06.jpg},{img/details/j07.jpg},{img/details/j08.jpg},{img/details/j09.jpg},{img/details/j10.jpg},{img/details/j11.jpg},{img/details', 'imgdetails/video.mp4', 'img/index/product/2.jpg', 18624),
(2, 1, '速度与激情：特别行动', '8.8', '动作/冒险', '08月23日', '“速激”系列外传电影', '一个是美国外交安全局的忠诚特工、身材魁梧的执法者霍布斯（道恩·强森饰），一个是前英国军事特工精英、无法无天的恶棍肖（杰森·斯坦森饰）。在2015年的《速度与激情7》中首次对峙之后，两人不论言语还是肢体都冲突不断，一直试图打倒对方。　　然而，通过高科技进行了', '[{name:''大卫·雷奇''},{name:''道恩·强森'',act:''霍布斯''},{name:''杰森·斯坦森'',act:''肖''},{name:''凡妮莎·柯比'',act:''海蒂''},{name:''伊德瑞斯·艾尔巴'',act:''布里克斯顿''},{name:''瑞', '[{img/details/5.jpg},{img/details/6.jpg},{img/details/7.jpg},{img/details/8.jpg},{img/details/9.jpg},{img/details/10.jpg},{img/details/11.jpg},{img/details/12.jpg},{img/details/13.jpg},{img/details/14.jpg}]', '[{img/details/j01.jpg},{img/details/j02.jpg},{img/details/j03.jpg},{img/details/j04.jpg},{img/details/j05.jpg},{img/details/j06.jpg},{img/details/j07.jpg},{img/details/j08.jpg},{img/details/j09.jpg},{img/details/j10.jpg},{img/details/j11.jpg},{img/details', 'imgdetails/video.mp4', 'img/index/product/6.jpg', 230544),
(3, 3, '哪吒之魔童降世', '9.7', '剧情/动画', '07月26日', 'IMAX首部国产动画大片', '天地灵气孕育出一颗能量巨大的混元珠，元始天尊将混元珠提炼成灵珠和魔丸，灵珠投胎为人，助周伐纣时可堪大用；而魔丸则会诞出魔王，为祸人间。元始天尊启动了天劫咒语，3年后天雷将会降临，摧毁魔丸。太乙受命将灵珠托生于陈塘关李靖家的儿子哪吒身上。然而阴差阳错，灵珠和', '[{name:''饺子''},{name:''吕艳婷'',act:''儿童哪吒''},{name:''囧森瑟夫'',act:''少年哪吒''},{name:''瀚墨'',act:''敖丙''},{name:''陈浩'',act:''李靖''},{name:''绿绮'',act:''殷夫人''},{n', '[{img/details/15.jpg},{img/details/16.jpg},{img/details/17.jpg},{img/details/18.jpg},{img/details/19.jpg},{img/details/20.jpg},{img/details/21.jpg},{img/details/22.jpg}]', '[{img/details/j01.jpg},{img/details/j02.jpg},{img/details/j03.jpg},{img/details/j04.jpg},{img/details/j05.jpg},{img/details/j06.jpg},{img/details/j07.jpg},{img/details/j08.jpg},{img/details/j09.jpg},{img/details/j10.jpg},{img/details/j11.jpg},{img/details', 'imgdetails/video.mp4', 'img/index/product/3.jpg', 168913),
(4, 4, '诛仙', NULL, '剧情/古装', '09月13日', '《诛仙》改编 张小凡传奇人生', '电影根据萧鼎小说《诛仙》改编。草庙村被屠，少年张小凡双亲离世，被青云门大竹峰收留。机缘巧合之下，他习得佛门天音功法，又意外获得魔教法器烧火棍，踏上强者之路的同时，也让他陷入了巨大的危机。至魔法器的现世，与陆雪琪、碧瑶、田灵儿三个女生间命运的交错，都让他原本', '[{name:''程小东''},{name:''肖战'',act:''张小凡''},{name:''李沁'',act:''陆雪琪''},{name:''孟美岐'',act:'' 碧瑶''},{name:''唐艺昕'',act:''田灵儿''}]', '[{img/details/23.jpg},{img/details/24.jpg},{img/details/25.jpg},{img/details/26.jpg},{img/details/27.jpg}]', '[{img/details/j01.jpg},{img/details/j02.jpg},{img/details/j03.jpg},{img/details/j04.jpg},{img/details/j05.jpg},{img/details/j06.jpg},{img/details/j07.jpg},{img/details/j08.jpg},{img/details/j09.jpg},{img/details/j10.jpg},{img/details/j11.jpg},{img/details', 'imgdetails/video.mp4', 'img/index/product/7.jpg', 81319),
(5, 5, '徒手攀岩', NULL, '纪录片/冒险', '09月06日', '奥斯卡最佳纪录片', '亚历克斯生命中最美好的一天，是在攀岩中度过的。没有绳索、安全带及其它防护设备，只凭四肢，一口气爬上高3000英尺(900余米)的“攀岩宇宙中心”伊尔酋长岩之巅。', '[{name:''伊丽莎白·柴''},{name:''亚历克斯·霍诺德'',act:''Himself''},{name:''金国威'',act:''Himself''}]', '[{img/details/28.jpg},{img/details/29.jpg},{img/details/30.jpg}]', '[{img/details/j01.jpg},{img/details/j02.jpg},{img/details/j03.jpg},{img/details/j04.jpg},{img/details/j05.jpg},{img/details/j06.jpg},{img/details/j07.jpg},{img/details/j08.jpg},{img/details/j09.jpg},{img/details/j10.jpg},{img/details/j11.jpg},{img/details', 'imgdetails/video.mp4', 'img/index/product/14.jpg', 10401),
(6, 6, '检察方的罪人', NULL, '剧情/悬疑', '09月06日', NULL, '东京地方检察厅刑事部调来年轻的检察官冲野启一郎（二宫和也），与他所敬重的精英检察官前辈最上毅（木村拓哉）一起工作。最上毅对已过追诉时效的犯人松仓重生穷追不舍，冲野则开始对最上检察官的搜查方针产生质疑，两人由此展开了赌上正义的“一战”。', '[{name:''原田真人''},{name:''木村拓哉'',act:''Mogam''},{name:''二宫和也'',act:''Okino''},{name:''山崎努''},{name:''芦名星''}]', '[{img/details/31.jpg},{img/details/32.jpg},{img/details/33.jpg},{img/details/34.jpg},{img/details/35.jpg}]', '[{img/details/j01.jpg},{img/details/j02.jpg},{img/details/j03.jpg},{img/details/j04.jpg},{img/details/j05.jpg},{img/details/j06.jpg},{img/details/j07.jpg},{img/details/j08.jpg},{img/details/j09.jpg},{img/details/j10.jpg},{img/details/j11.jpg},{img/details', 'imgdetails/video.mp4', 'img/index/product/17.jpg', 8918),
(7, 8, '名侦探柯南：绀青之拳', NULL, '爱情/动作/动画', '09月13日', '柯南第23部剧场版，真相只有一个！', '故事将来到新加坡，讲述寻找19世纪末随着沉船沉入海底的蓝宝石“绀青之拳”的故事。故事中，柯南和怪盗基德被卷入滨海湾金沙酒店的杀人事件中，一场来自新加坡的巨大阴谋将他们裹挟……', '[{name:''永冈智佳''},{name:''高山南'',act:''江户川柯南''},{name:''山口胜平'',act:''工藤新一 / 怪盗基德''},{name:''山崎和佳奈'',act:''毛利兰''},{name:''小山力也'',act:''毛利小五郎''},{name', '[{img/details/42.jpg},{img/details/43.jpg},{img/details/44.jpg},{img/details/45.jpg},{img/details/46.jpg},{img/details/47.jpg},{img/details/48.jpg},{img/details/50.jpg},{img/details/51.jpg},{img/details/52.jpg}]', '[{img/details/j01.jpg},{img/details/j02.jpg},{img/details/j03.jpg},{img/details/j04.jpg},{img/details/j05.jpg},{img/details/j06.jpg},{img/details/j07.jpg},{img/details/j08.jpg},{img/details/j09.jpg},{img/details/j10.jpg},{img/details/j11.jpg},{img/details', 'imgdetails/video.mp4', 'img/index/product/16.jpg', 30659),
(8, 7, '逗爱熊仁镇', NULL, '喜剧/爱情', '09月06日', NULL, '同在一间银行ATM部门中工作的何必（朱亚文饰）与蒙小鲜（张榕容饰），由于公司禁止办公室恋情，正秘密的谈着地下恋爱。与此同时300公里以外的熊仁镇一个ATM机出现故障，取一倍的钱吐两倍的现金，造成银行财产损失。于是蒙小鲜和何必约定，谁先找到被多取得钱谁就可以', '[{name:''查慕春''},{name:''朱亚文'',act:''Mogam''},{name:''张榕容'',act:''蒙小鲜''},{name:''王亮'',act:''胡灿烂''},{name:''晓凡'',act:''熊梦云''},{name:''韩彦博'',act:''老窝囊''}', '[{img/details/36.jpg},{img/details/37.jpg},{img/details/38.jpg},{img/details/39.jpg},{img/details/40.jpg},{img/details/41.jpg}]', '[{img/details/j01.jpg},{img/details/j02.jpg},{img/details/j03.jpg},{img/details/j04.jpg},{img/details/j05.jpg},{img/details/j06.jpg},{img/details/j07.jpg},{img/details/j08.jpg},{img/details/j09.jpg},{img/details/j10.jpg},{img/details/j11.jpg},{img/details', 'imgdetails/video.mp4', 'img/index/product/9.jpg', 11672),
(9, 9, '宝莱坞机器人2.0：重生归来', NULL, '动作/惊悚/科幻', '09月06日', '印度年度本土票房冠军', '印度某市，所有人的手机突然被来自天空的神秘力量席卷吸走，手机销售大亨、电信运营老板、国家电信部高官等与手机相关的许多人相继离奇死去；城市上空，巨型变异鸟怪（阿克谢·库玛尔　饰）突然出现，大开杀戒，向所有手机用户宣战，民众陷入恐慌……　　危机时刻，科学家瓦西', '[{name:''S·尚卡尔''},{name:''拉吉尼坎塔'',act:''瓦西（科学家）''},{name:''艾米·杰克逊'',act:''妮娜（女机器人）''},{name:''阿克谢·库玛尔'',act:''帕克什·拉詹（教授）''},{name:''阿迪尔·胡山''}]', '[{img/details/53.jpg},{img/details/54.jpg},{img/details/55.jpg},{img/details/56.jpg},{img/details/57.jpg}]', '[{img/details/j01.jpg},{img/details/j02.jpg},{img/details/j03.jpg},{img/details/j04.jpg},{img/details/j05.jpg},{img/details/j06.jpg},{img/details/j07.jpg},{img/details/j08.jpg},{img/details/j09.jpg},{img/details/j10.jpg},{img/details/j11.jpg},{img/details', 'imgdetails/video.mp4', 'img/index/product/12.jpg', 21310),
(10, 10, '愤怒的小鸟2', '8.9', '喜剧/动画/冒险', '08月16日', '同名游戏大电影续集', '小鸟胖红（杰森·苏戴奇斯配音）和绿猪莱纳德（比尔·哈德尔）两位宿敌，不得不联手，带领个字小岛的居民，共同对抗第三座小岛紫鹰的入侵。', NULL, NULL, NULL, NULL, 'img/index/product/13.jpg', 97335);

-- --------------------------------------------------------

--
-- 表的结构 `hldy_index_product`
--

CREATE TABLE `hldy_index_product` (
  `pid` int(11) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `score` decimal(2,1) DEFAULT NULL,
  `like` int(11) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `time` varchar(128) DEFAULT NULL,
  `profile` varchar(128) DEFAULT NULL,
  `mode` varchar(128) DEFAULT NULL,
  `img_url` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `hldy_index_product`
--

INSERT INTO `hldy_index_product` (`pid`, `title`, `score`, `like`, `type`, `time`, `profile`, `mode`, `img_url`) VALUES
(1, '速度与激情：特别行动', '8.8', 103524, '“速激”系列外传电影', '2019年08月23日中国上映', ' 大卫·雷奇、道恩·强森、杰森·斯坦森、凡妮莎·柯比', NULL, 'img/index/product/6.jpg'),
(2, '罗小黑战记', '9.8', 7255, '动画/奇幻', '2019年09月07日上映', '木头/山新/皇贞季', NULL, 'img/index/product/2.jpg'),
(3, '哪吒之魔童降世', '9.7', 201683, 'IMAX首部国产动画大片', '2019年07月26日中国上映', '饺子/吕艳萍/囧森瑟夫', NULL, 'img/index/product/3.jpg'),
(4, '诛仙', '8.0', 14076, '《诛仙》改编 张小凡传奇人生', '2019年09月13日中国上映', '程小东/肖战/李沁', NULL, 'img/index/product/7.jpg'),
(5, '徒手攀岩', NULL, 4024, '奥斯卡最佳纪录片', '2019年09月06日中国上映', '伊丽莎白·柴·瓦萨赫伊/金国威/亚历克斯·霍诺德/金国威\n', NULL, 'img/index/product/14.jpg'),
(6, '检察方的罪人', NULL, 6658, '剧情/悬疑', NULL, '原田真人/木村拓哉/二宫和也', NULL, 'img/index/product/17.jpg'),
(7, '逗爱熊仁镇', NULL, 6658, '喜剧/爱情', NULL, '查慕春/朱亚文/张榕容', NULL, 'img/index/product/9.jpg'),
(8, '名侦探柯南：绀青之拳', '8.3', 27491, '柯南第23部剧场版，真相只有一个', '9月12日上映', '永冈智佳/高山南/山口胜平', NULL, 'img/index/product/16.jpg'),
(9, '宝莱坞机器人2.0：重生归来', NULL, 11315, '印度年度本土票房冠军', NULL, 'S·尚卡尔/拉吉尼坎塔/艾米·杰克逊\n', NULL, 'img/index/product/12.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hldy_index_carousel`
--
ALTER TABLE `hldy_index_carousel`
  ADD PRIMARY KEY (`carid`);

--
-- Indexes for table `hldy_index_cinema`
--
ALTER TABLE `hldy_index_cinema`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `hldy_index_details`
--
ALTER TABLE `hldy_index_details`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `hldy_index_product`
--
ALTER TABLE `hldy_index_product`
  ADD PRIMARY KEY (`pid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `hldy_index_carousel`
--
ALTER TABLE `hldy_index_carousel`
  MODIFY `carid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `hldy_index_cinema`
--
ALTER TABLE `hldy_index_cinema`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `hldy_index_details`
--
ALTER TABLE `hldy_index_details`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `hldy_index_product`
--
ALTER TABLE `hldy_index_product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
