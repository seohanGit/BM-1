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
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
INSERT INTO `blacklist` VALUES (1,'2014-12-10','2014-12-24','k3'),(2,'2014-12-20','2015-01-03','k4'),(3,'2014-12-15','2015-12-29','k5');
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('BS002','그 후에','소설','밝은세상','0',9,'기욤 뮈','http://image.yes24.com/goods/3853238/95x0',NULL,NULL,NULL,'0',NULL,NULL,1),('BS021','한글 만다라 1~4권 세트','국내도서','루덴스','0',0,'루덴스.마시멜로','http://bimage.interpark.com/goods_image/7/9/3/6/219207936h.jpg',NULL,NULL,NULL,'1',NULL,NULL,2),('BS032','한글 만다라 2 - 자음학습 2','국내도서','루덴스','0',0,'루덴스.마시멜로','http://bimage.interpark.com/goods_image/0/2/9/7/218450297h.jpg',NULL,NULL,NULL,'0',NULL,NULL,3),('CS001',' SAS 데이터분석','data','21세기사','4',0,'김충련','http://image.yes24.com/goods/5947649/95x0',NULL,NULL,NULL,'0',NULL,NULL,4),('CS002',' R까기','데이터베이스','느린생각','0',6,'서진수','http://image.yes24.com/goods/13434081/95x0',NULL,NULL,NULL,'0',NULL,NULL,5),('CS005','Java의 정석','JAVA','도우출판','2',12,'남궁성','http://image.yes24.com/goods/3688909/95x0',NULL,NULL,NULL,'1',NULL,NULL,6),('CS006','JSP 2.2 웹 프로그래밍','JSP','가메출판사','0',0,'최범균','http://image.yes24.com/goods/8348263/95x0',NULL,NULL,NULL,'0',NULL,NULL,7),('CS007',' JSPStudy의JSP 웹프로그래밍','JSP','앤써북','0',0,'정동진,김준형,정영석','http://image.yes24.com/goods/12049776/95x0',NULL,NULL,NULL,'0',NULL,NULL,8),('CS008','뇌를 자극하는 JSP & Servlet ','JSP','한빛미디어','0',0,'김윤명','http://image.yes24.com/goods/4468035/95x0',NULL,NULL,NULL,'0',NULL,NULL,9),('CS009','유럽의 붓다, 니체','국내도서','열린책들','2',0,'야니스 콩스탕티니데스,다미앙 막도날드','http://bimage.interpark.com/goods_image/7/8/0/4/210437804h.jpg',NULL,NULL,NULL,'0',NULL,NULL,10),('CS010','한글로의 여행','국내도서','뜨인돌','2',0,'이바라기 노리코','http://bimage.interpark.com/goods_image/3/8/1/1/206623811h.jpg',NULL,NULL,NULL,'0',NULL,NULL,11),('k12349788952709042','아낌없이 주는 나무','국내도서','시공주니어','2',0,'쉘 실버스타인(Sheldon Alan Shel Silverstein)','http://bimage.interpark.com/goods_image/6/4/6/2/706462h.jpg','9788952709042',7000,'더 이상 설명이 필요 없는 쉘 실버스타인의 대표적인 작품 [아낌없이 주는 나무]. 누구나 알고 있듯이 진정한 사랑이 무엇인가를 일깨워 주는 나무의 아름다운 이야기다. 나무 한 그루는 매일같이 사랑하는 소년과 함께 할 수 있어 행복하다. 하지만 소년이 나이가 들어가면서, 나무는 홀로 있을 때가 많아진다. 그래도 나무는 가끔씩 찾아오는 소년에게, 소년이 필요로 하는 모든 것을 아낌없이 주며 행복해하는데...','0','2015-04-17',NULL,12),('k19788937483943','스티브 잡스','국내도서','민음사','4',0,'월터 아이작슨(Walter Isaacson)','http://bimage.interpark.com/goods_image/4/7/2/6/209034726h.jpg','9788937483943',25000,'스티브잡스가 인정한 유일한 공식 자서전 지난 10월 5일 스티브 잡스의 죽음으로 전세계가 술렁 거렸다. 그의 타계 소식과 함께 관련 서적들이 주목받고 있다. 그 중에서도. 스티브 잡스가 인정한 유일한  공식 전기가 출간 되었다.이 책의 저자 아이작슨은 2009년부터 2년간 잡스와 함께 어린 시절 집을 방문하거나 함께 산책을 하며 그를 40여 차례 인터뷰했고, 그의 친구, 가족, 동료뿐만 아니라 그에게 반감을 가진 인물이나 경쟁자까지 포함하여 100여 명의 인물들을 인터뷰하였다. 잡스를 둘러싼 모든 것이 집적된 이 전기에는 실리콘밸리에서 보낸 잡스의 어린 시절부터 애플의 창업 과정에 이르기까지 그의 전 생애가 담겨 있다.스티브잡스의 공식 전기를 통해 그의 성공을 배우고, 세계 IT 역사에 큰 \'혁신의 아이콘\'...','0','2015-04-20',NULL,13),('k19788997162901','핫존 - 에볼라 바이러스 전쟁의 시작','국내도서','청어람미디어','4',0,'리처드 프레스턴(Richard Preston)','http://bimage.interpark.com/goods_image/2/5/4/3/237152543h.jpg','9788997162901',15000,'뉴욕타임스 베스트셀러 32주간 1위 기록전 세계를 공포에 빠트린 에볼라 바이러스에 관한 최고의 논픽션!','0','2015-04-20',NULL,14),('k39788957977613','NEXUS DELF B2','','넥서스','0',0,'김선미,김성희,한상철','http://bimage.interpark.com/goods_image/8/4/4/0/210178440h.jpg','9788957977613',20700,'프랑스어능력시험 DELF B2프랑스어 관련 진학, 유학, 취업에 필수 자격증자신 있게, 확실하게 대비하여, 단번에 합격하자~- 2005년부터 달라진 새로운 출제 경향을 반영- 영역별 주요 출제 포인트를 집중 분석- 다양한 테마를 다룬 연습문제- 관련 어휘와 표현을 제시하여 실전에 대비 DELF B2 대비용입니다.    ←--------------------→    DELF A1  ┃  DELF A2  ┃ DELF B1  ┃ DELF B2  -  수험자들이 가장 어려워 하는 ‘말하기’의 모델을 제시하고 연습문제를 강화하였습니다.-  다양한 문제와 해설 등을 자세히 실었습니다.-  최신 출제 경향을 철저히 분석 검토하여 출제하였습니다.-  실전 모의고사 2회분을 실었습니다.-  해설 및 정답을 별책으로 구성하여...','0','2015-04-22',NULL,21),('k39788960002975','NEXUS DELF A2','','넥서스','0',0,'김선미,한상철','http://bimage.interpark.com/goods_image/0/0/0/8/200960008s.jpg','9788960002975',22700,'','0','2015-04-22',NULL,20),('k49788962247503','대박패턴500으로 영어를 스토킹하라 1','','로그인','1',0,'백선엽','http://bimage.interpark.com/goods_image/6/7/8/0/203366780h.jpg','9788962247503',13320,'바쁘세요? 그럼 패턴부터 외우세요!500패턴과 2000문장 암기면 회화가 대박납니다!영어는 해야겠는데 시간은 없고 하루하루 영어에 스토킹당하는 대한민국 학습자들을 위해 EBS·로그인·백선엽이 뭉쳤다. 하나를 알면 열 이상을 말하게 해준다는 장점 때문에 가장 효율적인 방법으로 입소문난 ‘패턴’! 학습자들의 패턴에 대한 갈증을 풀어주고자 수개월에 걸친 조사작업 끝에 500개의 영어회화 필수패턴을 수집하여 1, 2권에 걸쳐 수록했다. 미국 드라마·영화에서 패턴과 예문을 발췌하고 원어민들의 감수를 거쳐 현지 원어민들이 자주 사용하는, 암기할 가치가 높은 패턴과 예문만을 담았다. ‘칭찬할 때 쓰는 패턴’, ‘변명할 때 쓰는 패턴’ 등과 같이 패턴을 100개 기능별로 5개씩 그룹지어서, 학습자들이 패턴을 쉽게 익히고 ...','0','2015-04-21',NULL,19),('kim919788986836448','알랭 드 보통 여행의 기술','국내도서','청미래','0',0,'알랭 드 보통(Alain de Botton)','http://bimage.interpark.com/goods_image/6/2/7/4/209396274h.jpg','9788986836448',14000,'세계적인 베스트셀러 저자, 알랭 드 보통이 전하는 여행 이야기여행을 떠나기 전에 반드시 읽어야 할 단 한 권의 여행서“일상성의 발명가” 알랭 드 보통은 독창적인 시각으로 사랑, 건축, 철학 그리고 종교 등 다양한 주제에 대한 글을 써왔다. 그런 그가 떠나는 여행의 모든 것이 이 책에 담겨 있다. 이번에도 그는 우리를 실망시키지 않는다. 그는 번뜩이는 지성과 무심한 듯한 매력으로 기대의 즐거움, 이국적인 것의 매혹, 바베이도스의 바다 풍경에서부터 히드로 공항의 비행기 이륙에 이르기까지 모든 것에서 찾아낼 수 있는 가치를 독자들에게 곰곰이 생각하게 한다. 이 책은 여행을 떠나려는 사람들에게 여행의 목적지뿐만 아니라 여행을 어떻게 가야 하고, 왜 가야 하는지를 알려준다.알랭 드 보통은 다양한 장소들 ?바베이도스,...','0','2015-04-21',NULL,16),('kim919788996991342','미움받을 용기','국내도서','인플루엔셜','1',0,'기시미 이치로,고가 후미타케','http://bimage.interpark.com/goods_image/2/8/3/6/226122836h.jpg','9788996991342',14900,'심리학 3대 거장 아들러의 진짜 내 인생을 살게 하는 용기의 심리학!우리는 모두 변화를 원한다. 지금보다 더 자유로운 삶, 지금보다 더 행복한 삶, 지금보다 더 성공적인 삶. 하지만 우리는 쉽게 핑계를 대고, 쉽게 포기한다. 철학자는 말한다. ','0','2015-04-21',NULL,15),('kim919788997969357','자기배려의 인문학','국내도서','북드라망','0',0,'강민혁','http://bimage.interpark.com/goods_image/2/3/1/2/220932312h.jpg','9788997969357',15000,'중년의 평범한 은행원이 인문학을 만나 변화된 자기 삶을, 그리스-로마철학 및 동양의 문학 등과 더불어 풀어낸 독특한 인문서. 저자는 프랑스의 철학자 미셸 푸코가 그리스-로마철학에서 발굴해낸 개념인 ‘자기배려’(“단 한번도 되어 본 적 없는 자기가 되는 실천”)를 키워드로, 소크라테스, 플라톤, 세네카, 루쉰, 소세키 등의 사유를 누비며, 이를 직장인이자 두 아이의 부모이고 중년 남성인 자신의 삶과 연결시켜 풀어낸다. 아이를 혼낸 일은 세네카의 철학과 어우러지고, 회사의 프로젝트 때문에 힘들었던 일은 플라톤과 만나며, 오랜만에 만난 친구의 이야기는 에피쿠로스의 우정을 불러오는 것이다. 인문학과 만난 후 술·담배를 끊고, 회식으로 보내던 시간에 친구들과 모여 책을 읽는 저자는 ‘철학이 자신의 삶을 바꾼다’는 걸...','0','2015-04-21',NULL,18);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
INSERT INTO `borrow` VALUES ('CS009','2015-04-10','2015-04-28','3','k1234'),('CS007','2015-04-14','2015-04-16','3','k1234'),('CS010','2015-04-15','2015-04-19','2','k1234'),('CS002','2015-04-16','2015-04-22','3','k2'),('CS008','2015-04-16','2015-05-06','3','k2'),('CS006','2015-04-16','2015-05-06','3','k3'),('BS021','2015-04-16','2015-04-20','3','k3'),('CS008','2015-04-17','2015-04-17','3','k1234'),('CS007','2015-04-17','2015-04-22','3','k1234'),('CS005','2015-04-22','2015-05-07','2','ksh901016'),('CS009','2015-04-20','2015-04-20','3','kim91'),('k12349788952709042','2015-04-22','2015-05-10','2','kim91'),('CS009','2015-04-21','2015-05-11','2','kk11'),('k19788937483943','2015-04-22','2015-04-22','3','kk11'),('k49788962247503','2015-04-23','2015-05-13','1','k3'),('kim919788996991342','2015-04-23','2015-05-13','1','k3');
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bulletinboard`
--

LOCK TABLES `bulletinboard` WRITE;
/*!40000 ALTER TABLE `bulletinboard` DISABLE KEYS */;
INSERT INTO `bulletinboard` VALUES (1,'미생 ','','2014-11-22 15:00:00','2014-11-22 15:00:00','root'),(2,'ㅎㅎㅎㅎㅎ','ㅎㅎㅎㅎㅎ','2014-11-22 15:00:00','2015-04-23 01:48:58','root'),(3,'데이터배이스 배움','터대학에서 데이터베이스 과목을 가르친 지 20여 년의 세월 동안 외국의 유명한 원서들 또는 이들의 번역서를 교재로 선택하여 강의를 해왔다. 또한 저명한 원서 2판과 3판을 여러 교수들과 공동으로 직접 번역을 해보기도 하였다. 그런데 이런 교재들은 대개 700페이지 이상의 분량이어서 한 학기 동안 가르치는 것이 불가능했다. ','2014-12-07 15:00:00','2014-12-07 15:00:00','root'),(4,'7년 후에','후독자들이 좋아하는 작가의 신작에서 기대하는 사항은 크게 두 가지로 압축할 수 있을 것이다. 그 첫 번째는 해당 작가의 작품에서만 볼 수 있는 매력, 두 번째는 한곳에 고정되지 않고 늘 변화를 모색하는 노력을 보고자 할 것이다. ','2014-12-03 15:00:00','2014-12-03 15:00:00','root'),(5,'종이여자','로스앤젤레스의 빈민가 맥아더파크에서 나고 자란 톰 보이드는 어린 시절 겪은 강렬하고 순탄치 않았던 경험을 살려 집필한 소설 《천사 3부작》으로 일약 베스트셀러 작가가 된다. 그에게는 어린 시절부터 돈독한 우정을 나눈 친구들이 있다. 현재 LA경찰로 근무하는 여경 캐롤, 톰의 매니저로 일하는 밀로가 바로 그들이다. 맥아더파크에서의 어린 시절 경험을 공유하고 있는 그들은 서로 떼어놓고 생각할 수 없을 만큼 사이가 각별한 존재들이다. 죽음의 위험이 상존하는 마을에서 또래의 친구들은 대개 갱단에 가입하거나 마약딜러가 되어 하루살이 같은 목숨을 이어간다. 톰과 두 친구는 더 이상 비극적인 생을 이어갈 수 없다는 결연한 각오로 마을을 떠나올 수 있었다. 갱단의 일원이었던 밀로에게는 목숨을 건 탈주였다. 이제 어느 정도의 성공과 안정된 삶을 찾았지만 어린 시절의 암울하고 끔찍한 기억은 그들에게 오랜 세월 동안 지울 수 없는 상처로 남는다. ','2014-12-02 15:00:00','2014-12-02 15:00:00','root'),(6,'구해줘','아내를 잃은 후 좌절감에 휩싸여 살아가는 젊은 의사 샘 갤러웨이와 여배우의 꿈을 안고 뉴욕에 온 줄리에트 보몽. 브로드웨이 무대에 서겠다는 일념으로 뉴욕에 오지만 생활비를 벌기에도 벅찬 생활에 염증을 느낀 줄리에트 보몽은 프랑스로 돌아갈 결심을 굳힌다. 무대보다는 카페 웨이트리스가 직업이 되다시피 한 줄리에트에게 뉴욕은 패배와 무력감을 일깨워준 냉혹한 도시일 뿐이었다.ㅎㅎㅎㅎㅎㅎ','2014-11-29 15:00:00','2015-04-23 01:48:50','root'),(17,'열혈 C 프로그래밍','자료구조 학습의 올바른 방법과 목표를 말하고자 합니다! 자료구조는 어렵다고 알려져 있습니다.하지만 문제는 어렵다는데 있는 것이 아닙니다.어려워도 끝까지 공부할 수 있다면 문제가 되지 않습니다.문제는 끝까지 공부하지 못하는데 있습니다.설명이 이치에 맞고 학습의 방법이 올바르다면,내용이 어려워도 끝까지 공부할 수 있습니다.그래서 저자는 말합니다.자료구조를 잘 아는 사람에게 배워야 할 것은 자료구조의 학습방법이다!그리고 저자는 본서를 통해서 자료구조를 어떠한 방법으로 어떠한 수준까지 공부해야 하는지를 선배의 입장에서 이야기합니다.','2014-12-03 05:42:46','2014-12-03 05:42:46','root'),(22,'자바','dd','2014-12-08 10:01:17','2014-12-08 10:01:17','k1'),(23,'좋습니다','좋ㅅ브니다','2015-03-25 07:47:35','2015-03-25 07:47:35','k1'),(24,'괴테가 읽어주는 인생','중산층의 조건이 교양과 자신만의 주관이 있어야 한다는 조건이 있다. 괴테는 그 교양있는 사람들이 따를만큼 삶에 있어서 통찰력이 있고, 시대를 이끌어갔다. 지금 자본주의시대에도 철학과 문학, 통찰력이 있는 사람들이 시대를 주도하고 사람들을 따르게 만든다. 이 책은 삶을 주도적으로 살아가도록 한다.','2015-03-31 00:33:31','2015-03-31 00:33:31','k1'),(25,'하이','하이','2015-04-02 06:27:48','2015-04-02 06:27:48','k1234'),(26,'안녕하십니까','반갑습니다','2015-04-03 01:48:28','2015-04-03 01:48:28','seohan1');
/*!40000 ALTER TABLE `bulletinboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('k1','1234','민상훈','hihi@naver.com','인천시 서구','01067766160','0325646160',2,'1','경리'),('k1234','1234','123','tnvjakffkr@hotmail.com','','01067766160','0325646160',0,'0','회계'),('k2','1234','이빨','k2@naver.com','인천시남구','011','032',0,'0','법무'),('k3','1234','김치','k3@naver.com','인천시부평구','010','032',0,'0','생산'),('k4','1234','홍길동','k4@naver.com','인천시남구','010','032',0,'0','기획'),('k5','1234','하하','k5@naver.com','인천시남동구','010','032',0,'0','품질'),('kim91','1234','김상현','kkk91@daum.net','원인재역','018','034',3,'0','영업'),('kk11','1234','깡냉','k22@daum.net','인천광역시남동구','042','032',0,'0','전산'),('ksh901016','1234','강성현','','인천 남구 간석동','29291','382838',5,'0','전산'),('lee','1234','이창신','lcs@naer.com','인천시부평구','010','032',4,'0','구매'),('root','1','root','root@root.com','하늘','010','032',0,'1','설계'),('seohan1','1234','서한','민상훈','서울','','',0,'0','시험');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (17,'ㅇ 이용시간 : 평일 8시 ~ 17시 \r\nㅇ 1인 1회당 최대 5권 대여 가능\r\nㅇ 단기대여: 2주 , 장기대여: 1개월\r\nㅇ 도서 구입 신청 가능 (단, 10만원 이상 도서는 소속팀장 결재 필요)','2015-04-22',0),(18,'ㅇ 개정된 책 일 경우, 개정판 마다 ISBN이 다를 수 있음\r\n    - 인터파크에서 ISBN 확인 후 구입 신청\r\n\r\nㅇ ISBN이 없거나 인터파크에 원하는 도서가 없을 경우\r\n    - 선행기획팀 김세리 사원, 박완석 연구원에게 문의 (4326, 4325)','2015-04-16',0),(19,'테스트 입니다. 시간체크','2015-04-16',0),(20,'ㅇ 개정된 책 일 경우, 개정판 마다 ISBN이 다를 수 있음\r\n    - 인터파크에서 ISBN 확인 후 구입 신청\r\n\r\nㅇ ISBN이 없거나 인터파크에 원하는 도서가 없을 경우\r\n    - 선행기획팀 김세리 사원, 박완석 연구원에게 문의 (4326, 4325)','2015-04-22',0);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `recommended`
--

LOCK TABLES `recommended` WRITE;
/*!40000 ALTER TABLE `recommended` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (NULL,'2015-04-10','null9791195326426','역경의 행운','최재석',NULL,'국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=236973706&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/3/7/0/6/236973706h.jpg','9791195326426',20000,2,NULL,NULL,17),(NULL,'2015-04-10','null9788965400219','열혈강의 서블릿/JSP 웹 프로그래밍 with HTML+CSS+XML+자바스크립트','김승현',NULL,'국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=210432385&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/2/3/8/5/210432385h.jpg','9788965400219',32000,2,NULL,NULL,18),(NULL,'2015-04-13','null9788989313694','[위즈덤하우스] 어린이 자기계발시리즈 전30권세트','',NULL,'','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=222569674&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/9/6/7/4/222569674h.jpg','9788989313694',205000,1,NULL,NULL,19),(NULL,'2015-04-13','null9788960861565','어린이를 위한 배려','전지은',NULL,'국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=11399128&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/9/1/2/8/11399128s.jpg','9788960861565',9000,1,NULL,NULL,20),(NULL,'2015-04-13','null9788965744023','정글만리 1','조정래',NULL,'국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=212675918&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/5/9/1/8/212675918h.jpg','9788965744023',13500,1,NULL,NULL,21),('k1','2015-04-13','0','핫존 - 에볼라 바이러스 전쟁의 시작','리처드 프레스턴(Richard Preston)','청어람미디어','국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=237152543&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/2/5/4/3/237152543h.jpg','9788997162901',15000,2,NULL,'뉴욕타임스 베스트셀러 32주간 1위 기록전 세계를 공포에 빠트린 에볼라 바이러스에 관한 최고의 논픽션!',22),('k1','2015-04-13','0','스티브 잡스','월터 아이작슨(Walter Isaacson)','민음사','국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=209034726&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/4/7/2/6/209034726h.jpg','9788937483943',25000,1,NULL,'스티브잡스가 인정한 유일한 공식 자서전 지난 10월 5일 스티브 잡스의 죽음으로 전세계가 술렁 거렸다. 그의 타계 소식과 함께 관련 서적들이 주목받고 있다. 그 중에서도. 스티브 잡스가 인정한 유일한  공식 전기가 출간 되었다.이 책의 저자 아이작슨은 2009년부터 2년간 잡스와 함께 어린 시절 집을 방문하거나 함께 산책을 하며 그를 40여 차례 인터뷰했고, 그의 친구, 가족, 동료뿐만 아니라 그에게 반감을 가진 인물이나 경쟁자까지 포함하여 100여 명의 인물들을 인터뷰하였다. 잡스를 둘러싼 모든 것이 집적된 이 전기에는 실리콘밸리에서 보낸 잡스의 어린 시절부터 애플의 창업 과정에 이르기까지 그의 전 생애가 담겨 있다.스티브잡스의 공식 전기를 통해 그의 성공을 배우고, 세계 IT 역사에 큰 \'혁신의 아이콘\'...',23),('k1234','2015-04-17','0','아낌없이 주는 나무','쉘 실버스타인(Sheldon Alan Shel Silverstein)','시공주니어','국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=706462&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/6/4/6/2/706462h.jpg','9788952709042',7000,1,NULL,'더 이상 설명이 필요 없는 쉘 실버스타인의 대표적인 작품 [아낌없이 주는 나무]. 누구나 알고 있듯이 진정한 사랑이 무엇인가를 일깨워 주는 나무의 아름다운 이야기다. 나무 한 그루는 매일같이 사랑하는 소년과 함께 할 수 있어 행복하다. 하지만 소년이 나이가 들어가면서, 나무는 홀로 있을 때가 많아진다. 그래도 나무는 가끔씩 찾아오는 소년에게, 소년이 필요로 하는 모든 것을 아낌없이 주며 행복해하는데...',24),('kim91','2015-04-21','0','알랭 드 보통 여행의 기술','알랭 드 보통(Alain de Botton)','청미래','국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=209396274&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/6/2/7/4/209396274h.jpg','9788986836448',14000,1,NULL,'세계적인 베스트셀러 저자, 알랭 드 보통이 전하는 여행 이야기여행을 떠나기 전에 반드시 읽어야 할 단 한 권의 여행서“일상성의 발명가” 알랭 드 보통은 독창적인 시각으로 사랑, 건축, 철학 그리고 종교 등 다양한 주제에 대한 글을 써왔다. 그런 그가 떠나는 여행의 모든 것이 이 책에 담겨 있다. 이번에도 그는 우리를 실망시키지 않는다. 그는 번뜩이는 지성과 무심한 듯한 매력으로 기대의 즐거움, 이국적인 것의 매혹, 바베이도스의 바다 풍경에서부터 히드로 공항의 비행기 이륙에 이르기까지 모든 것에서 찾아낼 수 있는 가치를 독자들에게 곰곰이 생각하게 한다. 이 책은 여행을 떠나려는 사람들에게 여행의 목적지뿐만 아니라 여행을 어떻게 가야 하고, 왜 가야 하는지를 알려준다.알랭 드 보통은 다양한 장소들 ?바베이도스,...',25),('kim91','2015-04-21','0','미움받을 용기','기시미 이치로,고가 후미타케','인플루엔셜','국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=226122836&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/2/8/3/6/226122836h.jpg','9788996991342',14900,1,NULL,'심리학 3대 거장 아들러의 진짜 내 인생을 살게 하는 용기의 심리학!우리는 모두 변화를 원한다. 지금보다 더 자유로운 삶, 지금보다 더 행복한 삶, 지금보다 더 성공적인 삶. 하지만 우리는 쉽게 핑계를 대고, 쉽게 포기한다. 철학자는 말한다. ',26),('kim91','2015-04-21','0','자기배려의 인문학','강민혁','북드라망','국내도서','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=220932312&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/2/3/1/2/220932312h.jpg','9788997969357',15000,1,NULL,'중년의 평범한 은행원이 인문학을 만나 변화된 자기 삶을, 그리스-로마철학 및 동양의 문학 등과 더불어 풀어낸 독특한 인문서. 저자는 프랑스의 철학자 미셸 푸코가 그리스-로마철학에서 발굴해낸 개념인 ‘자기배려’(“단 한번도 되어 본 적 없는 자기가 되는 실천”)를 키워드로, 소크라테스, 플라톤, 세네카, 루쉰, 소세키 등의 사유를 누비며, 이를 직장인이자 두 아이의 부모이고 중년 남성인 자신의 삶과 연결시켜 풀어낸다. 아이를 혼낸 일은 세네카의 철학과 어우러지고, 회사의 프로젝트 때문에 힘들었던 일은 플라톤과 만나며, 오랜만에 만난 친구의 이야기는 에피쿠로스의 우정을 불러오는 것이다. 인문학과 만난 후 술·담배를 끊고, 회식으로 보내던 시간에 친구들과 모여 책을 읽는 저자는 ‘철학이 자신의 삶을 바꾼다’는 걸...',27),('k4','2015-04-21','0','대박패턴500으로 영어를 스토킹하라 1','백선엽','로그인','','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=203366780&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/6/7/8/0/203366780h.jpg','9788962247503',13320,1,NULL,'바쁘세요? 그럼 패턴부터 외우세요!500패턴과 2000문장 암기면 회화가 대박납니다!영어는 해야겠는데 시간은 없고 하루하루 영어에 스토킹당하는 대한민국 학습자들을 위해 EBS·로그인·백선엽이 뭉쳤다. 하나를 알면 열 이상을 말하게 해준다는 장점 때문에 가장 효율적인 방법으로 입소문난 ‘패턴’! 학습자들의 패턴에 대한 갈증을 풀어주고자 수개월에 걸친 조사작업 끝에 500개의 영어회화 필수패턴을 수집하여 1, 2권에 걸쳐 수록했다. 미국 드라마·영화에서 패턴과 예문을 발췌하고 원어민들의 감수를 거쳐 현지 원어민들이 자주 사용하는, 암기할 가치가 높은 패턴과 예문만을 담았다. ‘칭찬할 때 쓰는 패턴’, ‘변명할 때 쓰는 패턴’ 등과 같이 패턴을 100개 기능별로 5개씩 그룹지어서, 학습자들이 패턴을 쉽게 익히고 ...',28),('k3','2015-04-22','0','NEXUS DELF A2','김선미,한상철','넥서스','','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=200960008&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/0/0/0/8/200960008s.jpg','9788960002975',22700,1,NULL,'',29),('k3','2015-04-22','0','NEXUS DELF B2','김선미,김성희,한상철','넥서스','','http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=210178440&refererType=8303&bookblockname=bpmain_in&booklinkname=wg_search_B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300','http://bimage.interpark.com/goods_image/8/4/4/0/210178440h.jpg','9788957977613',20700,2,NULL,'프랑스어능력시험 DELF B2프랑스어 관련 진학, 유학, 취업에 필수 자격증자신 있게, 확실하게 대비하여, 단번에 합격하자~- 2005년부터 달라진 새로운 출제 경향을 반영- 영역별 주요 출제 포인트를 집중 분석- 다양한 테마를 다룬 연습문제- 관련 어휘와 표현을 제시하여 실전에 대비 DELF B2 대비용입니다.    ←--------------------→    DELF A1  ┃  DELF A2  ┃ DELF B1  ┃ DELF B2  -  수험자들이 가장 어려워 하는 ‘말하기’의 모델을 제시하고 연습문제를 강화하였습니다.-  다양한 문제와 해설 등을 자세히 실었습니다.-  최신 출제 경향을 철저히 분석 검토하여 출제하였습니다.-  실전 모의고사 2회분을 실었습니다.-  해설 및 정답을 별책으로 구성하여...',30);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('k1','BS021','2015-04-17','1'),('k1','BS032','2015-04-20','1'),('k1','CS005','2015-04-20','1'),('k1','BS002','2015-04-21','1'),('kim91','CS007','2015-04-27','1'),('kim91','CS002','2015-04-27','1');
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

-- Dump completed on 2015-04-28 10:19:46
