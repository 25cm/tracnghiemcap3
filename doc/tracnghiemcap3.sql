-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2014 at 10:39 PM
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
('01', 'tiếng anh', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('02', 'hóa học', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('03', 'vật lý', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('04', 'sinh học', '2014-09-23', 'admin', '2014-09-23', 'admin');

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
  `class_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `answer_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `answer_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `answer_3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `answer_4` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `correct_answer` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `used_flg` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `insert_dt` date NOT NULL,
  `insert_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `update_dt` date NOT NULL,
  `update_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=124 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `major_id`, `class_id`, `question`, `answer_1`, `answer_2`, `answer_3`, `answer_4`, `correct_answer`, `used_flg`, `insert_dt`, `insert_user`, `update_dt`, `update_user`) VALUES
(1, '01', '12', 'Choose the word that has the underlined part pronounced differently from the rest:\r\neight             weight          heighten           freight', 'eight', 'weight', 'heighten', 'freight', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(2, '01', '12', 'Choose the word that has the underlined part pronounced differently from the rest:\r\ncomputing                           commercial                            cinema                            conference', 'computing', 'commercial', 'cinema', 'conference', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(3, '01', '12', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nchallenge              manage              natural             human', 'challenge', 'manage', 'natural', 'human', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(4, '01', '12', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nthin              than                they               there', 'thin', 'than', 'they', 'there', '1', '0', '0000-00-00', '', '0000-00-00', ''),
(5, '01', '12', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nchallenge              manage              natural             human', 'challenge', 'manage', 'natural', 'human', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(6, '01', '12', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nthin              than                they               there', 'thin', 'than', 'they', 'there', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(7, '01', '12', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nvision                      tourism                          diverse                          Muslim', 'vision', 'tourism', 'diverse', 'Muslim', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(8, '01', '12', 'Choose the word that has the underlined part pronounced differently from the rest:  \r\n mutual                  teenager                    promote                    listen', 'mutual', 'teenager', 'promote', 'listen', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(9, '01', '12', 'Choose the word that has the underlined part pronounced differently from the rest:  \r\ndepress             depute                 deputy              debate', 'depress', 'depute', 'deputy', 'debate', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(10, '01', '12', 'Choose the word that has the underlined part pronounced differently from the rest:  \r\nembrace             embarrassing               enthusiasm             memorable', 'embrace', 'enthusiasm', 'memorable', 'listen', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(13, '01', '11', 'Choose the word that has the underlined part pronounced differently from the rest:\r\neight             weight          heighten           freight', 'eight', 'weight', 'heighten', 'freight', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(14, '01', '10', 'Choose the word that has the underlined part pronounced differently from the rest:\r\neight             weight          heighten           freight', 'eight', 'weight', 'heighten', 'freight', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(15, '01', '11', 'Choose the word that has the underlined part pronounced differently from the rest:\r\ncomputing                           commercial                            cinema                            conference', 'computing', 'commercial', 'cinema', 'conference', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(16, '01', '10', 'Choose the word that has the underlined part pronounced differently from the rest:\r\ncomputing                           commercial                            cinema                            conference', 'computing', 'commercial', 'cinema', 'conference', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(17, '01', '11', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nchallenge              manage              natural             human', 'challenge', 'manage', 'natural', 'human', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(18, '01', '11', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nthin              than                they               there', 'thin', 'than', 'they', 'there', '1', '0', '0000-00-00', '', '0000-00-00', ''),
(19, '01', '11', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nchallenge              manage              natural             human', 'challenge', 'manage', 'natural', 'human', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(20, '01', '11', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nthin              than                they               there', 'thin', 'than', 'they', 'there', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(21, '01', '11', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nvision                      tourism                          diverse                          Muslim', 'vision', 'tourism', 'diverse', 'Muslim', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(22, '01', '11', 'Choose the word that has the underlined part pronounced differently from the rest:  \r\n mutual                  teenager                    promote                    listen', 'mutual', 'teenager', 'promote', 'listen', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(23, '01', '11', 'Choose the word that has the underlined part pronounced differently from the rest:  \r\ndepress             depute                 deputy              debate', 'depress', 'depute', 'deputy', 'debate', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(24, '01', '10', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nchallenge              manage              natural             human', 'challenge', 'manage', 'natural', 'human', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(25, '01', '10', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nchallenge              manage              natural             human', 'challenge', 'manage', 'natural', 'human', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(26, '01', '10', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nthin              than                they               there', 'thin', 'than', 'they', 'there', '1', '0', '0000-00-00', '', '0000-00-00', ''),
(27, '01', '10', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nchallenge              manage              natural             human', 'challenge', 'manage', 'natural', 'human', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(28, '01', '10', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nthin              than                they               there', 'thin', 'than', 'they', 'there', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(29, '01', '10', 'Choose the word that has the underlined part pronounced differently from the rest:\r\nvision                      tourism                          diverse                          Muslim', 'vision', 'tourism', 'diverse', 'Muslim', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(30, '01', '10', 'Choose the word that has the underlined part pronounced differently from the rest:  \r\n mutual                  teenager                    promote                    listen', 'mutual', 'teenager', 'promote', 'listen', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(31, '01', '10', 'Choose the word that has the underlined part pronounced differently from the rest:  \r\ndepress             depute                 deputy              debate', 'depress', 'depute', 'deputy', 'debate', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(32, '01', '10', 'Choose the word that has the underlined part pronounced differently from the rest:  \r\nembrace             embarrassing               enthusiasm             memorable', 'embrace', 'enthusiasm', 'memorable', 'listen', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(33, '02', '12', 'Hòa tan 5,4 gam bột Al vào 150 ml dung dịch chứa Fe(NO3)3 1M và Cu(NO3)2 1M. Kết thúc phản ứng thu được m gam chất rắn. Giá trị của m là:', '10,95', '13,20', '13,80', '15,20', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(34, '02', '12', 'Cho 1,2 (g) Mg vào 100 (ml) dung dịch hỗn hợp gồm HCl 1,5M và NaNO3 0,5M. Sau phản ứng chỉ thu được V (lít) khí dạng đơn chất (không có sản phẩm khử nào khác).\r\nThể tích V (đktc) bằng:', '0,224 (lít)', '0,560 (lít)', '1,120 (lít)', '5,600 (lít)', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(35, '02', '12', 'Bột nhôm tự bốc cháy khi tiếp xúc với:', 'Oxi', 'Clo', 'Lưu huỳnh', 'Hơi nước', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(36, '02', '12', 'Hòa tan hoàn toàn 7,02 gam hỗn hợp muối cacbonat của hai kim loại A và B thuộc nhóm IIA và thuộc hai chu kì liên tiếp trong bảng tuần hoàn bằng dung dịch HCl thu được 1,68 lít khí (đktc). Hai kim loại A và B là:', 'Be và Mg', 'Mg và Ca', 'Ca và Sr', 'Sr và Ba', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(37, '02', '12', 'Thuốc thử thích hợp để làm mềm nước cứng tạm thời là:', 'Dung dịch Ca(OH)2', 'Dung dịch Na2SO4', 'Dung dịch Na2CO3', 'A hoặc C', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(38, '02', '12', 'Dung dịch A chứa 5 ion: Mg2+, Ba2+, Ca2+ và 0,1 mol Cl–, 0,2 mol . Thêm dần V (ml) dung dịch K2CO3 1M vào dung dịch A cho đến khi lượng kết tủa thu được lớn nhất. Giá trị của V là:', '150', '300', '200', '250', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(39, '02', '11', 'Thuốc thử thích hợp để làm mềm nước cứng tạm thời là:', 'Dung dịch Ca(OH)2', 'Dung dịch Na2SO4', 'Dung dịch Na2CO3', 'A hoặc C', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(40, '02', '11', 'Dung dịch A chứa 5 ion: Mg2+, Ba2+, Ca2+ và 0,1 mol Cl–, 0,2 mol . Thêm dần V (ml) dung dịch K2CO3 1M vào dung dịch A cho đến khi lượng kết tủa thu được lớn nhất. Giá trị của V là:', '150', '300', '200', '250', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(41, '02', '10', 'Thuốc thử thích hợp để làm mềm nước cứng tạm thời là:', 'Dung dịch Ca(OH)2', 'Dung dịch Na2SO4', 'Dung dịch Na2CO3', 'A hoặc C', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(42, '02', '10', 'Dung dịch A chứa 5 ion: Mg2+, Ba2+, Ca2+ và 0,1 mol Cl–, 0,2 mol . Thêm dần V (ml) dung dịch K2CO3 1M vào dung dịch A cho đến khi lượng kết tủa thu được lớn nhất. Giá trị của V là:', '150', '300', '200', '250', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(43, '02', '11', 'Hòa tan 5,4 gam bột Al vào 150 ml dung dịch chứa Fe(NO3)3 1M và Cu(NO3)2 1M. Kết thúc phản ứng thu được m gam chất rắn. Giá trị của m là:', '10,95', '13,20', '13,80', '15,20', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(44, '02', '10', 'Hòa tan 5,4 gam bột Al vào 150 ml dung dịch chứa Fe(NO3)3 1M và Cu(NO3)2 1M. Kết thúc phản ứng thu được m gam chất rắn. Giá trị của m là:', '10,95', '13,20', '13,80', '15,20', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(45, '02', '11', 'Bột nhôm tự bốc cháy khi tiếp xúc với:', 'Oxi', 'Clo', 'Lưu huỳnh', 'Hơi nước', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(46, '02', '10', 'Bột nhôm tự bốc cháy khi tiếp xúc với:', 'Oxi', 'Clo', 'Lưu huỳnh', 'Hơi nước', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(47, '02', '11', 'Hòa tan hoàn toàn 7,02 gam hỗn hợp muối cacbonat của hai kim loại A và B thuộc nhóm IIA và thuộc hai chu kì liên tiếp trong bảng tuần hoàn bằng dung dịch HCl thu được 1,68 lít khí (đktc). Hai kim loại A và B là:', 'Be và Mg', 'Mg và Ca', 'Ca và Sr', 'Sr và Ba', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(48, '02', '10', 'Hòa tan hoàn toàn 7,02 gam hỗn hợp muối cacbonat của hai kim loại A và B thuộc nhóm IIA và thuộc hai chu kì liên tiếp trong bảng tuần hoàn bằng dung dịch HCl thu được 1,68 lít khí (đktc). Hai kim loại A và B là:', 'Be và Mg', 'Mg và Ca', 'Ca và Sr', 'Sr và Ba', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(49, '02', '11', 'Cho 1,2 (g) Mg vào 100 (ml) dung dịch hỗn hợp gồm HCl 1,5M và NaNO3 0,5M. Sau phản ứng chỉ thu được V (lít) khí dạng đơn chất (không có sản phẩm khử nào khác).\r\nThể tích V (đktc) bằng:', '0,224 (lít)', '0,560 (lít)', '1,120 (lít)', '5,600 (lít)', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(50, '02', '10', 'Cho 1,2 (g) Mg vào 100 (ml) dung dịch hỗn hợp gồm HCl 1,5M và NaNO3 0,5M. Sau phản ứng chỉ thu được V (lít) khí dạng đơn chất (không có sản phẩm khử nào khác). Thể tích V (đktc) bằng:', '0,224 (lít)', '0,560 (lít)', '1,120 (lít)', '5,600 (lít)', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(51, '02', '12', 'Cho 20,6 (g) hỗn hợp muối cacbonat kim loại kiềm và kim loại kiềm thổ tác dụng với dung dịch HCl dư thấy có 4,48 lít khí thoát ra (đktc). Cô cạn dung dịch muối khan thu được đem điện phân nóng chảy thu được m gam kim loại. Giá trị của m là:', '8,6', '8,7', '8,8', '8,9', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(52, '02', '11', 'Cho 20,6 (g) hỗn hợp muối cacbonat kim loại kiềm và kim loại kiềm thổ tác dụng với dung dịch HCl dư thấy có 4,48 lít khí thoát ra (đktc). Cô cạn dung dịch muối khan thu được đem điện phân nóng chảy thu được m gam kim loại. Giá trị của m là:', '8,6', '8,7', '8,8', '8,9', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(53, '02', '10', 'Cho 20,6 (g) hỗn hợp muối cacbonat kim loại kiềm và kim loại kiềm thổ tác dụng với dung dịch HCl dư thấy có 4,48 lít khí thoát ra (đktc). Cô cạn dung dịch muối khan thu được đem điện phân nóng chảy thu được m gam kim loại. Giá trị của m là:', '8,6', '8,7', '8,8', '8,9', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(54, '02', '12', 'Cho từ từ 1,15 (gam) Na vào 1,0 (ml) dung dịch AlCl3 nồng độ 0,1 (mol/lít). Hiện tượng xảy ra và các chất trong dung dịch thu được là:', 'Có khí thoát ra, trong dung dịch xuất hiện kết tủa, sau đó kết tủa tan hoàn toàn. Dung dịch chứa: NaAlO2, NaCl, NaOH.', 'Có khí thoát ra, trong dung dịch xuất hiện kết tủa, sau đó kết tủa tan một phần. Dung dịch chứa: NaAlO2, NaCl.', 'Trong dung dịch xuất hiện kết tủa, sau đó kết tủa tan hoàn toàn. Dung dịch chứa: NaAlO2, NaCl, NaOH.', 'Có khí thoát ra, dung dịch trong suốt. Dung dịch chứa: NaAlO2, NaCl, AlCl3.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(55, '02', '12', 'Nhận định nào không đúng về cấu tạo và tính chất vật lí của các kim loại kiềm thổ?', 'Khối lượng riêng tương đối nhỏ, chúng là những kim loại nhẹ hơn nhôm (trừ Ba).', 'Độ cứng tuy có cao hơn kim loại kiềm nhưng nhìn chung là những kim loại mềm hơn nhôm.', 'Mạng tinh thể của chúng đều có kiểu lập phương tâm khối.', 'Nhiệt độ nóng chảy và nhiệt độ sôi tương đối thấp (trừ Be).', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(56, '02', '11', 'Cho từ từ 1,15 (gam) Na vào 1,0 (ml) dung dịch AlCl3 nồng độ 0,1 (mol/lít). Hiện tượng xảy ra và các chất trong dung dịch thu được là:', 'Có khí thoát ra, trong dung dịch xuất hiện kết tủa, sau đó kết tủa tan hoàn toàn. Dung dịch chứa: NaAlO2, NaCl, NaOH.', 'Có khí thoát ra, trong dung dịch xuất hiện kết tủa, sau đó kết tủa tan một phần. Dung dịch chứa: NaAlO2, NaCl.', 'Trong dung dịch xuất hiện kết tủa, sau đó kết tủa tan hoàn toàn. Dung dịch chứa: NaAlO2, NaCl, NaOH.', 'Có khí thoát ra, dung dịch trong suốt. Dung dịch chứa: NaAlO2, NaCl, AlCl3.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(57, '02', '11', 'Nhận định nào không đúng về cấu tạo và tính chất vật lí của các kim loại kiềm thổ?', 'Khối lượng riêng tương đối nhỏ, chúng là những kim loại nhẹ hơn nhôm (trừ Ba).', 'Độ cứng tuy có cao hơn kim loại kiềm nhưng nhìn chung là những kim loại mềm hơn nhôm.', 'Mạng tinh thể của chúng đều có kiểu lập phương tâm khối.', 'Nhiệt độ nóng chảy và nhiệt độ sôi tương đối thấp (trừ Be).', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(58, '02', '10', 'Cho từ từ 1,15 (gam) Na vào 1,0 (ml) dung dịch AlCl3 nồng độ 0,1 (mol/lít). Hiện tượng xảy ra và các chất trong dung dịch thu được là:', 'Có khí thoát ra, trong dung dịch xuất hiện kết tủa, sau đó kết tủa tan hoàn toàn. Dung dịch chứa: NaAlO2, NaCl, NaOH.', 'Có khí thoát ra, trong dung dịch xuất hiện kết tủa, sau đó kết tủa tan một phần. Dung dịch chứa: NaAlO2, NaCl.', 'Trong dung dịch xuất hiện kết tủa, sau đó kết tủa tan hoàn toàn. Dung dịch chứa: NaAlO2, NaCl, NaOH.', 'Có khí thoát ra, dung dịch trong suốt. Dung dịch chứa: NaAlO2, NaCl, AlCl3.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(59, '02', '10', 'Nhận định nào không đúng về cấu tạo và tính chất vật lí của các kim loại kiềm thổ?', 'Khối lượng riêng tương đối nhỏ, chúng là những kim loại nhẹ hơn nhôm (trừ Ba).', 'Độ cứng tuy có cao hơn kim loại kiềm nhưng nhìn chung là những kim loại mềm hơn nhôm.', 'Mạng tinh thể của chúng đều có kiểu lập phương tâm khối.', 'Nhiệt độ nóng chảy và nhiệt độ sôi tương đối thấp (trừ Be).', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(60, '02', '12', 'Đuy-ra là một trong những hợp kim quan trọng của nhôm. Thành phần và tính chất của loại hợp kim này là:', '10-14% Si, nhẹ bền, ăn khuôn', '94% Al, 4% Cu, bền hơn Al gấp 4 lần, có D=2,75g/cm3', '83,3% Mg, 10,5% Al, bền cơ học, chịu được va đập', '98,5% Al, có điện trở nhỏ, bền, dai', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(61, '02', '11', 'Đuy-ra là một trong những hợp kim quan trọng của nhôm. Thành phần và tính chất của loại hợp kim này là:', '10-14% Si, nhẹ bền, ăn khuôn', '94% Al, 4% Cu, bền hơn Al gấp 4 lần, có D=2,75g/cm3', '83,3% Mg, 10,5% Al, bền cơ học, chịu được va đập', '98,5% Al, có điện trở nhỏ, bền, dai', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(62, '02', '10', 'Đuy-ra là một trong những hợp kim quan trọng của nhôm. Thành phần và tính chất của loại hợp kim này là:', '10-14% Si, nhẹ bền, ăn khuôn', '94% Al, 4% Cu, bền hơn Al gấp 4 lần, có D=2,75g/cm3', '83,3% Mg, 10,5% Al, bền cơ học, chịu được va đập', '98,5% Al, có điện trở nhỏ, bền, dai', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(63, '03', '12', 'Một con lắc gồm lò xo khối lượng không đáng kể có độ cứng k, một đầu gắn vật nhỏ có khối lượng m, đầu còn lại được treo vào một điểm cố định. Con lắc dao động điều hòa theo phương thẳng đứng. Chu kỳ dao động của con lắc là:', 'm*k', '1/2pi*m*k', '2pi*m*k', '2pi*m/k', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(64, '03', '12', 'Con lắc lò xo có k = 100 N/m, m = 1 kg dao động điều hòa. Khi vật có động năng 10 mJ thì vật cách vị trí cân bằng 1 cm. Khi vật có động năng 5 mJ thì thế năng của vật bằng bao nhiêu?', '2/100 J.', '5/100 J.', '1/100 J.', '2 J.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(65, '03', '11', 'Một con lắc gồm lò xo khối lượng không đáng kể có độ cứng k, một đầu gắn vật nhỏ có khối lượng m, đầu còn lại được treo vào một điểm cố định. Con lắc dao động điều hòa theo phương thẳng đứng. Chu kỳ dao động của con lắc là:', 'm*k', '1/2pi*m*k', '2pi*m*k', '2pi*m/k', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(66, '03', '11', 'Con lắc lò xo có k = 100 N/m, m = 1 kg dao động điều hòa. Khi vật có động năng 10 mJ thì vật cách vị trí cân bằng 1 cm. Khi vật có động năng 5 mJ thì thế năng của vật bằng bao nhiêu?', '2/100 J.', '5/100 J.', '1/100 J.', '2 J.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(67, '03', '10', 'Một con lắc gồm lò xo khối lượng không đáng kể có độ cứng k, một đầu gắn vật nhỏ có khối lượng m, đầu còn lại được treo vào một điểm cố định. Con lắc dao động điều hòa theo phương thẳng đứng. Chu kỳ dao động của con lắc là:', 'm*k', '1/2pi*m*k', '2pi*m*k', '2pi*m/k', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(68, '03', '11', 'Con lắc lò xo có k = 100 N/m, m = 1 kg dao động điều hòa. Khi vật có động năng 10 mJ thì vật cách vị trí cân bằng 1 cm. Khi vật có động năng 5 mJ thì thế năng của vật bằng bao nhiêu?', '2/100 J.', '5/100 J.', '1/100 J.', '2 J.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(69, '03', '12', 'Một chất điểm khối lượng m = 0,01 (kg) thực hiện dao động điều hoà với chu kì T = 2 (s) và pha ban đầu bằng 0 (rad). Năng lượng toàn phần của chất điểm là E = 10-4 (J). Phương trình của chất điểm đó là:', 'x = 4,5cosπt (cm).', 'x = 45cosπt (cm).', 'x = 4,5cos2πt (cm).', 'x = 45cos2πt (cm).', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(70, '03', '12', 'Một con lắc đơn được treo trong một bình chân không. Chu kỳ dao động nhỏ của con lắc là T0. Bơm không khí vào trong bình thì chu kỳ dao động nhỏ của con lắc là T. Gọi D0; D lần lượt là khối lượng riêng của không khí và khối lượng riêng của kim loại làm quả cầu con lắc. Đặt ε = Do/D. Hệ thức liên hệ giữa T và T0 là:', 'T = 2T0', 'T = T0', 'T = 1/T0', 'T = 2/T0', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(71, '03', '11', 'Một chất điểm khối lượng m = 0,01 (kg) thực hiện dao động điều hoà với chu kì T = 2 (s) và pha ban đầu bằng 0 (rad). Năng lượng toàn phần của chất điểm là E = 10-4 (J). Phương trình của chất điểm đó là:', 'x = 4,5cosπt (cm).', 'x = 45cosπt (cm).', 'x = 4,5cos2πt (cm).', 'x = 45cos2πt (cm).', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(72, '03', '11', 'Một con lắc đơn được treo trong một bình chân không. Chu kỳ dao động nhỏ của con lắc là T0. Bơm không khí vào trong bình thì chu kỳ dao động nhỏ của con lắc là T. Gọi D0; D lần lượt là khối lượng riêng của không khí và khối lượng riêng của kim loại làm quả cầu con lắc. Đặt ε = Do/D. Hệ thức liên hệ giữa T và T0 là:', 'T = 2T0', 'T = T0', 'T = 1/T0', 'T = 2/T0', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(73, '03', '10', 'Một chất điểm khối lượng m = 0,01 (kg) thực hiện dao động điều hoà với chu kì T = 2 (s) và pha ban đầu bằng 0 (rad). Năng lượng toàn phần của chất điểm là E = 10-4 (J). Phương trình của chất điểm đó là:', 'x = 4,5cosπt (cm).', 'x = 45cosπt (cm).', 'x = 4,5cos2πt (cm).', 'x = 45cos2πt (cm).', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(74, '03', '10', 'Một con lắc đơn được treo trong một bình chân không. Chu kỳ dao động nhỏ của con lắc là T0. Bơm không khí vào trong bình thì chu kỳ dao động nhỏ của con lắc là T. Gọi D0; D lần lượt là khối lượng riêng của không khí và khối lượng riêng của kim loại làm quả cầu con lắc. Đặt ε = Do/D. Hệ thức liên hệ giữa T và T0 là:', 'T = 2T0', 'T = T0', 'T = 1/T0', 'T = 2/T0', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(75, '03', '12', 'Một con lắc đơn dao động điều hòa với biên độ góc α0. Con lắc có thế năng bằng động năng của nó khi vật ở vị trí có li độ góc:', 'α0 = α', 'α0 = α/2', 'α0 = 2α', 'α0 = 1/α', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(76, '03', '12', 'Câu nào dưới đây không đúng với vật dao động điều hòa có phương trình x = Acos(ωt + φ):', 'Biên độ A, tần số góc ω là những hằng số dương, pha ban đầu φ cũng là hằng số nhưng có thể dương, âm hoặc bằng không.', 'Biên độ A, tần số góc ω và pha ban đầu φ đều là những hằng số dương.', 'Pha ban đầu φ phụ thuộc vào trạng thái ban đầu.', 'Biên độ A phụ thuộc vào năng lượng ban đầu kích thích cho hệ.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(77, '03', '11', 'Một con lắc đơn dao động điều hòa với biên độ góc α0. Con lắc có thế năng bằng động năng của nó khi vật ở vị trí có li độ góc:', 'α0 = α', 'α0 = α/2', 'α0 = 2α', 'α0 = 1/α', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(78, '03', '11', 'Câu nào dưới đây không đúng với vật dao động điều hòa có phương trình x = Acos(ωt + φ):', 'Biên độ A, tần số góc ω là những hằng số dương, pha ban đầu φ cũng là hằng số nhưng có thể dương, âm hoặc bằng không.', 'Biên độ A, tần số góc ω và pha ban đầu φ đều là những hằng số dương.', 'Pha ban đầu φ phụ thuộc vào trạng thái ban đầu.', 'Biên độ A phụ thuộc vào năng lượng ban đầu kích thích cho hệ.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(79, '03', '10', 'Một con lắc đơn dao động điều hòa với biên độ góc α0. Con lắc có thế năng bằng động năng của nó khi vật ở vị trí có li độ góc:', 'α0 = α', 'α0 = α/2', 'α0 = 2α', 'α0 = 1/α', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(80, '03', '10', 'Câu nào dưới đây không đúng với vật dao động điều hòa có phương trình x = Acos(ωt + φ):', 'Biên độ A, tần số góc ω là những hằng số dương, pha ban đầu φ cũng là hằng số nhưng có thể dương, âm hoặc bằng không.', 'Biên độ A, tần số góc ω và pha ban đầu φ đều là những hằng số dương.', 'Pha ban đầu φ phụ thuộc vào trạng thái ban đầu.', 'Biên độ A phụ thuộc vào năng lượng ban đầu kích thích cho hệ.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(81, '03', '12', 'Biên độ của dao động cưỡng bức không phụ thuộc vào:', 'Biên độ của ngoại lực tuần hoàn tác dụng lên vật.', 'Pha ban đầu của ngoại lực tuần hoàn tác dụng lên vật. ', 'Tần số ngoại lực tuần hoàn tác dụng lên vật.', 'Hệ số của lực cản tác dụng lên vật dao động.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(82, '03', '12', 'Một chất điểm thực hiện dao động điều hoà theo phương nằm ngang trên đoạn thẳng AB = 2a với chu kì T = 2 (s). Chọn gốc thời gian lúc t = 0, khi chất điểm nằm ở li độ x =  và vận tốc có giá trị âm. Phương trình dao động của chất điểm có dạng:', 'x = asin(πt + π/2).', 'x = asin(πt + π/6).', 'x = asin(2πt + π/2).', 'x = asin(2πt + π/6).', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(83, '03', '11', 'Biên độ của dao động cưỡng bức không phụ thuộc vào:', 'Biên độ của ngoại lực tuần hoàn tác dụng lên vật.', 'Pha ban đầu của ngoại lực tuần hoàn tác dụng lên vật. ', 'Tần số ngoại lực tuần hoàn tác dụng lên vật.', 'Hệ số của lực cản tác dụng lên vật dao động.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(84, '03', '11', 'Một chất điểm thực hiện dao động điều hoà theo phương nằm ngang trên đoạn thẳng AB = 2a với chu kì T = 2 (s). Chọn gốc thời gian lúc t = 0, khi chất điểm nằm ở li độ x =  và vận tốc có giá trị âm. Phương trình dao động của chất điểm có dạng:', 'x = asin(πt + π/2).', 'x = asin(πt + π/6).', 'x = asin(2πt + π/2).', 'x = asin(2πt + π/6).', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(85, '03', '10', 'Biên độ của dao động cưỡng bức không phụ thuộc vào:', 'Biên độ của ngoại lực tuần hoàn tác dụng lên vật.', 'Pha ban đầu của ngoại lực tuần hoàn tác dụng lên vật. ', 'Tần số ngoại lực tuần hoàn tác dụng lên vật.', 'Hệ số của lực cản tác dụng lên vật dao động.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(86, '03', '10', 'Một chất điểm thực hiện dao động điều hoà theo phương nằm ngang trên đoạn thẳng AB = 2a với chu kì T = 2 (s). Chọn gốc thời gian lúc t = 0, khi chất điểm nằm ở li độ x =  và vận tốc có giá trị âm. Phương trình dao động của chất điểm có dạng:', 'x = asin(πt + π/2).', 'x = asin(πt + π/6).', 'x = asin(2πt + π/2).', 'x = asin(2πt + π/6).', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(87, '03', '12', 'Một vật thực hiện hai dao động thành phần cùng phương, cùng tần số và có biên độ bằng nhau. Dao động tổng hợp có biên độ A và độ lệch pha ban đầu là φ. Kết luận nào sau đây là đúng?', 'Dao động thành phần có biên độ là A/2.', 'Dao động thành phần có biên độ là A/2cosφ.', 'Hai dao động thành phần cùng pha.', 'Hai dao động thành phần ngược pha.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(88, '03', '12', '** Một cái đĩa nằm ngang có khối lượng M=200(g), được gắn vào đầu trên của một lò xo thẳng đứng có độ cứng k. Đầu dưới của lò xo được giữ cố định. Đĩa có thể chuyển động theo phương thắng đứng. Bỏ qua mọi ma sát và lực cản của không khí.Đĩa đang ở vị trí cân bằng người ta thả một vật có m=100(g)từ độ cao h=7,5cm so với mặt đĩa.Va chạm giữa vật và đĩa là va chạm đàn hồi.Sau va chạm đầu tiên vật nảy lên và được giữ cho không rơi xuống đĩa nữa.Lấy g=10m/s2\r\nLấy gốc thời gian là lúc vật chạm vào đĩa, gốc toạ độ là vị trí cân bằng của đĩa lúc ban đầu, chiều hướng lên trên và M = 200 (g), m = 100 (g), k = 20 (N/m), A = 4 (cm), h = 7,5 (cm), g = 10 (m/s2). Phương trình dao động của đĩa là:', 'x = 8,2.sin10t (cm).', 'x = 8,2.sin(10πt – π) (cm).', 'x = 0,82.sin10πt (cm).', 'x = 8,2.sin(10t + π) (cm).', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(89, '03', '11', 'Một vật thực hiện hai dao động thành phần cùng phương, cùng tần số và có biên độ bằng nhau. Dao động tổng hợp có biên độ A và độ lệch pha ban đầu là φ. Kết luận nào sau đây là đúng?', 'Dao động thành phần có biên độ là A/2.', 'Dao động thành phần có biên độ là A/2cosφ.', 'Hai dao động thành phần cùng pha.', 'Hai dao động thành phần ngược pha.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(90, '03', '11', '** Một cái đĩa nằm ngang có khối lượng M=200(g), được gắn vào đầu trên của một lò xo thẳng đứng có độ cứng k. Đầu dưới của lò xo được giữ cố định. Đĩa có thể chuyển động theo phương thắng đứng. Bỏ qua mọi ma sát và lực cản của không khí.Đĩa đang ở vị trí cân bằng người ta thả một vật có m=100(g)từ độ cao h=7,5cm so với mặt đĩa.Va chạm giữa vật và đĩa là va chạm đàn hồi.Sau va chạm đầu tiên vật nảy lên và được giữ cho không rơi xuống đĩa nữa.Lấy g=10m/s2\r\nLấy gốc thời gian là lúc vật chạm vào đĩa, gốc toạ độ là vị trí cân bằng của đĩa lúc ban đầu, chiều hướng lên trên và M = 200 (g), m = 100 (g), k = 20 (N/m), A = 4 (cm), h = 7,5 (cm), g = 10 (m/s2). Phương trình dao động của đĩa là:', 'x = 8,2.sin10t (cm).', 'x = 8,2.sin(10πt – π) (cm).', 'x = 0,82.sin10πt (cm).', 'x = 8,2.sin(10t + π) (cm).', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(91, '03', '10', 'Một vật thực hiện hai dao động thành phần cùng phương, cùng tần số và có biên độ bằng nhau. Dao động tổng hợp có biên độ A và độ lệch pha ban đầu là φ. Kết luận nào sau đây là đúng?', 'Dao động thành phần có biên độ là A/2.', 'Dao động thành phần có biên độ là A/2cosφ.', 'Hai dao động thành phần cùng pha.', 'Hai dao động thành phần ngược pha.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(92, '03', '10', '** Một cái đĩa nằm ngang có khối lượng M=200(g), được gắn vào đầu trên của một lò xo thẳng đứng có độ cứng k. Đầu dưới của lò xo được giữ cố định. Đĩa có thể chuyển động theo phương thắng đứng. Bỏ qua mọi ma sát và lực cản của không khí.Đĩa đang ở vị trí cân bằng người ta thả một vật có m=100(g)từ độ cao h=7,5cm so với mặt đĩa.Va chạm giữa vật và đĩa là va chạm đàn hồi.Sau va chạm đầu tiên vật nảy lên và được giữ cho không rơi xuống đĩa nữa.Lấy g=10m/s2\r\nLấy gốc thời gian là lúc vật chạm vào đĩa, gốc toạ độ là vị trí cân bằng của đĩa lúc ban đầu, chiều hướng lên trên và M = 200 (g), m = 100 (g), k = 20 (N/m), A = 4 (cm), h = 7,5 (cm), g = 10 (m/s2). Phương trình dao động của đĩa là:', 'x = 8,2.sin10t (cm).', 'x = 8,2.sin(10πt – π) (cm).', 'x = 0,82.sin10πt (cm).', 'x = 8,2.sin(10t + π) (cm).', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(93, '03', '10', 'Con lắc lò xo có k = 100 N/m, m = 1 kg dao động điều hòa. Khi vật có động năng 10 mJ thì vật cách vị trí cân bằng 1 cm. Khi vật có động năng 5 mJ thì thế năng của vật bằng bao nhiêu?', '2/100 J.', '5/100 J.', '1/100 J.', '2 J.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(94, '04', '12', 'Ý nghĩa cơ bản nhất của phương pháp nghiên cứu trẻ đồng sinh là:', 'Phân biệt trẻ đồng sinh cùng trứng và đồng sinh khác trứng.', 'Biết các tính trạng nào ở loài người chủ yếu do kiểu gen, các tính trạng nào chủ yếu do môi trường quyết định.', 'Xem xét đặc điểm tâm lí, sinh lí ở loài người.', 'Nghiên cứu về kiểu gen của trẻ đồng sinh cùng trứng và trẻ đồng sinh khác trứng.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(95, '04', '12', 'Đặc điểm di truyền nào sau đây, cho phép ta xác định tính trạng trong một phả hệ, không được quy định bởi gen nằm trên NST X:', 'Tính trạng đó chỉ được biểu hiện ở giới nam.', 'Bố mang tính trạng trội, con gái mang tính trạng lặn.', 'Mẹ mang tính trạng lặn, con trai mang tính trạng trội.', 'Bố mang tính trạng trội, con gái mang tính trạng lặn và mẹ mang tính trạng lặn, con trai mang tính trạng trội.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(96, '04', '11', 'Ý nghĩa cơ bản nhất của phương pháp nghiên cứu trẻ đồng sinh là:', 'Phân biệt trẻ đồng sinh cùng trứng và đồng sinh khác trứng.', 'Biết các tính trạng nào ở loài người chủ yếu do kiểu gen, các tính trạng nào chủ yếu do môi trường quyết định.', 'Xem xét đặc điểm tâm lí, sinh lí ở loài người.', 'Nghiên cứu về kiểu gen của trẻ đồng sinh cùng trứng và trẻ đồng sinh khác trứng.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(97, '04', '11', 'Đặc điểm di truyền nào sau đây, cho phép ta xác định tính trạng trong một phả hệ, không được quy định bởi gen nằm trên NST X:', 'Tính trạng đó chỉ được biểu hiện ở giới nam.', 'Bố mang tính trạng trội, con gái mang tính trạng lặn.', 'Mẹ mang tính trạng lặn, con trai mang tính trạng trội.', 'Bố mang tính trạng trội, con gái mang tính trạng lặn và mẹ mang tính trạng lặn, con trai mang tính trạng trội.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(98, '04', '10', 'Ý nghĩa cơ bản nhất của phương pháp nghiên cứu trẻ đồng sinh là:', 'Phân biệt trẻ đồng sinh cùng trứng và đồng sinh khác trứng.', 'Biết các tính trạng nào ở loài người chủ yếu do kiểu gen, các tính trạng nào chủ yếu do môi trường quyết định.', 'Xem xét đặc điểm tâm lí, sinh lí ở loài người.', 'Nghiên cứu về kiểu gen của trẻ đồng sinh cùng trứng và trẻ đồng sinh khác trứng.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(99, '04', '10', 'Đặc điểm di truyền nào sau đây, cho phép ta xác định tính trạng trong một phả hệ, không được quy định bởi gen nằm trên NST X:', 'Tính trạng đó chỉ được biểu hiện ở giới nam.', 'Bố mang tính trạng trội, con gái mang tính trạng lặn.', 'Mẹ mang tính trạng lặn, con trai mang tính trạng trội.', 'Bố mang tính trạng trội, con gái mang tính trạng lặn và mẹ mang tính trạng lặn, con trai mang tính trạng trội.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(100, '04', '12', 'Đồng sinh khác trứng là trường hợp:', 'Hai trứng khác nhau, được thụ tinh bởi cùng một loại tinh trùng.', 'Hai tinh trùng cùng kiểu gen, thụ tinh với hai trứng cùng kiểu gen.', 'Hai tinh trùng khác nhau, thụ tinh với hai trứng hình thành hai hợp tử, phát triển thành hai cá thể.', 'Hai trứng có kiểu gen giống nhau, được thụ tinh bởi hai tinh trùng, hình thành hai hợp tử có kiểu gen khác nhau.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(101, '04', '12', 'Trường hợp nào sau đây có thể tạo ra hợp tử phát triển thành người mắc hội chứng Đao.', 'Giao tử chứa 2 nhiễm sắc thể số 21 kết hợp với giao tử bình thường.', 'Giao tử chứa nhiễm sắc thể số 21 bị mất đoạn kết hợp với giao tử bình thường.', 'Giao tử chứa 2 nhiễm sắc thể số 23 kết hợp với giao tử bình thường.', 'Giao tử không chứa nhiễm sắc thể số 21 kết hợp với giao tử bình thường.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(102, '04', '11', 'Đồng sinh khác trứng là trường hợp:', 'Hai trứng khác nhau, được thụ tinh bởi cùng một loại tinh trùng.', 'Hai tinh trùng cùng kiểu gen, thụ tinh với hai trứng cùng kiểu gen.', 'Hai tinh trùng khác nhau, thụ tinh với hai trứng hình thành hai hợp tử, phát triển thành hai cá thể.', 'Hai trứng có kiểu gen giống nhau, được thụ tinh bởi hai tinh trùng, hình thành hai hợp tử có kiểu gen khác nhau.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(103, '04', '11', 'Trường hợp nào sau đây có thể tạo ra hợp tử phát triển thành người mắc hội chứng Đao.', 'Giao tử chứa 2 nhiễm sắc thể số 21 kết hợp với giao tử bình thường.', 'Giao tử chứa nhiễm sắc thể số 21 bị mất đoạn kết hợp với giao tử bình thường.', 'Giao tử chứa 2 nhiễm sắc thể số 23 kết hợp với giao tử bình thường.', 'Giao tử không chứa nhiễm sắc thể số 21 kết hợp với giao tử bình thường.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(104, '04', '10', 'Đồng sinh khác trứng là trường hợp:', 'Hai trứng khác nhau, được thụ tinh bởi cùng một loại tinh trùng.', 'Hai tinh trùng cùng kiểu gen, thụ tinh với hai trứng cùng kiểu gen.', 'Hai tinh trùng khác nhau, thụ tinh với hai trứng hình thành hai hợp tử, phát triển thành hai cá thể.', 'Hai trứng có kiểu gen giống nhau, được thụ tinh bởi hai tinh trùng, hình thành hai hợp tử có kiểu gen khác nhau.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(105, '04', '10', 'Trường hợp nào sau đây có thể tạo ra hợp tử phát triển thành người mắc hội chứng Đao.', 'Giao tử chứa 2 nhiễm sắc thể số 21 kết hợp với giao tử bình thường.', 'Giao tử chứa nhiễm sắc thể số 21 bị mất đoạn kết hợp với giao tử bình thường.', 'Giao tử chứa 2 nhiễm sắc thể số 23 kết hợp với giao tử bình thường.', 'Giao tử không chứa nhiễm sắc thể số 21 kết hợp với giao tử bình thường.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(106, '04', '12', 'Phương pháp điều trị bằng liệu pháp gen áp dụng cho các bệnh:', 'di truyền phân tử.', 'di truyền nhiễm sắc thể.', 'di truyền tế bào chất.', 'di truyền giới tính.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(107, '04', '12', 'Các bệnh di trụyền thường gặp ở người gồm:', 'Bệnh do đột biến gen trội.', 'Bệnh do đột biến lệch bội nhiễm sắc thể.', 'Bệnh do đột biến đa bội.', 'Bệnh do đột biến cấu trúc nhiễm sắc thể.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(108, '04', '11', 'Phương pháp điều trị bằng liệu pháp gen áp dụng cho các bệnh:', 'di truyền phân tử.', 'di truyền nhiễm sắc thể.', 'di truyền tế bào chất.', 'di truyền giới tính.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(109, '04', '11', 'Các bệnh di trụyền thường gặp ở người gồm:', 'Bệnh do đột biến gen trội.', 'Bệnh do đột biến lệch bội nhiễm sắc thể.', 'Bệnh do đột biến đa bội.', 'Bệnh do đột biến cấu trúc nhiễm sắc thể.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(110, '04', '10', 'Phương pháp điều trị bằng liệu pháp gen áp dụng cho các bệnh:', 'di truyền phân tử.', 'di truyền nhiễm sắc thể.', 'di truyền tế bào chất.', 'di truyền giới tính.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(111, '04', '10', 'Các bệnh di trụyền thường gặp ở người gồm:', 'Bệnh do đột biến gen trội.', 'Bệnh do đột biến lệch bội nhiễm sắc thể.', 'Bệnh do đột biến đa bội.', 'Bệnh do đột biến cấu trúc nhiễm sắc thể.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(112, '04', '12', 'Nguyên tắc để phát hiện sự bất thường hay bình thường của một cá thể, trong phương pháp nghiên cứu tế bào là:', 'Soi tiêu bản tế bào 2n dưới kính hiển vi, quan sát hình thái và số lượng của bộ NST.', 'Soi tiêu bản tế bào n dưới kính hiển vi, quan sát hình thái và số lượng của nó.', 'Soi tiêu bản tế bào sinh dưỡng, quan sát quá trình trao đổi chất của nó.', 'Soi tiêu bản tế bào sinh dục, quan sát quá trình giảm phân của nó. ', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(113, '04', '12', 'Phát biểu nào sai khi nói đến bệnh phêninkêtô niệu?', 'Là bệnh di truyền phân tử.', 'Là bệnh rối loạn chuyển hóa axit amin phêninalanin thành axit amin tirôzin.', 'Bị bệnh này có thể mất trí nhớ.', 'Là loại bệnh không chữa được.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(114, '04', '11', 'Nguyên tắc để phát hiện sự bất thường hay bình thường của một cá thể, trong phương pháp nghiên cứu tế bào là:', 'Soi tiêu bản tế bào 2n dưới kính hiển vi, quan sát hình thái và số lượng của bộ NST.', 'Soi tiêu bản tế bào n dưới kính hiển vi, quan sát hình thái và số lượng của nó.', 'Soi tiêu bản tế bào sinh dưỡng, quan sát quá trình trao đổi chất của nó.', 'Soi tiêu bản tế bào sinh dục, quan sát quá trình giảm phân của nó. ', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(115, '04', '11', 'Phát biểu nào sai khi nói đến bệnh phêninkêtô niệu?', 'Là bệnh di truyền phân tử.', 'Là bệnh rối loạn chuyển hóa axit amin phêninalanin thành axit amin tirôzin.', 'Bị bệnh này có thể mất trí nhớ.', 'Là loại bệnh không chữa được.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(116, '04', '10', 'Nguyên tắc để phát hiện sự bất thường hay bình thường của một cá thể, trong phương pháp nghiên cứu tế bào là:', 'Soi tiêu bản tế bào 2n dưới kính hiển vi, quan sát hình thái và số lượng của bộ NST.', 'Soi tiêu bản tế bào n dưới kính hiển vi, quan sát hình thái và số lượng của nó.', 'Soi tiêu bản tế bào sinh dưỡng, quan sát quá trình trao đổi chất của nó.', 'Soi tiêu bản tế bào sinh dục, quan sát quá trình giảm phân của nó. ', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(117, '04', '10', 'Phát biểu nào sai khi nói đến bệnh phêninkêtô niệu?', 'Là bệnh di truyền phân tử.', 'Là bệnh rối loạn chuyển hóa axit amin phêninalanin thành axit amin tirôzin.', 'Bị bệnh này có thể mất trí nhớ.', 'Là loại bệnh không chữa được.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(118, '04', '12', 'Nội dung nào sau đây sai, khi đề cập đến vai trò của di truyền y học?', 'Dự đoán khả năng xuất hiện bệnh hay dị tật ở thế hệ con cháu.', 'Hạn chế tác hại của bệnh.', 'Hạn chế sự phát tán bệnh như hạn chế sinh đẻ, không cho kết hôn gần.', 'Chữa được một số bệnh như đái đường, máu khó đông, hội chứng Đao. ', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(119, '04', '12', 'Trong phương pháp phả hệ, xây dựng phả hệ phải được thực hiện qua ít nhất là:', '2 thế hệ.', '3 thế hệ.', '10 thế hệ.', '5 thế hệ.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(120, '04', '11', 'Nội dung nào sau đây sai, khi đề cập đến vai trò của di truyền y học?', 'Dự đoán khả năng xuất hiện bệnh hay dị tật ở thế hệ con cháu.', 'Hạn chế tác hại của bệnh.', 'Hạn chế sự phát tán bệnh như hạn chế sinh đẻ, không cho kết hôn gần.', 'Chữa được một số bệnh như đái đường, máu khó đông, hội chứng Đao. ', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(121, '04', '11', 'Trong phương pháp phả hệ, xây dựng phả hệ phải được thực hiện qua ít nhất là:', '2 thế hệ.', '3 thế hệ.', '10 thế hệ.', '5 thế hệ.', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(122, '04', '10', 'Nội dung nào sau đây sai, khi đề cập đến vai trò của di truyền y học?', 'Dự đoán khả năng xuất hiện bệnh hay dị tật ở thế hệ con cháu.', 'Hạn chế tác hại của bệnh.', 'Hạn chế sự phát tán bệnh như hạn chế sinh đẻ, không cho kết hôn gần.', 'Chữa được một số bệnh như đái đường, máu khó đông, hội chứng Đao. ', '1', '0', '2014-09-23', '', '2014-09-23', ''),
(123, '04', '10', 'Trong phương pháp phả hệ, xây dựng phả hệ phải được thực hiện qua ít nhất là:', '2 thế hệ.', '3 thế hệ.', '10 thế hệ.', '5 thế hệ.', '1', '0', '2014-09-23', '', '2014-09-23', '');

-- --------------------------------------------------------

--
-- Table structure for table `submajors`
--

CREATE TABLE IF NOT EXISTS `submajors` (
  `major_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `submajor_id` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `submajor_name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `insert_dt` date NOT NULL,
  `insert_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `update_dt` date NOT NULL,
  `update_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`major_id`,`submajor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `submajors`
--

INSERT INTO `submajors` (`major_id`, `submajor_id`, `submajor_name`, `insert_dt`, `insert_user`, `update_dt`, `update_user`) VALUES
('01', '001', 'Động từ tobe', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('01', '002', 'Thì hiện tại đơn', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('02', '001', 'Kim loại kiềm', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('02', '002', 'Este - Lipit', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('02', '003', 'Sắt', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('03', '001', 'Dao động cơ', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('03', '002', 'Dòng điện xoay chiều', '2014-09-23', 'admin', '2014-09-23', 'admin'),
('04', '001', 'Di truyền học', '2014-09-23', 'admin', '2014-09-23', 'admin');

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
