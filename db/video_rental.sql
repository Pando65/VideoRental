# ************************************************************
# Sequel Pro SQL dump
# Versión 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.24)
# Base de datos: videorental
# Tiempo de Generación: 2015-05-16 16:51:53 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla directors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `directors`;

CREATE TABLE `directors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `directorNo` char(5) NOT NULL,
  `DirectorName` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8;

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;

INSERT INTO `directors` (`id`, `directorNo`, `DirectorName`)
VALUES
	(1004,'D0078','Stephen Herek'),
	(1005,'D1001','Roger Spottiswoode'),
	(1006,'D3765','Jane Emmerick'),
	(1007,'D4576','John Woo'),
	(1008,'D5743','Michael Bay'),
	(1009,'D7834','Sally Nichols');

/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fName` varchar(15) NOT NULL,
  `lName` varchar(15) NOT NULL,
  `sex` char(1) NOT NULL,
  `DOB` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `dateJoined` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;

INSERT INTO `members` (`id`, `fName`, `lName`, `sex`, `DOB`, `address`, `dateJoined`)
VALUES
	(1,'Karen','Parker','F','1972-02-22','22 Greenway Drive, Glasw, G12 8DS','1991-01-06'),
	(2,'Gillian','Peters','F','1954-03-09','89 Redmond Road, Glasw, G11 9YR','1995-04-19'),
	(3,'Bob','Adams','M','1974-11-15','57 Littleway Road, Glasw, G3 6DS','1998-01-06'),
	(4,'Don','Nelson','M','1951-12-12','123 Suffolk Lane,Glasw, G15 1RC','2000-04-07'),
	(5,'Lorna','Smith','F','1972-01-01','Flat 5A London Road, Glasw, G3','1998-01-11'),
	(6,'Dan','White','M','1960-05-05','200 Great Western Road, Glasw, G11 9JJ','2001-05-05'),
	(7,'Omar','Manjarrez','M','1995-06-06','masdms','2015-09-16');

/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla rentalagreements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rentalagreements`;

CREATE TABLE `rentalagreements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `videoforrent_id` int(11) NOT NULL,
  `dateOut` date NOT NULL,
  `dateReturn` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `videoforrent_id` (`videoforrent_id`),
  CONSTRAINT `rentalagreements_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `rentalagreements_ibfk_2` FOREIGN KEY (`videoforrent_id`) REFERENCES `videoforrents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `rentalagreements` WRITE;
/*!40000 ALTER TABLE `rentalagreements` DISABLE KEYS */;

INSERT INTO `rentalagreements` (`id`, `member_id`, `videoforrent_id`, `dateOut`, `dateReturn`)
VALUES
	(1,1,2,'2000-02-05','2000-02-07');

/*!40000 ALTER TABLE `rentalagreements` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla videoforrents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `videoforrents`;

CREATE TABLE `videoforrents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `videoforrents_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `videoforrents` WRITE;
/*!40000 ALTER TABLE `videoforrents` DISABLE KEYS */;

INSERT INTO `videoforrents` (`id`, `available`, `video_id`)
VALUES
	(2,0,4),
	(3,1,1),
	(4,1,2),
	(5,1,6),
	(6,1,4),
	(7,1,1),
	(8,1,1),
	(9,1,5);

/*!40000 ALTER TABLE `videoforrents` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla videos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `videos`;

CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `certificate` varchar(10) DEFAULT NULL,
  `category` varchar(10) DEFAULT NULL,
  `dailyRental` decimal(8,2) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `director_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `director_id` (`director_id`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;

INSERT INTO `videos` (`id`, `title`, `certificate`, `category`, `dailyRental`, `price`, `director_id`)
VALUES
	(1,'Tomorrow Never Dies','12','Action',5.00,21.99,1005),
	(2,'Face/Off','12','Thriller',5.00,31.99,1007),
	(3,'The Rock','18','Action',4.00,29.99,1007),
	(4,'Independence Day','PG','Sci-Fi',4.50,32.99,1006),
	(5,'101 Dalmatians','U','Children',4.00,18.50,1004),
	(6,'Primary Colors','U','Comedy',4.50,14.50,1009);

/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
