-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: busancommunity
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblaccount`
--

DROP TABLE IF EXISTS `tblaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblaccount` (
  `account_seq` int NOT NULL,
  `account_title` varchar(20) DEFAULT NULL,
  `account_content` text,
  PRIMARY KEY (`account_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblaccount`
--

LOCK TABLES `tblaccount` WRITE;
/*!40000 ALTER TABLE `tblaccount` DISABLE KEYS */;
INSERT INTO `tblaccount` VALUES (1,'계정1','test1'),(2,'계정2','test2'),(3,'계정3','test3'),(4,'계정4','test4'),(5,'계정5','test5'),(6,'계정6','test6');
/*!40000 ALTER TABLE `tblaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblboard`
--

DROP TABLE IF EXISTS `tblboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblboard` (
  `board_seq` int NOT NULL AUTO_INCREMENT,
  `board_writer` varchar(20) NOT NULL,
  `board_title` varchar(50) NOT NULL,
  `board_content` text,
  `board_pos` smallint unsigned DEFAULT NULL,
  `board_regdate` date DEFAULT NULL,
  `board_ip` varchar(15) DEFAULT NULL,
  `board_count` smallint unsigned DEFAULT NULL,
  `board_filename` varchar(45) DEFAULT NULL,
  `board_filesize` int DEFAULT NULL,
  PRIMARY KEY (`board_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblboard`
--

LOCK TABLES `tblboard` WRITE;
/*!40000 ALTER TABLE `tblboard` DISABLE KEYS */;
INSERT INTO `tblboard` VALUES (21,'test1','게시글 테스트1','게시글 테스트입니다1',0,'2022-06-21','0:0:0:0:0:0:0:1',1,NULL,0),(22,'test1','게시글 테스트2','<p>게시글 테스트입니다2</p>',0,'2022-06-21','0:0:0:0:0:0:0:1',1,NULL,0),(23,'test1','게시글 테스트3','<p>게시글 테스트입니다3</p>',0,'2022-06-21','0:0:0:0:0:0:0:1',0,NULL,0),(24,'test1','게시글 테스트4','<p>게시글 테스트입니다4</p>',0,'2022-06-21','0:0:0:0:0:0:0:1',0,NULL,0),(25,'test1','게시글 테스트5','<p>게시글 테스트입니다5</p>',0,'2022-06-21','0:0:0:0:0:0:0:1',0,NULL,0),(26,'test1','게시글 테스트6','<p>게시글 테스트입니다6</p>',0,'2022-06-21','0:0:0:0:0:0:0:1',0,NULL,0),(27,'test1','게시글 테스트7','<p>게시글 테스트입니다7</p>',0,'2022-06-21','0:0:0:0:0:0:0:1',0,NULL,0),(28,'test1','게시글 테스트8','<p>게시글 테스트입니다8</p>',0,'2022-06-21','0:0:0:0:0:0:0:1',0,NULL,0),(29,'test1','게시글 테스트9','<p>게시글 테스트입니다9</p>',0,'2022-06-21','0:0:0:0:0:0:0:1',0,NULL,0),(30,'test1','게시글 테스트10','<p>게시글 테스트입니다10</p>',0,'2022-06-21','0:0:0:0:0:0:0:1',0,NULL,0),(31,'test1','게시글 테스트11','<p>게시글 테스트입니다11</p>',0,'2022-06-21','0:0:0:0:0:0:0:1',0,NULL,0),(32,'test1','게시글 테스트12','<p>게시글 테스트입니다12</p>',0,'2022-06-21','0:0:0:0:0:0:0:1',0,NULL,0),(33,'test1','게시글 테스트13','<p>게시글 테스트입니다13</p>',0,'2022-06-21','0:0:0:0:0:0:0:1',1,NULL,0);
/*!40000 ALTER TABLE `tblboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcomment`
--

DROP TABLE IF EXISTS `tblcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcomment` (
  `comment_seq` int NOT NULL AUTO_INCREMENT,
  `comment_board` int DEFAULT NULL,
  `comment_writer` varchar(20) NOT NULL,
  `comment_content` text,
  `comment_regdate` date NOT NULL,
  `comment_pos` smallint DEFAULT NULL,
  `comment_ref` smallint DEFAULT NULL,
  `comment_depth` smallint DEFAULT NULL,
  `comment_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`comment_seq`),
  KEY `tblcomment_ibfk` (`comment_board`),
  CONSTRAINT `tblcomment_ibfk` FOREIGN KEY (`comment_board`) REFERENCES `tblboard` (`board_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcomment`
--

LOCK TABLES `tblcomment` WRITE;
/*!40000 ALTER TABLE `tblcomment` DISABLE KEYS */;
INSERT INTO `tblcomment` VALUES (74,33,'test1','test1','2022-06-21',0,1,0,'0:0:0:0:0:0:0:1'),(76,33,'test1','관리자에 의해 삭제되었습니다.','2022-06-21',0,75,0,'0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `tblcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbletc`
--

DROP TABLE IF EXISTS `tbletc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbletc` (
  `etc_seq` int NOT NULL,
  `etc_title` varchar(20) DEFAULT NULL,
  `etc_content` text,
  PRIMARY KEY (`etc_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbletc`
--

LOCK TABLES `tbletc` WRITE;
/*!40000 ALTER TABLE `tbletc` DISABLE KEYS */;
INSERT INTO `tbletc` VALUES (1,'기타1','test1'),(2,'기타2','test2'),(3,'기타3','test3'),(4,'기타4','test4'),(5,'기타5','test5'),(6,'기타6','test6');
/*!40000 ALTER TABLE `tbletc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhelp`
--

DROP TABLE IF EXISTS `tblhelp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblhelp` (
  `help_seq` int NOT NULL,
  `help_title` varchar(20) DEFAULT NULL,
  `help_content` text,
  PRIMARY KEY (`help_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhelp`
--

LOCK TABLES `tblhelp` WRITE;
/*!40000 ALTER TABLE `tblhelp` DISABLE KEYS */;
INSERT INTO `tblhelp` VALUES (1,'도움말1','test1'),(2,'도움말2','test2'),(3,'도움말3','test3'),(4,'도움말4','test4'),(5,'도움말5','test5'),(6,'도움말6','test6');
/*!40000 ALTER TABLE `tblhelp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmember`
--

DROP TABLE IF EXISTS `tblmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmember` (
  `id` char(30) NOT NULL,
  `pw` char(20) NOT NULL,
  `mobile` char(11) NOT NULL,
  `regdate` timestamp NOT NULL,
  `pwresetdate` timestamp NULL DEFAULT NULL,
  `profileimage` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmember`
--

LOCK TABLES `tblmember` WRITE;
/*!40000 ALTER TABLE `tblmember` DISABLE KEYS */;
INSERT INTO `tblmember` VALUES ('raid','1234','01088003995','2022-06-14 03:26:27','2022-06-14 03:26:27','ProfileImage.jpg'),('test1','1234','01079797979','2022-06-19 08:14:12','2022-06-19 08:14:12','ProfileImage.jpg'),('test11','1234','sdfdsaf','2022-06-13 07:10:03','2022-06-14 05:53:48',NULL),('test12','1234','safsafagfa','2022-06-13 07:10:58',NULL,NULL),('test13','1234','dfdfafs','2022-06-13 07:11:47',NULL,NULL),('test16','1234','0000000000','2022-06-13 07:21:55',NULL,NULL),('test18','1234','01013132424','2022-06-13 07:24:44',NULL,NULL),('test2','1234','01013131313','2022-06-13 05:35:56',NULL,NULL),('test3','1234','ddfds','2022-06-13 05:47:46',NULL,NULL),('test4','1234','dfsfdsg','2022-06-13 05:48:55',NULL,NULL),('test5','1234','01122','2022-06-13 06:59:02',NULL,NULL),('test6','1234','1214142343','2022-06-13 07:06:42',NULL,NULL),('test7','1234','01012341333','2022-06-13 07:09:20',NULL,NULL),('test8','1234','01013241234','2022-06-13 07:09:46',NULL,NULL);
/*!40000 ALTER TABLE `tblmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnotice`
--

DROP TABLE IF EXISTS `tblnotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblnotice` (
  `notice_seq` int NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(20) DEFAULT NULL,
  `notice_content` text,
  PRIMARY KEY (`notice_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnotice`
--

LOCK TABLES `tblnotice` WRITE;
/*!40000 ALTER TABLE `tblnotice` DISABLE KEYS */;
INSERT INTO `tblnotice` VALUES (1,'공지사항1','test1'),(2,'공지사항2','test2'),(3,'공지사항3','test3'),(4,'공지사항4','test4'),(5,'공지사항5','test5'),(6,'공지사항6','test6');
/*!40000 ALTER TABLE `tblnotice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblphoto`
--

DROP TABLE IF EXISTS `tblphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblphoto` (
  `photo_seq` int NOT NULL AUTO_INCREMENT,
  `haeundae` varchar(45) DEFAULT NULL,
  `junggu` varchar(45) DEFAULT NULL,
  `youngdogu` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sahagu` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `seogu` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `busanjingu` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `donggu` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dongraegu` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `namgu` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bukgu` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `geumjeonggu` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gangseogu` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `yeonjegu` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `suyeonggu` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sasanggu` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gijanggun` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`photo_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblphoto`
--

LOCK TABLES `tblphoto` WRITE;
/*!40000 ALTER TABLE `tblphoto` DISABLE KEYS */;
INSERT INTO `tblphoto` VALUES (1,';부산국제영화관;BusanCinemaCenter.jpg',';남포동;Nampodong.jpg',';다누비열차;DanubiTrain.jpg',';다대포해변;DadaepoBeach.JPG',';암남공원;AmnamPark.jpg',';애진봉 철쭉군락지;AjinbongAzalea Colony.jpg',';168계단 모노레일;168Monorail.jpg',';부산 3.1독립운동 기념탑;Busan3.1Independence Movement Monument.jpg',';부산항대교;BusanharborBridge.jpg',';어린이교통공원;Children\'sTrafficPark.jpg',';범어사;Beomeosa.jpg',';도장포어촌체험마을;DaehangExperienceFishingVillage.jpg',';부산행정복합타운;BusanAdministrativeTown.jpg',';금련산;Geumnyeonsan.jpg',';백양산;Baekyangsan.jpg',';대운산자연휴양림;DaleumsanNaturalRecreationalForest.jpg'),(2,';해운대;Haeundae3.jpg',';용두산공원;YongdusanPark.jpeg',';감지해변산책로;GamjiBeachWalk.jpg',';다대포낙조해변;DadaepoSunset Fountain.JPG',';천마산 누리바라기 전망대;CheonmasanNuribaragiObservatory.jpg',';시민공원;BusanCitizensPark.jpg',';책마루 전망대;ChaegmaluObservationDeck.jpg',';충렬사;Chungnyeolsa.jpg',';대연수목전시원;DaeyeonArboretum.jpg',';구포왜성;GupoDwarf.jpg',';금정산;Geumjeongsan.jpg',';대저생태공원;DaejeoEcologicalPark.jpg',';혜원정사사찰;HyewonjeongsaTemple.jpg',';광안리 해수욕장;GwangalliBeach.png',';사상근린공원;LuxuryStreetPark.jpg',';드림볼파크;DreamballPark.jpg'),(3,';누리마루;Nurimaru3.jpg',';국제시장;InternationalMarket.jpeg',';절영해안산책로;JeoryeongCoastalwalk.jpg',';다대포낙조해변;DadaepoSunset Fountain2.JPG',';천마산 조각공원;CheonmasanSculpturePark.jpg',';황령산 봉수대;Hwangnyeongsan Bongsudae.jpg',';차이나타운;Chinatown.jpg',';동래 패총;Dongrae Shellgun.jpg',';이기대;Igidae.gif',';구포시장;GupoMarket.jpg',';금정산성요새;GeumjeongsanseongFortress.jpg',';가덕도;Gadeokdo.jpg',';마하사;MahasaTemple.jpg',';광안대교;GwanganBridge.jpg',';삼락생태공원;SamnakEcologicalPark.jpg',';일광해수욕장;IlgwangBeach.jpg'),(4,';달맞이길;MoontanRoad.jpg',';비프광장;BiffPlaza.jpg',';동삼동패총전시관;ShellMountExhibitionHallinDongsam-dong.jpg',';을숙도철새공원;EulsukdoMigratoryBirdPark.JPG',';송도 오토캠핑장;SongdoAutoCampingSite.jpg',';전포카페거리;JeonpoCafeStreet.jpg',';조선통신사역사관;ChosunNewsAgencyHistoryMuseum.jpg',';금강공원;GeumgangPark.jpg',';일제강제동원역사관;MemorialMuseumOfForcedMobilization.jpg',';화명수목원;Hwamyeong-Arboretum.jpg',';해동호;HoeDongho.jpg',';거가대교;GeogaBridge.jpg',';역사기록관;NationalArchives.jpg',';민락수변공원;MillakWaterfrontPark.jpg',';사상공원;SasangPark.jpg',';장안사 계곡;JangansaValley.png'),(5,';아쿠아리움;Aquarium.png',';중앙공원;JungangPark.jpg',';태종대;Taejongdae.jpg',';경화역 벚꽃길;Hadan-dongCherryBlossomRoad.JPG',';송도해수욕장;Songdobeach.jpg',';젊음의거리;streetOfYouth.jpg',';문화원;CulturalPlatform.jpg',';박차정 의사 생가;ParkCha-jeong\'s Birthplace.jpg',';오륙도;Oryukdo.jpg',';화명생태공원;Hwamyeong-Ecological-Park.jpg',';연꽃소류지;lotusPond.jpg',';경남경마공원;Let\'sRunPark.jpg',';온천천;Oncheoncheon.jpg',';남천 벚꽃길;NamcheonCherryBlossomStreet.jpg',';승학산;Seunghaksan.jpg',';롯데월듯;LotteWorld.jpg'),(6,';광안대교;GwanganBridge2.jpg',';남포문고;BookstoreStreet.jpg',';영도대교;YeongdoBridge.jpg',';일몰전망대;JangnimPortBuneziaThemeStreet.JPG',';송도 용궁구름다리;SongdoYonggungCloudBridge.jpg',';선암사;SeonamsaTemple.jpg',';웹툰이바구길;WebtoonIbagu-gil.jpg',';우장춘 기념관;WooJang-chun MemorialHall.jpg',';UN기념관;UN-MemorialPark.gif',';레고마을;Legovillage.jpg',';금정체육공원;SporonePark.jpg',';맥도생태공원;MacdoEcologicalPark.jpg',';고분군;Yeonsan AncientTombs.jpg',';수영강;SuyeongRiver.jpg',';운수사사찰;UnsusaTemple.jpg',';소학대;Sohagdae.jpg');
/*!40000 ALTER TABLE `tblphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpolicy`
--

DROP TABLE IF EXISTS `tblpolicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblpolicy` (
  `policy_seq` int NOT NULL,
  `policy_title` varchar(20) DEFAULT NULL,
  `policy_content` text,
  PRIMARY KEY (`policy_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpolicy`
--

LOCK TABLES `tblpolicy` WRITE;
/*!40000 ALTER TABLE `tblpolicy` DISABLE KEYS */;
INSERT INTO `tblpolicy` VALUES (1,'개인정보정책1','test1'),(2,'개인정보정책2','test2'),(3,'개인정보정책3','test3'),(4,'개인정보정책4','test4'),(5,'개인정보정책5','test5'),(6,'개인정보정책6','test6');
/*!40000 ALTER TABLE `tblpolicy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-22  9:09:04
