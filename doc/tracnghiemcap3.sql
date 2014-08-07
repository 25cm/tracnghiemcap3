-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2014 at 03:27 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tracnghiemcap3`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
  `answer_id` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `answer` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `insert_dt` date NOT NULL,
  `insert_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `update_dt` date NOT NULL,
  `update_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `class_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `class_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `insert_dt` date NOT NULL,
  `insert_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `update_dt` date NOT NULL,
  `update_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `majors`
--

CREATE TABLE IF NOT EXISTS `majors` (
  `major_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `major_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `insert_dt` date NOT NULL,
  `insert_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `update_dt` date NOT NULL,
  `update_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`major_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE IF NOT EXISTS `points` (
  `user_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `major_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `class_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `point` decimal(10,0) NOT NULL DEFAULT '0',
  `insert_dt` date NOT NULL,
  `insert_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `update_dt` date NOT NULL,
  `update_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `question_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `major_id` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `class_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `answer_1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `answer_2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `answer_3` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `answer_4` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `answer` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `used_flg` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `insert_dt` date NOT NULL,
  `insert_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `update_dt` date NOT NULL,
  `update_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `class_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '1: admin, 2: standard user',
  `delete_flg` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `insert_dt` date NOT NULL,
  `insert_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `update_dt` date NOT NULL,
  `update_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
