/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.19 : Database - gzb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `gzb`;

/*Table structure for table `images` */

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '标题',
  `info` varchar(100) DEFAULT NULL COMMENT '描述',
  `date` varchar(20) NOT NULL COMMENT '录入时间',
  `data` mediumblob NOT NULL COMMENT '图片信息',
  `imagetype` varchar(20) NOT NULL COMMENT '图片类型',
  `type` int(11) NOT NULL COMMENT '图片目录ID',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '状态：0正常，1作废',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `images` */

LOCK TABLES `images` WRITE;

UNLOCK TABLES;

/*Table structure for table `imagetype` */

DROP TABLE IF EXISTS `imagetype`;

CREATE TABLE `imagetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '分类名',
  `info` varchar(100) DEFAULT NULL COMMENT '说明',
  `parentid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `imagetype` */

LOCK TABLES `imagetype` WRITE;

insert  into `imagetype`(`id`,`name`,`info`,`parentid`) values (1,'12年','',0),(2,'13年','',0),(3,'1月','',1);

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `registdate` varchar(20) NOT NULL,
  `modifydate` varchar(20) DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

LOCK TABLES `user` WRITE;

insert  into `user`(`id`,`uid`,`name`,`email`,`password`,`username`,`registdate`,`modifydate`,`flag`) values (1,'c0ea8eef-e4a7-490c-ac87-33f2ba3727b2','dyong','dyong525@163.com','456','dyong','2011-10-24 11:25:05','2013-05-24 09:38:10',0),(2,'6bdd28e8-701f-4215-afd9-3c4c8756f007','dyong525','dyong525@163.com','123','DY','2011-10-24 11:25:37',NULL,-1),(3,'3c517f91-65f4-4b55-88b9-58eb965ff935','dyong5','dyong525@163.com','123','DY','2011-10-24 11:27:49',NULL,0),(4,'867f0baf-b615-4d75-bdc5-062327753b0f','ffg','f','111','ff','2013-04-19 15:47:16','2013-04-19 15:52:28',0);

UNLOCK TABLES;

/*Table structure for table `yd_module` */

DROP TABLE IF EXISTS `yd_module`;

CREATE TABLE `yd_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '模块名',
  `url` varchar(100) DEFAULT NULL COMMENT '链接地址',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '模块类型：目录1，文件2',
  `parentid` int(11) NOT NULL DEFAULT '0' COMMENT '上级模块ID',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态：启用1，作废-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `yd_module` */

LOCK TABLES `yd_module` WRITE;

insert  into `yd_module`(`id`,`name`,`url`,`type`,`parentid`,`state`) values (1,'用户权限管理','',1,0,1),(2,'模块管理','',1,1,1),(3,'角色管理','',1,1,1),(4,'用户角色管理','',1,1,1),(5,'用户管理','',1,1,1),(6,'模块添加','module!add.do',2,2,1),(7,'模块列表','module!list.do',2,2,1),(8,'角色添加','rolse!add.do',2,3,1),(9,'角色列表','rolse!list.do',2,3,1),(10,'用户角色分配','userinfo!add.do',2,4,1),(11,'用户角色列表','userinfo!list.do',2,4,1),(12,'安全退出','index!loginout.do',2,1,-1),(13,'密码修改','user!pwd.do',2,1,1),(14,'用户添加','user!add.do',2,5,1),(15,'用户列表','user!list.do',2,5,1),(17,'照片管理','',1,0,1),(16,'添加相册','imgtype!add.do',2,18,1),(18,'相册管理','',1,17,1),(19,'照片集','',1,17,1),(20,'相册列表','imgtype!list.do',2,18,1),(21,'照片添加','images!add.do',2,19,1),(22,'照片集列表','images!list.do',2,19,1);

UNLOCK TABLES;

/*Table structure for table `yd_rolse` */

DROP TABLE IF EXISTS `yd_rolse`;

CREATE TABLE `yd_rolse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolse` varchar(32) NOT NULL COMMENT '角色名',
  `info` varchar(500) DEFAULT NULL COMMENT '角色介绍',
  `modules` varchar(200) NOT NULL COMMENT '包含的模块ID，用,分割',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态：启用1，作废-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `yd_rolse` */

LOCK TABLES `yd_rolse` WRITE;

insert  into `yd_rolse`(`id`,`rolse`,`info`,`modules`,`state`) values (1,'普通员工','普通员工','2,3,4,5,6,11',1),(2,'管理员','管理员','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15',1);

UNLOCK TABLES;

/*Table structure for table `yd_userinfo` */

DROP TABLE IF EXISTS `yd_userinfo`;

CREATE TABLE `yd_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `rolses` varchar(100) NOT NULL COMMENT '用户角色列表',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态：启用1，作废-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `yd_userinfo` */

LOCK TABLES `yd_userinfo` WRITE;

insert  into `yd_userinfo`(`id`,`userid`,`rolses`,`state`) values (1,1,'1,2',1);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
