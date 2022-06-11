/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 10.4.24-MariaDB : Database - tyba
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tyba` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `tyba`;

/*Table structure for table `restaurants` */

DROP TABLE IF EXISTS `restaurants`;

CREATE TABLE `restaurants` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `city` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `restaurants` */

insert  into `restaurants`(`id`,`city`,`restaurant`) values 
(1,'villavicencio','fierros'),
(2,'villavicencio','penhouse paisa'),
(3,'villavicencio','burguer pop'),
(4,'bogota','Ichiland Made Café'),
(5,'bogota','La Mesa de Papel'),
(6,'bogota','Full 80’s\r\n'),
(7,'bogota','Rock’N Stop Diner'),
(8,'bogota','Kathmandu, elixir del Oriente\r\n'),
(9,'villavicencio','limoncelo'),
(10,'villavicencio','Barbacoa latina');

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tipo_tarjeta` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `digitos` int(4) NOT NULL,
  `aprobada` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transactions` */

insert  into `transactions`(`id`,`tipo_tarjeta`,`digitos`,`aprobada`) values 
(1,'visa',123,0),
(2,'mastercard',567,0),
(3,'express',890,0);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clave` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`usuario`,`clave`) values 
(1,'manuel','f0a5f4d7846b749827ef688200aa8061'),
(2,'manuel','e88febd1ea904f224c3a79f5ddd8aa89'),
(6,'juan','1e6e62234f10a0cfdc0691c673213066');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
