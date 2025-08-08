/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.3.39-MariaDB-0ubuntu0.20.04.2 : Database - inatex_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`inatex_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `inatex_db`;

/*Table structure for table `addons` */

DROP TABLE IF EXISTS `addons`;

CREATE TABLE `addons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `unique_identifier` varchar(255) NOT NULL,
  `version` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `about` longtext DEFAULT NULL,
  `purchase_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `addons` */

/*Table structure for table `applications` */

DROP TABLE IF EXISTS `applications`;

CREATE TABLE `applications` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `applications` */

/*Table structure for table `blog_category` */

DROP TABLE IF EXISTS `blog_category`;

CREATE TABLE `blog_category` (
  `blog_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `added_date` varchar(100) NOT NULL,
  PRIMARY KEY (`blog_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `blog_category` */

/*Table structure for table `blog_comments` */

DROP TABLE IF EXISTS `blog_comments`;

CREATE TABLE `blog_comments` (
  `blog_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `likes` longtext NOT NULL,
  `added_date` varchar(100) NOT NULL,
  `updated_date` varchar(100) NOT NULL,
  PRIMARY KEY (`blog_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `blog_comments` */

/*Table structure for table `blogs` */

DROP TABLE IF EXISTS `blogs`;

CREATE TABLE `blogs` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `keywords` text NOT NULL,
  `description` longtext NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `banner` varchar(100) NOT NULL,
  `is_popular` int(11) NOT NULL,
  `likes` longtext NOT NULL,
  `added_date` varchar(100) NOT NULL,
  `updated_date` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `blogs` */

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `font_awesome_class` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `category` */

insert  into `category`(`id`,`code`,`name`,`parent`,`slug`,`date_added`,`last_modified`,`font_awesome_class`,`thumbnail`) values 
(1,'50fb2fdaeb','Sekolah Lapang Geofisika',0,'sekolah-lapang-geofisika',1750698000,1750698000,'fas fa-address-book','98dcc52a72431dc5508c3bc9d5e0c836.jpg'),
(2,'3af9c18dfa','Sekolah Lapang Geofisika Provinsi Indonesia',1,'sekolah-lapang-geofisika-provinsi-indonesia',1750698000,1751043600,'fas fa-address-book',NULL),
(3,'aa07763755','BMKG Goes To School',0,'bmkg-goes-to-school',1750870800,NULL,'fas fa-address-card','73fd686bc57a607f76541afa79beb286.jpg'),
(4,'0327dfc937','BMKG Goes To School Provinsi Indonesia',3,'bmkg-goes-to-school-provinsi-indonesia',1750870800,1751043600,'far fa-address-card',NULL),
(5,'ceaa7683f7','IOWAVE',0,'iowave',1750870800,NULL,'fas fa-adjust','d480c1e1a82219bcf91812c476d8066b.jpg'),
(6,'8520080297','IOWAVE Indian Ocean Tsunami Drill-Indonesia',5,'iowave-indian-ocean-tsunami-drill-indonesia',1750870800,1751043600,'fas fa-adjust',NULL),
(7,'92216ca12e','IOWAVE Indian Ocean Tsunami Drill- Jawa Barat',5,'iowave-indian-ocean-tsunami-drill-jawa-barat',1751043600,NULL,'fas fa-adjust',NULL),
(8,'a961cc1c69','Tsunami Table Top Exercise',0,'tsunami-table-top-exercise',1751043600,NULL,'far fa-calendar-check','category-thumbnail.png'),
(9,'4150e431ff','Tsunami Table Top Exercise-Indonesia',8,'tsunami-table-top-exercise-indonesia',1751043600,NULL,'fab fa-algolia',NULL);

/*Table structure for table `ci_sessions` */

DROP TABLE IF EXISTS `ci_sessions`;

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ci_sessions` */

insert  into `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) values 
('1g7chmoub4gdqurndmgdcc49n9oocbqs','::1',1750702354,'__ci_last_regenerate|i:1750702354;cart_items|a:0:{}language|s:7:\"english\";'),
('rq2822djhi73p48g2ds1ac92fm73f98b','::1',1750702354,'__ci_last_regenerate|i:1750702354;cart_items|a:0:{}language|s:7:\"english\";'),
('tq9r63h6a91jvm3bf9r5jr8mf1vnbd9j','::1',1750702354,'__ci_last_regenerate|i:1750702354;cart_items|a:0:{}language|s:7:\"english\";'),
('tgi2iba3iovqfffg3pe5ggs4ehdarm4v','::1',1750702354,'__ci_last_regenerate|i:1750702354;cart_items|a:0:{}language|s:7:\"english\";'),
('toj9o01g0jcqqifibphb4hnp2bkr032t','::1',1750702354,'__ci_last_regenerate|i:1750702354;cart_items|a:0:{}language|s:7:\"english\";'),
('d7l3p3l4em9740k812k8luk3a2ejjrp7','::1',1750702658,'__ci_last_regenerate|i:1750702658;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";layout|s:4:\"list\";total_price_of_checking_out|i:0;'),
('qesduc3b00a8hfr4o1l4egepr0i4tr43','::1',1750702980,'__ci_last_regenerate|i:1750702980;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";layout|s:4:\"list\";total_price_of_checking_out|i:0;'),
('hg6o00pt7k83n64q72n14q2u1d3qpem1','::1',1750703351,'__ci_last_regenerate|i:1750703351;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";layout|s:4:\"list\";total_price_of_checking_out|i:0;'),
('5d1dopv8in5cilc7n55cugl9t3pgcr87','::1',1750703684,'__ci_last_regenerate|i:1750703684;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";layout|s:4:\"list\";total_price_of_checking_out|i:0;'),
('lgip0cb0bsbu1gfivt5redeljhv6ptsf','::1',1750703990,'__ci_last_regenerate|i:1750703990;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";layout|s:4:\"list\";total_price_of_checking_out|i:0;flash_message|s:27:\"Course updated successfully\";__ci_vars|a:1:{s:13:\"flash_message\";s:3:\"old\";}'),
('lk3u40lq5r928r0a89mrvldjibsaj4uc','::1',1750704068,'__ci_last_regenerate|i:1750703990;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";layout|s:4:\"list\";total_price_of_checking_out|i:0;'),
('3vk3h7e6j1a10lr1tdgbd701n5uorsg2','::1',1750727217,'__ci_last_regenerate|i:1750727172;cart_items|a:0:{}language|s:7:\"english\";'),
('jonvkem4jmin06g83equnehmjo3qgvum','::1',1750817932,'__ci_last_regenerate|i:1750817932;cart_items|a:0:{}language|s:7:\"english\";'),
('pun6oidhpurtl0ero2j28parnui429nn','::1',1750819466,'__ci_last_regenerate|i:1750819466;cart_items|a:0:{}language|s:7:\"english\";'),
('acriek8rc96t0msbm1nipl0ntroh61rn','::1',1750819953,'__ci_last_regenerate|i:1750819953;cart_items|a:0:{}language|s:7:\"english\";'),
('hdb87ruevmbah15rcj4tbst481ja3n9v','::1',1750820363,'__ci_last_regenerate|i:1750820363;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('44e6sklc48b94cf4q7gs4e4hsabqnosp','::1',1750820690,'__ci_last_regenerate|i:1750820690;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('ggvhahts676rp8upcovj5199r4m9fi0u','::1',1750820840,'__ci_last_regenerate|i:1750820690;cart_items|a:0:{}language|s:7:\"english\";'),
('318rlhg0qa4li0ljpth91abfksm1nt23','::1',1750916662,'__ci_last_regenerate|i:1750916662;language|s:7:\"english\";cart_items|a:0:{}'),
('3frg31jvcr7g0jfs5k284cut4llomcd0','::1',1750916984,'__ci_last_regenerate|i:1750916984;language|s:7:\"english\";cart_items|a:0:{}user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('6bqlomd7dkduu9b04li9696mt8l7ql49','::1',1750921524,'__ci_last_regenerate|i:1750921524;language|s:7:\"english\";cart_items|a:0:{}user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('c1iogdp7mh5rll7rllsh22k9dresnlcq','::1',1750921643,'__ci_last_regenerate|i:1750921524;language|s:7:\"english\";cart_items|a:0:{}user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";layout|s:4:\"list\";'),
('0935hdmajerb9s6vlcdod79j6ns17fuh','::1',1750942289,'__ci_last_regenerate|i:1750942289;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";layout|s:4:\"list\";'),
('qmigvfms59bn6hh0hsanpdi674om6a6f','::1',1750942620,'__ci_last_regenerate|i:1750942620;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";layout|s:4:\"list\";'),
('0bh2ia85cait062gmb5ir6nujbrci7oo','::1',1750942853,'__ci_last_regenerate|i:1750942620;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";layout|s:4:\"list\";'),
('e51ac9j5it9bfj8coj1q9jq3kcil3k7b','::1',1750991524,'__ci_last_regenerate|i:1750991524;cart_items|a:0:{}language|s:7:\"english\";'),
('l28h0u3m0obdpl1i6rgjpt3a5tf4b108','::1',1750991841,'__ci_last_regenerate|i:1750991841;cart_items|a:0:{}language|s:7:\"english\";layout|s:4:\"list\";'),
('2s64q0inma7fefef96a672nl3lbfeeaq','::1',1750992101,'__ci_last_regenerate|i:1750991841;cart_items|a:0:{}language|s:7:\"english\";layout|s:4:\"list\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('lfl1eaerl980aq4kl14lsj44g56gvv7n','::1',1751021917,'__ci_last_regenerate|i:1751021860;cart_items|a:0:{}language|s:7:\"english\";'),
('5ddtcj6shf381kckk0i6p7tfvcjl06nr','::1',1751072922,'__ci_last_regenerate|i:1751072922;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('tgnmups52ktf0gb2vbiem2gfbpg05fh0','::1',1751073720,'__ci_last_regenerate|i:1751073720;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('rbstopf2gjrihs6u55762l9040v4vgrc','::1',1751074124,'__ci_last_regenerate|i:1751074124;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('pnlp2n07idnegu6do1rdrao421edokju','::1',1751074456,'__ci_last_regenerate|i:1751074456;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('slfod6i2527l505teidr63jqreq2r248','::1',1751074926,'__ci_last_regenerate|i:1751074926;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('8fhj0dvhvivhgpmsae05p4shcdum1q9a','::1',1751075241,'__ci_last_regenerate|i:1751075241;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('apabelugnskpil37pnjgvhde5mh5r2m0','::1',1751077540,'__ci_last_regenerate|i:1751077540;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('m1il1bp95oc61f665sl02sqshbleekg9','::1',1751077887,'__ci_last_regenerate|i:1751077887;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('dlrcm4ke196h0hmb1njem2butiung7l6','::1',1751078679,'__ci_last_regenerate|i:1751078679;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('0g3tb72gdljudfqjfcfms4nm2nvbp0uk','::1',1751079076,'__ci_last_regenerate|i:1751079076;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('nd1o83q8rg4dejt3vc669adp5eafjis3','::1',1751079388,'__ci_last_regenerate|i:1751079388;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('9jmldk64m8tspro3sh1ose68ojiu96pp','::1',1751079707,'__ci_last_regenerate|i:1751079707;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('kmhvrljlqtcehc3j1nhgj9d247cugs5h','::1',1751081550,'__ci_last_regenerate|i:1751081550;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('lllj049mperbh2fmuhmvnd506m1b2j31','::1',1751082834,'__ci_last_regenerate|i:1751082834;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('0daffgi374kavc181lhji6m74djjpkc5','::1',1751083154,'__ci_last_regenerate|i:1751083154;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"2\";role_id|s:1:\"2\";role|s:4:\"User\";name|s:12:\"ismail kamil\";is_instructor|s:1:\"0\";user_login|s:1:\"1\";layout|s:4:\"list\";'),
('cqjs9u2hpcefdctjl07666h257l7kfoh','::1',1751083543,'__ci_last_regenerate|i:1751083543;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"2\";role_id|s:1:\"2\";role|s:4:\"User\";name|s:12:\"ismail kamil\";is_instructor|s:1:\"0\";user_login|s:1:\"1\";layout|s:4:\"list\";'),
('497rj34idbudu6cl9iuk3hmie9btdi2b','::1',1751083522,'__ci_last_regenerate|i:1751083522;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('4dvl3hqaurtgo86ltd11etiobc9vnc9g','::1',1751083891,'__ci_last_regenerate|i:1751083891;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('adl1apd1j05vkv74sf4mq0mg0agfkddi','::1',1751083900,'__ci_last_regenerate|i:1751083900;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"2\";role_id|s:1:\"2\";role|s:4:\"User\";name|s:12:\"ismail kamil\";is_instructor|s:1:\"0\";user_login|s:1:\"1\";layout|s:4:\"list\";'),
('pr1l69bafpkors010hfshrcdanui9qu5','::1',1751088518,'__ci_last_regenerate|i:1751088518;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('qng940lpu5l4507r9a1od4m6sagn65mn','::1',1751083926,'__ci_last_regenerate|i:1751083900;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"2\";role_id|s:1:\"2\";role|s:4:\"User\";name|s:12:\"ismail kamil\";is_instructor|s:1:\"0\";user_login|s:1:\"1\";layout|s:4:\"list\";'),
('83ummtn0seupgmq4utqhamt834k7dsm4','::1',1751088518,'__ci_last_regenerate|i:1751088518;cart_items|a:0:{}language|s:7:\"english\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('426na4j2nujt3q7d4b0j38itjha3m67q','::1',1751089203,'__ci_last_regenerate|i:1751089202;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('ioofgivihncerfanmu8s6h4cn0nf4513','::1',1751089772,'__ci_last_regenerate|i:1751089772;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('d9l0og0tf4nj9dfgdiio4c3kkm8bm436','::1',1751091870,'__ci_last_regenerate|i:1751091870;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('qbp21cr6hm4k28mijo02dqoge7l7t333','::1',1751091892,'__ci_last_regenerate|i:1751091876;language|s:9:\"indonesia\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";cart_items|a:0:{}'),
('p8oqi9ntg98pifqvpu0nptokq5rsmpgc','::1',1751110452,'__ci_last_regenerate|i:1751110452;language|s:9:\"indonesia\";'),
('jdqdh3r1rs5vaj14jhq69qcokuv4o5bk','::1',1751110927,'__ci_last_regenerate|i:1751110927;language|s:9:\"indonesia\";cart_items|a:0:{}'),
('tbl0qqhe9njpin7moiv1f4nf7ucimelj','::1',1751111244,'__ci_last_regenerate|i:1751111244;language|s:9:\"indonesia\";cart_items|a:0:{}error_message|s:28:\"Kredensial login tidak valid\";__ci_vars|a:1:{s:13:\"error_message\";s:3:\"old\";}'),
('htvmv3lgh3t78e6pd4lgk78nvs4ut0sk','::1',1751111649,'__ci_last_regenerate|i:1751111649;language|s:9:\"indonesia\";cart_items|a:0:{}user_id|s:1:\"2\";role_id|s:1:\"2\";role|s:4:\"User\";name|s:12:\"ismail kamil\";is_instructor|s:1:\"0\";user_login|s:1:\"1\";'),
('mdfgucqva36fml1fslommne7n6f2c537','::1',1751111641,'__ci_last_regenerate|i:1751111641;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('v4skghmdc6mv311lop6brecn17sm4td4','::1',1751111645,'__ci_last_regenerate|i:1751111641;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"1\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:9:\"melki adi\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('tuia76l7f12r9dtj39pd68j6ssdfhna4','::1',1751111694,'__ci_last_regenerate|i:1751111649;language|s:9:\"indonesia\";cart_items|a:0:{}user_id|s:1:\"2\";role_id|s:1:\"2\";role|s:4:\"User\";name|s:12:\"ismail kamil\";is_instructor|s:1:\"0\";user_login|s:1:\"1\";'),
('tp3ejcp3er7l0pvr8gtfsn7khjlsblgj','::1',1751244395,'__ci_last_regenerate|i:1751244395;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('mi88snmfjj2c8iqocbo57v6kmqjvljkm','::1',1751244417,'__ci_last_regenerate|i:1751244412;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('dgvtloturmjqp22vf36mik1ujkknsg5b','::1',1751333005,'__ci_last_regenerate|i:1751333005;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('gf0lnksdqventrv2j9k6t2bq5jsur7c9','::1',1751333390,'__ci_last_regenerate|i:1751333389;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('5lutug2s7n8b5dvorf99t8s81vvm6bcd','::1',1751414905,'__ci_last_regenerate|i:1751414902;language|s:9:\"indonesia\";cart_items|a:0:{}'),
('3mtuqtabjlrt0d6pppr1l5j89qq2noa9','::1',1751429940,'__ci_last_regenerate|i:1751429940;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('d4a8i1t3rdom84d7g6igqoprdcuk9nnn','::1',1751437318,'__ci_last_regenerate|i:1751437305;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('kklo00skpvc34r21fnn8taal3gt0vvsl','::1',1751680597,'__ci_last_regenerate|i:1751680596;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('3oifv9ogv35labj9mfm3n6cb0oes2p4l','::1',1751857815,'__ci_last_regenerate|i:1751857815;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('00o43koioa6rrim5c6sikp8rqmhjq5b0','::1',1752649971,'__ci_last_regenerate|i:1752649971;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('1hb1j19l1avbrrdnikr1pkikuav1n3l7','10.31.51.228',1752649304,'__ci_last_regenerate|i:1752649304;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('lbrj6uernq8osrudreu5uj12n94cvco9','10.31.48.169',1752649835,'__ci_last_regenerate|i:1752649835;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('7rgne2hjblktdme5la75dd4tigi9o34k','10.31.54.112',1752649353,'__ci_last_regenerate|i:1752649353;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('lnbbk0234psv3oe09ve4ph1dk1jl6rm2','10.31.48.169',1752649987,'__ci_last_regenerate|i:1752649835;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('4gjrulsj6bcvn6pi7akga7c95f1g45r4','::1',1752650245,'__ci_last_regenerate|i:1752649971;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"2\";role_id|s:1:\"2\";role|s:4:\"User\";name|s:12:\"ismail kamil\";is_instructor|s:1:\"0\";user_login|s:1:\"1\";'),
('0i3gprtm8e5gboo7rvca0v7f78dj2h2j','10.31.51.228',1752651744,'__ci_last_regenerate|i:1752651744;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('3v9nutehep4d0m16mt8gpdpn0is1s9cc','::1',1752734414,'__ci_last_regenerate|i:1752734393;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('g0gspov3kitp5jgkttdpj86vheo7gv78','::1',1752734738,'__ci_last_regenerate|i:1752734738;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"3\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:13:\"admin2 admin2\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('pgn1f6b57rqqnf3hunfk2lr0guvkgi8h','::1',1752737991,'__ci_last_regenerate|i:1752737991;cart_items|a:0:{}language|s:9:\"indonesia\";user_id|s:1:\"3\";role_id|s:1:\"1\";role|s:5:\"Admin\";name|s:13:\"admin2 admin2\";is_instructor|s:1:\"1\";admin_login|s:1:\"1\";'),
('unv82jl5fstnufhtkdoju416k5v3ght5','::1',1752738016,'__ci_last_regenerate|i:1752737991;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('amb885i35tfguogmc8u4s01lksheeuh0','::1',1752756103,'__ci_last_regenerate|i:1752756103;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('9l1a4csta7hdim3jq96in73us9og3c2p','::1',1752756251,'__ci_last_regenerate|i:1752756103;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('g0q7q1tnsq0ldt1d2g62t74oik1af11e','::1',1752791580,'__ci_last_regenerate|i:1752791580;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('m7mflu0hor8dni42nrg3i5s4hh7s6e5m','::1',1752812115,'__ci_last_regenerate|i:1752812115;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('h2i28kff10r50rleib31fan65ebppo9e','::1',1752812227,'__ci_last_regenerate|i:1752812115;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('ihbreb7jlic3lurh7s9742er2vr1ccj6','::1',1752821376,'__ci_last_regenerate|i:1752821376;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('t31g987me2m65l9l32j840ngliao39el','::1',1752884688,'__ci_last_regenerate|i:1752884688;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('40mf98r4fs56285aveu92h9h5ultv65q','::1',1752900385,'__ci_last_regenerate|i:1752900385;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('dln9qjcoenca50rttm6dol1tie18iij0','::1',1752925320,'__ci_last_regenerate|i:1752925320;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('m68hu370vhtd7hokaed56837bqm6daau','::1',1752971516,'__ci_last_regenerate|i:1752971516;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('5hlijtgikmhdtt9hq6a1jl573c9t47ne','::1',1752990143,'__ci_last_regenerate|i:1752990085;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('smouta27aeal0r6b00c788844e2dkbpg','::1',1718656276,'__ci_last_regenerate|i:1753012264;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('72jemj3jg1fcmm2q1n75gjv84ccuii6f','::1',1753080808,'__ci_last_regenerate|i:1753080808;cart_items|a:0:{}language|s:9:\"indonesia\";'),
('g3omdorqm48kbv212bkpr3vonngt5hf1','::1',1753144285,'__ci_last_regenerate|i:1753144285;cart_items|a:0:{}language|s:9:\"indonesia\";');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `body` longtext DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `commentable_id` int(11) DEFAULT NULL,
  `commentable_type` varchar(50) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `comment` */

/*Table structure for table `coupons` */

DROP TABLE IF EXISTS `coupons`;

CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `discount_percentage` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `expiry_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `coupons` */

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `outcomes` longtext DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `section` longtext DEFAULT NULL,
  `requirements` longtext DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount_flag` int(11) DEFAULT 0,
  `discounted_price` int(11) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `course_type` varchar(255) DEFAULT NULL,
  `is_top_course` int(11) DEFAULT 0,
  `is_admin` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `course_overview_provider` varchar(255) DEFAULT NULL,
  `meta_keywords` longtext DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `is_free_course` int(11) DEFAULT NULL,
  `multi_instructor` int(11) NOT NULL DEFAULT 0,
  `enable_drip_content` int(11) NOT NULL,
  `creator` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `course` */

insert  into `course`(`id`,`title`,`short_description`,`description`,`outcomes`,`language`,`category_id`,`sub_category_id`,`section`,`requirements`,`price`,`discount_flag`,`discounted_price`,`level`,`user_id`,`thumbnail`,`video_url`,`date_added`,`last_modified`,`course_type`,`is_top_course`,`is_admin`,`status`,`course_overview_provider`,`meta_keywords`,`meta_description`,`is_free_course`,`multi_instructor`,`enable_drip_content`,`creator`) values 
(1,'Sekolah Lapang Gempabumi Jawa Barat','Berikut adalah deskripsi Sekolah Lapang Gempabumi Jawa Barat','<p>Berikut adalah deskripsi Sekolah Lapang Gempabumi Jawa Barat</p>','[\"selamat tsunami\"]','english',1,2,'[1]','[\"tidak ada\"]',0,NULL,0,'beginner','1',NULL,'https://www.youtube.com/watch?v=97ph2AYwzbs',1750698000,1751043600,'general',0,1,'active','youtube','','tsunami',1,0,0,1),
(2,'BMKG Goes To School Jawa Barat','BMKG Goes To School Jawa Barat','<p>BMKG Goes To School Jawa Barat</p>','[]','english',3,4,'[]','[]',0,NULL,0,'beginner','1',NULL,'',1750870800,NULL,'general',1,1,'active','','','',1,0,0,1),
(3,'IOWAVE Indoan Ocean Tsunami Drill-Jawa Barat','IOWAVE Indoan Ocean Tsunami Drill-Jawa Barat','','[]','english',5,6,'[]','[]',0,NULL,0,'beginner','1',NULL,'',1751043600,NULL,'general',NULL,1,'active','','','',1,0,0,1),
(4,'Tsunami Table Top Exercise- Jawa Barat','Tsunami Table Top Exercise- Jawa Barat','','[]','english',8,9,'[]','[]',0,NULL,0,'beginner','1',NULL,'',1751043600,NULL,'general',NULL,1,'active','','','',1,0,0,1);

/*Table structure for table `currency` */

DROP TABLE IF EXISTS `currency`;

CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `paypal_supported` int(11) DEFAULT NULL,
  `stripe_supported` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `currency` */

insert  into `currency`(`id`,`name`,`code`,`symbol`,`paypal_supported`,`stripe_supported`) values 
(1,'US Dollar','USD','$',1,1),
(2,'Albanian Lek','ALL','Lek',0,1),
(3,'Algerian Dinar','DZD','دج',1,1),
(4,'Angolan Kwanza','AOA','Kz',1,1),
(5,'Argentine Peso','ARS','$',1,1),
(6,'Armenian Dram','AMD','֏',1,1),
(7,'Aruban Florin','AWG','ƒ',1,1),
(8,'Australian Dollar','AUD','$',1,1),
(9,'Azerbaijani Manat','AZN','m',1,1),
(10,'Bahamian Dollar','BSD','B$',1,1),
(11,'Bahraini Dinar','BHD','.د.ب',1,1),
(12,'Bangladeshi Taka','BDT','৳',1,1),
(13,'Barbadian Dollar','BBD','Bds$',1,1),
(14,'Belarusian Ruble','BYR','Br',0,0),
(15,'Belgian Franc','BEF','fr',1,1),
(16,'Belize Dollar','BZD','$',1,1),
(17,'Bermudan Dollar','BMD','$',1,1),
(18,'Bhutanese Ngultrum','BTN','Nu.',1,1),
(19,'Bitcoin','BTC','฿',1,1),
(20,'Bolivian Boliviano','BOB','Bs.',1,1),
(21,'Bosnia','BAM','KM',1,1),
(22,'Botswanan Pula','BWP','P',1,1),
(23,'Brazilian Real','BRL','R$',1,1),
(24,'British Pound Sterling','GBP','£',1,1),
(25,'Brunei Dollar','BND','B$',1,1),
(26,'Bulgarian Lev','BGN','Лв.',1,1),
(27,'Burundian Franc','BIF','FBu',1,1),
(28,'Cambodian Riel','KHR','KHR',1,1),
(29,'Canadian Dollar','CAD','$',1,1),
(30,'Cape Verdean Escudo','CVE','$',1,1),
(31,'Cayman Islands Dollar','KYD','$',1,1),
(32,'CFA Franc BCEAO','XOF','CFA',1,1),
(33,'CFA Franc BEAC','XAF','FCFA',1,1),
(34,'CFP Franc','XPF','₣',1,1),
(35,'Chilean Peso','CLP','$',1,1),
(36,'Chinese Yuan','CNY','¥',1,1),
(37,'Colombian Peso','COP','$',1,1),
(38,'Comorian Franc','KMF','CF',1,1),
(39,'Congolese Franc','CDF','FC',1,1),
(40,'Costa Rican ColÃ³n','CRC','₡',1,1),
(41,'Croatian Kuna','HRK','kn',1,1),
(42,'Cuban Convertible Peso','CUC','$, CUC',1,1),
(43,'Czech Republic Koruna','CZK','Kč',1,1),
(44,'Danish Krone','DKK','Kr.',1,1),
(45,'Djiboutian Franc','DJF','Fdj',1,1),
(46,'Dominican Peso','DOP','$',1,1),
(47,'East Caribbean Dollar','XCD','$',1,1),
(48,'Egyptian Pound','EGP','ج.م',1,1),
(49,'Eritrean Nakfa','ERN','Nfk',1,1),
(50,'Estonian Kroon','EEK','kr',1,1),
(51,'Ethiopian Birr','ETB','Nkf',1,1),
(52,'Euro','EUR','€',1,1),
(53,'Falkland Islands Pound','FKP','£',1,1),
(54,'Fijian Dollar','FJD','FJ$',1,1),
(55,'Gambian Dalasi','GMD','D',1,1),
(56,'Georgian Lari','GEL','ლ',1,1),
(57,'German Mark','DEM','DM',1,1),
(58,'Ghanaian Cedi','GHS','GH₵',1,1),
(59,'Gibraltar Pound','GIP','£',1,1),
(60,'Greek Drachma','GRD','₯, Δρχ, Δρ',1,1),
(61,'Guatemalan Quetzal','GTQ','Q',1,1),
(62,'Guinean Franc','GNF','FG',1,1),
(63,'Guyanaese Dollar','GYD','$',1,1),
(64,'Haitian Gourde','HTG','G',1,1),
(65,'Honduran Lempira','HNL','L',1,1),
(66,'Hong Kong Dollar','HKD','$',1,1),
(67,'Hungarian Forint','HUF','Ft',1,1),
(68,'Icelandic KrÃ³na','ISK','kr',1,1),
(69,'Indian Rupee','INR','₹',1,1),
(70,'Indonesian Rupiah','IDR','Rp',1,1),
(71,'Iranian Rial','IRR','﷼',1,1),
(72,'Iraqi Dinar','IQD','د.ع',1,1),
(73,'Israeli New Sheqel','ILS','₪',1,1),
(74,'Italian Lira','ITL','L,£',1,1),
(75,'Jamaican Dollar','JMD','J$',1,1),
(76,'Japanese Yen','JPY','¥',1,1),
(77,'Jordanian Dinar','JOD','ا.د',1,1),
(78,'Kazakhstani Tenge','KZT','лв',1,1),
(79,'Kenyan Shilling','KES','KSh',1,1),
(80,'Kuwaiti Dinar','KWD','ك.د',1,1),
(81,'Kyrgystani Som','KGS','лв',1,1),
(82,'Laotian Kip','LAK','₭',1,1),
(83,'Latvian Lats','LVL','Ls',0,0),
(84,'Lebanese Pound','LBP','£',1,1),
(85,'Lesotho Loti','LSL','L',1,1),
(86,'Liberian Dollar','LRD','$',1,1),
(87,'Libyan Dinar','LYD','د.ل',1,1),
(88,'Lithuanian Litas','LTL','Lt',0,0),
(89,'Macanese Pataca','MOP','$',1,1),
(90,'Macedonian Denar','MKD','ден',1,1),
(91,'Malagasy Ariary','MGA','Ar',1,1),
(92,'Malawian Kwacha','MWK','MK',1,1),
(93,'Malaysian Ringgit','MYR','RM',1,1),
(94,'Maldivian Rufiyaa','MVR','Rf',1,1),
(95,'Mauritanian Ouguiya','MRO','MRU',1,1),
(96,'Mauritian Rupee','MUR','₨',1,1),
(97,'Mexican Peso','MXN','$',1,1),
(98,'Moldovan Leu','MDL','L',1,1),
(99,'Mongolian Tugrik','MNT','₮',1,1),
(100,'Moroccan Dirham','MAD','MAD',1,1),
(101,'Mozambican Metical','MZM','MT',1,1),
(102,'Myanmar Kyat','MMK','K',1,1),
(103,'Namibian Dollar','NAD','$',1,1),
(104,'Nepalese Rupee','NPR','₨',1,1),
(105,'Netherlands Antillean Guilder','ANG','ƒ',1,1),
(106,'New Taiwan Dollar','TWD','$',1,1),
(107,'New Zealand Dollar','NZD','$',1,1),
(108,'Nicaraguan CÃ³rdoba','NIO','C$',1,1),
(109,'Nigerian Naira','NGN','₦',1,1),
(110,'North Korean Won','KPW','₩',0,0),
(111,'Norwegian Krone','NOK','kr',1,1),
(112,'Omani Rial','OMR','.ع.ر',0,0),
(113,'Pakistani Rupee','PKR','₨',1,1),
(114,'Panamanian Balboa','PAB','B/.',1,1),
(115,'Papua New Guinean Kina','PGK','K',1,1),
(116,'Paraguayan Guarani','PYG','₲',1,1),
(117,'Peruvian Nuevo Sol','PEN','S/.',1,1),
(118,'Philippine Peso','PHP','₱',1,1),
(119,'Polish Zloty','PLN','zł',1,1),
(120,'Qatari Rial','QAR','ق.ر',1,1),
(121,'Romanian Leu','RON','lei',1,1),
(122,'Russian Ruble','RUB','₽',1,1),
(123,'Rwandan Franc','RWF','FRw',1,1),
(124,'Salvadoran ColÃ³n','SVC','₡',0,0),
(125,'Samoan Tala','WST','SAT',1,1),
(126,'Saudi Riyal','SAR','﷼',1,1),
(127,'Serbian Dinar','RSD','din',1,1),
(128,'Seychellois Rupee','SCR','SRe',1,1),
(129,'Sierra Leonean Leone','SLL','Le',1,1),
(130,'Singapore Dollar','SGD','$',1,1),
(131,'Slovak Koruna','SKK','Sk',1,1),
(132,'Solomon Islands Dollar','SBD','Si$',1,1),
(133,'Somali Shilling','SOS','Sh.so.',1,1),
(134,'South African Rand','ZAR','R',1,1),
(135,'South Korean Won','KRW','₩',1,1),
(136,'Special Drawing Rights','XDR','SDR',1,1),
(137,'Sri Lankan Rupee','LKR','Rs',1,1),
(138,'St. Helena Pound','SHP','£',1,1),
(139,'Sudanese Pound','SDG','.س.ج',1,1),
(140,'Surinamese Dollar','SRD','$',1,1),
(141,'Swazi Lilangeni','SZL','E',1,1),
(142,'Swedish Krona','SEK','kr',1,1),
(143,'Swiss Franc','CHF','CHf',1,1),
(144,'Syrian Pound','SYP','LS',0,0),
(145,'São Tomé and Príncipe Dobra','STD','Db',1,1),
(146,'Tajikistani Somoni','TJS','SM',1,1),
(147,'Tanzanian Shilling','TZS','TSh',1,1),
(148,'Thai Baht','THB','฿',1,1),
(149,'Tongan pa\'anga','TOP','$',1,1),
(150,'Trinidad & Tobago Dollar','TTD','$',1,1),
(151,'Tunisian Dinar','TND','ت.د',1,1),
(152,'Turkish Lira','TRY','₺',1,1),
(153,'Turkmenistani Manat','TMT','T',1,1),
(154,'Ugandan Shilling','UGX','USh',1,1),
(155,'Ukrainian Hryvnia','UAH','₴',1,1),
(156,'United Arab Emirates Dirham','AED','إ.د',1,1),
(157,'Uruguayan Peso','UYU','$',1,1),
(158,'Afghan Afghani','AFA','؋',1,1),
(159,'Uzbekistan Som','UZS','лв',1,1),
(160,'Vanuatu Vatu','VUV','VT',1,1),
(161,'Venezuelan BolÃvar','VEF','Bs',0,0),
(162,'Vietnamese Dong','VND','₫',1,1),
(163,'Yemeni Rial','YER','﷼',1,1),
(164,'Zambian Kwacha','ZMK','ZK',1,1);

/*Table structure for table `enrol` */

DROP TABLE IF EXISTS `enrol`;

CREATE TABLE `enrol` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `enrol` */

insert  into `enrol`(`id`,`user_id`,`course_id`,`date_added`,`last_modified`) values 
(1,2,1,1751043600,NULL);

/*Table structure for table `frontend_settings` */

DROP TABLE IF EXISTS `frontend_settings`;

CREATE TABLE `frontend_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `frontend_settings` */

insert  into `frontend_settings`(`id`,`key`,`value`) values 
(1,'banner_title','Start Learning Earthquake and Tsunami Mitigation'),
(2,'banner_sub_title','InaTEX merupakan portal edukasi mitigasi gempabumi dan tsunami BMKG yang menyediakan materi edukasi dan database pelaksanaan kegiatan edukasi mitigasi gempabumi dan tsunami BMKG'),
(4,'about_us','<p></p><h2><span xss=removed>This is about us</span></h2><p><span xss=\"removed\">Welcome to Academy. It will help you to learn in a new ways</span></p>'),
(10,'terms_and_condition','<h2>Terms and Condition</h2>This is the Terms and condition page for your companys'),
(11,'privacy_policy','<p></p><p></p><h2><span xss=\"removed\">Privacy Policy</span><br></h2>This is the Privacy Policy page for your companys<p></p><p><b>This is another</b> <u><a href=\"https://youtube.com/watch?v=PHgc8Q6qTjc\" target=\"_blank\">thing you will</a></u> <span xss=\"removed\">not understand</span>.</p>'),
(13,'theme','default'),
(14,'cookie_note','This website uses cookies to personalize content and analyse traffic in order to offer you a better experience.'),
(15,'cookie_status','active'),
(16,'cookie_policy','<h1>Cookie policy</h1><ol><li>Cookies are small text files that can be used by websites to make a user\'s experience more efficient.</li><li>The law states that we can store cookies on your device if they are strictly necessary for the operation of this site. For all other types of cookies we need your permission.</li><li>This site uses different types of cookies. Some cookies are placed by third party services that appear on our pages.</li></ol>'),
(17,'banner_image','5a4555e3fddf8d686d7a66d3cc160c4c.jpg'),
(18,'light_logo','logo-light.png'),
(19,'dark_logo','3200dca98ebe9021d31c8cd58b5d995e.png'),
(20,'small_logo','logo-light-sm.png'),
(21,'favicon','cf9ad2ca65265e31795644dfe32958db.png'),
(22,'recaptcha_status','0'),
(23,'recaptcha_secretkey','Valid-secret-key'),
(24,'recaptcha_sitekey','Valid-site-key'),
(25,'refund_policy','<h2><span xss=\"removed\">Refund Policy</span></h2>'),
(26,'facebook','https://facebook.com'),
(27,'twitter','https://twitter.com'),
(28,'linkedin','https://linkedin.com'),
(31,'blog_page_title','Where possibilities begin'),
(32,'blog_page_subtitle','We’re a leading marketplace platform for learning and teaching online. Explore some of our most popular content and learn something new.'),
(33,'blog_page_banner','blog-page.png'),
(34,'instructors_blog_permission','0'),
(35,'blog_visibility_on_the_home_page','1');

/*Table structure for table `language` */

DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `phrase_id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase` longtext DEFAULT NULL,
  `english` longtext DEFAULT NULL,
  PRIMARY KEY (`phrase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `language` */

/*Table structure for table `lesson` */

DROP TABLE IF EXISTS `lesson`;

CREATE TABLE `lesson` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `video_type` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `lesson_type` varchar(255) DEFAULT NULL,
  `attachment` longtext DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  `is_free` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `video_type_for_mobile_application` varchar(255) DEFAULT NULL,
  `video_url_for_mobile_application` varchar(255) DEFAULT NULL,
  `duration_for_mobile_application` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lesson` */

insert  into `lesson`(`id`,`title`,`duration`,`course_id`,`section_id`,`video_type`,`video_url`,`date_added`,`last_modified`,`lesson_type`,`attachment`,`attachment_type`,`summary`,`is_free`,`order`,`video_type_for_mobile_application`,`video_url_for_mobile_application`,`duration_for_mobile_application`) values 
(4,'Tatanan Tektonik Jawa Barat',NULL,1,1,NULL,NULL,1751043600,NULL,'other','https://www.youtube.com/embed/LOphMzSaAto','iframe','&lt;p&gt;selamat belajar&lt;/p&gt;',0,0,NULL,NULL,NULL),
(5,'buat peta evakuasi mandiri','00:00:00',1,1,NULL,NULL,1751043600,NULL,'quiz',NULL,NULL,'buat peta evakuasi mandiri',0,0,NULL,NULL,NULL),
(6,'tes dokumen ',NULL,1,1,NULL,NULL,1751043600,NULL,'other','1392a4e8ae0eb14b8b22e487b63b2676.pdf','pdf','',1,0,NULL,NULL,NULL);

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `from` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `log` */

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_thread_code` longtext DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `sender` longtext DEFAULT NULL,
  `timestamp` longtext DEFAULT NULL,
  `read_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `message` */

insert  into `message`(`message_id`,`message_thread_code`,`message`,`sender`,`timestamp`,`read_status`) values 
(1,'90c43ca51906829','test kirim pesan','2','1751083578',1),
(2,'90c43ca51906829','pesan diterima','1','1751083604',1);

/*Table structure for table `message_thread` */

DROP TABLE IF EXISTS `message_thread`;

CREATE TABLE `message_thread` (
  `message_thread_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_thread_code` longtext DEFAULT NULL,
  `sender` varchar(255) DEFAULT '',
  `receiver` varchar(255) DEFAULT '',
  `last_message_timestamp` longtext DEFAULT NULL,
  PRIMARY KEY (`message_thread_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `message_thread` */

insert  into `message_thread`(`message_thread_id`,`message_thread_code`,`sender`,`receiver`,`last_message_timestamp`) values 
(1,'90c43ca51906829','2','1',NULL);

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `admin_revenue` varchar(255) DEFAULT NULL,
  `instructor_revenue` varchar(255) DEFAULT NULL,
  `instructor_payment_status` int(11) DEFAULT 0,
  `transaction_id` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `coupon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `payment` */

/*Table structure for table `payout` */

DROP TABLE IF EXISTS `payout`;

CREATE TABLE `payout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `payout` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `permissions` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `permissions` */

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `number_of_options` int(11) DEFAULT NULL,
  `options` longtext DEFAULT NULL,
  `correct_answers` longtext DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `question` */

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rating` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ratable_id` int(11) DEFAULT NULL,
  `ratable_type` varchar(50) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `rating` */

insert  into `rating`(`id`,`rating`,`user_id`,`ratable_id`,`ratable_type`,`date_added`,`last_modified`,`review`) values 
(1,3,2,1,'course',1751043600,NULL,'pelatihan ini sangat bagus');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`date_added`,`last_modified`) values 
(1,'Admin',1234567890,1234567890),
(2,'User',1234567890,1234567890);

/*Table structure for table `section` */

DROP TABLE IF EXISTS `section`;

CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `section` */

insert  into `section`(`id`,`title`,`course_id`,`order`) values 
(1,'Pendahuluan',1,0);

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `settings` */

insert  into `settings`(`id`,`key`,`value`) values 
(1,'language','indonesia'),
(2,'system_name','inaTEX'),
(3,'system_title','INATEX-BMKG'),
(4,'system_email','melki.adi.kurniawan@bmkg.go.id'),
(5,'address','Kemayoran, Jakarta'),
(6,'phone','021-xxxxxx'),
(7,'purchase_code','your-purchase-code'),
(10,'youtube_api_key','youtube-api-key'),
(11,'vimeo_api_key','vimeo-api-key'),
(12,'slogan','Mitigasi Gempabumi dan Tsunami'),
(13,'text_align',NULL),
(14,'allow_instructor','1'),
(15,'instructor_revenue','70'),
(16,'system_currency','USD'),
(17,'paypal_currency','USD'),
(18,'stripe_currency','USD'),
(19,'author','Direktorat Gempabumi dan Tsunami'),
(20,'currency_position','left'),
(21,'website_description','Tsunami Ready! '),
(22,'website_keywords','LMS,Learning Management System,Creativeitem,demo,hello,How are you,inatex ,bmkg'),
(23,'footer_text',''),
(24,'footer_link','inatews.bmkg.go.id'),
(25,'protocol','smtp'),
(26,'smtp_host','ssl://smtp.gmail.com'),
(27,'smtp_port','465'),
(28,'smtp_user','Your-email'),
(29,'smtp_pass','Your-email-password'),
(30,'version','5.6'),
(31,'student_email_verification','disable'),
(32,'instructor_application_note','Fill all the fields carefully and share if you want to share any document with us it will help us to evaluate you as an instructor.'),
(33,'razorpay_keys','[{\"active\":\"1\",\"key\":\"rzp_test_J60bqBOi1z1aF5\",\"secret_key\":\"uk935K7p4j96UCJgHK8kAU4q\",\"theme_color\":\"#c7a600\"}]'),
(34,'razorpay_currency','USD'),
(35,'fb_app_id','facebook-app-id'),
(36,'fb_app_secret','facebook-app-secret-key'),
(37,'fb_social_login','0'),
(38,'drip_content_settings','{\"lesson_completion_role\":\"percentage\",\"minimum_duration\":10,\"minimum_percentage\":\"50\",\"locked_lesson_message\":\"&lt;h3 xss=&quot;removed&quot; style=&quot;text-align: center; &quot;&gt;&lt;span xss=&quot;removed&quot;&gt;&lt;strong&gt;Permission denied!&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/h3&gt;&lt;p xss=&quot;removed&quot; style=&quot;text-align: center; &quot;&gt;&lt;span xss=&quot;removed&quot;&gt;This course supports drip content, so you must complete the previous lessons.&lt;\\/span&gt;&lt;\\/p&gt;\"}'),
(39,'certificate_template','This is to certify that Mr. / Ms. {student} successfully completed the course with on certificate for {course}.'),
(40,'certificate-text-positons','\n     \n      \n      \n      &lt;div class=&quot;this-template&quot; style=&quot;width: 750px; position: relative;&quot;&gt;\n       &lt;img width=&quot;100%&quot; src=&quot;..\\..\\uploads/certificates/template.jpg&quot;&gt;\n        &lt;div class=&quot;draggable student_name&quot; style=&quot;position: absolute; font-family: Italianno, cursive; font-size: 25px; top: 390px; left: 63px;&quot;&gt;{student}&lt;/div&gt;\n       &lt;div class=&quot;draggable course_completion_date&quot; style=&quot;position: absolute; font-family: Italianno, cursive; font-size: 25px; top: 389px; left: 559px;&quot;&gt;{date}&lt;/div&gt;\n       &lt;div class=&quot;draggable certificate_text&quot; style=&quot;position: absolute; width: 500px; text-align: center; font-size: 20px; top: 230px; left: 123px;&quot;&gt;This is to certify that Mr. / Ms. {student} successfully completed the course with on certificate for {course}.&lt;/div&gt;\n       &lt;div class=&quot;draggable qrCode&quot; style=&quot;position: absolute; width: 65px; height: 65px; text-align: center; font-size: 20px; top: 306px; left: 338px;&quot;&gt;&lt;p style=&quot;text-align: center; padding: 4px 0px;&quot;&gt;Qr code&lt;/p&gt;&lt;/div&gt;\n     &lt;/div&gt;\n                '),
(41,'course_accessibility','publicly');

/*Table structure for table `tag` */

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) DEFAULT NULL,
  `tagable_id` int(11) DEFAULT NULL,
  `tagable_type` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tag` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `skills` longtext NOT NULL,
  `social_links` longtext DEFAULT NULL,
  `biography` longtext DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `wishlist` longtext DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `payment_keys` longtext NOT NULL,
  `verification_code` longtext DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_instructor` int(11) DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`first_name`,`last_name`,`email`,`password`,`skills`,`social_links`,`biography`,`role_id`,`date_added`,`last_modified`,`wishlist`,`title`,`payment_keys`,`verification_code`,`status`,`is_instructor`,`image`) values 
(1,'admin1','admin1','melki.bmkg.1989@gmail.com','6cb97fdc2b850e9bc8c00aee18ca1555007d2fe3','','{\"facebook\":\"\",\"twitter\":\"\",\"linkedin\":\"\"}',NULL,1,NULL,NULL,NULL,NULL,'',NULL,1,1,NULL),
(2,'user1','user1','melki.adi.kurniawan@bmkg.go.id','f95365af1fe311652c3567c2aac8b0873b656466','','{\"facebook\":\"\",\"twitter\":\"\",\"linkedin\":\"\"}',NULL,2,1751082894,NULL,'[]',NULL,'{\"paypal\":{\"production_client_id\":\"\",\"production_secret_key\":\"\"},\"stripe\":{\"public_live_key\":\"\",\"secret_live_key\":\"\"},\"razorpay\":{\"key_id\":\"\",\"secret_key\":\"\"}}','187941',1,0,NULL),
(3,'admin2','admin2','admin@gmail.com','427858e9e9486fa496d3227b831a0874690a42a4','','{\"facebook\":\"\",\"twitter\":\"\",\"linkedin\":\"\"}',NULL,1,NULL,NULL,NULL,NULL,'',NULL,1,1,NULL);

/*Table structure for table `watch_histories` */

DROP TABLE IF EXISTS `watch_histories`;

CREATE TABLE `watch_histories` (
  `watch_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `completed_lesson` longtext NOT NULL,
  `course_progress` int(11) NOT NULL,
  `watching_lesson_id` int(11) NOT NULL,
  `quiz_result` longtext NOT NULL,
  `date_added` varchar(100) DEFAULT NULL,
  `date_updated` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`watch_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `watch_histories` */

insert  into `watch_histories`(`watch_history_id`,`course_id`,`student_id`,`completed_lesson`,`course_progress`,`watching_lesson_id`,`quiz_result`,`date_added`,`date_updated`) values 
(1,1,1,'',0,4,'','1750703699','1751083385'),
(2,1,2,'[\"4\",\"5\",\"6\"]',100,6,'','1751082983','1752650212');

/*Table structure for table `watched_duration` */

DROP TABLE IF EXISTS `watched_duration`;

CREATE TABLE `watched_duration` (
  `watched_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `watched_student_id` int(11) DEFAULT NULL,
  `watched_course_id` int(11) DEFAULT NULL,
  `watched_lesson_id` int(11) DEFAULT NULL,
  `watched_counter` longtext DEFAULT NULL,
  PRIMARY KEY (`watched_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `watched_duration` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
