# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.14)
# Database: desi_bank_db
# Generation Time: 2014-11-17 21:13:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table customer_question_answer_tbl
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_question_answer_tbl`;

CREATE TABLE `customer_question_answer_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `customer_question_answer_tbl` WRITE;
/*!40000 ALTER TABLE `customer_question_answer_tbl` DISABLE KEYS */;

INSERT INTO `customer_question_answer_tbl` (`id`, `userid`, `question`, `answer`)
VALUES
	(3,'98','What is the name of your first crush?','sd'),
	(4,'59','What is the name of your childhood hero?','wef'),
	(5,'97','What is the name of your childhood hero?','asdf'),
	(6,'54','What is your birth place?','madu'),
	(7,'54','What is the name of your childhood hero?','rdj');

/*!40000 ALTER TABLE `customer_question_answer_tbl` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_security_questions_tbl
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_security_questions_tbl`;

CREATE TABLE `customer_security_questions_tbl` (
  `qid` int(5) DEFAULT NULL,
  `questions` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `customer_security_questions_tbl` WRITE;
/*!40000 ALTER TABLE `customer_security_questions_tbl` DISABLE KEYS */;

INSERT INTO `customer_security_questions_tbl` (`qid`, `questions`)
VALUES
	(1,'What is your birth place?'),
	(2,'What is your mother\'s maiden name?'),
	(3,'What is your favourite author\'s name?'),
	(4,'What is your pet name?'),
	(5,'What is your favourite soccer team?'),
	(6,'What is the name of your childhood hero?'),
	(7,'What is your father\'s middle name?'),
	(8,'What is the name of your first crush?'),
	(9,'What was the name of your first school?'),
	(10,'What is your favourite vacation spot?');

/*!40000 ALTER TABLE `customer_security_questions_tbl` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
