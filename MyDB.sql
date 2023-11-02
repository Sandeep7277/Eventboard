/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.28 : Database - eventboard
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`eventboard` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `eventboard`;

/*Table structure for table `bookedevent` */

DROP TABLE IF EXISTS `bookedevent`;

CREATE TABLE `bookedevent` (
  `eventid` int NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`eventid`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bookedevent` */

insert  into `bookedevent`(`eventid`,`id`) values 
(2,20352032),
(2,20352050),
(2,20352061),
(3,20352050),
(3,20352061),
(4,20352050),
(7,20352050),
(7,20352061),
(10,20352050);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `catid` int NOT NULL AUTO_INCREMENT,
  `catname` varchar(100) NOT NULL,
  PRIMARY KEY (`catid`,`catname`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`catid`,`catname`) values 
(1,'Fresher\'s Party'),
(2,'Fairwell Party'),
(3,'Blood Donation Camp'),
(4,'Sports'),
(5,'Workshop'),
(6,'Seminar'),
(7,'Academic Results'),
(8,'Project Viva'),
(9,'exam');

/*Table structure for table `events` */

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `eventid` int NOT NULL AUTO_INCREMENT,
  `descr` varchar(250) NOT NULL,
  `catid` int NOT NULL,
  `startdate` date NOT NULL,
  `endate` date NOT NULL,
  `starttime` varchar(20) NOT NULL,
  `endtime` varchar(20) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'scheduled',
  `fees` int NOT NULL,
  PRIMARY KEY (`eventid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `events` */

insert  into `events`(`eventid`,`descr`,`catid`,`startdate`,`endate`,`starttime`,`endtime`,`photo`,`status`,`fees`) values 
(1,'1st year MCA Fresher Party has been organized in Department Cultural hall',1,'2022-07-01','2022-07-01','10:00','4:00','freaher party.jpg','canceled',200),
(2,'Blood Donation Camp is going to organized in computer science department.',3,'2022-06-30','2022-06-30','10:00','4:00','blood donation camp.jpg','scheduled',0),
(3,'MCA 2nd Year Farewell party has been organized in department cultural hall',2,'2022-06-15','2022-06-15','10:00','4:00','Farewell-Party.jpg','scheduled',100),
(4,'Cricket Match Tournament has been organized in Rajiv Gandhi Stadium, Interested Student participate in this tournament.  ',4,'2022-07-25','2022-07-31','08:00','4:00','cricket.jpg','scheduled',1000),
(5,'MCA 3rd Year Farewell party has been organized in department Cultural hall ',2,'2022-06-20','2022-06-20','10:00','4:00','farewell 2.jpg','scheduled',200),
(6,'Hockey Tournament has been organized in Rajiv Gandhi Stadium. Interested student can participate in this tournament.',4,'2022-07-20','2022-06-25','08:00','4:00','hocky.jpg','scheduled',500),
(7,'Python workshop has been organized in computer science department. All CS department students can participate in this workshop.',5,'2022-06-20','2022-06-20','10:00','2:00','Workshops.jpg','scheduled',0),
(8,'A Seminar has been organized in CS Department. All student can participate in this seminar.',6,'2022-06-22','2022-06-22','10:00','4:00','seminars1.jpg','scheduled',0),
(9,'MCA 3rd Semester result has been declare soon..',7,'2022-06-08','2022-06-08','10:00','10:00','results.jpg','scheduled',0),
(10,'2nd year MCA project viva exam scheduled ',8,'2022-06-08','2022-06-09','10:00','4:00','Screenshot (1600).png','scheduled',0);

/*Table structure for table `students` */

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `rollno` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `students` */

insert  into `students`(`rollno`,`name`,`city`,`course`,`email`,`phone`) values 
(20352001,'ADARSH T K','Kerala','MCA','20352001@pondiuni.ac.in','871448488'),
(20352002,'ADHITHYA HARSHAN K','Tamilnadu','MCA','20352002@pondiuni.ac.in','9698879824'),
(20352004,'AHAMMED AKDHAM N','Kerala','MCA','20352004@pondiuni.ac.in','8086476256'),
(20352006,'AKSHAYA E','Kerala','MCA','20352006@pondiuni.ac.in','8086073789'),
(20352007,'ANKIT KUMAR','Bihar','MCA','20352007@pondiuni.ac.in','8507642735'),
(20352008,'ANUJ KUMAR','Bihar','MCA','20352008@pondiuni.ac.in','8409553315'),
(20352009,'ANURAG KUMAR','Bihar','MCA','20352009@pondiuni.ac.in','8873598830'),
(20352010,'ANWESHA CHAKRAVARTY','West Bengal','MCA','20352010@pondiuni.ac.in','8902229715'),
(20352012,'ARCHANA A','pondicherry','MCA','20352012@pondiuni.ac.in','7598615375'),
(20352013,'ASHWIN P','Kerala','MCA','20352013@pondiuni.ac.in','7025036037'),
(20352014,'BALMUKUND KUMAR','Bihar','MCA','20352014@pondiuni.ac.in','7631354071'),
(20352015,'BEBITOVA MAMAJAN SEMEDOVNA','Turkmenistan','MCA','20352015@pondiuni.ac.in','9110255206'),
(20352016,'DHIVYA M','Pondicherry','MCA','20352016@pondiuni.ac.in','6380404503'),
(20352017,'GANGUMALLA CHANDRA DURGA SIVAPARVATI','Andra','MCA','20352017@pondiuni.ac.in','8368502328'),
(20352018,'GAYATHIRI A','Pondicherry','MCA','20352018@pondiuni.ac.in','8903354569'),
(20352019,'HAROON SIDHEEKHI K T','Kerala','MCA','20352019@pondiuni.ac.in','8129618183'),
(20352020,'JEEVIGUNTA DHEERAJ KUMAR','Andra','MCA','20352020@pondiuni.ac.in','6309393135'),
(20352021,'JISHNA K','Kerala','MCA','20352021@pondiuni.ac.in','8330892787'),
(20352022,'JOSEPH IRUDAYARAJ FRANCIS','Pondicherry','MCA','20352022@pondiuni.ac.in','8072963024'),
(20352023,'JYOTIPRAKASH ROUL','orisha','MCA','20352023@pondiuni.ac.in','8984300514'),
(20352024,'KEERTHIVASAN H','Pondicherry','MCA','20352024@pondiuni.ac.in','7339631738'),
(20352026,'KRISDAPYRTO KHONGLAH','Meghalaya','MCA','20352026@pondiuni.ac.in','7085283247'),
(20352027,'KUNTAL SARKAR','West Bengal','MCA','20352027@pondiuni.ac.in','8116763585'),
(20352028,'LALDINSANGA C','Manipur','MCA','20352028@pondiuni.ac.in','8118933945'),
(20352029,'MANIKANDAN M','Pondicherry','MCA','20352029@pondiuni.ac.in','7448777872'),
(20352030,'MANTHRESH R','Pondicherry','MCA','20352030@pondiuni.ac.in','9840387317'),
(20352031,'MARUTHANAYAGAM','Pondicherry','MCA','20352031@pondiuni.ac.in','8300367010'),
(20352032,'MAYANK PRIYDARSHI','Bihar','MCA','20352032@pondiuni.ac.in','8651313464'),
(20352033,'MOHAMMED ATIF ANSARI','Madhya Pardesh','MCA','20352033@pondiuni.ac.in','7470693743'),
(20352034,'MOHAMMED FASIL V','Kerala','MCA','20352034@pondiuni.ac.in','8593984251'),
(20352035,'MOHAMMED HISHAM','Kerala','MCA','20352035@pondiuni.ac.in','8547025425'),
(20352036,'MUHAMMED YASIR V','Kerala','MCA','20352036@pondiuni.ac.in','9495778412'),
(20352037,'NAVEENKUMAR S','Tamil Nadu','MCA','20352037@pondiuni.ac.in','7708712339'),
(20352038,'NIRANJAN A','Tamil Nadu','MCA','20352038@pondiuni.ac.in','9894488771'),
(20352039,'NISHANT KUMAR','Bihar','MCA','20352039@pondiuni.ac.in','8210529989'),
(20352040,'PADMA M','Pondicherry','MCA','20352040@pondiuni.ac.in','6381853279'),
(20352041,'PREETHINA','Kerala','MCA','20352041@pondiuni.ac.in','9544229713'),
(20352042,'PURNIMA AGARWAL','West Bengal','MCA','20352042@pondiuni.ac.in','9123326120'),
(20352043,'RAHUL SAHA','West Bengal','MCA','20352043@pondiuni.ac.in','9679165255'),
(20352046,'RISHIVEL RAKESH R','Pondicherry','MCA','20352046@pondiuni.ac.in','7305394240'),
(20352047,'ROSHNARA MOHAMMED ALI','Kerala','MCA','20352047@pondiuni.ac.in','7909110092'),
(20352048,'SAHIL KUMAR','Bihar','MCA','20352048@pondiuni.ac.in','9523923180'),
(20352049,'SANDEEP KUMAR','Bihar','MCA','20352049@pondiuni.ac.in','7277292815'),
(20352050,'SANDEEP KUMAR','Jamui','MCA','sss72778895@gmail.com','7277889519'),
(20352052,'SANJEEV KUMAR SHRIVASTWA','Bihar','MCA','20352052@pondiuni.ac.in','8709818848'),
(20352053,'SATHESH S','Pondicherry','MCA','20352053@pondiuni.ac.in','7092896204'),
(20352054,'SATISH K','Tamil Nadu','MCA','20352054@pondiuni.ac.in','9025403353'),
(20352055,'SEHABUDDIN S K','West Bengal','MCA','20352055@pondiuni.ac.in','9647188065'),
(20352056,'SIVAKUMAR R','Kerala','MCA','20352056@pondiuni.ac.in','9539123525'),
(20352057,'SONIYA G','Pondicherry','MCA','20352057@pondiuni.ac.in','7448609782'),
(20352058,'SOUMABHA CHAKRABORTY','West Bengal','MCA','20352058@pondiuni.ac.in','9163617178'),
(20352059,'SRUTHI O T','Kerala','MCA','20352059@pondiuni.ac.in','9656149957'),
(20352061,'TRISHA AGARWAL','West Bengal','MCA','20352061@pondiuni.ac.in','8336906341'),
(20352062,'VAIRAMUTHU M','Pondicherry','MCA','20352062@pondiuni.ac.in','9791417141'),
(20352063,'VANLAWMA R','Manipur','MCA','20352063@pondiuni.ac.in','8413946035'),
(20352064,'VASANTHARAJAN M','Pondicherry','MCA','20352064@pondiuni.ac.in','7904861241'),
(20352065,'VIDHYASAGAR S','Pondicherry','MCA','20352065@pondiuni.ac.in','9123540014'),
(20352067,'YUVARAJ K','Pondicherry','MCA','20352067@pondiuni.ac.in','7904753909');

/*Table structure for table `teachers` */

DROP TABLE IF EXISTS `teachers`;

CREATE TABLE `teachers` (
  `tid` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `teachers` */

insert  into `teachers`(`tid`,`name`,`city`,`designation`,`email`,`phone`) values 
(1001,'Dr. S. Sivasathya','Pondicherry','HOD','ssivasathya@gmail.com','+91 4132654518'),
(1002,'Dr. Subramanian','Pondicherry','Professor','rsmanian.csc@pondiuni.edu.in','+91 4132654452'),
(1003,'Dr. T. Chithralekha','Pondicherry','Professor','tchithralekha.csc@pondiuni.edu.in','+91 4132654930'),
(1004,'Dr. K. Suresh Joseph','Pondicherry','Associate Professor','ksjoseph.csc@pondiuni.edu.in','+91 4132654420'),
(1005,'Dr. S. Ravi','Pondicherry','Associate Professor','sravicite@gmail.com','+91 4132654480'),
(1006,'Dr. S. K. V. Jayakumar','Pondicherry','Associate Professor','skvjey@gmail.com','+91 4132654990'),
(1007,'Dr. M. Nandhini','Pondicherry','Associate Professor','mnandhini.csc@pondiuni.edu.in','+91 4132654494'),
(1008,'R. P. Seenivasan','Pondicherry','Assistant Professor','rpseenivasan.csc@pondiuni.edu.in','+91 4132654517'),
(1009,'Dr. K. Vijayanand','Pondicherry','Assistant Professor','default@default.in','0987654321'),
(1010,'Dr. T. Sivakumar','Pondicherry','Assistant Professor','tsivakumar.csc@pondiuni.edu.in','+91 4132654454'),
(1011,'Dr. R. Sunitha','Pondicherry','Assistant Professor','maanila@yahoo.com','+91 4132654550'),
(1012,'Dr. Pothula Sujatha','Pondicherry','Assistant Professor','sujathaps.csc@pondiuni.edu.in','+91 4132654457'),
(1013,'Dr. M. Sathya','Pondicherry','Assistant Professor','satsubithra@gmail.com','+91 4132654456'),
(1014,'Dr. K. S. Kuppusamy','Pondicherry','Assistant Professor','kskuppu@gmail.com','+91 4132654882'),
(1015,'Dr. V. Uma','Pondicherry','Assistant Professor','umabskr@gmail.com','+91 4132654458'),
(1016,'Dr. P. Shanthi Bala','Pondicherry','Assistant Professor','shanthibala.cs@gmail.com','+91 04132654971'),
(1017,'Dr. T. Vengattaraman','Pondicherry','Assistant Professor','vengattaraman.t@gmail.com','+91 4132654969'),
(1018,'Dr. S. L. Jayalakshmi','Pondicherry','Assistant Professor','sathishjayalakshmi02@pondiuni.ac.in','');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userid` varchar(50) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `role` varchar(20) NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`userid`,`uname`,`pwd`,`role`,`id`) values 
('admin','Sandeep kumar','kumar','admin',0),
('kuppusamy','Dr. K. S. Kuppusamy','123456','lecturer',1014),
('mayank','MAYANK PRIYDARSHI','priydarshi','student',20352032),
('rishivel','RISHIVEL RAKESH R','rakrsh','student',20352046),
('sahil','SAHIL KUMAR','kumar','student',20352048),
('sandeep','SANDEEP KUMAR','kumar','student',20352050),
('sathya','Dr. M. Sathya','123456','lecturer',1013),
('sivasathya','Dr. S. Sivasathya','123456','lecturer',1001),
('trisha','TRISHA AGARWAL','agrawal','student',20352061);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
