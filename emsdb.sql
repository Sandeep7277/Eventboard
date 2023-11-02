-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2021 at 05:58 AM
-- Server version: 8.0.21
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookedevent`
--

CREATE TABLE `bookedevent` (
  `eventid` int NOT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookedevent`
--

INSERT INTO `bookedevent` (`eventid`, `id`) VALUES
(2, 102),
(2, 103),
(3, 102),
(6, 103),
(7, 103),
(9, 103);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catid` int NOT NULL,
  `catname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catid`, `catname`) VALUES
(1, 'Fresher\'s Party'),
(2, 'Fairwell Party'),
(3, 'Blood Donation Camp'),
(4, 'Guest Lecture');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `eventid` int NOT NULL,
  `descr` varchar(250) NOT NULL,
  `catid` int NOT NULL,
  `startdate` date NOT NULL,
  `endate` date NOT NULL,
  `starttime` varchar(20) NOT NULL,
  `endtime` varchar(20) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'scheduled',
  `fees` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eventid`, `descr`, `catid`, `startdate`, `endate`, `starttime`, `endtime`, `photo`, `status`, `fees`) VALUES
(1, 'Blood Donation Camp in the college campus. Please donate as much as you can.', 3, '2020-04-10', '2020-04-10', '10:00 AM', '5:00 PM', 'blood_donation_camp.jpg', 'scheduled', 150),
(2, 'Fresher\'s Party will be organised in Empire Restaurent.\r\nYou have to deposit Rs. 200 for the party at the college cash counter.', 1, '2020-07-01', '2020-07-01', '11:00 AM', '6:00 PM', 'event.jpg', 'scheduled', 200),
(3, 'Guest Lecture on Ethical Hacking', 4, '2020-04-17', '2020-04-17', '10:00 AM', '2:00 PM', 'guestlecturer.jpg', 'scheduled', 100),
(4, 'Fairwell party will be organized at location Hotel Godzilla.', 2, '2020-04-30', '2020-04-30', '10:00 AM', '6:00 PM', 'farewell_gifts.jpg', 'scheduled', 50),
(5, 'Guest lecture about web development by Mr. Anand Singh', 4, '2020-04-17', '2020-04-17', '10:00 AM', '1:00 PM', 'guest-lecture.jpg', 'canceled', 150),
(9, 'BCA 1st year fresher party', 1, '2020-10-10', '2020-10-10', '10:00', '2:00', 'logo.png', 'scheduled', 200);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `rollno` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`rollno`, `name`, `city`, `course`, `email`, `phone`) VALUES
(102, 'Vijay Kumar', 'Noida', 'BCA-1', 'vijay@gmail.com', '3333444455'),
(103, 'Anita Goel', 'Banaras', 'BCA-6', 'jyoti@gmail.com', '8888888888');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `tid` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`tid`, `name`, `city`, `designation`, `email`, `phone`) VALUES
(10001, 'Ajay Kumar', 'Noida', 'HOD', 'ajay@gmail.com', '9998885554');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` varchar(50) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `role` varchar(20) NOT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `uname`, `pwd`, `role`, `id`) VALUES
('admin', 'Mr. Anand Singh', 'anand', 'admin', 0),
('ajayk', 'Ajay Kumar', 'admin', 'lecturer', 10001),
('jyoti', 'Jyoti Keshari', 'abcd', 'student', 103),
('vijay', 'Vijay Kumar', 'anand', 'student', 102);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookedevent`
--
ALTER TABLE `bookedevent`
  ADD PRIMARY KEY (`eventid`,`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`eventid`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`rollno`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `eventid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
