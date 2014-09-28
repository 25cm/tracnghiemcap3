-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2014 at 11:08 PM
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
  `answer_id` int(6) NOT NULL AUTO_INCREMENT,
  `question_id` int(10) NOT NULL,
  `user_id` int(5) NOT NULL,
  `answer` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `insert_dt` date NOT NULL,
  `insert_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `update_dt` date NOT NULL,
  `update_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`, `insert_dt`, `insert_user`, `update_dt`, `update_user`) VALUES
('10', 'Lớp 10', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('11', 'Lớp 11', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('12', 'Lớp 12', '2014-09-23', 'admin', '2014-09-23', 'admin');

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

--
-- Dumping data for table `majors`
--

INSERT INTO `majors` (`major_id`, `major_name`, `insert_dt`, `insert_user`, `update_dt`, `update_user`) VALUES
('01', 'english', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('02', 'chemical', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('03', 'physical', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('04', 'biological', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('05', 'geographic', '2014-09-25', 'admin', '2014-09-25', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE IF NOT EXISTS `points` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `major_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `class_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `point` decimal(10,0) NOT NULL DEFAULT '0',
  `insert_dt` date NOT NULL,
  `insert_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `update_dt` date NOT NULL,
  `update_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `major_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `submajor_id` int(11) NOT NULL,
  `class_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `answer_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `answer_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `answer_3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `answer_4` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `correct_answer` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `insert_dt` date NOT NULL,
  `insert_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `update_dt` date NOT NULL,
  `update_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `submajors`
--

CREATE TABLE IF NOT EXISTS `submajors` (
  `submajor_id` int(11) NOT NULL AUTO_INCREMENT,
  `major_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `class_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `submajor_name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `submajor_img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `insert_dt` date NOT NULL,
  `insert_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `update_dt` date NOT NULL,
  `update_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`submajor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=86 ;

--
-- Dumping data for table `submajors`
--

INSERT INTO `submajors` (`submajor_id`, `major_id`, `class_id`, `submajor_name`, `submajor_img`, `insert_dt`, `insert_user`, `update_dt`, `update_user`) VALUES
(39, '02', '11', 'Sự điện ly', '/resources/images/chemical11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(40, '02', '11', 'Cacbon - Silic', '/resources/images/chemical11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(41, '02', '11', 'Hidrocacbon no', '/resources/images/chemical11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(42, '04', '11', 'Cảm ứng', '/resources/images/biological11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(43, '04', '11', 'Sinh sản', '/resources/images/biological11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(44, '03', '11', 'Điện tích - Điện trường', '/resources/images/physical11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(45, '03', '11', 'Dòng điện không đổi', '/resources/images/physical11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(46, '03', '11', 'Từ trường', '/resources/images/physical11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(47, '03', '11', 'Mắt', '/resources/images/physical11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(48, '03', '11', 'Khúc xạ ánh sáng', '/resources/images/physical11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(49, '01', '11', 'Stress', '/resources/images/english11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(50, '01', '11', 'Sentence building', '/resources/images/english11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(51, '01', '11', 'Sentence transformation', '/resources/images/english11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(52, '05', '11', 'Việt Nam trên con đường đổi mới và hội nhập', '/resources/images/geographic11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(54, '05', '11', 'Đặc điểm chung của tự nhiên', '/resources/images/geographic11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(55, '02', '10', 'Nguyên tử', '/resources/images/chemical10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(56, '02', '10', 'Nhóm oxi', '/resources/images/chemical10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(57, '02', '10', 'Nhóm halogen', '/resources/images/chemical10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(58, '02', '10', 'Phản ứng hóa học', '/resources/images/chemical10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(59, '04', '10', 'Cấu trúc tế bào', '/resources/images/biological10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(60, '04', '10', 'Phân bào', '/resources/images/biological10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(61, '04', '10', 'Virus và bệnh truyền nhiễm', '/resources/images/biological10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(62, '03', '10', 'Động học chất điểm', '/resources/images/physical10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(63, '03', '11', 'Tĩnh học vật rắn', '/resources/images/physical11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(64, '03', '10', 'Chất khí', '/resources/images/physical10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(65, '03', '10', 'Các định luật bảo toàn', '/resources/images/physical10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(66, '01', '10', 'Pronounciation', '/resources/images/english10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(67, '01', '10', 'Grammar and vocabulary', '/resources/images/english10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(68, '05', '10', 'Địa lý dân cư', '/resources/images/geographic10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(69, '05', '10', 'Một số vấn đề phát triển và phân bố nông nghiệp', '/resources/images/geographic10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(70, '05', '12', 'Chuyển dịch cơ cấu kinh tế', '/resources/images/geographic12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(71, '05', '12', 'Địa lý các vùng kinh tế', '/resources/images/geographic12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(72, '05', '12', 'Vấn đề sử dụng và bảo về tự nhiên', '/resources/images/geographic12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(73, '02', '12', 'Este - Lipit', '/resources/images/chemical12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(74, '02', '12', 'Đại cương về kim loại', '/resources/images/chemical12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(75, '02', '12', 'Cacbohidrat', '/resources/images/chemical12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(76, '02', '12', 'Kim loại kiềm, kiềm thổ và nhôm', '/resources/images/chemical12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(77, '04', '12', 'Di truyền học người', '/resources/images/biological12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(78, '04', '12', 'Di truyền học quần thể', '/resources/images/biological12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(79, '04', '12', 'Quần xã sinh vật', '/resources/images/biological12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(80, '03', '12', 'Dao động cơ', '/resources/images/physical12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(81, '03', '12', 'Dòng điện xoay chiều', '/resources/images/physical12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(82, '03', '12', 'Sóng ánh sáng', '/resources/images/physical12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(83, '03', '12', 'Hạt nhân nguyên tử', '/resources/images/physical12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(84, '01', '12', 'Reading', '/resources/images/english12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(85, '01', '12', 'Error Identification', '/resources/images/english12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `verification_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '1: admin, 2: standard user',
  `avatar_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delete_flg` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `insert_dt` date NOT NULL,
  `insert_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `update_dt` date NOT NULL,
  `update_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=52 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `email`, `verified`, `verification_code`, `phone_number`, `class_id`, `password`, `user_type`, `avatar_path`, `delete_flg`, `insert_dt`, `insert_user`, `update_dt`, `update_user`) VALUES
(46, 'caubemuongte', 'anhnv1310@gmail.com', '1', '9c9d4e3123116e60117dd186322e66a2', '09180002911', '10', 'HdwPxSF6s8', '0', NULL, '0', '2014-09-19', '', '2014-09-19', ''),
(47, 'anhnv13', 'anhnv1310@gmail.com', '1', 'd5107f203a9083e41fbbd8e3426c1ae6', '', '10', 'ca9118c9cf3efca03aa46c887d52c192', '0', NULL, '0', '2014-09-19', '', '2014-09-19', ''),
(48, 'chubebanchim', 'anhnv1310@gmail.com', '1', 'ba61f28972e24f239f74d8574870dff4', '0123456789', '12', 'ca9118c9cf3efca03aa46c887d52c192', '0', NULL, '0', '2014-09-19', '', '2014-09-19', ''),
(49, 'chimtrau', 'anhnv1310@gmail.com', '0', 'd5e1c3b6b23bdb7f8a8b5068f1c7b98d', '01590001111', '12', 'ca9118c9cf3efca03aa46c887d52c192', '0', NULL, '0', '2014-09-22', '', '2014-09-22', ''),
(51, 'tranvanchuong', 'anhnv1310@gmail.com', '0', '9feb1ea579bfd63cd50b84b2649eb6dd', '01696803198', '10', 'ca9118c9cf3efca03aa46c887d52c192', '0', NULL, '0', '2014-09-22', '', '2014-09-22', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
