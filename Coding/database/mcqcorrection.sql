-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 29, 2018 at 02:25 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mcqcorrection`
--
CREATE DATABASE IF NOT EXISTS `mcqcorrection` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mcqcorrection`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add user', 6, 'add_profile'),
(17, 'Can change user', 6, 'change_profile'),
(18, 'Can delete user', 6, 'delete_profile'),
(19, 'Can add students list', 7, 'add_studentslist'),
(20, 'Can change students list', 7, 'change_studentslist'),
(21, 'Can delete students list', 7, 'delete_studentslist'),
(22, 'Can add answer sheets', 8, 'add_answersheets'),
(23, 'Can change answer sheets', 8, 'change_answersheets'),
(24, 'Can delete answer sheets', 8, 'delete_answersheets'),
(25, 'Can add exam details', 9, 'add_examdetails'),
(26, 'Can change exam details', 9, 'change_examdetails'),
(27, 'Can delete exam details', 9, 'delete_examdetails'),
(28, 'Can add chats', 10, 'add_chats'),
(29, 'Can change chats', 10, 'change_chats'),
(30, 'Can delete chats', 10, 'delete_chats');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_general_profile_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(6, 'general', 'profile'),
(5, 'sessions', 'session'),
(8, 'teacher', 'answersheets'),
(10, 'teacher', 'chats'),
(9, 'teacher', 'examdetails'),
(7, 'teacher', 'studentslist');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-01-29 09:20:38.357421'),
(2, 'contenttypes', '0002_remove_content_type_name', '2018-01-29 09:20:39.840820'),
(3, 'auth', '0001_initial', '2018-01-29 09:20:44.571289'),
(4, 'auth', '0002_alter_permission_name_max_length', '2018-01-29 09:20:45.403320'),
(5, 'auth', '0003_alter_user_email_max_length', '2018-01-29 09:20:45.436523'),
(6, 'auth', '0004_alter_user_username_opts', '2018-01-29 09:20:45.472656'),
(7, 'auth', '0005_alter_user_last_login_null', '2018-01-29 09:20:45.511718'),
(8, 'auth', '0006_require_contenttypes_0002', '2018-01-29 09:20:45.545898'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2018-01-29 09:20:45.586914'),
(10, 'auth', '0008_alter_user_username_max_length', '2018-01-29 09:20:45.631835'),
(11, 'general', '0001_initial', '2018-01-29 09:20:51.424804'),
(12, 'admin', '0001_initial', '2018-01-29 09:20:53.673828'),
(13, 'admin', '0002_logentry_remove_auto_add', '2018-01-29 09:20:53.726562'),
(14, 'sessions', '0001_initial', '2018-01-29 09:20:54.840820'),
(15, 'teacher', '0001_initial', '2018-01-29 09:25:36.185546');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `general_profile`
--

CREATE TABLE IF NOT EXISTS `general_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `location` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `general_profile`
--

INSERT INTO `general_profile` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `location`) VALUES
(1, 'pbkdf2_sha256$36000$bYFFBFjKGGBY$4c52QZ7CD6Z81KRohm6aCWo2M4BXH0DqyRNXNqbppCU=', '2018-01-29 10:23:52.396484', 0, 'gokul', 'gokula', 'krishnan', 'gokul@gmail.com', 0, 1, '2018-01-29 09:23:48.813476', 'chennai'),
(2, 'pbkdf2_sha256$36000$GEzbFlpuxHZg$Is4GWhZuLyEkMwkLP/L0rSogC/YeLsosTod912EVZDc=', '2018-01-29 10:14:55.580078', 0, 'suresh', 'suresh', 'kumar', 'suresh@gmail.com', 0, 1, '2018-01-29 10:14:48.561523', 'chennai');

-- --------------------------------------------------------

--
-- Table structure for table `general_profile_groups`
--

CREATE TABLE IF NOT EXISTS `general_profile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `general_profile_groups_profile_id_group_id_2fbe609e_uniq` (`profile_id`,`group_id`),
  KEY `general_profile_groups_group_id_3befd3aa_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `general_profile_user_permissions`
--

CREATE TABLE IF NOT EXISTS `general_profile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `general_profile_user_per_profile_id_permission_id_4ec35cbe_uniq` (`profile_id`,`permission_id`),
  KEY `general_profile_user_permission_id_d7c45d82_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_answersheets`
--

CREATE TABLE IF NOT EXISTS `teacher_answersheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL,
  `classes` varchar(200) NOT NULL,
  `exam` varchar(200) NOT NULL,
  `marks` varchar(200) NOT NULL,
  `dateconducted` date NOT NULL,
  `dateuploaded` date NOT NULL,
  `answerpapers` varchar(100) NOT NULL,
  `students_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_answersheets_students_id_61d06df5_fk_teacher_s` (`students_id`),
  KEY `teacher_answersheets_user_id_d7a7d850_fk_general_profile_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `teacher_answersheets`
--

INSERT INTO `teacher_answersheets` (`id`, `subject`, `classes`, `exam`, `marks`, `dateconducted`, `dateuploaded`, `answerpapers`, `students_id`, `user_id`) VALUES
(1, 'english', '12 b', 'half yearly', '80.0', '2018-01-23', '2018-01-29', 'uncorrected/test_01.png', 1, 1),
(2, 'english', '12 b', 'half yearly', '100.0', '2018-01-28', '2018-01-29', 'uncorrected/test_05.png', 6, 1),
(3, 'Tamil', '12 b', 'half yearly', '20.0', '2018-01-25', '2018-01-29', 'uncorrected/test_04.png', 6, 1),
(4, 'maths', '12 b', 'half yearly', '60.0', '2018-01-23', '2018-01-29', 'uncorrected/test_03.png', 6, 1),
(5, 'physics', '12 b', 'half yearly', '80.0', '2018-01-22', '2018-01-29', 'uncorrected/test_01_SXAR5md.png', 6, 1),
(6, 'chemistry', '12 b', 'half yearly', '100.0', '2018-01-16', '2018-01-29', 'uncorrected/test_05_ZU9Bllc.png', 2, 1),
(7, 'english', '12 b', 'half yearly', '60.0', '2018-01-16', '2018-01-29', 'uncorrected/test_03_zT2armf.png', 9, 1),
(8, 'chemistry', '12 b', 'half yearly', '40.0', '2018-01-17', '2018-01-29', 'uncorrected/example_test.png', 13, 1),
(9, 'physics', '12 b', 'half yearly', '20.0', '2018-01-16', '2018-01-29', 'uncorrected/test_02.png', 2, 1),
(10, 'chemistry', '12 c', 'half yearly', '60.0', '2018-01-16', '2018-01-29', 'uncorrected/test_03_jlSrfqw.png', 3, 1),
(11, 'chemistry', '12 a', 'half yearly', '100.0', '2018-01-01', '2018-01-29', 'uncorrected/test_05_oQh5qUk.png', 4, 1),
(12, 'chemistry', '12 a', 'half yearly', '100.0', '2018-01-17', '2018-01-29', 'uncorrected/test_05_pK0fwBk.png', 11, 1),
(13, 'Zoology', '12 a', 'half yearly', '20.0', '2018-01-10', '2018-01-29', 'uncorrected/test_04_zvU2JJG.png', 10, 1),
(14, 'history', '11 c', 'half yearly', '80.0', '2018-01-17', '2018-01-29', 'uncorrected/test_01_Em9NPef.png', 14, 1),
(15, 'botany', '11 c', 'half yearly', '40.0', '2018-01-03', '2018-01-29', 'uncorrected/example_test_GokOxrJ.png', 15, 1),
(16, 'biology', '12 b', 'half yearly', '80.0', '2018-01-16', '2018-01-29', 'uncorrected/test_01_azri2jf.png', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_chats`
--

CREATE TABLE IF NOT EXISTS `teacher_chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(200) NOT NULL,
  `sender` varchar(200) NOT NULL,
  `studentuser_id` int(11) NOT NULL,
  `teacheruser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_chats_studentuser_id_30672ae2_fk_teacher_studentslist_id` (`studentuser_id`),
  KEY `teacher_chats_teacheruser_id_6bd19fde_fk_general_profile_id` (`teacheruser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_examdetails`
--

CREATE TABLE IF NOT EXISTS `teacher_examdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_examdetails_student_id_e350374f_fk_teacher_s` (`student_id`),
  KEY `teacher_examdetails_teacher_id_d70ffeab_fk_general_profile_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_studentslist`
--

CREATE TABLE IF NOT EXISTS `teacher_studentslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `studentid` varchar(200) NOT NULL,
  `classes` varchar(200) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `location` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_studentslist_user_id_12b45f20_fk_general_profile_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `teacher_studentslist`
--

INSERT INTO `teacher_studentslist` (`id`, `name`, `studentid`, `classes`, `mobile`, `location`, `user_id`) VALUES
(1, 'gokul', '123456', '12 b', '9856321470', 'chennai', 1),
(2, 'sai', '256366', '12 b', '8520936741', 'chennai', 1),
(3, 'ram', '255367', '12 b', '9856321470', 'chennai', 1),
(4, 'raghu', '255367', '12 b', '8520936741', 'mumbai', 1),
(5, 'ravi', '255367', '12 b', '9856321470', 'chennai', 1),
(6, 'siva', '123654', '12 b', '8520936755', 'chennai', 1),
(7, 'dev', '255367', '12 b', '9856321470', 'chennai', 1),
(8, 'subha', '255367', '12 b', '8520936741', 'chennai', 1),
(9, 'devi', '255367', '12 b', '9856321470', 'bangalore', 1),
(10, 'sumitra', '255367', '12 b', '8520936741', 'bangalore', 1),
(11, 'jaya', '255367', '12 b', '9856321470', 'bangalore', 1),
(12, 'shakthi', '255367', '12 b', '9856321470', 'hyderabad', 1),
(13, 'ramy', '255367', '12 b', '8520936741', 'hyderabad', 1),
(14, 'divya', '255367', '12 b', '9856321470', 'hyderabad', 1),
(15, 'roopa', '255367', '12 b', '8520936741', 'chennai', 1),
(16, 'siva', '255367', '12 b', '8520936741', 'delhi', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_general_profile_id` FOREIGN KEY (`user_id`) REFERENCES `general_profile` (`id`),
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `general_profile_groups`
--
ALTER TABLE `general_profile_groups`
  ADD CONSTRAINT `general_profile_groups_group_id_3befd3aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `general_profile_groups_profile_id_ec6a808d_fk_general_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `general_profile` (`id`);

--
-- Constraints for table `general_profile_user_permissions`
--
ALTER TABLE `general_profile_user_permissions`
  ADD CONSTRAINT `general_profile_user_permission_id_d7c45d82_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `general_profile_user_profile_id_15be2332_fk_general_p` FOREIGN KEY (`profile_id`) REFERENCES `general_profile` (`id`);

--
-- Constraints for table `teacher_answersheets`
--
ALTER TABLE `teacher_answersheets`
  ADD CONSTRAINT `teacher_answersheets_user_id_d7a7d850_fk_general_profile_id` FOREIGN KEY (`user_id`) REFERENCES `general_profile` (`id`),
  ADD CONSTRAINT `teacher_answersheets_students_id_61d06df5_fk_teacher_s` FOREIGN KEY (`students_id`) REFERENCES `teacher_studentslist` (`id`);

--
-- Constraints for table `teacher_chats`
--
ALTER TABLE `teacher_chats`
  ADD CONSTRAINT `teacher_chats_teacheruser_id_6bd19fde_fk_general_profile_id` FOREIGN KEY (`teacheruser_id`) REFERENCES `general_profile` (`id`),
  ADD CONSTRAINT `teacher_chats_studentuser_id_30672ae2_fk_teacher_studentslist_id` FOREIGN KEY (`studentuser_id`) REFERENCES `teacher_studentslist` (`id`);

--
-- Constraints for table `teacher_examdetails`
--
ALTER TABLE `teacher_examdetails`
  ADD CONSTRAINT `teacher_examdetails_teacher_id_d70ffeab_fk_general_profile_id` FOREIGN KEY (`teacher_id`) REFERENCES `general_profile` (`id`),
  ADD CONSTRAINT `teacher_examdetails_student_id_e350374f_fk_teacher_s` FOREIGN KEY (`student_id`) REFERENCES `teacher_studentslist` (`id`);

--
-- Constraints for table `teacher_studentslist`
--
ALTER TABLE `teacher_studentslist`
  ADD CONSTRAINT `teacher_studentslist_user_id_12b45f20_fk_general_profile_id` FOREIGN KEY (`user_id`) REFERENCES `general_profile` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
