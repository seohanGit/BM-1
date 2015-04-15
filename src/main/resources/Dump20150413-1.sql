-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: webdb
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `listnum` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`listnum`),
  KEY `ID_idx` (`id`),
  CONSTRAINT `ID` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
INSERT INTO `blacklist` VALUES (1,'2014-12-10','2014-12-24','k3'),(2,'2014-12-20','2015-01-03','k4'),(3,'2014-12-15','2015-12-29','k5');
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `bookCode` varchar(40) NOT NULL,
  `bookname` varchar(50) NOT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `publisher` varchar(45) DEFAULT NULL,
  `borrowcheck` varchar(4) DEFAULT '0',
  `grade` int(11) DEFAULT NULL,
  `writer` varchar(45) DEFAULT NULL,
  `imageurl` varchar(150) DEFAULT NULL,
  `isbn` char(14) DEFAULT NULL,
  `priceSales` int(10) DEFAULT NULL,
  `summary` varchar(1000) DEFAULT NULL,
  `reservecheck` varchar(4) DEFAULT '0',
  PRIMARY KEY (`bookCode`),
  KEY `reservecheck_idx` (`reservecheck`),
  KEY `borrow_FK_idx` (`borrowcheck`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('BS002','그 후에','소설','밝은세상','1',9,'기욤 뮈','http://image.yes24.com/goods/3853238/95x0',NULL,NULL,NULL,NULL),('BS021','한글 만다라 1~4권 세트','국내도서','루덴스','0',0,'루덴스.마시멜로','http://bimage.interpark.com/goods_image/7/9/3/6/219207936h.jpg',NULL,NULL,NULL,''),('BS032','한글 만다라 2 - 자음학습 2','국내도서','루덴스','1',0,'루덴스.마시멜로','http://bimage.interpark.com/goods_image/0/2/9/7/218450297h.jpg',NULL,NULL,NULL,'1'),('CS001',' SAS 데이터분석','data','21세기사','4',0,'김충련','http://image.yes24.com/goods/5947649/95x0',NULL,NULL,NULL,'0'),('CS002',' R까기','데이터베이스','느린생각','0',6,'서진수','http://image.yes24.com/goods/13434081/95x0',NULL,NULL,NULL,'0'),('CS005','Java의 정석','JAVA','도우출판','0',12,'남궁성','http://image.yes24.com/goods/3688909/95x0',NULL,NULL,NULL,'1'),('CS006','JSP 2.2 웹 프로그래밍','JSP','가메출판사','1',0,'최범균','http://image.yes24.com/goods/8348263/95x0',NULL,NULL,NULL,'0'),('CS007',' JSPStudy의JSP 웹프로그래밍','JSP','앤써북','2',0,'정동진,김준형,정영석','http://image.yes24.com/goods/12049776/95x0',NULL,NULL,NULL,'0'),('CS008','뇌를 자극하는 JSP & Servlet ','JSP','한빛미디어','0',0,'김윤명','http://image.yes24.com/goods/4468035/95x0',NULL,NULL,NULL,'0'),('CS009','유럽의 붓다, 니체','국내도서','열린책들','0',0,'야니스 콩스탕티니데스,다미앙 막도날드','http://bimage.interpark.com/goods_image/7/8/0/4/210437804h.jpg',NULL,NULL,NULL,'0'),('CS010','한글로의 여행','국내도서','뜨인돌','1',0,'이바라기 노리코','http://bimage.interpark.com/goods_image/3/8/1/1/206623811h.jpg',NULL,NULL,NULL,'0');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrow` (
  `bookCode` varchar(40) NOT NULL,
  `borrowdate` date DEFAULT NULL,
  `returndate` date DEFAULT NULL,
  `borrowcheck` varchar(4) DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `borrowCode` varchar(45) DEFAULT NULL,
  KEY `bookCode_idx` (`bookCode`),
  KEY `status_idx` (`borrowcheck`),
  KEY `ID_idx` (`id`),
  CONSTRAINT `ID_borrow` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bookCode_borrow` FOREIGN KEY (`bookCode`) REFERENCES `book` (`bookCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
INSERT INTO `borrow` VALUES ('CS009','2015-04-10','2015-04-28','3','k1234',NULL),('CS007','2015-04-14','2015-05-05','2','k1234',NULL),('CS010','2015-04-15','2015-05-05','1','k1234',NULL);
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletinboard`
--

DROP TABLE IF EXISTS `bulletinboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletinboard` (
  `boardnum` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `registerdate` timestamp NULL DEFAULT NULL,
  `modifidate` timestamp NULL DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`boardnum`),
  KEY `ID_idx` (`id`),
  CONSTRAINT `ID_board` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletinboard`
--

LOCK TABLES `bulletinboard` WRITE;
/*!40000 ALTER TABLE `bulletinboard` DISABLE KEYS */;
INSERT INTO `bulletinboard` VALUES (1,'미생 ','웹툰으로 처음 만났던 미생이었지만 완결까지는 못 기다리고 그냥 지나쳐버린 만화였던 미생이 드라마로 시작하는 걸 보고 호기심에 봤던 드라마였지만 1편을 보고... 내가 왜 이 만화를 마무리하지 못했던 마음에 다시금 만화로 완결까지 다 보게 되었네','2014-11-22 15:00:00','2014-11-22 15:00:00','root'),(2,'우리가 원하는 삶','우리가 원하는 삶은 어떤 삶인가? 돈이 많은? 명성이 높은? 건강한? 행복한? 이 모든 것을 가지고 있다면 당신은 정말 행운아이다.','2014-11-22 15:00:00','2014-11-23 15:00:00','root'),(3,'데이터배이스 배움','터대학에서 데이터베이스 과목을 가르친 지 20여 년의 세월 동안 외국의 유명한 원서들 또는 이들의 번역서를 교재로 선택하여 강의를 해왔다. 또한 저명한 원서 2판과 3판을 여러 교수들과 공동으로 직접 번역을 해보기도 하였다. 그런데 이런 교재들은 대개 700페이지 이상의 분량이어서 한 학기 동안 가르치는 것이 불가능했다. ','2014-12-07 15:00:00','2014-12-07 15:00:00','root'),(4,'7년 후에','후독자들이 좋아하는 작가의 신작에서 기대하는 사항은 크게 두 가지로 압축할 수 있을 것이다. 그 첫 번째는 해당 작가의 작품에서만 볼 수 있는 매력, 두 번째는 한곳에 고정되지 않고 늘 변화를 모색하는 노력을 보고자 할 것이다. ','2014-12-03 15:00:00','2014-12-03 15:00:00','root'),(5,'종이여자','로스앤젤레스의 빈민가 맥아더파크에서 나고 자란 톰 보이드는 어린 시절 겪은 강렬하고 순탄치 않았던 경험을 살려 집필한 소설 《천사 3부작》으로 일약 베스트셀러 작가가 된다. 그에게는 어린 시절부터 돈독한 우정을 나눈 친구들이 있다. 현재 LA경찰로 근무하는 여경 캐롤, 톰의 매니저로 일하는 밀로가 바로 그들이다. 맥아더파크에서의 어린 시절 경험을 공유하고 있는 그들은 서로 떼어놓고 생각할 수 없을 만큼 사이가 각별한 존재들이다. 죽음의 위험이 상존하는 마을에서 또래의 친구들은 대개 갱단에 가입하거나 마약딜러가 되어 하루살이 같은 목숨을 이어간다. 톰과 두 친구는 더 이상 비극적인 생을 이어갈 수 없다는 결연한 각오로 마을을 떠나올 수 있었다. 갱단의 일원이었던 밀로에게는 목숨을 건 탈주였다. 이제 어느 정도의 성공과 안정된 삶을 찾았지만 어린 시절의 암울하고 끔찍한 기억은 그들에게 오랜 세월 동안 지울 수 없는 상처로 남는다. ','2014-12-02 15:00:00','2014-12-02 15:00:00','root'),(6,'구해줘','아내를 잃은 후 좌절감에 휩싸여 살아가는 젊은 의사 샘 갤러웨이와 여배우의 꿈을 안고 뉴욕에 온 줄리에트 보몽. 브로드웨이 무대에 서겠다는 일념으로 뉴욕에 오지만 생활비를 벌기에도 벅찬 생활에 염증을 느낀 줄리에트 보몽은 프랑스로 돌아갈 결심을 굳힌다. 무대보다는 카페 웨이트리스가 직업이 되다시피 한 줄리에트에게 뉴욕은 패배와 무력감을 일깨워준 냉혹한 도시일 뿐이었다.','2014-11-29 15:00:00','2014-11-29 15:00:00','root'),(17,'열혈 C 프로그래밍','자료구조 학습의 올바른 방법과 목표를 말하고자 합니다! 자료구조는 어렵다고 알려져 있습니다.하지만 문제는 어렵다는데 있는 것이 아닙니다.어려워도 끝까지 공부할 수 있다면 문제가 되지 않습니다.문제는 끝까지 공부하지 못하는데 있습니다.설명이 이치에 맞고 학습의 방법이 올바르다면,내용이 어려워도 끝까지 공부할 수 있습니다.그래서 저자는 말합니다.자료구조를 잘 아는 사람에게 배워야 할 것은 자료구조의 학습방법이다!그리고 저자는 본서를 통해서 자료구조를 어떠한 방법으로 어떠한 수준까지 공부해야 하는지를 선배의 입장에서 이야기합니다.','2014-12-03 05:42:46','2014-12-03 05:42:46','root'),(22,'자바','자바자바','2014-12-08 10:01:17','2014-12-08 10:01:17','k1'),(23,'좋습니다','좋ㅅ브니다','2015-03-25 07:47:35','2015-03-25 07:47:35','k1'),(24,'괴테가 읽어주는 인생','중산층의 조건이 교양과 자신만의 주관이 있어야 한다는 조건이 있다. 괴테는 그 교양있는 사람들이 따를만큼 삶에 있어서 통찰력이 있고, 시대를 이끌어갔다. 지금 자본주의시대에도 철학과 문학, 통찰력이 있는 사람들이 시대를 주도하고 사람들을 따르게 만든다. 이 책은 삶을 주도적으로 살아가도록 한다.','2015-03-31 00:33:31','2015-03-31 00:33:31','k1'),(25,'하이','하이','2015-04-02 06:27:48','2015-04-02 06:27:48','k1234'),(26,'안녕하십니까','반갑습니다','2015-04-03 01:48:28','2015-04-03 01:48:28','seohan1');
/*!40000 ALTER TABLE `bulletinboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` varchar(45) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `cell` varchar(45) NOT NULL,
  `home` varchar(45) DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  `permission` varchar(10) NOT NULL DEFAULT '0',
  `numborrow` int(11) DEFAULT NULL,
  `numarrear` int(11) DEFAULT NULL,
  `team` varchar(45) DEFAULT NULL,
  `class` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('k1','1234','민상훈','hihi@naver.com','인천시 서구','01067766160','0325646160',0,'1',5,0,NULL,NULL),('k1234','1234','123','tnvjakffkr@hotmail.com','','01067766160','0325646160',0,'0',NULL,NULL,NULL,NULL),('k2','2','이빨','k2@naver.com','인천시남구','011','032',0,'0',2,0,NULL,NULL),('k3','3','김치','k3@naver.com','인천시부평구','010','032',0,'0',4,7,NULL,NULL),('k4','4','홍길동','k4@naver.com','인천시남구','010','032',0,'0',4,4,NULL,NULL),('k5','5','하하','k5@naver.com','인천시남동구','010','032',0,'0',6,6,NULL,NULL),('kim91','1234','김상현','kkk91@daum.net','원인재역','018','034',3,'0',10,0,NULL,NULL),('kk11','1234','깡냉','k22@daum.net','인천광역시남동구','042','032',0,'0',NULL,NULL,NULL,NULL),('ksh901016','1234','강성현','ksh901016@naver.com','인천시남동구','0105','032',5,'0',55,0,NULL,NULL),('lee','1234','이창신','lcs@naer.com','인천시부평구','010','032',4,'0',20,0,NULL,NULL),('root','1','root','root@root.com','하늘','010','032',NULL,'1',NULL,NULL,NULL,NULL),('seohan1','1234','서한','민상훈','서울','','',0,'0',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `boardnum` int(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) DEFAULT NULL,
  `registerdate` date DEFAULT NULL,
  PRIMARY KEY (`boardnum`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (7,'시간순서 체크','2015-04-15'),(8,'시간순서체크11','2015-04-15'),(9,'ㅎㅇㅎㅇ','2015-03-01'),(10,'ㅇㅇ','2015-02-10'),(11,'ㅋㅋㅋ','2015-01-06'),(12,'ㅎㅎㅎ','2015-05-06');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommended`
--

DROP TABLE IF EXISTS `recommended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommended` (
  `recommnum` int(11) NOT NULL,
  `booknum` varchar(40) DEFAULT NULL,
  `boardnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`recommnum`),
  KEY `booknum_idx` (`booknum`),
  KEY `boardnum_idx` (`boardnum`),
  CONSTRAINT `boardnum` FOREIGN KEY (`boardnum`) REFERENCES `bulletinboard` (`boardnum`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `booknum` FOREIGN KEY (`booknum`) REFERENCES `book` (`bookCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommended`
--

LOCK TABLES `recommended` WRITE;
/*!40000 ALTER TABLE `recommended` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `id` varchar(45) DEFAULT NULL,
  `requestdate` date DEFAULT NULL,
  `bookCode` varchar(45) NOT NULL,
  `bookname` varchar(45) DEFAULT NULL,
  `writer` varchar(45) DEFAULT NULL,
  `publisher` varchar(45) DEFAULT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `link` varchar(300) DEFAULT NULL,
  `imageurl` varchar(300) DEFAULT NULL,
  `isbn` char(14) DEFAULT NULL,
  `priceSales` int(10) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `class` varchar(45) DEFAULT NULL,
  `summary` varchar(1000) DEFAULT NULL,
  `requestCode` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`requestCode`),
  KEY `ID_res_idx` (`id`),
  CONSTRAINT `ID(FK)` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (NULL,'2015-04-10','null9791195326426','역경의 행운','최재석',NULL,'국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=236973706&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/3/7/0/6/236973706h.jpg','9791195326426',20000,2,NULL,NULL,17),(NULL,'2015-04-10','null9788965400219','열혈강의 서블릿/JSP 웹 프로그래밍 with HTML+CSS+XML+자바스크립트','김승현',NULL,'국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=210432385&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/2/3/8/5/210432385h.jpg','9788965400219',32000,2,NULL,NULL,18),(NULL,'2015-04-13','null9788989313694','[위즈덤하우스] 어린이 자기계발시리즈 전30권세트','',NULL,'','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=222569674&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/9/6/7/4/222569674h.jpg','9788989313694',205000,1,NULL,NULL,19),(NULL,'2015-04-13','null9788960861565','어린이를 위한 배려','전지은',NULL,'국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=11399128&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/9/1/2/8/11399128s.jpg','9788960861565',9000,1,NULL,NULL,20),(NULL,'2015-04-13','null9788965744023','정글만리 1','조정래',NULL,'국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=212675918&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/5/9/1/8/212675918h.jpg','9788965744023',13500,1,NULL,NULL,21),('k1','2015-04-13','k19788997162901','핫존 - 에볼라 바이러스 전쟁의 시작','리처드 프레스턴(Richard Preston)','청어람미디어','국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=237152543&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/2/5/4/3/237152543h.jpg','9788997162901',15000,2,NULL,'뉴욕타임스 베스트셀러 32주간 1위 기록전 세계를 공포에 빠트린 에볼라 바이러스에 관한 최고의 논픽션!',22),('k1','2015-04-13','k19788937483943','스티브 잡스','월터 아이작슨(Walter Isaacson)','민음사','국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=209034726&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/4/7/2/6/209034726h.jpg','9788937483943',25000,1,NULL,'스티브잡스가 인정한 유일한 공식 자서전 지난 10월 5일 스티브 잡스의 죽음으로 전세계가 술렁 거렸다. 그의 타계 소식과 함께 관련 서적들이 주목받고 있다. 그 중에서도. 스티브 잡스가 인정한 유일한  공식 전기가 출간 되었다.이 책의 저자 아이작슨은 2009년부터 2년간 잡스와 함께 어린 시절 집을 방문하거나 함께 산책을 하며 그를 40여 차례 인터뷰했고, 그의 친구, 가족, 동료뿐만 아니라 그에게 반감을 가진 인물이나 경쟁자까지 포함하여 100여 명의 인물들을 인터뷰하였다. 잡스를 둘러싼 모든 것이 집적된 이 전기에는 실리콘밸리에서 보낸 잡스의 어린 시절부터 애플의 창업 과정에 이르기까지 그의 전 생애가 담겨 있다.스티브잡스의 공식 전기를 통해 그의 성공을 배우고, 세계 IT 역사에 큰 \'혁신의 아이콘\'...',23);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id` varchar(40) DEFAULT NULL,
  `bookCode` varchar(45) DEFAULT NULL,
  `reserveDate` date DEFAULT NULL,
  `reservecheck` varchar(4) DEFAULT NULL,
  KEY `bookCode_res` (`bookCode`),
  KEY `ID_res` (`id`) COMMENT '	',
  CONSTRAINT `bookCode_res` FOREIGN KEY (`bookCode`) REFERENCES `book` (`bookCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('k1','BS021','2015-04-17','1'),('k1','BS032','2015-04-20','1'),('k1','CS005','2015-04-20','1'),('k1','BS002','2015-04-21','1');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-15 16:10:37
