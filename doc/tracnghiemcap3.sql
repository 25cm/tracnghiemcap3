-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2014 at 09:48 PM
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
  `class_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `point` decimal(10,0) NOT NULL DEFAULT '0',
  `insert_dt` date NOT NULL,
  `insert_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `update_dt` date NOT NULL,
  `update_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=61 ;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`user_id`, `class_id`, `point`, `insert_dt`, `insert_user`, `update_dt`, `update_user`) VALUES
(54, '12', '20', '2014-10-06', 'acc001', '2014-10-06', 'acc001'),
(55, '11', '4', '2014-10-06', 'acc002', '2014-10-06', 'acc002'),
(56, '12', '3', '2014-10-06', 'acc003', '2014-10-06', 'acc003'),
(57, '12', '27', '2014-10-06', 'acc004', '2014-10-06', 'acc004'),
(59, '12', '7', '2014-10-06', 'acc005', '2014-10-06', 'acc005'),
(60, '12', '4', '2014-10-06', 'acc006', '2014-10-06', 'acc006');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=298 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `major_id`, `submajor_id`, `class_id`, `question`, `answer_1`, `answer_2`, `answer_3`, `answer_4`, `correct_answer`, `insert_dt`, `insert_user`, `update_dt`, `update_user`) VALUES
(2, '01', 66, '10', 'Choose the word that has the underlined part pronounced differently from the rest:<br>\r\neasy                           treat                        hearing                     please', 'easy', 'treat', 'hearing', 'please', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(3, '01', 66, '10', 'Choose the word that has the underlined part pronounced differently from the rest:  \r\nsure                       moor                       around                         tourist', 'sure', 'moor', 'around', 'tourist', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(4, '01', 66, '10', 'Choose the word that has the underlined part pronounced differently from the rest:<br>\r\nracial                    economy                    capital                     republic', 'racial', 'economy', 'capital', 'republic', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(5, '01', 66, '10', 'Choose the word that has the underlined part pronounced differently from the rest:<br>\r\nblind                  wild                      while                      steadily', 'blind', 'wild', 'while', 'steadily', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(6, '01', 66, '10', 'Choose the word that has the underlined part pronounced differently from the rest:<br>\r\nrequested                       regulated                            asked                        needed', 'requested', 'regulated', 'asked', 'needed', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(7, '01', 66, '10', 'Choose the word that has the underlined part pronounced differently from the rest: <br>\r\ngroup                    soup                      count                 move', 'group', 'soup', 'count', 'move', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(8, '01', 66, '10', 'Choose the word that has the underlined part pronounced differently from the rest:<br>\r\narchitecture              chemise               chemist               chaos', 'architecture', 'chemise', 'chemist', 'chaos', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(9, '01', 66, '10', 'Choose the word that has the underlined part pronounced differently from the rest: <br>\r\nhere                       bear                        hear                          engineer', 'here', 'bear', 'hear', 'engineer', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(10, '01', 66, '10', 'Choose the word that has the underlined part pronounced differently from the rest:<br>\r\nsuburb                     learn                      liberty                        birthday', 'suburd', 'learn', 'liberty', 'birthday', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(11, '01', 66, '10', 'Choose the word that has the underlined part pronounced differently from the rest:<br>\r\nhappen                 many                  example                     family', 'happen', 'many', 'example', 'family', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(12, '01', 66, '10', 'Choose the word that has the underlined part pronounced differently from the rest:  <br>\r\nreleased                 loosed                  increased                  raised ', 'released', 'loosed', 'increased', 'raised', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(13, '01', 67, '10', 'Choose the best answer for the following sentence:<br>\r\nStudies show that if a working environment is pleasant, _______________ increases.', 'produce', 'productive', 'producer', 'productivity', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(14, '01', 67, '10', 'Choose the best answer for the following sentence:<br>\r\nMy father ___________ the Internet when my mother was cooking dinner.', 'surf', 'surfs', 'surfed', 'was surfing', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(15, '01', 67, '10', 'Choose the best answer for the following sentence:<br>\r\nI''m going to wait until you ___________ your work. ', 'finished', 'have finished', 'had finished', 'will finish', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(16, '01', 67, '10', 'Choose the best answer for the following sentence:<br>\r\nI love travelling in Scandinavia; the ______________ is so beautiful there.', 'country               ', 'countryside   ', 'environment             ', 'nature', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(17, '01', 67, '10', 'Choose the best answer for the following sentence:<br>\r\n_____________ is a type of literature, especially drama, which is serious and sad, and often ends with the death of the main character', 'Comedy', 'Newsreel', 'Documentary', 'Tragedy', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(18, '01', 67, '10', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nShe was made stay at home all day to look after the children.', 'was', 'stay at', 'to look after', 'children', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(19, '01', 67, '10', 'Choose the best answer for the following sentence:<br>\r\nI’m glad ___________ that your first picnic was excellent with your classmates.', 'to hearing   ', 'hearing                ', 'to hear ', 'heard', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(20, '01', 67, '10', 'Choose the best answer for the following sentence:<br>\r\nThese monuments are a vital part of the cultural _____________ of South America.', 'festival                  ', 'location                     ', 'official                    ', 'heritage', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(21, '01', 67, '10', 'Choose the best answer for the following sentence:<br>\r\nThe cuisine of France is _____________________.', 'more famous than that of England', 'famous than the cuisine of England', 'more famous than which of England', 'as famous than that of England', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(22, '01', 67, '10', 'Choose the best answer for the following sentence:<br>\r\nBecause Phong Nha cave is not far from Dong Hoi Town then we decided go ___________.', 'on trip a day       ', 'on a day trip', 'a day on trip ', 'a day trip on', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(23, '01', 49, '11', 'Choose a word that has different stress pattern:<br>\nEgyptian               magnificent               suggestion               regional', 'Egyptian               ', 'magnificent               ', 'suggestion               ', 'regional', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(24, '01', 49, '11', 'Choose a word that has different stress pattern:<br>\r\ngratitude              acquaintance              apartment             appreciate', 'gratitude              ', 'acquaintance              ', 'apartment             ', 'appreciate', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(25, '01', 49, '11', 'CÂU SỐ 3\r\nChoose the word whose stress is on the second syllable:<br>\r\nensure                    middle                       number                  sister', 'ensure                    ', 'middle                       ', 'number                  ', 'sister', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(26, '01', 49, '11', 'Choose the word whose stress is on the second syllable:<br>\r\ncharity                     gratitude                      maximum                       expectant', 'charity                     ', 'gratitude                      ', 'maximum                       ', 'expectant', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(27, '01', 49, '11', 'Choose the word that has the underlined part pronounced differently from the rest:  \r\n women             contest               competitive               event', 'women             ', 'contest               ', 'competitive               ', 'event', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(28, '01', 49, '11', 'Choose a word that has different stress pattern:<br>\r\nstadium                general                    atmosphere                 volunteer', 'stadium                ', 'general                    ', 'atmosphere                 ', 'volunteer', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(29, '01', 49, '11', 'Choose a word that has different stress pattern:<br>\r\nadventure                  register                   equipment                    protection', 'adventure                  ', 'register                   ', 'equipment                    ', 'protection', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(30, '01', 49, '11', 'Choose a word that has different stress pattern:<br>\r\nseveral                  imprison                 hospital                       educate', 'several                  ', 'imprison                 ', 'hospital                       ', 'educate', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(31, '01', 49, '11', 'Choose a word that has different stress pattern:<br>\r\ngymnast              gymnasium              knowledge               maintenance', 'gymnast              ', 'gymnasium              ', 'knowledge               ', 'maintenance', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(32, '01', 49, '11', 'Choose a word that has different stress pattern:<br>\r\nparticipant             development              traditional               solidarity', 'participant             ', 'development              ', 'traditional               ', 'solidarity', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(33, '01', 50, '11', 'Choose the correct sentence which is built from the words and phrases given:<br>\r\n I / display / my collection of dolls / in a window / arrange them / size', 'I not only display my collection of dolls in a window but also them on size.', 'I display my collection of dolls in a window to arrange them in size.', 'I display my collection of dolls in a window, arranging them by size.', 'I display my collection of dolls in a window, which are arranging them by size.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(34, '01', 50, '11', 'Choose the correct sentence which is built from the words and phrases given:<br>\r\nhe / 5 feet / good looking / friendly', 'He is 5 feet, good looking, bu]t friendly.', 'He is 5 feet tall, and good looking, friendly.', 'He is 5 feet tall, good looking, and friendly.', 'He is 5 feet tall but good looking, and friendly.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(35, '01', 50, '11', 'Choose the correct sentence which is built from the words and phrases given:<br>\r\nLinda / regret / her / chance / miss / of / prize /.', 'Linda regretted to miss her chance of a prize.', 'Linda regretted miss her chance of a prize.', 'Linda regretted to be missed her chance of a prize.', 'Linda regretted missing her chance of a prize.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(36, '01', 50, '11', 'Choose the correct sentence which is built from the words and phrases given:<br>\r\nmost / people / prefer / spending / money / to / earning / it.', 'Most people prefer spending it to earning money.', 'Most people prefer it spending to earning money.', 'Most people prefer spending money to earning it.', 'Most people prefer it spending money to earning.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(37, '01', 50, '11', 'Choose the correct sentence which is built from the words and phrases given:<br>\r\n is / hydropower / exporter / Canada / oil / natural / of / gas / and / coal / an / uranium ', 'Canada is an exporter of oil, natural gas, coal, and hydropower uranium.', 'Canada is an exporter of oil, natural gas, coal, uranium, and hydropower.', 'Canada is an exporter oil, natural gas, coal, uranium, and of hydropower.', 'Canada is an oil exporter, of natural gas, coal, uranium, and hydropower.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(38, '01', 50, '11', 'Choose the correct sentence which is built from the words and phrases given:<br>\r\nwe / friends / at university', 'We have been friends since we were at university.', 'We make friends when we were at university.', 'We are friends as we were at university.', 'We have been friends even though we were at university.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(39, '01', 50, '11', 'Choose the correct sentence which is built from the words and phrases given:<br>\r\nit / than / reached / 1,000 people / more / have / the / 1953 / of / Mt. Everest / scaled / top / since / was / first / in', 'The top of Mt. Everest have reached more than 1,000 people since it was scaled first in 1953.', 'Since more than 1,000 people have reached it, the top of Mt. Everest was first scaled in 1953.', 'Since 1,000 people have reached the top of Mt. Everest more than it was first scaled in 1953.', 'More than 1,000 people have reached the top of Mt. Everest since it was first scaled in 1953.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(40, '01', 50, '11', 'Choose the correct sentence which is built from the words and phrases given:<br>\r\nAccident / look / serious / but /fortunate / injure', 'The accident looked serious but fortunate anybody injured.', 'The accident looked serious but fortunately nobody was injured.', 'The accident looked seriously but fortunate somebody was injured.', 'The accident looked seriously but fortunately everybody injured.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(41, '01', 50, '11', 'Choose the correct sentence which is built from the words and phrases given:<br>\r\nI / know / she / in / hospital / I / visit / her / .', 'If I have known that she was in hospital, I would have visited her.', 'If I had known that she was in hospital, I will have visited her.', 'If I knew that she was in hospital, I would have visited her.', 'If I had known that she was in hospital, I would have visited her.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(42, '01', 50, '11', 'Choose the correct sentence which is built from the words and phrases given:<br>\r\nthe / when / all / preparations / been / have / completed /, / she / feels / happy/.', 'When the preparations have all been completed, she feels happy.', 'When all preparations have been completed, she feels the happy.', 'When all the preparations have been completed, she feels happy.', 'When the preparations have been all completed, she feels happy.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(43, '01', 51, '11', 'Choose one sentence that has the same meaning as the root one:<br>\r\nThe movie is supposed to be interesting.', 'People suppose that the movie is interesting.', 'People supposed that the movie was interesting.', 'It is supposed that the movie to be interesting.', 'It was supposed the movie has been interesting.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(44, '01', 51, '11', 'Choose one sentence that has the same meaning as the root one:<br>\r\nBarry continued to smoke even though his doctor told him to quit.', 'Barry quit smoking as he was told by his doctor.', 'Barry was told to continue smoking and not to quit.', 'Although Barry’s doctor told him to quit but he continued to smoke.', 'Despite being told to quit smoking, Barry continued to do.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(45, '01', 51, '11', 'Choose one sentence that has the same meaning as the root one:<br>\r\nHe didn’t prepare his lesson so he couldn’t answer the teacher’s questions.', 'If he prepares his lesson he can answer the teacher’s questions.', 'If he prepared his lesson he could answer the teacher’s questions.', 'If he had prepared his lesson he could answer the teacher’s questions.', 'If he had prepared his lesson he could have answered the teacher’s questions.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(46, '01', 51, '11', 'Choose one sentence that has the same meaning as the root one:<br>\r\nI used my calculator; otherwise, I’d have taken longer.', 'If I hadn’t used my calculator, I’d have taken longer.', 'If I had used my calculator, I wouldn’t have taken longer.', 'If I didn’t use my calculator, I would take longer.', 'If I used my calculator, I wouldn’t take longer.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(47, '01', 51, '11', 'Choose one sentence that has the same meaning as the root one:<br>\r\nThey don''t let us cycle in the park.', 'We are not let cycle in the park.', 'We are not let to cycle in the park.', 'We are not allowed to cycle in the park.', 'We are not allowed cycle in the park.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(48, '01', 51, '11', 'Choose one sentence that has the same meaning as the root one:<br>\r\nBoth the young girl and the old man had a great time at the ice-skating competition.\r\n', 'None of the young girl and the old man had a great time at the ice- skating competition.', 'It was not the young girl and the old man that had a great time at the ice-skating competition.', 'Not only did the young girl have a great time at the ice-skating competition, but the old man did as well.', 'Both the young girl and the old man thought the ice-skating competition was not interesting.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(49, '01', 51, '11', 'Choose one sentence that has the same meaning as the root one:<br>\r\nHe didn''t hurry so he missed the plane', 'If he hurried he wouldn’t miss the plane.', 'If he had hurried he might catch the plane.', 'If he had hurried he could have caught the plane.', 'He didn’t miss the plane because he hurried.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(50, '01', 51, '11', 'Choose one sentence that has the same meaning as the root one:<br>\r\nThanks to your timely warning, we were aware of the danger.', 'We were in the danger although you had warned us in time.', 'Unless you had warned us in time, we would have been aware of the danger.', ' In spite of your timely warning, we could not escape the danger.', 'But for your timely warning, we would have been unaware of the danger.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(51, '01', 51, '11', 'Choose one sentence that has the same meaning as the root one:\r\nHe has been addicted to alcohol since his wife died.', 'It is since his wife died that he has become an alcohol addict.', 'He has been addicted to alcohol because of his wife died.', 'He has drunk a litter wine since his wife died.', 'He has stopped drinking wine since his wife’s death.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(52, '01', 51, '11', 'Choose one sentence that has the same meaning as the root one:<br>\r\nOne of the reasons why John left for the city was that he wanted to find a good job.', 'John left for the city partly because he wanted to find a good job.', 'John wanted to find a good job since he left for the city.', 'John wanted to find a good job, that the reason why he left for the city.', 'Due to he wanted to find a good job, John left for the city.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(53, '01', 84, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nI am wearing three pullovers in winter because I always feel cold.', 'am wearing', 'in', 'because', 'always feel', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(54, '01', 84, '12', 'CÂU SỐ 2\r\nFind a mistake in the four underlined parts of the sentence and correct it:<br>\r\nYou mustn’t take flowers to your hostess if you don’t want to.', 'mustn''t', 'to', 'hostess', 'don''t', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(55, '01', 84, '12', 'CÂU SỐ 3\r\nFind a mistake in the four underlined parts of the sentence and correct it:<br>\r\nMost parents prefer an education system which offers the children widest study options in the world.\r\n', 'Most parents', 'an education system', 'which', 'widest', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(56, '01', 84, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nI could make rabbits disappear into thin air if I am a magician..', 'Could make', 'disappear', 'thin air', 'am', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(57, '01', 84, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nThe mother asked the little boy whether he was sorry for what he has done.', 'little boy', 'was', 'for', 'he has', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(58, '01', 84, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nJane was dropping a carton of eggs as she was leaving the room.\r\n', 'was dropping', 'cartoon', 'as', 'was leaving', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(59, '01', 84, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nOn all likelihood, we will never know the real reason.', 'on', 'will', 'the', 'reason', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(60, '01', 84, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nSince my watch has broken. I have been late for school three times.', 'has broken', 'have been', 'for', 'three times', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(61, '01', 84, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nTom, your chores should have been finished by the time I get home, including taking out the\r\ngarbage.', 'chores', 'have been', 'by the time', 'including', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(62, '01', 84, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nThe train that we eventually caught it was one that stops at every station.', 'that', 'eventually', 'it', 'that', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(63, '01', 85, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nA person’s body postures, movements but positions more often tell us exactly what they mean.', 'A person’s', 'but', 'exactly', 'what', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(64, '01', 85, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nMy sister puts on a wig whenever she goes out, but I never wear a wig in my whole life.', 'puts on', 'whenever', 'goes out', 'never wear', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(65, '01', 85, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nDeserts may have underground springs, rivers, or reservoirs they lie close to the surface, or deep underground.', 'may have', 'they', 'the surface', 'or', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(66, '01', 85, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nShe was the first woman was elected to parliament.\r\n', 'the first', 'woman', 'was', 'to', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(67, '01', 85, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nIf you decide to take any examination system, you should make contact with the Admissions Office to ask for an appropriate preparation for the subject whom you are planning to study.\r\n', 'to take', 'should make', 'whom', 'are planning', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(68, '01', 85, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nOur bodies send out messages constantly and sometimes we do not recognize that we are using many nonverbal language.', 'send out', 'messages', 'we do not recognize', 'many', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(69, '01', 85, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nNothing can be done unless more information are given to us.\r\n', 'can be done', 'more', 'are', 'to us', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(70, '01', 85, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nThose books should be taken back to the library five days ago.\r\n', 'those', 'be', 'back', 'five days ago', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(71, '01', 85, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nHigher vocational education and training that combines teaching of both practical skills and theoretical expertise.\r\n', 'vocational', 'that combines', 'practical', 'theoretical', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(72, '01', 85, '12', 'Find a mistake in the four underlined parts of the sentence and correct it:<br>\r\nI turned on the ceiling fan; although, it is still hot in here.\r\n', 'turned on', 'ceiling fan', 'although', 'in here', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(73, '02', 55, '10', 'Một cation R+ có cấu hình electron ở phân lớp ngoài cùng là 2p6. Vậy cấu hình lectron ở phân lớp ngoài cùng của R có thể là:\r\n', '3s2.', '3s1.', '3p1.', '3s2 hoặc 3s1 hoặc 3p1.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(74, '02', 55, '10', 'Nguyên tử nào dưới đây có 1 electron độc thân:', '1s22s22p63s23p2.', '1s22s22p63s23p3.', '1s22s22p63s23p4.', '1s22s22p63s23p5.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(75, '02', 55, '10', 'Các ion sau: 9F; 11Na+; 12Mg2+; 13Al3+ có:', 'Bán kính giống nhau.', 'Số proton giống nhau.', 'Số electron giống nhau.', 'Số khối giống nhau.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(76, '02', 55, '10', 'Mệnh đề nào sau đây không đúng?<br>\r\n(I) Số điện tích hạt nhân đặc trưng cho một nguyên tố hóa học.<br>\r\n(II) Chỉ có hạt nhân nguyên tử oxi mới có 8 proton.<br>\r\n(III) Chỉ có hạt nhân nguyên tử oxi mới có 8 nơtron.<br>\r\n(IV) Chỉ có vỏ nguyên tử oxi mới có 8 electron.<br>', '(III).', '(IV).', '(II) và (III).', '(III) và (IV).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(77, '02', 55, '10', 'Cho ba nguyên tố X (Z = 2); Y (Z = 16); T (Z = 19). Phát biểu nào sau đây đúng:', 'X và T là kim loại, Y là phi kim.', 'X và Y là khí hiếm, T là kim loại.', 'X là khí hiếm, Y là phi kim, T là kim loại.', 'X, Y, T là phi kim, kim loại hay khí hiếm đều sai.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(78, '02', 55, '10', 'Cation M+ có cấu hình electron ở lớp vỏ ngoài cùng là 2p6. Cấu hình electron của nguyên tử M:', '1s22s22p6.', '1s22s22p63s2.', '1s22s22p63s23p1.', '1s22s22p63s1.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(79, '02', 55, '10', 'Số electron tối đa trong phân lớp f và phân lớp p lần lượt là:', '10e và 14e.', '14e và 6e.', '6e và 14e.', '10e và 18e.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(80, '02', 55, '10', 'Các đồng vị của cùng một nguyên tố hóa học là những nguyên tử:', 'Có cùng số proton nhưng khác nhau số electron.', 'Có cùng số electron nhưng khác nhau số proton.', 'Có cùng số proton nhưng khác nhau số nơtron.', 'Có cùng số nơtron nhưng khác nhau số proton.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(81, '02', 55, '10', 'Hầu hết các nguyên tử đều có các hạt:', 'Proton và electron.', 'Nơtron và electron.', 'Proton và nơtron.', 'Proton, nơtron và electron.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(82, '02', 55, '10', 'Có bao nhiêu electron ở lớp ngoài cùng trong nguyên tử của nguyên tố có số hiệu nguyên tử là 17?', '1', '3', '5', '7', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(83, '02', 56, '10', 'Người ta phân biệt SO3, SO2 bằng:', 'Dung dịch brom.', 'Dung dịch KMnO4.', 'Dung dịch BaCl2.', 'Tất cả các chất trên', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(84, '02', 56, '10', 'Chọn phát biểu đúng:', 'Oxi có các dạng thù hình là 17O và 18O.', 'Oxi chỉ có hai số oxi hóa là 0 và -2.', 'Số oxi hóa -2 là số oxi hóa bền nhất của oxi.', 'Oxi không bao giờ thể hiện tính khử khi phản ứng với các chất khác.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(85, '02', 56, '10', 'Axit sunfuric đặc không thể hóa than hợp chất nào sau đây:', 'Glucozơ.', 'Saccarozơ.', 'Xenlulozơ.', 'Đá vôi.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(86, '02', 56, '10', 'Trong các phản ứng sau, phản ứng nào không là phản ứng oxi hóa khử:', 'H2SO4 + S -> SO2 + H2O.', 'H2SO4 + Fe ->  Fe2(SO4)3 + SO2 + H2O.', 'H2SO4 + Fe3O4 ->  FeSO4 + Fe2(SO4)3 + H2O.', 'H2SO4 + FeO -> Fe2(SO4)3 + SO2 + H2O.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(87, '02', 56, '10', 'Cho 2 phương trình hóa học sau:<br>\r\nH2SO3 + 2H2S -> 3S + 3H2O<br>\r\n5H2SO3 + 2KMnO4 -> 2MnSO4 + Na2SO4 + 2H2SO4 + 3H2O<br>\r\nPhát biểu nào sau đây diễn tả đúng tính chất của H2SO3 trong 2 phương <br>trình hóa học trên?', 'Là một axit yếu.', 'Là chất khử.', 'Là chất oxi hóa.', 'Vừa là chất khử, vừa là chất oxi hóa.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(88, '02', 56, '10', 'Các nguyên tố thuộc nhóm VI A có số electron ở lớp ngoài cùng là:', '1', '2', '4', '6', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(89, '02', 56, '10', 'Trong các phương trình hóa học có đơn chất oxi tham gia phản ứng, vai trò của oxi là:', 'Chất khử.', 'Chất oxi hóa.', 'Vừa là chất khử, vừa là chất oxi hóa.', 'Không là chất khử, cũng không là chất oxi hóa.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(90, '02', 56, '10', 'Trong hợp chất nào, nguyên tố S không thể hiện tính oxi hóa:', 'KHS.', 'Na2SO3', 'SO2', 'H2SO4', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(91, '02', 56, '10', 'Trong các hợp chất sau đây của lưu huỳnh, hợp chất nào không thể dùng làm chất khử:', 'SO2', 'K2SO3', 'H2SO4', 'Na2S', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(92, '02', 56, '10', 'Cho các phản ứng sau:<br>\r\n1) H2O + CO -> H2 + CO2<br>\r\n2) H2O2 + CO -> H2O + CO2<br>\r\nPhát biểu nào sau đây diễn tả đúng nhất tính chất của 2 phản ứng trên?', 'H2O và H2O2 đều có tính khử.', 'H2O và H2O2 đều có tính oxi hóa.', 'H2O và H2O2 đều oxi hóa được CO nhưng H2O2 có tính oxi hóa mạnh hơn nước.', 'H2O và H2O2 đều khử được CO nhưng H2O2 có tính khử mạnh hơn nước.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(93, '02', 39, '11', 'Có bốn dung dịch riêng biệt: Na2CO3, Na2SO4, BaCl2, NaNO3. Chỉ dùng thêm quỳ tím thì có thể nhận biết được mấy chất:', '4', '3', '2', '1', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(94, '02', 39, '11', 'Theo thuyết Bronstet, H2O có vai trò là một axit khi nó:', 'Cho một electron.', 'Nhận một electron.', 'Cho một proton.', 'Nhận một proton.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(95, '02', 39, '11', 'Cho a mol NO2 hấp thụ hoàn toàn vào dung dịch chứa a mol NaOH. pH của dung dịch thu được là:', 'pH = 7.', 'pH = 0.', 'pH > 7.', 'pH < 7.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(96, '02', 39, '11', 'CÂU SỐ 4\r\nIon OH- có thể phản ứng với các ion nào sau đây?', 'H+,', 'Cu2+, Mg2+, Al3+.', 'Fe2+, Zn2+, Al3+.', 'H+, , , Cu2+, Mg2+, Al3+, Fe2+, Zn2+, Al3+, Fe3+', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(97, '02', 39, '11', 'Chất rắn nào sau đây tan nhiều trong nước tạo ra một dung dịch không có tính dẫn điện?', 'Muối ăn (NaCl).', 'Cát (SiO2).', 'Benzen (C6H6).', 'Glucozơ (C6H12O6).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(98, '02', 39, '11', 'Chọn mệnh đề đúng:', 'Dung dịch bazơ bao giờ cũng làm quỳ tím hóa xanh.', 'Dung dịch muối axit bao giờ cũng có môi trường axit.', 'Dung dịch muối trung hòa bao giờ độ pH cũng bằng 7.', 'Nước cất có pH = 7.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(99, '02', 39, '11', 'Muối nào sau đây không bị thủy phân?', 'Na2S', 'NaCl', 'Al2S3', 'Fe2(SO4)3.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(100, '01', 39, '11', 'Chất rắn nào sau đây khi hòa tan vào nước sẽ làm cho giá trị pH của nước tăng?', 'NaCl', 'NH4Cl', 'Fe(NO3)3.', 'Na2CO3', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(101, '02', 39, '11', 'Khí hiđro clorua tan trong nước, ion dương xuất hiện trong dung dịch chỉ là:', 'Ion hiđroni.', 'Ion clorua.', 'Ion hiđroxit.', 'Ion hiđrua.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(102, '02', 39, '11', 'Nước nguyên chất:', 'Không chứa ion OH- và không chứa ion H3O+.', 'Có nồng độ ion OH- bằng nồng độ ion H3O+.', 'Có nồng độ ion H3O+ lớn hơn nồng độ ion OH-.', 'Có nồng độ ion H3O+ nhỏ hơn nồng độ ion OH-.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(103, '02', 40, '11', 'Silic đioxit phản ứng được với nhóm chất nào sau đây?', 'MgO, C, KOH, HF, MgCO3.', 'MgO, C, KOH, MgCO3.', 'MgO, KOH, HF, MgCO3.', 'MgO, C, KOH, HF.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(104, '02', 40, '11', 'Dẫn từ từ khí CO2 vào dung dịch nước vôi trong cho đến dư. Hiện tượng quan sát được là:', 'Dung dịch bị vẩn đục.', 'Dung dịch vẩn đục, sau đó trong trở lại.', 'Không thấy hiện tượng gì xảy ra.', 'Hiện tượng khác.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(105, '02', 40, '11', 'Thổi 0,5 mol khí CO2 vào dung dịch chứa 0,4 mol Ba(OH)2. Sau phản ứng thu được a mol kết tủa. Giá trị của a là:', '0,15 mol.', '0,2 mol.', '0,3 mol.', '0,35 mol.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(106, '02', 40, '11', 'Thổi rất chậm 2,24 lít (đktc) một hỗn hợp khí gồm CO và H2 đi qua một ống sứ đựng hỗn hợp {Al2O3, CuO, Fe3O4, Fe2O3} có khối lượng 24 gam (lấy dư) đang được đun nóng. Sau khi phản ứng xảy ra hoàn toàn khối lượng chất rắn còn lại trong ống sứ là:', '22,4g', '11,2g', '20,8g', 'Không thể xác định được.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(107, '02', 40, '11', 'Cả hai oxit trong dãy nào sau đây đều là những oxit axit?', 'GeO2 và SnO2.', 'SnO2 và CO2.', 'PbO2 và SiO2.', 'CO2 và SiO2.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(108, '02', 40, '11', 'Có hai dung dịch Na2SO4 và Na2CO3. Thuốc thử nào có thể dùng để nhận biết mỗi dung dịch?', 'BaCl2', 'Axit HCl.', 'Pb(NO3)2.', 'NaCl', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(109, '02', 40, '11', 'Để xác định thành phần phần trăm khối lượng nước có trong một loại tinh thể muối nitrat ngậm nước, người ta tiến hành thí nghiêm sau:<br>\r\n- Cân chén nung rỗng, có khối lượng 69g.<br>\r\n- Cân chén nung có đựng tinh thể muối ngậm nước, khối lượng là 75g.<br>\r\n- Đun nóng chén nung được tinh thể muối khan có khối lượng là 72g.<br>\r\nPhần trăm khối lượng nước trong tinh thể muối ngậm nước là:<br>', '8%', '50%', '72%', '96%', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(110, '02', 40, '11', 'Từ những phản ứng hóa học:<br>\r\nNa2CO3 + HCl  NaCl + H2O + CO2↑<br>\r\nNa2SiO3 + CO2 + H2O  H2SiO3 + Na2CO3<br>\r\ncho biết axit silixic có tính axit:', 'Mạnh hơn axit cacbonic, nhưng yếu hơn axit clohiđric.', 'Yếu hơn axit cacbonic và axit clohiđric.', 'Yếu hơn axit cacbonic, nhưng mạnh hơn axit clohiđric.', 'Mạnh hơn axit cacbonic và axit clohiđric.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(111, '02', 40, '11', 'M là kim loại hóa trị II. Nung đến khối lượng không đổi 25,9 (g) M(HCO3)2 rồi cho khí CO2 hấp thụ vào Ca(OH)2 có dư tạo 20 gam kết tủa.<br> M là nguyên tố:', 'Cu', 'Ca', 'Ba', 'Mg', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(112, '02', 40, '11', 'Có ba chất màu trắng CaCO3, Na2CO3, và NaNO3 đựng trong ba lọ không dán nhãn.<br> Chỉ dùng nhóm hóa chất nào sau đây có thể nhận biết được ba dung dịch đó?', 'Quỳ tím và nước.', 'Dung dịch HCl và nước.', 'Quỳ tím và nước hoặc dung dịch HCl và nước đều đúng.', 'Quỳ tím và nước hoặc dung dịch HCl và nước đều sai.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(113, '02', 74, '12', 'Cho hợp kim Zn-Mg-Ag vào dung dịch CuCl2. Sau phản ứng thu được hỗn hợp 3 kim loại là:', 'Zn, Mg, Cu.', 'Zn, Mg, Ag.', 'Mg, Ag, Cu.', 'Zn, Ag, Cu.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(114, '02', 74, '12', 'Khi nhiệt độ tăng, độ dẫn điện của các kim loại thay đổi theo chiều:', 'Tăng', 'Giảm', 'Không thay đổi', 'Vừa tăng vừa giảm.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(115, '02', 74, '12', 'Cho hỗn hợp Mg, Ag vào dung dịch chứa FeSO4 và CuCl2. Sau phản ứng thu được chất rắn X và dung dịch Y.<br> Thành phần của X, Y phù hợp với thí nghiệm là:', 'X: Fe, Cu, AgCl;    Y: Mg2+', 'X: Mg, Cu, Ag;     Y: Fe2+, , Cl−.', 'X: Cu, Fe;    Y: Mg2+; Ag+, Cl−', 'X: Mg, Fe, Cu, Ag;     Y: Mg2+, Cl−', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(116, '02', 74, '12', 'Tính chất chung của ăn mòn điện hoá và ăn mòn hoá học là:', 'Có phát sinh dòng điện.', 'Electron của kim loại được chuyển trực tiếp sang môi trường tác dụng.', 'Nhiệt độ càng cao tốc độ ăn mòn càng nhanh.', 'Đều là các quá trình oxi hoá - khử.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(117, '02', 74, '12', 'Để bảo vệ vỏ tàu biển làm bằng thép, người ta thường gắn vào đáy tàu (phần ngâm trong nước biển) một miếng kim loại:', 'Sn', 'Zn', 'Cu', 'Ba', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(118, '02', 74, '12', 'Cho 54,8 gam Ba vào 200 (ml) dung dịch CuSO4 1M. Khi phản ứng xảy ra hoàn toàn thì khối lượng kết tủa thu được là:', '19,6 (gam).', '46,6 (gam).', '66,2 (gam).', '93,2 (gam).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(119, '02', 74, '12', 'Trong quá trình điện phân dung dịch CuSO4 (các điện cực bằng graphit), hiện tượng nào được mô tả là đúng?', 'Ở anot xảy ra sự khử ion Cu2+.', 'Ở catot xảy ra sự oxi hoá phân tử H2O.', 'Ở catot xảy ra sự khử ion Cu2+.', 'Ở anot xảy ra sự oxi hoá ion .', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(120, '02', 74, '12', 'Cho phản ứng hoá học : Mg + CuSO4  MgSO4 + Cu<br>\r\nPhương trình hoá học nào biểu thị cho sự oxi hoá?', 'Mg2+ + 2e ->  Mg.', 'Mg -> Mg2+ + 2e.', 'Cu2+ + 2e -> Cu.', 'Cu2+ + Mg -> Cu + Mg2+.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(121, '02', 74, '12', 'Cho 3,68 (gam) hỗn hợp gồm Al và Zn tác dụng với một lượng vừa đủ dung dịch H2SO4 10%, thu được 2,24 (lít) khí H2 (ở đktc).<br> Khối lượng dung dịch thu được sau phản ứng là:', '101,68 (gam).', '101,48 (gam).', '97,80 (gam).', '88,20 (gam).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(122, '02', 74, '12', 'Hoà tan 2,74g kim loại M thuộc nhóm A vào 200ml dung dich HCl 0,1M thu được dung dịch A và 492,8ml khí ở 27,30C, 1atm. <br>Xác định kim loại M.', 'Sn', 'Ba', 'Sr', 'Cs', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(123, '02', 76, '12', 'Cho từ từ 1,15 (gam) Na vào 1,0 (ml) dung dịch AlCl3 nồng độ 0,1 (mol/lít).<br> Hiện tượng xảy ra và các chất trong dung dịch thu được là:', 'Có khí thoát ra, trong dung dịch xuất hiện kết tủa, sau đó kết tủa tan hoàn toàn. Dung dịch chứa: NaAlO2, NaCl, NaOH.', 'Có khí thoát ra, trong dung dịch xuất hiện kết tủa, sau đó kết tủa tan một phần. Dung dịch chứa: NaAlO2, NaCl.', 'Trong dung dịch xuất hiện kết tủa, sau đó kết tủa tan hoàn toàn. Dung dịch chứa: NaAlO2, NaCl, NaOH.', 'Có khí thoát ra, dung dịch trong suốt. Dung dịch chứa: NaAlO2, NaCl, AlCl3.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(124, '02', 76, '12', 'Hòa tan 5,4 gam bột Al vào 150 ml dung dịch chứa Fe(NO3)3 1M và Cu(NO3)2 1M. Kết thúc phản ứng thu được m gam chất rắn. Giá trị của m là:', '10,95.', '13,20.', '13,80. ', '15,20.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(125, '02', 76, '12', 'Cho 1,2 (g) Mg vào 100 (ml) dung dịch hỗn hợp gồm HCl 1,5M và NaNO3 0,5M.<br> Sau phản ứng chỉ thu được V (lít) khí dạng đơn chất (không có sản phẩm khử nào khác).\r\nThể tích V (đktc) bằng:', '0,224 (lít).', '0,560 (lít).', '1,120 (lít).', '5,600 (lít).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(126, '02', 76, '12', 'Bột nhôm tự bốc cháy khi tiếp xúc với:', 'Oxi', 'Clo', 'Lưu huỳnh.', 'Hơi nước.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(127, '02', 76, '12', 'Hòa tan hoàn toàn 7,02 gam hỗn hợp muối cacbonat của hai kim loại A và B thuộc nhóm IIA và thuộc hai chu kì liên tiếp trong bảng tuần hoàn bằng dung dịch HCl thu được 1,68 lít khí (đktc). Hai kim loại A và B là:', 'Be và Mg.', 'Mg và Ca.', 'Ca và Sr', 'Sr và Ba.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(128, '02', 76, '12', 'Nhận định nào không đúng về cấu tạo và tính chất vật lí của các kim loại kiềm thổ?', 'Khối lượng riêng tương đối nhỏ, chúng là những kim loại nhẹ hơn nhôm (trừ Ba).', 'Độ cứng tuy có cao hơn kim loại kiềm nhưng nhìn chung là những kim loại mềm hơn nhôm.', 'Mạng tinh thể của chúng đều có kiểu lập phương tâm khối.', 'Nhiệt độ nóng chảy và nhiệt độ sôi tương đối thấp (trừ Be).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(129, '02', 76, '12', 'Thuốc thử thích hợp để làm mềm nước cứng tạm thời là:', 'Dung dịch Ca(OH)2.', 'Dung dịch Na2SO4.', 'Dung dịch Na2CO3.', 'Dung dịch Ca(OH)2 hoặc dung dịch Na2CO3.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(130, '02', 76, '12', 'Dung dịch A chứa 5 ion: Mg2+, Ba2+, Ca2+ và 0,1 mol Cl–, 0,2 mol .<br> Thêm dần V (ml) dung dịch K2CO3 1M vào dung dịch A cho đến khi lượng kết tủa thu được lớn nhất. Giá trị của V là:', '100', '300', '200', '350', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(131, '02', 76, '12', 'Cho 20,6 (g) hỗn hợp muối cacbonat kim loại kiềm và kim loại kiềm thổ tác dụng với dung dịch HCl dư thấy có 4,48 lít khí thoát ra (đktc). <br>Cô cạn dung dịch muối khan thu được đem điện phân nóng chảy thu được m gam kim loại. Giá trị của m là:', '8,6', '8,7', '8,8', '8,9', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(132, '03', 62, '10', '* Một người A đứng yên trên một đoàn tàu có chiều dài 300 (m), chuyển động với vận tốc 144 (km/h).<br> Một người B đứng yên trên một đoàn tàu dài 150 (m), chuyển động với vận tốc 90 (km/h).<br> Hai đoàn tàu chạy trên hai đường ray song song theo hướng tới gặp nhau.<br>\r\nĐối với người B, thời gian đoàn tàu thứ nhất chạy qua trước mặt người B:', '4,6s', '6,92s', '12s', '2,3s', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(133, '03', 62, '10', 'Chu kì của vật chuyển động theo vòng tròn bán kính 10 (cm) bằng 4 (s). Vận tốc góc của vật bằng bao nhiêu:', '2π (rad/s).', '4π (rad/s).', 'π (rad/s).', 'π/2 (rad/s).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(134, '03', 62, '10', 'Phát biểu nào sau đây là đúng:', 'Độ dời là quãng đường vật đi được.', 'Độ dời bằng quãng đường khi vật chuyển động thẳng.', 'Trong chuyển động thẳng, tốc độ trung bình bằng độ lớn của vận tốc trung bình.', 'Tốc độ trung bình của một chuyển động thẳng bất kì bao giờ cũng dương.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(135, '03', 62, '10', '* Cho đồ thị diễn tả vị trí của một chuyển động thẳng theo thời gian.\r\n                   <br>\r\nThời điểm nào sau khi chuyển động, vật cách gốc tọa độ 4 (m):', '1s', '5s', '6s', '1s và 6s', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(136, '03', 62, '10', '* Xét một bánh xe bán kính R quay đều quanh trục với vận tốc góc ω. Xét 1 điểm trên vành bánh xe (1) và 1 điểm nằm cách trục quay R/2 (2).\r\n<br>Chu kì quay của 2 điểm đó là:', 'T1 = 2T2.', 'T2 = 2T1.', 'T1 = T2.', 'Một kết quả khác.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(137, '03', 62, '10', '* Chiều dài hộp đựng bút trong năm lần đo (đơn vị mm) là: 250; 252; 252; 248; 250.<br>\r\nSai số tỉ đối của phép đo trên là?', '0,4%', '0,8%', '4%', '8%', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(138, '03', 62, '10', '* Một dòng sông rộng 60 (m), nước chảy với vận tốc 1 (m/s) đối với bờ. <br>Một chiếc thuyền đi trên sông với vận tốc 3 (m/s).\r\n<br>Vận tốc của thuyền đối với bờ khi ngược dòng là?', '4 (m/s).', '2 (m/s).', '3,2 (m/s).', 'Không có giá trị nào đúng.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(139, '03', 64, '10', 'Trong nhiều bài toán thực tế người ta hay dùng các đơn vị không nằm trong hệ đơn vị SI. <br>Ví dụ đo áp suất bằng atmosphe, đo thể tích bằng lít.<br> Nếu dùng các đơn vị ấy thì phương trình trạng thái của 1 mol khí lí tưởng sẽ phải dùng <br> đơn vị nào để đo R và giá trị của R bằng bao nhiêu:', 'R = 0,082 J/mol.K.', 'R = 8,31 l.atm/mol.K.', 'R = 8,31 J/mol.K.', 'R = 0,082 l.atm/mol.K.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(140, '03', 64, '10', 'Hai bình chứa khí lí tưởng ở cùng nhiệt độ. Bình B có dung tích gấp đôi bình A, có số phân tử bằng nửa số phân tử trong bình A.<br> Mỗi phân tử khí trong bình B có khối lượng gấp đôi mỗi phân tử khí trong bình A. <br>Áp suất khí trong bình B so với áp suất khí trong bình A thì:', 'Bằng một nửa.', 'Gấp đôi.', 'Bằng nhau.', 'Bằng một phần tư.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(141, '03', 64, '10', 'Có 14 (g) chất khí nào đó đựng trong bình kín có thể tích 1 (lít).<br> Đun nóng đến 1270C áp suất khí trong bình là 16,62.105 (N/m2). Khí đó là khí gì:', 'Ôxi', 'Nitơ', 'Hêli', 'Hiđrô', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(142, '03', 64, '10', 'Một khối khí lí tưởng qua thực hiện quá trình biến đổi mà kết quả là nhiệt độ tăng gấp đôi và áp suất tăng gấp đôi. <br>Gọi V1 là thể tích ban đầu của khí, thể tích cuối là V2 thì:', 'V2 = 2V1.', 'V2 = V1/4.', 'V2 = 4V1.', 'V2 = V1.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(143, '03', 64, '10', 'Một bình có thể tích 5,6 (l) chứa 0,5 (mol) khi ở 00C. Áp suất khí trong bình là?', '1 (atm).', '2 (atm).', '4 (atm).', '0,5 (atm)', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(144, '03', 64, '10', 'Tăng nhiệt độ nhưng giữ thể tích của khối khí không đổi. Áp suất khối khí tác dụng lên thành bình tăng vì:', 'Khối lượng phân tử khi tăng.', 'Phân tử mất nhiều động năng hơn khi va chạm vào thành bình.', 'Thời gian va chạm vào thành bình ngắn hơn.', 'Phân tử có vận tốc trung bình lớn hơn và va chạm vào thành bình nhiều hơn.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(145, '03', 44, '11', '* Ba tụ điện có điện dung C1 = 60 (μF), C2 = 40 (μF), C3 = 20 (μF) được mắc với nhau thành bộ.<br>\r\n               \r\nTụ C3 có điện tích Q3 = 60 (μC); Hiệu điện thế giữa hai điểm A và B là:', '3 (V).', '12 (V).', '4 (V).', '6 (V).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(146, '03', 44, '11', 'Độ lớn của lực tương tác tĩnh điện Coulomb giữa hai điện tích điểm đặt trong chân không sẽ:', 'Tỉ lệ thuận với bình phương độ lớn hai điện tích đó.', 'Tỉ lệ thuận với khoảng cách giữa chúng.', 'Tỉ lệ nghịch với khoảng cách giữa chúng.', 'Tỉ lệ nghịch với bình phương khoảng cách giữa chúng.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(147, '03', 44, '11', 'Kết luận nào sau đây là sai khi nói về công của lực điện trường làm di chuyển một điện tích q trong điện trường?', 'Phụ thuộc vào hình dạng đường đi.', 'Phụ thuộc cường độ điện trường.', 'Phụ thuộc hiệu điện thế ở hai đầu đường đi.', 'Phụ thuộc vào độ lớn của điện tích đó.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin');
INSERT INTO `questions` (`question_id`, `major_id`, `submajor_id`, `class_id`, `question`, `answer_1`, `answer_2`, `answer_3`, `answer_4`, `correct_answer`, `insert_dt`, `insert_user`, `update_dt`, `update_user`) VALUES
(148, '03', 44, '11', 'Phát biểu nào sau đây là đúng?', 'Điện dung của tụ điện là điện tích trên bản tụ dương.', 'Điện dung của tụ điện tỉ lệ khoảng cách giữa hai bản tụ.', 'Điện dung của tụ điện tỉ lệ với điện tích của nó.', 'Điện tích của tụ điện tỉ lệ với hiệu điện thế giữa hai bản của nó.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(149, '03', 44, '11', 'Một vật dẫn cân bằng điện trong điện trường thì:', 'Cường độ điện trường bên trong vật bằng không.', 'Điện thế tại điểm trên bề mặt lớn nhất.', 'Điện tích tập trung nhiều ở chỗ lõm.', 'Điện tích phân bố đều trong khối vật dẫn.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(150, '03', 44, '11', 'Nếu một vật A trở nên tích điện dương khi cọ xát với vật B thì vật B đã:', 'Nhận êlectron.', 'Mất êlectron.', 'Nhận prôton.', 'Mất prôton.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(151, '03', 44, '11', ' C1 và C2 là hai tụ phẳng có cùng điện tích. Giữa các bản là các chất điện môi giống nhau có bề dày d và 2d. Điện dung của tụ C1 là 0,12 (μF).<br>\r\nĐiện dung của bộ tụ C1 và C2 ghép nối tiếp là:', '0,04 (μF).', '0,08 (μF).', '0,18 (μF).', '0,36 (μF).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(152, '03', 44, '11', 'Một tụ có điện dung C mắc vào hiệu điện thế U thì có điện tích là Q. Phát biểu nào sau đây là đúng?', 'C không phụ thuộc vào U.', 'C tỉ lệ nghịch với U.', 'C tỉ lệ thuận với Q.', 'Q tỉ lệ nghịch với U.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(153, '03', 44, '11', 'Sau khi ngắt tụ điện phẳng khỏi nguồn điện, ta tịnh tiến hai bản tụ để khoảng cách giữa chúng giảm, khi đó:', 'Điện tích trên hai bản tụ sẽ giảm.', 'Hiệu điện thế giữa hai bản tụ tăng.', 'Năng lượng điện trường trong tụ sẽ tăng.', 'Năng lượng điện trường trong tụ sẽ giảm.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(154, '03', 44, '11', 'Có ba điện tích điểm nằm cố định trên ba đỉnh của một hình vuông (mỗi diện tích ở một đỉnh) sao cho điện trường ở đỉnh thứ tư bằng không. <br>Nếu vậy thì trong ba điện tích đó là? Chọn kết luận sai:', 'Có hai điện tích dương, một điện tích âm.', 'Có hai điện tích âm, một điện tích dương.', 'Đều là các điện tích dương.', 'Có hai điện tích bằng nhau, độ lớn của hai điện tích này nhỏ hơn độ lớn của điện tích thứ ba.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(155, '03', 45, '11', 'Một bộ nguồn điện gồm 20 pin mắc thành hai dãy song song, mỗi dãy có 10 pin mắc nối tiếp.<br> Mỗi pin có suất điện động = 1,5 V, điện trở trong r = 0,5 Ω.<br> Hai cực của bộ nguồn được nối vào hai điện cực bằng bạc của một bình điện phân dung dịch AgNO3 (Ag = 108; n = 1).<br> Điện trở của bình điện phân bằng R = 197,5 Ω. <br>Tính khối lượng bạc được giải phóng ở catôt trong thời gian t = 90 phút.', 'm = 0,53 g.', 'm = 0,51 g.', 'm = 0,33 g.', 'm = 0,13 g.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(156, '03', 45, '11', 'Hệ số nhiệt điện trở của kim loại có giá trị dương và chỉ phụ thuộc vào:', 'Nhiệt độ của kim loại.', 'Độ sạch (hay độ tinh khiết) của kim loại.', 'Chế độ gia công của kim loại.', 'Nhiệt độ của kim loại và độ sạch (hay dộ tinh khiết) của kim loại hoặc chế độ gia công của kim loại.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(157, '03', 45, '11', 'Dây tóc một bóng đèn 110 V-100 W khi sáng bình thường có nhiệt độ 2200°C. Hệ số nhiệt điện trở của dây tóc bằng α = 4,5.10-3 K-1. Tìm điện trở Ro, của dây tóc ở 20°C.<br> Điện trở dây tóc trong khoảng nhiệt độ này xem như tăng tỉ lệ bậc nhất theo nhiệt độ.', 'Ro = 12,60 Ω.', 'Ro = 11,19 Ω.', 'Ro = 11,02 Ω.', 'Ro = 9,44 Ω.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(158, '03', 45, '11', 'Khi điện phân dung dịch H2SO4 có các điện cực bằng platin. Sản phẩm thu được ở anôt và catôt lần lượt là:', 'Khí ôxi - khí hiđrô.', 'Khí hiđrô - khí ôxi.', 'Khí hiđrô - SO4.', 'SO4 - khí hiđrô', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(159, '03', 45, '11', 'Dòng điện trong chất điện phân là chuyển động có hướng của:', 'Các chất tan trong dung dịch.', 'Các ion dương trong dung dịch.', 'Các ion dương và các ion âm dưới tác dụng của điện trường trong dung dịch.', 'Các ion dương và các ion âm theo chiều điện trường trong dung dịch.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(160, '03', 45, '11', 'Phát biểu nào dưới đây về tranzito là chính xác:', 'Một lớp bán dẫn p kẹp giữa hai lớp bán dẫn n là một tranzito n-p-n.', 'Một lớp bán dẫn n mỏng kẹp giữa hai lớp bán dẫn p không thể xem là một tranzito.', 'Một lớp bán dẫn p mỏng kẹp giữa hai lớp bán dẫn n luôn có khả năng khuếch đại.', 'Trong tranzito n-p-n, bao giờ mật độ hạt tải điện miền êmitơ cũng cao hơn miền bazơ.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(161, '03', 45, '11', 'Câu nào dưới đây nói về điôt phát quang (LED) là không đúng:', 'Điôt phát quang là linh kiện bán dẫn khi có dòng điện chạy qua thì nó sẽ phát ra ánh sáng.', 'Điôt phát quang là linh kiện bán dẫn khi có khả năng biến năng lượng ánh sáng thành năng lượng điện.', 'Điôt phát quang làm bằng một số liệu bán dẫn như GaP (gali - photpho), GaAs (gali-asen),.. và thường dùng trong các bộ chỉ thị số, các bộ điều khiển từ xa.', 'Điôt phát quang được chế tạo đặc biệt có thể trở thành nguồn laze bán dẫn hiện đang dùng phổ biến trong các thiết bị nghe nhìn.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(162, '03', 45, '11', '** Cho một mạch điện gồm một nguồn  có suất điện động 8 V, điện trở trong 0,5 Ω, một bình điện phân đựng dung dịch CuSO4 có anôt làm bằng platin.<br> Bình có suất phản điện '' = 2 V, điện trở r’ = 1,5 Ω. Cho biết với đồng A = 63,546 g và đồng có hóa trị n = 2 trong dung dịch điện phân CuSO4. <br>Lượng đồng bám vào catôt là 3,2 g.\r\nTính thời gian điện phân.', 't = 1 giờ 04 phút.', 't = 54 phút.', 't = 47 phút.', 't = 45 phút.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(163, '03', 45, '11', 'Một bình điện phân chứa dung dịch đồng sunphat (CuSO4) với hai điện cực bằng đồng (Cu). Khi cho dòng điện không đổi chạy qua bình này trong khoảng thời gian 30 phút, thì thấy khối lượng của catôt tăng thêm 1,143g.<br> Tính cường độ dòng điện I chạy qua bình điện phân. Khối lượng nguyên tử của đồng là A = 63,5; n = 2:', 'I = 0,965A.', 'I = 1.93A.', 'I = 0,965mA.', 'I = 1,93mA.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(164, '03', 80, '12', 'Con lắc lò xo có k = 100 N/m, m = 1 kg dao động điều hòa. Khi vật có động năng 10 mJ thì vật cách vị trí cân bằng 1 cm.<br> Khi vật có động năng 5 mJ thì thế năng của vật bằng bao nhiêu?', '2.10^-2 J.', '5.10^-2 J.', '3.10^–2 J.', '10^–2 J.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(165, '03', 80, '12', 'Một chất điểm khối lượng m = 0,01 (kg) thực hiện dao động điều hoà với chu kì T = 2 (s) và pha ban đầu bằng 0 (rad).<br> Năng lượng toàn phần của chất điểm là E = 10-4 (J). Phương trình của chất điểm đó là:', 'x = 4,5cosπt (cm).', 'x = 45cosπt (cm).', 'x = 4,5cos(πt + π/2) (cm).', 'x = 45cos(πt + π/4) (cm).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(166, '03', 80, '12', 'Câu nào dưới đây không đúng với vật dao động điều hòa có phương trình x = Acos(ωt + φ):', 'Biên độ A, tần số góc ω là những hằng số dương, pha ban đầu φ cũng là hằng số nhưng có thể dương, âm hoặc bằng không.', 'Biên độ A, tần số góc ω và pha ban đầu φ đều là những hằng số dương.', 'Pha ban đầu φ phụ thuộc vào trạng thái ban đầu.', 'Biên độ A phụ thuộc vào năng lượng ban đầu kích thích cho hệ.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(167, '03', 80, '12', 'Biên độ của dao động cưỡng bức không phụ thuộc vào:', 'Biên độ của ngoại lực tuần hoàn tác dụng lên vật.', 'Pha ban đầu của ngoại lực tuần hoàn tác dụng lên vật. ', 'Tần số ngoại lực tuần hoàn tác dụng lên vật.', 'Hệ số của lực cản tác dụng lên vật dao động.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(168, '03', 80, '12', 'Một chất điểm thực hiện dao động điều hoà theo phương nằm ngang trên đoạn thẳng AB = 2a với chu kì T = 2 (s).<br> Chọn gốc thời gian lúc t = 0, khi chất điểm nằm ở li độ x = a/2  và vận tốc có giá trị âm. Phương trình dao động của chất điểm có dạng:', 'x = asin(πt + π).', 'x = asin(πt + π/2).', 'x = asin(πt + π/4).', 'x = asin(πt + π/6).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(169, '03', 80, '12', 'Một vật thực hiện hai dao động thành phần cùng phương, cùng tần số và có biên độ bằng nhau.<br> Dao động tổng hợp có biên độ A và độ lệch pha ban đầu là . Kết luận nào sau đây là đúng?', 'Dao động thành phần có biên độ là A/2.', 'Dao động thành phần có biên độ là A/2cosφ.', 'Hai dao động thành phần cùng pha.', 'Hai dao động thành phần ngược pha.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(170, '03', 80, '12', '** Một cái đĩa nằm ngang có khối lượng M=200(g), được gắn vào đầu trên của một lò xo thẳng đứng có độ cứng k. <br>Đầu dưới của lò xo được giữ cố định. Đĩa có thể chuyển động theo phương thắng đứng. Bỏ qua mọi ma sát và lực cản của không khí. <br>Đĩa đang ở vị trí cân bằng người ta thả một vật có m=100(g)từ độ cao h=7,5cm so với mặt đĩa. <br>Va chạm giữa vật và đĩa là va chạm đàn hồi.Sau va chạm đầu tiên vật nảy lên và được giữ cho không rơi xuống đĩa nữa.Lấy g=10m/s2\r\n<br>Lấy gốc thời gian là lúc vật chạm vào đĩa, gốc toạ độ là vị trí cân bằng của đĩa lúc ban đầu, chiều hướng lên trên và M = 200 (g), m = 100 (g), k = 20 (N/m), A = 4 (cm), h = 7,5 (cm), g = 10 (m/s2). Phương trình dao động của đĩa là:', 'x = 8,2.sin10t (cm).', 'x = 8,2.sin(10πt – π) (cm).', 'x = 0,82.sin10πt (cm).', 'x = 8,2.sin(10t + π) (cm).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(171, '03', 81, '12', 'Muốn làm phát sinh trong mạch kín S một dòng điện cảm ứng ta phải:', 'Thay đổi góc α và thay đổi từ trường B.', 'Thay đổi diện tích S của mạch kín.', 'Đưa mạch kín ra khỏi vùng không gian có từ trường B.', 'Thay đổi góc α, từ trường B, diện tích S của mạch kín và đưa mạch kín ra khỏi vùng không gian có từ trường B.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(172, '03', 81, '12', 'Tìm câu trả lời đúng trong số các câu dưới đây:', 'Khi 3 mạch tiêu thụ điện giống hệt nhau thì 3 dòng điện tạo ra bởi máy phát điện 3 pha là 3 dòng điện xoay chiều có dạng: i1 = I0cosωt; i2 = I0cos(ωt + 120°) và i3 = I0cos(ωt – 120°).', 'Dòng điện 3 pha là hệ dòng điện xoay chiều tạo ra bởi 3 máy dao điện một pha riêng biệt.', 'Khi chưa nối với các mạch điện tiêu thụ điện thì 3 suất điện động tạo bởi máy phát điện 3 pha giống hệt nhau về mọi mặt.', 'Máy phát điện 3 pha có 3 phần: phần cảm gồm 3 cuộn dây giống nhau (hay 3 cặp cuộn dây) đặt lệch nhau 120° trên lõi sắt (stato) và phần ứng gồm 1 hay nhiều cặp cực từ quay tròn đều (rôto).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(173, '03', 81, '12', 'Cơ sở hoạt động của máy biến thế là gì?', 'Hiện tượng từ trễ.', 'Cảm ứng điện từ.', 'Cảm ứng từ.', 'Cộng hưởng điện từ.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(174, '03', 81, '12', 'Trong mạch có tụ điện, nhận xét nào sau đây là đúng nhất về tác dụng của tụ điện?', 'Cho dòng điện xoay chiều đi qua dễ dàng.', 'Cản trở dòng điện xoay chiều.', 'Ngăn cản hoàn toàn dòng điện xoay chiều.', 'Cho dòng điện xoay chiều đi qua đồng thời cũng cản trở dòng điện.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(175, '03', 81, '12', 'Dòng điện chạy qua một điện trở thuần R = 2 Ω có biểu thức i = cos100πt (A). Biểu thức của điện áp trên hai đầu đoạn mạch là:', 'u = cos(100πt + π) (V).', 'u = 2cos(100πt) (V).', 'u = cos(100πt + π/2) (V).', 'u = 0,5cos(100πt) (V).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(176, '03', 81, '12', 'Một máy phát điện xoay chiều có một cặp cực phát ra dòng điện xoay chiều tần số 50 (Hz).<br> Nếu máy có 6 cặp cực cùng phát ra dòng điện xoay chiều tần số 50 (Hz) thì trong một phút rôto quay được bao nhiêu vòng?', 'n'' = 500 vòng.', 'n'' = 1000 vòng.', 'n'' = 150 vòng.', 'n'' = 3000 vòng.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(177, '03', 81, '12', 'Chỉnh lưu dòng điện xoay chiều có nghĩa là:', 'Tìm cách thay đổi cường độ dòng điện xoay chiều.', 'Tìm cách thay đổi điện thế dòng điên xoay chiều.', 'Làm cho dòng điện xoay chiều chỉ chạy theo một chiều nhất định.', 'Tìm cách thay đổi cường độ dòng điện xoay chiều và làm cho dòng điện xoay chiều chỉ chạy theo một chiều nhất định.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(178, '03', 81, '12', 'Đặt một điện áp xoay chiều u = 220cos100πt vào hai đầu một cuộn cảm thuần có độ tự cảm L = 0,2 H. <br>Cường độ dòng điện chạy qua cuộn cảm có biểu thức là:', 'i = 3,5cos100πt (A).', 'i = 3,5cos(100πt + π/2) (A).', 'i = 3,5cos(100πt – π/3) (A).', 'i = 3,5cos(100πt – π/2) (A).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(179, '04', 59, '10', 'Tế bào nào sản xuất nhiều lipit có lưới nội chất trơn phát triển?', 'Tế bào hồng cầu.', 'Tế bào bạch cầu.', 'Tế bào biểu bì.', 'Tế bào vỏ tuyến thượng thận.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(180, '04', 59, '10', 'Ti thể có nguồn gốc từ:', 'Vi khuẩn hiếu khí sống kí sinh trong tế bào nhân chuẩn.', 'Vi khuẩn hiếu khí sống cộng sinh trong tế bào nhân chuẩn.', 'Vi khuẩn yếm khí sống kí sinh trong tế bào nhân chuẩn.', 'Vi khuẩn yếm khí sống cộng sinh trong tế bào nhân chuẩn.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(181, '04', 59, '10', 'Lớp màng nhày của tế bào vi khuẩn có tác dụng:', 'Giúp vi khuẩn di chuyển.', 'Bảo vệ vi khuẩn, giúp vi khuẩn gắn chặt vào tế bào chủ.', 'Như những thụ thể tiếp nhận virút.', 'Hấp thu các chất dinh dưỡng.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(182, '04', 59, '10', 'Cấu trúc có sợi prôtêin dài, mảnh, đường kính khoảng 7 nm là:', 'Vi ống.', 'Vi sợi.', 'Sợi trung gian.', 'Ribôxôm.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(183, '04', 59, '10', 'Vùng nhân của tế bào sinh vật nhân sơ chứa:', 'Một phân tử ADN dạng vòng.', 'Nhiều phân tử ADN dạng vòng.', 'Một plasmit.', 'Nhiều plasmit.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(184, '04', 59, '10', 'Cùng một loài cây, số lượng lục lạp trong tế bào của lá cây trồng ở bóng râm so với số lượng lục lạp trong tế bào lá của cây trồng ngoài sáng như thế nào?', 'Số lượng lục lạp trong tế bào lá của cây trồng ở bóng râm và cây trồng ngoài sáng đều ít như nhau.', 'Số lượng lục lạp trong tế bào lá của cây trồng ở bóng râm và cây trồng ngoài sáng đều nhiều như nhau.', 'Số lượng lục lạp trong tế bào lá của cây trồng ở bóng râm nhiều hơn số lượng lục lạp trong tế bào lá của cây trồng ngoài sáng.', 'Số lượng lục lạp trong tế bào lá của cây trồng ở bóng râm ít hơn số lượng lục lạp trong tế bào lá của cây trồng ngoài sáng.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(185, '04', 59, '10', 'Thành phần hoá học chủ yếu cấu tạo nên thành tế bào động vật (đối với tế bào động vật có thành tế bào) là:', 'Xenlulôzơ và kitin.', 'Xenlulôzơ', 'Kitin', 'Glicôcalyx', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(186, '04', 59, '10', 'Cấu trúc của bộ máy Gôngi là:', 'Một chồng túi màng dẹt xếp cạnh nhau nhưng túi nọ tách biệt với cái kia.', 'Một chồng túi màng dẹt xếp cạnh nhau và chồng khít lên nhau.', 'Gồm các hạt nhỏ (grana) xếp chồng lên nhau.', 'Một hệ thống màng bên trong tế bào tạo nên các ống và xoang dẹt thông với nhau.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(187, '04', 59, '10', 'Sự vận chuyển các chất qua màng tế bào (màng sinh chất) mà không cần tiêu tốn năng lượng gọi là:', 'Vận chuyển thụ động.', 'Vận chuyển chủ động.', 'Bơm prôtôn.', 'Xuất - nhập bào.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(188, '04', 59, '10', 'Hình dạng tế bào được ổn định là nhờ:', 'Bộ máy Gôngi.', 'Bộ khung tế bào.', 'Không bào.', 'Trung tử.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(189, '04', 59, '10', 'Sự vận chuyển các chất qua màng tế bào (màng sinh chất) mà không cần tiêu tốn năng lượng gọi là:', 'Vận chuyển thụ động.', 'Vận chuyển chủ động.', 'Bơm prôtôn.', 'Xuất - nhập bào.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(190, '04', 60, '10', 'Một tế bào sinh dục chín của 1 loài sinh vật giảm phân bình thường. Xét 2 cặp NST tương đồng được kí hiệu là AaBb.<br> Kí hiệu của 2 cặp NST này tại thời điểm kì giữa lần phân bào 1 của giảm phân là:', 'AaBb', 'AAaaBBbb', 'AABB và aabb.', 'AABB và aabb hoặc AAbb và aaBB', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(191, '04', 60, '10', 'Tế bào con chứa bộ n NST đơn ở kì nào, của giảm phân?', 'Kì đầu II.', 'Kì giữa II.', 'Kì sau II.', 'Kì cuối II.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(192, '04', 60, '10', 'Nguyên phân là hình thức phân chia tế bào không xảy ra ở loại tế bào nào sau đây?', 'Tế bào vi khuẩn.', 'Tế bào động vật.', 'Tế bào thực vật.', 'Tế bào người.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(193, '04', 60, '10', 'Trong nguyên phân, việc phân chia tế bào chất ở tế bào động vật xảy ra khi:', 'Nhiễm sắc thể phân li về 2 cực tế bào.', 'Nhiễm sắc thể co xoắn cực đại.', 'Hoàn tất việc phân chia vật chất di truyền, màng tế bào thắt lại ở vị trí giữa tế bào.', 'Hoàn tất việc phân chia vật chất di truyền, tạo vách ngăn ở mặt phẳng xích đạo của thoi vô sắc.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(194, '04', 60, '10', 'Trong giảm phân, hiện tượng nào sau đây có thể dẫn đến làm thay đổi cấu trúc của nhiễm sắc thể?', 'Nhân đôi.', 'Tiếp hợp.', 'Trao đổi chéo.', 'Co xoắn.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(195, '04', 60, '10', 'Sự trao đổi các đoạn NST giữa các NST tương đồng xảy ra ở kì nào của giảm phân?', 'Đầu I.', 'Giữa I.', 'Sau I.', 'Cuối I.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(196, '04', 60, '10', 'Bộ NST đặc trưng của mỗi loài sinh sản hữu tính ổn định qua các thế hệ cơ thể là nhờ quá trình:', 'Nguyên phân và giảm phân.', 'Giảm phân và thụ tinh.', 'Thụ tinh.', 'Nguyên phân, giảm phân và thụ tinh.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(197, '04', 60, '10', 'Ở người, bộ NST 2n = 46. Một tế bào sinh dưỡng thực hiện nguyên phân liên tiếp 5 lần, hỏi môi trường nội bào đã cung cấp bao nhiêu NST đơn?', '736', '1426', '1472', '960', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(198, '04', 60, '10', 'Thời gian của chu kì tế bào:', 'Từ 15 đến 20 phút.', 'Từ 1 đến 20 giờ.', 'Trên 20 giờ.', 'Tùy thuộc từng loại tế bào trong cơ thể và tùy thuộc từng loài.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(199, '04', 42, '11', 'Đặt hạt đậu mới nảy mầm vị trí nằm ngang, sau thời gian, thân cây cong lên, còn rễ cong xuống. Hiện tượng này được gọi là:', 'Thân cây có tính hướng đất dương còn rễ cây có tính hướng đất âm.', 'Thân cây và rễ cây đều có tính hướng đất dương.', 'Thân cây và rễ cây đều có tính hướng đất âm.', 'Thân cây có tính hướng đất âm còn rễ cây có tính hướng đất dương.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(200, '04', 42, '11', 'Tập tính thứ sinh ở động vật có chung các đặc điểm:', 'Sinh ra đã có.', 'Được truyền từ đời trước sang đời sau.', 'Phải học trong đời sống mới có được.', 'Suốt đời không đổi.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(201, '04', 42, '11', 'Thí nghiệm trồng cây trong 3 chậu cùng một loài và thời gian nhưng khác nhau về điều kiện chiếu sáng như sau:<br>\r\nChậu 1: Chiếu sáng từ một phía.<br>\r\nChậu 2: Để trong đêm tối không có ánh sáng.<br>\r\nChậu 3: Chiếu sáng bình thường từ mọi hướng.<br>\r\nCây ở chậu nào sau đây sinh trưởng hướng ngọn về nguồn ánh sáng?', 'Chậu 1.', 'Chậu 2.', 'Chậu 3.', 'Chậu 2 và chậu 3.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(202, '04', 42, '11', 'Vận động ngủ của hoa nghệ tây và hoa tulip là do sự biến đổi của nhiệt độ môi trường gây nên, được gọi là:', 'Ứng động sinh trưởng.', 'Ứng động sức trương.', 'Ứng động tiếp xúc và hóa ứng động.', 'Ứng động tổn thương.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(203, '04', 42, '11', 'Tập tính ở động vật được chia thành:', 'Tập tính đơn giản, tập tính phức tạp.', 'Tập tính cá thể, tập tính bầy đàn.', 'Tập tính bẩm sinh, tập tính thứ sinh, tập tính hỗn hợp.', 'Tập tính không điều kiện, tập tính có điều kiện.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(204, '04', 42, '11', 'Ý nào sau đây không phải là yếu tố chủ yếu trong cơ chế hình thành điện thế nghỉ?', 'Sự phân bố ion không đều ở hai bên màng tế bào.', 'Tính thấm có chọn lọc của màng tế bào đối với ion (cổng ion mở hay đóng).', 'Sự phân bố ion K+ và Na+ đồng đều ở hai bên màng tế bào.', 'Bơm Na - K.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(205, '04', 42, '11', 'Trồng cây trong một hộp kín có khoét một lỗ tròn. Sau thời gian ngọn cây mọc vươn về phía ánh sáng. Đây là thí nghiệm chứng minh loại hướng động nào?', 'Hướng sáng.', 'Hướng sáng âm.', 'Hướng sáng dương.', 'Hướng sáng và hướng gió.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(206, '04', 42, '11', 'Cấu tạo của cơ quan thực hiện ứng động và hướng động như sau:', 'Ứng động: cấu tạo hình dẹt (kiểu lưng - bụng lá, cánh hoa...) hoặc cấu tạo khớp phình nhiều cấp. Hướng động: cấu tạo dạng tròn như bao lá mầm (ở cây hòa thảo), thân cành, rễ các loài khác.', 'Ứng động: cấu tạo dạng tròn, như bao lá mầm (ở cây hòa thảo), thân cành, rễ các loài khác', 'Hướng động và ứng động: cấu tạo dạng tròn như bao lá mầm (ở cây hòa thảo), thân cành, rễ các loài khác.', 'Hướng động và ứng động: cấu tạo hình dẹt (kiểu lưng - bụng lá, cánh hoa...) hoặc cấu tạo khớp phình nhiều cấp (cây trinh nữ).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(207, '04', 42, '11', 'Cảm ứng ở thực vật là:', 'Hình thức phản ứng của cây trước tác nhân kích thích không định hướng.', 'Hình thức phản ứng của một bộ phận của cây trước tác nhân kích thích theo một hướng xác định.', 'Phản ứng của sinh vật đối với kích thích.', 'Sự vận động theo tính chất chu kì nhịp thời gian ngày, đêm.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(208, '04', 42, '11', 'Phản xạ đơn giản ở động vật là:', 'Phản xạ được cấu tạo bởi ít tế bào thần kinh và thường do thần kinh ngoại biên điều khiển.', 'Phản xạ được cấu tạo bởi ít tế bào thần kinh và thường do tủy sống điều khiển.', 'Phản xạ được cấu tạo bởi ít tế bào thần kinh, có sự tham gia của não bộ, đặc biệt là của vỏ bán cầu đại não.', 'Phản xạ được cấu tạo bởi nhiều tế bào thần kinh, có sự tham gia của não bộ, đặc biệt là của vỏ bán cầu đại não.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(209, '04', 43, '11', 'Sự tạo quả được hình thành từ:', 'Phôi mầm.', 'Nhân phụ.', 'Bầu noãn.', 'Nội nhũ.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(210, '04', 43, '11', 'Thế nào là sinh sản sinh dưỡng tự nhiên? Hãy chọn câu trả lời đúng.', 'Là quá trình tạo ra các thế hệ mới đảm bảo cho sự tồn tại của loài.', 'Là hình thức phân chia cơ thể mẹ thành hai cơ thể mới.', 'Là hiện tượng hình thành cơ thể mới từ một phần của cơ quan sinh dưỡng (rễ, thân, lá...).', 'Là hình thức tạo ra cơ thể mới đa dạng về đặc điểm di truyền.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(211, '04', 43, '11', 'Cơ quan chỉ huy về sự điều hòa sinh sản ở động vật là:', 'Tuyến yên.', 'Tuyến giáp.', 'Vùng dưới đồi.', 'Tuyến sinh dục.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(212, '04', 43, '11', 'Ở loài ong, kết quả của hình thức trinh sinh nở ra:', 'Ong đực, mang bộ NST lưỡng bội.', 'Ong thợ, mang bộ NST đơn bội.', 'Ong chúa, mang bộ NST lưỡng bội.', 'Ong đực mang bộ NST đơn bội.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(213, '04', 43, '11', 'Động vật ở nước thường đẻ trứng và xuất tinh trùng vào nước, các giao tử sẽ gặp nhau một cách ngẫu nhiên, được gọi là:', 'Tự phối.', 'Thụ tinh ngoài.', 'Thụ tinh trong.', 'Trinh sinh.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(214, '04', 43, '11', 'Trong hình thức sinh sản bào tử, cơ thể mới được hình thành từ:', 'Bào tử.', 'Hợp tử.', 'Thể giao tử.', 'Thể bào tử.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(215, '04', 43, '11', 'Sinh sản vô tính ở thực vật là gì? Hãy chọn câu trả lời đúng.', 'Là sự hình thành cây mới giống hệt cây mẹ.', 'Là sự hình thành cây mới có sự kết hợp giữa tính đực, cái.', 'Là sự hình thành cây mới không có sự kết hợp giữa tính đực, cái.', 'Là sự hình thành cây mới có đặc tính giống cây mẹ, từ một phần của cơ quan sinh dưỡng.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(216, '04', 43, '11', 'Vai trò của hoocmôn FSH? Hãy chọn câu trả lời đúng.', 'Kích thích sự phát triển của ống sinh tinh và tạo thành tinh trùng.', 'Kích thích sự phát triển của bao noãn.', 'Kích thích trứng chín và rụng.', 'Kích thích sự phát triển của ống sinh tinh, tạo thành tinh trùng và sự phát triển của bao noãn.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(217, '04', 43, '11', 'Thí dụ nào sau đây là biện pháp thụ tinh nhân tạo làm thay đổi số con?', 'Tăng cường chiếu sáng đối với gà nuôi làm cho gà có thể đẻ 2 trứng trong 1 ngày.', 'Tiêm dịch chiết từ tuyến dưới não của các loài cá khác cho cá mè, cá trắm cỏ làm cho trứng chín hàng loạt.', 'Khi hợp tử đang phân chia, người ta dùng kĩ thuật để tách rời các tế bào con ra khỏi hợp tử. Mỗi tế bào sẽ được nuôi dưỡng và phát triển thành 1 phôi mới.', 'Ép nhẹ lên bụng cá đã thành thực sinh dục để trứng chín tràn vào 1 cái đĩa rồi rót nhẹ tinh dịch lên trên. Dùng lông gà đảo nhẹ giúp trứng thụ tinh.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(218, '04', 77, '12', 'Ý nghĩa cơ bản nhất của phương pháp nghiên cứu trẻ đồng sinh là:', 'Phân biệt trẻ đồng sinh cùng trứng và đồng sinh khác trứng.', 'Biết các tính trạng nào ở loài người chủ yếu do kiểu gen, các tính trạng nào chủ yếu do môi trường quyết định.', 'Xem xét đặc điểm tâm lí, sinh lí ở loài người.', 'Nghiên cứu về kiểu gen của trẻ đồng sinh cùng trứng và trẻ đồng sinh khác trứng.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(219, '04', 77, '12', 'Đặc điểm di truyền nào sau đây, cho phép ta xác định tính trạng trong một phả hệ, không được quy định bởi gen nằm trên NST X:', 'Tính trạng đó chỉ được biểu hiện ở giới nam.', 'Bố mang tính trạng trội, con gái mang tính trạng lặn.', 'Mẹ mang tính trạng lặn, con trai mang tính trạng trội.', 'Bố mang tính trạng trội, con gái mang tính trạng lặn và mẹ mang tính trạng lặn, con trai mang tính trạng trội.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(220, '04', 77, '12', 'Đồng sinh khác trứng là trường hợp:', 'Hai trứng khác nhau, được thụ tinh bởi cùng một loại tinh trùng.', 'Hai tinh trùng cùng kiểu gen, thụ tinh với hai trứng cùng kiểu gen.', 'Hai tinh trùng khác nhau, thụ tinh với hai trứng hình thành hai hợp tử, phát triển thành hai cá thể.', 'Hai trứng có kiểu gen giống nhau, được thụ tinh bởi hai tinh trùng, hình thành hai hợp tử có kiểu gen khác nhau.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(221, '04', 77, '12', 'Trường hợp nào sau đây có thể tạo ra hợp tử phát triển thành người mắc hội chứng Đao.', 'giao tử chứa 2 nhiễm sắc thể số 21 kết hợp với giao tử bình thường.', 'giao tử chứa nhiễm sắc thể số 21 bị mất đoạn kết hợp với giao tử bình thường.', 'giao tử chứa 2 nhiễm sắc thể số 23 kết hợp với giao tử bình thường.', 'giao tử không chứa nhiễm sắc thể số 21 kết hợp với giao tử bình thường.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(222, '04', 77, '12', 'Phương pháp điều trị bằng liệu pháp gen áp dụng cho các bệnh:', 'di truyền phân tử.', 'di truyền nhiễm sắc thể.', 'di truyền tế bào chất.', 'di truyền giới tính.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(223, '04', 77, '12', 'Các bệnh di trụyền thường gặp ở người gồm:', 'Bệnh do đột biến gen trội.', 'Bệnh do đột biến lệch bội nhiễm sắc thể.', 'Bệnh do đột biến đa bội.', 'Bệnh do đột biến cấu trúc nhiễm sắc thể.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(224, '04', 77, '12', 'Nguyên tắc để phát hiện sự bất thường hay bình thường của một cá thể, trong phương pháp nghiên cứu tế bào là:', 'Soi tiêu bản tế bào 2n dưới kính hiển vi, quan sát hình thái và số lượng của bộ NST.', 'Soi tiêu bản tế bào n dưới kính hiển vi, quan sát hình thái và số lượng của nó.', 'Soi tiêu bản tế bào sinh dưỡng, quan sát quá trình trao đổi chất của nó.', 'Soi tiêu bản tế bào sinh dục, quan sát quá trình giảm phân của nó. ', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(225, '04', 77, '12', 'Phát biểu nào sai khi nói đến bệnh phêninkêtô niệu?', 'Là bệnh di truyền phân tử.', 'Là bệnh rối loạn chuyển hóa axit amin phêninalanin thành axit amin tirôzin.', 'Bị bệnh này có thể mất trí nhớ.', 'Là loại bệnh không chữa được.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(226, '04', 77, '12', 'Nội dung nào sau đây sai, khi đề cập đến vai trò của di truyền y học?', 'Dự đoán khả năng xuất hiện bệnh hay dị tật ở thế hệ con cháu.', 'Hạn chế tác hại của bệnh.', 'Hạn chế sự phát tán bệnh như hạn chế sinh đẻ, không cho kết hôn gần.', 'Chữa được một số bệnh như đái đường, máu khó đông, hội chứng Đao.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(227, '04', 77, '12', 'Trong phương pháp phả hệ, xây dựng phả hệ phải được thực hiện qua ít nhất là:', '2 thế hệ.', '3 thế hệ.', '10 thế hệ.', '5 thế hệ.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(228, '04', 78, '12', 'Nghiên cứu một quần thể động vật cho thấy ở thời điểm ban đầu có 11000 cá thể. Quần thể này có tỉ lệ sinh là 12% /năm, tỉ lệ tử vong là 8% /năm và tỉ lệ xuất cư là 2% /năm.<br> Sau một năm, số lượng cá thể trong quần thể đó được dự đoán là:', '11180', '11020', '11220', '11260', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(229, '04', 78, '12', 'Ở thỏ: Gen A qui định lông đen trội hoàn toàn so với gen a qui định lông trắng, trong một quần thể thỏ đang ở trạng thái cân bằng có 27 con thỏ lông trắng, chiếm 9% tổng số cá thể của đàn.<br> Số cá thể có kiểu gen đồng hợp trội lông đen trong quần thể thỏ là:', '126 cá thể.', '273 cá thể.', '147 cá thể.', '150 cá thể.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(230, '04', 78, '12', 'Điều kiện nghiệm đúng của định luật Hacđi - Vanbec là:', 'quần thể có số lượng cá thể lớn.', 'quần thể giao phối ngẫu nhiên.', 'không có chọn lọc và đột biến.', 'quần thể có số lượng cá thể lớn. quần thể giao phối ngẫu nhiên. không có chọn lọc và đột biến.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(231, '04', 78, '12', 'Quần thể giao phối khác quần thể tự phối:', 'ở quần thể giao phối thường nhiều cá thể hơn.', 'ở quần thể giao phối tần số các alen không thay đổi.', 'ở quần thể giao phối ngoài mối quan hệ về dinh dưỡng, nơi ở, còn có mối quan hệ đực cái.', 'ở quần thể giao phối các cá thể khác nhau hơn.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(232, '04', 78, '12', 'Một quần thể thực vật tự thụ phấn có tỉ lệ kiểu gen ở thế hệ P là 0,45AA : 0,30Aa : 0,25aa. <br>Cho biết các cá thể có kiểu gen aa không có khả năng sinh sản. Tính theo lí thuyết, tỉ lệ các kiểu gen thu được ở F1 là:', '0,525AA : 0,150Aa : 0,325aa.', '0,36AA : 0,24Aa : 0,40aa.', '0,36AA : 0,48Aa : 0,16aa.', '0,70AA : 0,20Aa : 0,10aa.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(233, '04', 78, '12', 'Trong một số nhóm người sống ở châu Phi, có khoảng 4% số người chết vì bệnh sốt rét. <br>Giả sử quần thể người đạt trạng thái cân bằng Hacđi - Vanbec, những người chống được bệnh sốt rét trong quần thể đó có tỉ lệ là:', '4%', '8%', '16%', '32%', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(234, '04', 78, '12', 'Trong một quần thể thực vật, tần số tương đối của alen A là 0,6; alen a là 0,4.<br> Quần thể đó có cấu trúc di truyền ở trạng thái cân bằng là:', '0,34AA : 0,48Aa : 0,18aa.', '0,36AA : 0,48Aa : 0,16aa.', '0,32AA : 0,48Aa : 0,20aa.', '0,38AA : 0,48Aa : 0,14aa.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(235, '04', 78, '12', 'Tần số tương đối của một kiểu gen nào đó trong quần thể là tỉ lệ phần trăm của:', 'số cá thể có kiểu gen đó trong quần thể.', 'số kiểu hình của kiểu gen đó trong quần thể.', 'số cá thể cùng độ tuổi có kiểu gen đó trong quần thể.', 'số cá thể đực có kiểu gen đó trong quần thể.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(236, '04', 78, '12', ' "Gọi p, q, r lần lượt là tần số các alen IA, IB, I0 quy định các nhóm máu. Khi đạt trạng thái cân bằng di truyền thì:"\r\nTần số tương đối alen I0 của quần thể là:', 'r2 + 2qr + q2', 'r2 + 2pr', 'r2 + 2pq', 'pr + qr +r2', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(237, '04', 78, '12', '"Khi khảo sát hệ nhóm máu A, B, O của một quần thể có 14500 người. Số cá thể có nhóm máu A, B, AB và O lần lượt là 3480, 5075, 5800 và 145."\r\n<br>Số lượng người có máu A đồng hợp:', '2.230', '1.160', '3.625', '2.320', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(238, '05', 68, '10', 'Khu vực kinh tế ngoài quốc doanh ngày càng thu hút nhiều lao động trong lĩnh vực nào?', 'Kĩ thuật cao.', 'Xây dựng.', 'Dịch vụ.', 'Kĩ thuật cao và xây dựng hoặc dịch vụ.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(239, '05', 68, '10', 'Năm 2005 tỉ lệ lao động trong khu vực dịch vụ chiếm:', '24,5%.', '25,5%.', '26,5%.', '27,5%.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(240, '05', 68, '10', 'Đô thị hóa ở nước ta có đặc điểm gì?', 'Quá trình đô thị hóa chậm.', 'Trình độ đô thị hóa thấp.', 'Nếp sống thành thị và nông thôn xen lẫn.', 'Quá trình đô thị hóa chậm và trình độ đô thị hóa thấp hoặc nếp sống thành thị và nông thôn xen lẫn.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(241, '05', 68, '10', 'Thành phố thường có nhiều chức năng gắn bó với nhau nhưng quan trọng hơn cả là chức năng nào?', 'Chức năng hành chính.', 'Chức năng kinh tế.', 'Chức năng quân sự.', 'Chức năng du lịch.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(242, '05', 68, '10', 'Trong điều kiện nước ta hiện nay dân số đông có trở ngại gì?', 'Tốc độ phát triển kinh tế.', 'Giải quyết việc làm.', 'Khó nâng cao chất lượng cuộc sống.', 'Tốc độ phát triển kinh tế và giải quyết việc làm hoặc khó nâng cao chất lượng cuộc sống.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(243, '05', 68, '10', 'Ở nước ta nhiều dịch bệnh được thanh toán, đồng thời tử vong trẻ em giảm, thọ trung bình tăng đó là do?', 'Khắp xã, phường có trạm y tế.', 'Đội ngũ y tể, bác sĩ đông.', 'Có sự điều trị kết hợp giữa tây y và đông y.', 'Được chăm sóc tốt sức khoẻ ban đầu.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(244, '05', 68, '10', 'Khi phân bố lại dân cư ở vùng đồng bằng sẽ dẫn đến thuận lợi nào cho vùng này?', 'Giảm ít lao động và tăng thêm việc làm.', 'Tăng thêm nguồn lao động.', 'Giải quyết hết việc làm.', 'Tổ chức sản xuất và sử dụng lao động hợp lí hơn.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(245, '05', 68, '10', 'Trong quá trình đô thị hóa cần chú ý vấn đề nào?\r\nA. \r\n B. \r\n C. \r\n D.  hoặc phát triển cân đối giữa kinh tế -xã hội đô thị với kết cấu hạ tầng đô thị.', 'Phát triển đô thị lớn là trung tâm phát triển bền vững.', 'Đô thị hóa nông thôn điều chỉnh dân nông thôn vào đô thị.', 'Phát triển cân đối giữa kinh tế -xã hội đô thị với kết cấu hạ tầng đô thị.', 'Phát triển đô thị lớn là trung tâm phát triển bền vững và đô thị hóa nông thôn điều chỉnh dân nông thôn vào đô thị.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(246, '05', 68, '10', 'Năm 2005 lao động không có chuyên môn kĩ thuật ở nước ta chiếm:', '70%.', '75%.', '77%.', '79%.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(247, '05', 68, '10', 'Trong cả nước hiện nay số xã, phường có trạm y tế chiếm (năm 2007):', '95,6%.', '96,6%.', '97,6%.', '98,6%.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(248, '05', 69, '10', 'Chiếm sản lượng thủy sản nuôi trồng lớn nhất hiện nay, đó là tỉnh:', 'Cà Mau.', 'An Giang.', 'Bạc Liêu.', 'Bến Tre.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(249, '05', 69, '10', 'Diện tích lúa 7,5 triệu ha và sản lượng lúa là 34,4 triệu tấn, vậy năng suất lúa trung bình:', '44,6 tạ/ha.', '45,8 tạ/ha.', '47,9 tạ/ha.', '48,5 tạ/ha.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(250, '05', 69, '10', 'Hãy sắp xếp theo thứ tự từ cao xuống thấp sản lượng của các loại thực phẩm động vật sau đây:', 'Thịt lợn - Thủy sản - Thịt bò.', 'Thủy sản - Thịt lợn - Thịt gia cầm.', 'Thủy sản - Thịt bò - Thịt gia cầm.', 'Thịt gia cầm - Thủy sản - Thịt Trâu.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(251, '05', 69, '10', 'Trong các loại thực phẩm động vật thì hiện nay loại nào có sản lượng nhiều nhất?', 'Thịt lợn.', 'Thịt bò.', 'Hải sản.', 'Thịt gia cầm.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(252, '05', 69, '10', 'Hãy nêu những nguyên nhân dẫn đến sự suy thoái tài nguyên rừng ở nước ta?', 'Do khai thác quá mức.', 'Sống du canh, du cư, đốt rừng làm nương rẫy.', 'Bọn lâm tặc khai thác trái phép.', 'Do khai thác quá mức và sống du canh, du cư, đốt rừng làm nương rẫy hoặc bọn lâm tặc khai thác trái phép.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(253, '05', 69, '10', 'Vùng Đồng bằng sông Cửu Long có thế mạnh để phát triển loại cây nào?\r\nA. \r\n B. \r\n C. \r\n D. ', 'Cây ăn quả ôn đới.', 'Cây nhiệt đới.', 'Chè, cao su, cà phê.', 'Cây đặc sản sơn, hồi, quế.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(254, '05', 69, '10', 'Ngành thủy sản đã có bước phát triển đột phá trong những năm gần đây. Sản lượng thủy sản năm 2005 đạt:', 'Hơn 1,9 triệu tấn.', 'Hơn 2,2 triệu tấn.', 'Hơn 2,4 triệu tấn.', 'Hơn 3,4 triệu tấn.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(255, '05', 69, '10', 'Sản lượng thủy sản tính bình quân trên đầu người hiện nay là bao nhiêu kg (năm 2005)?', 'Khoảng 26 kg.', 'Khoảng 30 kg.', 'Khoảng 42 kg.', 'Khoảng 37 kg.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(256, '05', 69, '10', 'Thành phần nào đóng vai trò chủ yếu nhất của kinh tế nông thôn hiện nay?', 'Hợp tác xã nông nghiệp.', 'Hợp tác xã thủy sản.', 'Kinh tế trang trại.', 'Kinh tế hộ gia đình.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(257, '05', 69, '10', 'Trong cơ cấu vốn đất thì hiện nay loại đất nào chiếm tỉ trọng lớn nhất?\r\n', 'Đất nông nghiệp.', 'Đất lâm nghiệp có rừng.', 'Đất chuyên dùng và đất ở.', 'Đất chưa sử dụng.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(258, '05', 52, '11', 'Việt Nam chính thức trở thành thành viên của WTO từ:', 'Tháng 12 năm 2005.', 'Tháng 11 năm 2006.', 'Tháng 12 năm 2006.', 'Tháng 1 năm 2007.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(259, '05', 52, '11', 'Trong ASEAN thì hiện nay các nước nào sau đây không phải là thành viên của APEC?', 'Lào, Campuchia, Mianma, Đông timo.', 'Brunây, Xingapo, Campuchia.', 'Campuchia, Inđônêxia, Lào.', 'Đông timo, Philippin, Lào.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(260, '05', 52, '11', 'Năm nào sau đây được mở đầu cho đường lối đổi mới?', 'Năm 1976.', 'Năm 1980.', 'Năm 1984.', 'Năm 1986.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(261, '05', 52, '11', 'Việt Nam và Hoa Kì bình thường hoá quan hệ từ năm nào?', 'Năm 1980.', 'Năm  1990.', 'Năm 1995.', 'Năm  2000.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(262, '05', 52, '11', 'Việt Nam là thành viên thứ mấy của tổ chức Thương mại thế giới?', 'Thành viên 149.', 'Thành viên 150.', 'Thành viên 151.', 'Thành viên 152.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(263, '05', 52, '11', 'Nước ta chính thức gia nhập WTO vào thời gian nào?', 'Tháng 9 năm 2006.', 'Tháng 10 năm 2006.', 'Tháng 11 năm 2006.', 'Tháng 12 năm 2006.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(264, '05', 52, '11', 'Việt Nam đã trở thành thành viên của ASEAN vào thời gian nào?', 'Tháng 5 năm 1993.', 'Tháng 6 năm 1994.', 'Tháng 7 năm 1995.', 'Tháng 8 năm 1996.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(265, '05', 52, '11', 'Trong công cuộc đổi mới ở nước ta, lĩnh vực nào được đổi mới đầu tiên?', 'Lĩnh vực công nghiệp.', 'Lĩnh vực nông nghiệp.', 'Lĩnh vực dịch vụ.', 'Lĩnh vực công nghiệp và nông nghiệp.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(266, '05', 52, '11', 'Công cuộc đổi mới ở nước ta được manh nha từ năm nào?', 'Năm 1976.', 'Năm 1977.', 'Năm 1978.', 'Năm 1979.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(267, '05', 52, '11', 'Công cuộc đổi mới đã đạt được những thành tựu to lớn nào?', 'Thoát khỏi khủng hoảng kinh tế - xã hội.', 'Tốc độ tăng trưởng kinh tế khá cao và ổn định.', 'Giảm nhanh tỉ lệ hộ đói, nghèo.', 'Thoát khỏi khủng hoảng kinh tế - xã hội và tốc độ tăng trưởng kinh tế khá cao và ổn định hoặc giảm nhanh tỉ lệ hộ đói, nghèo.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(268, '05', 54, '11', 'Bốn dãy núi cánh cung nào được thể hiện ở vùng núi Đông Bắc:', 'Cánh cung: Hoàng Liên Sơn, sông Gâm.', 'Cánh cung: sông Gâm, Ngân Sơn, Bắc Sơn, Đông Triều.', 'Cánh cung: sống Mã, sông Đà, Đông Triều.', 'Cánh cung: Hoàng Liên Sơn, sông Gâm và cánh cung: sông Mã, sông Đà, Đông Triều.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(269, '05', 54, '11', 'Phần đất liền nước ta được chia thành mấy miền khí hậu chính?', '2 miền khí hậu.', '3 miền khí hậu.', '4 miền khí hậu.', '5 miền khí hậu.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin');
INSERT INTO `questions` (`question_id`, `major_id`, `submajor_id`, `class_id`, `question`, `answer_1`, `answer_2`, `answer_3`, `answer_4`, `correct_answer`, `insert_dt`, `insert_user`, `update_dt`, `update_user`) VALUES
(270, '05', 54, '11', 'Nền nhiệt ẩm cao tạo thuận lợi gì cho phát triển nông nghiệp?', 'Thâm canh lúa nước.', 'Đa dạng hóa cây trồng, vật nuôi.', 'Nâng cao năng suất.', 'Thâm canh lúa nước và đa dạng hóa cây trồng, vật nuôi hoặc nâng cao năng suất.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(271, '05', 54, '11', 'Với tọa độ địa lí, địa hình và tác động của các khối khí dẫn đến hệ quả nào?', 'Hình thành các trung tâm nóng, lạnh.', 'Hình thành các trung tâm mưa nhiều, mưa ít.', 'Các kiểu khí hậu như nhiệt đới, á nhiệt đới, á xích đạo.', 'Hình thành các trung tâm nóng, lạnh và hình thành các trung tâm mưa nhiều, mưa ít hoặc các kiểu khí hậu như nhiệt đới, á nhiệt đới, á xích đạo.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(272, '05', 54, '11', 'Là miền duy nhất có đầy đủ hệ thống đai cao. Đó là miền tự nhiên nào?', 'Miền Đông Bắc Bắc Bộ.', 'Miền Tây Bắc và Bắc Trung Bộ.', 'Miền Nam Trung Bộ.', 'Miền Nam Bộ.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(273, '05', 54, '11', 'Các dãy núi ở nước ta chủ yếu chạy theo hướng nào?', 'Hướng Tây Bắc - Đông Nam.', 'Hướng Bắc - Nam.', 'Hướng Tây Nam - Đông Bắc.', 'Hướng Đông - Tây.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(274, '05', 54, '11', 'Ranh giới để phân chia các đới cảnh quan địa lí là:', '2 đới cảnh quan với ranh giới là sông Cả.', '2 đới cảnh quan với ranh giới là khối núi Bạch Mã (đèo Hải Vân).', '3 đới cảnh quan với ranh giới là khối sông Mã và khối núi Bạch Mã.', '3 đới cảnh quan với ranh giới là khối khối núi Bạch Mã và sông Ba.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(275, '05', 54, '11', 'Thường có lũ vào mùa hạ và cạn vào mùa đông là đặc điểm của miền thuỷ văn nào?', 'Miền thuỷ văn Bắc Bộ.', 'Miền thuỷ văn Đông Trường Sơn.', 'Miền thuỷ văn Tây Nguyên và Nam Bộ.', 'Miền thuỷ văn Bắc Bộ và miền thuỷ văn Tây Nguyên và Nam Bộ.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(276, '05', 54, '11', 'Vùng đồng bằng nào có diện tích đất phèn, mặn lớn nhất?', 'Đồng bằng sông Hồng.', 'Đồng bằng sông Cửu Long.', 'Các đồng bằng vùng Bắc Trung Bộ.', 'Vùng Duyên hải Nam Trung Bộ.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(277, '05', 54, '11', 'Vùng núi nào sau đây có 5 dãy núi hình cánh cung lớn?', 'Vùng núi Tây Bắc.', 'Vùng núi Đông Bắc.', 'Vùng núi Trường Sơn Bắc.', 'Vùng núi Trường Sơn Nam.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(278, '05', 70, '12', 'Ý nào không đúng với chiến lược phát triển kinh tế - xã hội nước ta đến năm 2010?', 'GDP tăng gấp đôi so với năm 2000.', 'Giảm tỉ lệ lao động nông nghiệp còn khoảng 40%.', 'Chuyển dịch mạnh cơ cấu kinh tế.', 'Cơ cấu lao động thay đổi nhanh.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(279, '05', 70, '12', 'Chất lượng tăng trưởng của nền kinh tế đã được cải thiện hơn trước nhưng vẫn còn biểu hiện là:', 'Chậm chuyển biến về chất lượng.', 'Hiệu quả kinh tế còn thấp.', 'Sức cạnh tranh của nền kinh tế còn yếu.', 'Chậm chuyển biến về chất lượng và hiệu quả kinh tế còn thấp hoặc sức cạnh tranh của nền kinh tế còn yếu.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(280, '05', 70, '12', 'Trong cơ cấu GDP thì hiện nay khu vực kinh tế nào chiếm tỉ trọng cao nhất (năm 2005)?', 'Khu vực I.', 'Khu vực II.', 'Khu vực III.', 'Các khu vực có tỉ trọng bằng nhau.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(281, '05', 70, '12', 'Có vị trí đầu tàu kinh tế, dẫn đầu trong sự nghiệp công nghiệp hóa, hiện đại hóa là vùng kinh tế?', 'Vùng kinh tế trọng điểm Bắc Bộ.', 'Vùng kinh tế trọng điểm phía Nam.', 'Vùng kinh tế trọng điểm miền Trung.', 'Vùng kinh tế Tây Nguyên.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(282, '05', 70, '12', 'Sự chuyển dịch từ nông nghiệp sang công nghiệp trong khu vực sản xuất vật chất ở nhóm nước nào là chủ yếu?', 'Các nước công nghiệp phát triển.', 'Các nước đang phát triển.', 'Các nước công nghiệp mới.', 'Các nước công nghiệp phát triển hoặc các nước công nghiệp mới.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(283, '05', 70, '12', 'Tăng trưởng tổng sản phẩm trong nước đạt cao nhất vào năm nào?', 'Năm 1986.', 'Năm 1990.', 'Năm 1995.', 'Năm 2003.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(284, '05', 70, '12', 'Cơ cấu ngành kinh tế nước ta trong tổng giá trị quốc nội chuyển đổi theo hướng nào?', 'Tăng tỉ trọng khu vực II.', 'Giảm tỉ trọng khu vực I.', 'Ổn định tỉ trọng khu vực III.', 'Tăng tỉ trọng khu vực II và giảm tỉ trọng khu vực I hoặc ổn định tỉ trọng khu vực III.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(285, '05', 70, '12', 'Nguyên nhân nào dẫn đến nước ta cùng một lúc thực hiện hai bước cuuyển dịch cơ cấu ngành kinh tế?', 'Công cuộc đổi mới.', 'Thực hiện chiến lược công nghiệp, hóa hiện đại hóa.', 'Xu hướng toàn cầu hóa kinh tế.', 'Công cuộc đổi mới và thực hiện chiến lược công nghiệp, hóa hiện đại hóa hoặc xu hướng toàn cầu hóa kinh tế.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(286, '05', 70, '12', 'Hiện nay trên phạm vi cả nước đã hình thành mấy vùng kinh tế trọng điểm?', '2', '3', '4', '5', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(287, '05', 70, '12', 'Trên thế giới hiện nay đang diễn ra xu hướng chuyển dịch cơ cấu ngành kinh tế đó là:', 'Khu vực sản xuất vật chất sang khu vực dịch vụ.', 'Từ công nghiệp sang nông nghiệp.', 'Từ khu vực dịch vụ sang nông nghiệp.', 'Ngành kinh tế có vốn đầu tư nước ngoài phát triển nhanh.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(288, '05', 71, '12', 'Đồng bằng sông Cửu Long có những thuận lợi nhất định đối với việc phát triển ngành chăn nuôi nhất là:\r\nA. \r\n B. \r\n C. \r\n D. ', 'Trâu, bò.', 'Bò, lợn.', 'Trâu và gia cầm (vịt).', 'Lợn và gia cầm (vịt).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(289, '05', 71, '12', 'Điều kiện tự nhiên nào gây khó khăn cho phát triển nuôi trồng thủy sản ở Bắc Trung Bộ?', 'Diện tích đầm phá hẹp.', 'Công nghiệp chế biến thủy sản chậm phát triển.', 'Bão, lũ, gió mùa đông lạnh và gió Lào.', 'Dịch bệnh.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(290, '05', 71, '12', 'Hiện nay Tây Nguyên có mấy tỉnh và thành phố tương đương cấp tỉnh?', '5', '6', '7', '8', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(291, '05', 71, '12', 'Khoáng sản kim loại màu, nhất là vàng tập trung nhiều nhất ở vùng:', 'Bồng Miêu (Quảng Nam).', 'Bình Định.', 'Khánh Hòa.', 'Quảng Ngãi.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(292, '05', 71, '12', 'Tỉnh nào ở Bắc trung bộ có sản lượng khai thác và nuôi trồng thủy sản lớn nhất năm 2002?', 'Nghệ An.', 'Quảng Trị.', 'Quảng Bình.', 'Hà Tĩnh.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(293, '05', 71, '12', 'Ý nghĩa Hiệp định hợp tác nghề cá vịnh Bắc Bộ giữa Việt Nam và Trung Quốc là:', 'Hợp tác quản lí, bảo vệ vùng biển.', 'Khai thác và sử dụng hiệu quả vịnh Bắc Bộ.', 'Hợp tác quản lí, bảo vệ vùng biển và khai thác hoặc sử dụng hiệu quả vịnh Bắc Bộ.', 'Tất cả đáp án sai.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(294, '05', 71, '12', 'Đất nông nghiệp có độ phì cao và trung bình ở Đồng bằng sông Hồng chiếm:', '50%.', '60%.', '70%.', '80%.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(295, '05', 71, '12', 'Vùng cung cấp muối nổi tiếng cho cả nước hiện nay là:', 'Sa Huỳnh (Quảng Ngãi).', 'Cà Ná (Ninh Thuận).', 'Nha Trang - Bình Thuận.', 'Sa Huỳnh (Quảng Ngãi) và Cà Ná (Ninh Thuận).', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(296, '05', 71, '12', 'Khai thác và chế biến dầu khí là ngành mũi nhọn ở nước ta nhưng ở Duyên hải Nam Trung Bộ thì vùng nào đang được chú ý khai thác?', 'Phú Quý (Bình Thuận).', 'Hoàng Sa (Đà Nẵng).', 'Trường Sa (Khánh Hòa).', 'Bể Trầm tích Nam Côn Sơn.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin'),
(297, '05', 71, '12', 'Tây Nguyên có vị trí đặc biệt quan trọng nhất về quốc phòng và xây dựng kinh tế là do:', 'Vị trí trung tâm của bán đảo Đông Dương.', 'Giáp với Hạ Lào và đông bắc Campuchia.', 'Năm gần vùng Hoa Nam Trung Quốc đông dân.', 'Vị trí trung tâm của bán đảo Đông Dương và giáp với Hạ Lào và đông bắc Campuchia hoặc năm gần vùng Hoa Nam Trung Quốc đông dân.', '1', '2014-08-22', 'admin', '2014-08-22', 'admin');

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
(42, '04', '11', 'Cảm ứng', '/resources/images/biological11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(43, '04', '11', 'Sinh sản', '/resources/images/biological11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(44, '03', '11', 'Điện tích - Điện trường', '/resources/images/physical11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(45, '03', '11', 'Dòng điện không đổi', '/resources/images/physical11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(49, '01', '11', 'Stress', '/resources/images/english11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(50, '01', '11', 'Sentence building', '/resources/images/english11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(51, '01', '11', 'Sentence transformation', '/resources/images/english11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(52, '05', '11', 'Việt Nam trên con đường đổi mới và hội nhập', '/resources/images/geographic11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(54, '05', '11', 'Đặc điểm chung của tự nhiên', '/resources/images/geographic11.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(55, '02', '10', 'Nguyên tử', '/resources/images/chemical10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(56, '02', '10', 'Nhóm oxi', '/resources/images/chemical10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(59, '04', '10', 'Cấu trúc tế bào', '/resources/images/biological10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(60, '04', '10', 'Phân bào', '/resources/images/biological10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(62, '03', '10', 'Động học chất điểm', '/resources/images/physical10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(64, '03', '10', 'Chất khí', '/resources/images/physical10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(66, '01', '10', 'Pronounciation', '/resources/images/english10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(67, '01', '10', 'Grammar and vocabulary', '/resources/images/english10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(68, '05', '10', 'Địa lý dân cư', '/resources/images/geographic10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(69, '05', '10', 'Một số vấn đề phát triển và phân bố nông nghiệp', '/resources/images/geographic10.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(70, '05', '12', 'Chuyển dịch cơ cấu kinh tế', '/resources/images/geographic12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(71, '05', '12', 'Địa lý các vùng kinh tế', '/resources/images/geographic12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(74, '02', '12', 'Đại cương về kim loại', '/resources/images/chemical12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(76, '02', '12', 'Kim loại kiềm, kiềm thổ và nhôm', '/resources/images/chemical12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(77, '04', '12', 'Di truyền học người', '/resources/images/biological12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(78, '04', '12', 'Di truyền học quần thể', '/resources/images/biological12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(80, '03', '12', 'Dao động cơ', '/resources/images/physical12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
(81, '03', '12', 'Dòng điện xoay chiều', '/resources/images/physical12.gif', '2014-09-28', 'admin', '2014-09-28', 'admin'),
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
  `delete_flg` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `insert_dt` date NOT NULL,
  `insert_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `update_dt` date NOT NULL,
  `update_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=61 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `email`, `verified`, `verification_code`, `phone_number`, `class_id`, `password`, `user_type`, `delete_flg`, `insert_dt`, `insert_user`, `update_dt`, `update_user`) VALUES
(54, 'acc001', 'anhnv1310@gmail.com', '1', '335584df2463c0cc0854ffa1a9126045', '01696803198', '11', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '2014-10-04', '', '2014-10-04', ''),
(55, 'acc002', 'anhnv1310@gmail.com', '1', '089024c60aac555a1f9e46ce900f4dae', '', '10', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '2014-10-05', '', '2014-10-05', ''),
(56, 'acc003', 'anhnv1310@gmail.com', '1', 'a7308296e73ad88680c3c635116c8470', '01696803198', '10', 'ca9118c9cf3efca03aa46c887d52c192', '0', '0', '2014-10-05', '', '2014-10-05', ''),
(57, 'acc004', 'anhnv1310@gmail.com', '1', 'e6987e431524c9bc27fe8466293e5743', '', '10', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '2014-10-05', '', '2014-10-05', ''),
(58, 'admin01', 'anhnv1310@gmail.com', '1', '7778092fbb7c7fb17b949563a9728752', '0123456789', '10', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '2014-10-06', '', '2014-10-06', ''),
(59, 'acc005', 'anhnv1310@gmail.com', '1', 'e6987e431524c9bc27fe8466293e5743', '', '10', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '2014-10-05', '', '2014-10-05', ''),
(60, 'acc006', 'anhnv1310@gmail.com', '1', 'e6987e431524c9bc27fe8466293e5743', '', '10', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '2014-10-05', '', '2014-10-05', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
