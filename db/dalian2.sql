-- MySQL dump 10.16  Distrib 10.1.19-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `index`
--

DROP TABLE IF EXISTS `index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index` (
  `a` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index`
--

LOCK TABLES `index` WRITE;
/*!40000 ALTER TABLE `index` DISABLE KEYS */;
INSERT INTO `index` VALUES ('这里是沈阳市');
/*!40000 ALTER TABLE `index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_13947965133`
--

DROP TABLE IF EXISTS `list_13947965133`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_13947965133` (
  `cid` varchar(11) NOT NULL COMMENT '商品id',
  `lei` varchar(64) NOT NULL COMMENT '商品类型',
  `one` text NOT NULL COMMENT '商品详情',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_13947965133`
--

LOCK TABLES `list_13947965133` WRITE;
/*!40000 ALTER TABLE `list_13947965133` DISABLE KEYS */;
INSERT INTO `list_13947965133` VALUES ('1','凉菜','凉菜001|25|80|45|35691.png  凉菜003|25|80|45|35691.png'),('3','热菜','热菜001|25|80|45|35691.png  热菜003|25|80|45|35691.png  热菜005|25|80|45|35691.png'),('4','饮品','可口可乐|25|80|45|35691.png  双氧水|25|80|45|35691.png  敌敌畏|25|80|45|35691.png  砒霜水|25|80|45|35691.png  硫酸|25|80|45|35691.png');
/*!40000 ALTER TABLE `list_13947965133` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_13947965134`
--

DROP TABLE IF EXISTS `list_13947965134`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_13947965134` (
  `cid` varchar(11) NOT NULL COMMENT '商品id',
  `lei` varchar(64) NOT NULL COMMENT '商品类型',
  `one` text NOT NULL COMMENT '商品详情',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_13947965134`
--

LOCK TABLES `list_13947965134` WRITE;
/*!40000 ALTER TABLE `list_13947965134` DISABLE KEYS */;
/*!40000 ALTER TABLE `list_13947965134` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_13947965135`
--

DROP TABLE IF EXISTS `list_13947965135`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_13947965135` (
  `cid` varchar(11) NOT NULL COMMENT '商品id',
  `lei` varchar(64) NOT NULL COMMENT '商品类型',
  `one` text NOT NULL COMMENT '商品详情',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_13947965135`
--

LOCK TABLES `list_13947965135` WRITE;
/*!40000 ALTER TABLE `list_13947965135` DISABLE KEYS */;
/*!40000 ALTER TABLE `list_13947965135` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shangjia`
--

DROP TABLE IF EXISTS `shangjia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shangjia` (
  `sid` varchar(11) NOT NULL,
  `spd` varchar(64) NOT NULL COMMENT '商户密码',
  `sname` varchar(64) NOT NULL,
  `s-ico` varchar(254) NOT NULL COMMENT '商户头像',
  `s3` text NOT NULL COMMENT '店铺简介',
  `s4` varchar(8) NOT NULL COMMENT '星级',
  `s5` int(11) NOT NULL COMMENT '销量',
  `s6` int(11) NOT NULL COMMENT '起送价',
  `s7` int(11) NOT NULL COMMENT '配送费',
  `s11` tinyint(1) NOT NULL COMMENT '是否营业',
  `s12` int(11) NOT NULL COMMENT '商户类型',
  `s13` text NOT NULL COMMENT '用户对商家的评价',
  `s14` text NOT NULL COMMENT '菜单信息',
  `s15` text NOT NULL COMMENT '营业时间',
  `s16` text NOT NULL COMMENT '地址',
  `s17` varchar(14) NOT NULL COMMENT '联系电话',
  `s18` text NOT NULL COMMENT '举报与投诉',
  `s19` varchar(8) NOT NULL COMMENT '商家类型',
  `s20` text NOT NULL COMMENT '广播信息',
  `s21` varchar(254) NOT NULL COMMENT '活动1',
  `s22` varchar(254) NOT NULL COMMENT '活动2',
  `s23` varchar(254) NOT NULL COMMENT '活动3',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shangjia`
--

LOCK TABLES `shangjia` WRITE;
/*!40000 ALTER TABLE `shangjia` DISABLE KEYS */;
INSERT INTO `shangjia` VALUES ('13947965133','123456','一手店（五里河店）','2.jpg','一手店的简介','★★★★',84,15,4,1,1101,'一手店的评价','暂时不使用','营业时间','地址','+8612345678910','举报信息','暂不使用','广播信息','','',''),('13947965134','123','奇品达烤肉饭((东软电脑城店)','4.jpg','齐品达的简介','★★★★★',2849,10,0,1,4699,'齐品达很不错','','营业时间','','01011101','','118','免费吃','','',''),('13947965135','46','好利来(三好街)','3.jpg','好吃的好利来，专注多年面包','★★☆',17,30,4,0,3266,'好利来确实挺好的','好利来的菜单信息还在建设中','营业时间：\r\n09:00-17:00','沈阳市三好街79号','024-238494669','暂时无投诉信息','365','今天下雪，配送速度慢','','','');
/*!40000 ALTER TABLE `shangjia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` varchar(11) NOT NULL COMMENT '用户账号',
  `upd` varchar(64) NOT NULL COMMENT '用户密码',
  `u1` varchar(64) NOT NULL COMMENT '昵称',
  `u2` text NOT NULL COMMENT '订单',
  `u3` int(11) NOT NULL COMMENT '账户余额',
  `u4` text NOT NULL COMMENT '收货地址',
  `u5` text NOT NULL COMMENT '收支明细',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('','','','',0,'',''),('121','121','','',0,'',''),('122','122','','',0,'',''),('123','123','','',0,'',''),('123456','123456','沉默','',0,'',''),('12348','12348','','',0,'',''),('124','124','','',0,'',''),('125','125','','',0,'',''),('126','126','','',0,'',''),('127','127','','',0,'',''),('132','132','','',0,'',''),('133','133','','',0,'',''),('134','134','','',0,'',''),('135','135','','',0,'',''),('137','137','','',0,'',''),('139','139','','',0,'',''),('13947965133','13947965133','','郭晗',0,'',''),('13947965555','13947965555','','',0,'',''),('145','145','','',0,'',''),('146','146','','',0,'',''),('149','149','','',0,'',''),('1577133','1577133','','',0,'',''),('15771332671','15771332671','沉默','麦乐滋(手工水饺)|0|白菜肉水饺(两)*2|餐具  肯德基(西单店)|★★★★|可乐(大杯)',32,'特朗普|男|12345678901|美国华盛顿白宫  普京|男|12345678901|俄罗斯莫斯科克里姆林宫','收益|3.50|2016-12-14|889  支出|-7.8|2016-8-24|776'),('165','165','','',0,'',''),('167','167','','',0,'',''),('169','169','','',0,'',''),('17004957578','QW1234er','','',0,'',''),('172','172','','',0,'',''),('178','178','','',0,'',''),('182','182','','',0,'',''),('183','183','','',0,'',''),('184','184','','',0,'',''),('186','186','','',0,'',''),('189','189','','',0,'',''),('199','199','','',0,'',''),('2','2','','',0,'',''),('23','23','','',0,'',''),('3','3','','',0,'',''),('458','458','','',0,'',''),('56','56','','',0,'',''),('693','693','','',0,'',''),('789','789','','',0,'','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-30 15:22:14
