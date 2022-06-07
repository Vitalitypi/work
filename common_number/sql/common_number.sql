/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.29 : Database - common_number
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`common_number` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `common_number`;

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  `goods` varchar(100) NOT NULL,
  `other` varchar(100) DEFAULT NULL,
  `order_time` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `order` */

insert  into `order`(`order_id`,`money`,`goods`,`other`,`order_time`) values 
(0,10000,'computer','','2022-06-07 10:25:12'),
(1,100,'books',' ','2022-06-06 00:00:00'),
(2,50,'flowers',' ','2022-06-05 00:00:00'),
(3,150,'foods',' ','2022-06-07 10:15:44'),
(4,200,'peer',' ','2022-06-07 10:16:16'),
(5,2000,'iphone',' ','2022-06-07 10:16:42');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `pass_word` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_user_name_uindex` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`pass_word`) values 
(0,'zlp','123'),
(1,'zjn','aaa'),
(2,'dby','bbb'),
(3,'zh','ccc');

/*Table structure for table `user_order` */

DROP TABLE IF EXISTS `user_order`;

CREATE TABLE `user_order` (
  `user_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_time` datetime NOT NULL,
  PRIMARY KEY (`user_order_id`),
  KEY `user_order___fk_order_id` (`order_id`),
  KEY `user_order___fk_user` (`user_id`),
  CONSTRAINT `user_order___fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `user_order___fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_order` */

insert  into `user_order`(`user_order_id`,`user_id`,`order_id`,`order_time`) values 
(1,1,1,'2022-06-06 00:00:00'),
(2,2,2,'2022-06-05 00:00:00'),
(3,3,3,'2022-06-07 10:15:44'),
(4,1,4,'2022-06-07 10:16:16'),
(5,2,5,'2022-06-07 10:16:42'),
(6,3,0,'2022-06-07 10:25:12');

/*Table structure for table `user_tree` */

DROP TABLE IF EXISTS `user_tree`;

CREATE TABLE `user_tree` (
  `tree_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_node` int(11) NOT NULL,
  `son_node` int(11) NOT NULL,
  PRIMARY KEY (`tree_id`),
  KEY `user_tree___fk_parent` (`parent_node`),
  KEY `user_tree___fk_son` (`son_node`),
  CONSTRAINT `user_tree___fk_parent` FOREIGN KEY (`parent_node`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_tree___fk_son` FOREIGN KEY (`son_node`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_tree` */

insert  into `user_tree`(`tree_id`,`parent_node`,`son_node`) values 
(1,0,1),
(2,0,2),
(3,2,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
