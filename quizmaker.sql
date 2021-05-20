/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.8-MariaDB : Database - quiz_maker
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `exam_groups` */

DROP TABLE IF EXISTS `exam_groups`;

CREATE TABLE `exam_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `exam_groups` */

insert  into `exam_groups`(`id`,`group_name`,`exam_id`,`created_at`,`updated_at`) values 
(1,'Question Group 1',5,'2021-05-11 07:29:11','2021-05-11 07:29:11'),
(2,'Results',5,'2021-05-11 07:29:11','2021-05-11 07:29:11');

/*Table structure for table `exams` */

DROP TABLE IF EXISTS `exams`;

CREATE TABLE `exams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `attempt_number` int(11) NOT NULL,
  `passing_score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `theme_style` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `screen_height` int(11) DEFAULT NULL,
  `screen_width` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `exams` */

insert  into `exams`(`id`,`name`,`description`,`author_id`,`status`,`attempt_number`,`passing_score`,`created_at`,`updated_at`,`theme_style`,`screen_height`,`screen_width`) values 
(5,'Professional Exam','This is Professional Exam',1,1,2,100,'2021-05-11 07:29:11','2021-05-20 11:03:38','background: unset; font-fmily:Calibri; color:rgb(255, 255, 255); background-image:url(\"http://localhost:8000/images/theme_backgrounds/blue_gradient.png\"); background-size: 100% 100%; background-repeat: no-repeat;',NULL,NULL);

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2021_04_22_094331_create_permissions_table',1),
(5,'2021_04_22_094412_create_roles_table',1),
(6,'2021_04_22_095114_create_users_permissons_table',1),
(7,'2021_04_22_095253_create_users_roles_table',1),
(8,'2021_04_22_095437_create_roles_permissions_table',1),
(9,'2021_04_22_202403_update_users_add_active',1),
(10,'2021_04_23_054749_create_exams_table',1),
(11,'2021_04_23_095548_update_exams_table_update_some_fields',1),
(12,'2021_04_23_132803_create_quiz_type_table',1),
(13,'2021_04_23_141624_create_quizes_table',1),
(14,'2021_04_27_101508_update_quizes_table_add_some_fields',2),
(15,'2021_04_27_103010_create_quizes_answers_table',3),
(16,'2021_04_27_103202_create_answers_table',3),
(17,'2021_04_27_104041_create_quizes_answer_contents_table',3),
(18,'2021_04_27_104326_create_multi_choice_answer_contents_table',3),
(19,'2021_04_27_175554_drop_some_tables',4),
(20,'2021_04_27_175809_update_answers_table',5),
(21,'2021_04_27_180046_update_multi_choice_answer_contents_table',6),
(22,'2021_04_27_181016_update_quizes_table',7),
(23,'2021_04_28_200710_create_multi_response_answer_contents_table',8),
(24,'2021_04_28_201051_update_multi_response_answer_content_table',9),
(25,'2021_04_29_211602_create_numeric_answer_contents_table',10),
(26,'2021_05_04_235634_update_quizes_table_rename_some_fields',11),
(27,'2021_05_11_062811_drop_answers_table',11),
(28,'2021_05_11_063042_drop_multi_choice_answer_contents_table',12),
(29,'2021_05_11_063127_drop_multi_response_answer_contents_table',12),
(30,'2021_05_11_063231_drop_numeric_answer_contents_table',13),
(31,'2021_05_11_063557_update_quizes_table_delete_rename_add_many_fields',14),
(32,'2021_05_11_064814_create_exam_groups_table',15),
(33,'2021_05_11_091542_update_quizes_table_add_three_score_fields',16),
(34,'2021_05_14_011827_update_exams_table_add_theme_style_field',17),
(35,'2021_05_18_103621_update_quizes_table_add_fields_media_element_other_elements',18),
(36,'2021_05_18_194120_update_quizes_table_add_field_background_img',19),
(37,'2021_05_20_055945_update_quizes_table_add_two_fields_video_audio',20),
(38,'2021_05_20_104253_update_quizes_table_add_2_fields_video_element_audio_element',21),
(39,'2021_05_20_110731_update_exams_add_2_fields_screen_height_screen_width',21);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

/*Table structure for table `quiz_type` */

DROP TABLE IF EXISTS `quiz_type`;

CREATE TABLE `quiz_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quiz_type` */

insert  into `quiz_type`(`id`,`name`,`description`,`created_at`,`updated_at`) values 
(1,'Multiple Choice',NULL,NULL,NULL),
(2,'Multiple Response',NULL,NULL,NULL),
(3,'True/False',NULL,NULL,NULL),
(4,'Short Answer',NULL,NULL,NULL),
(5,'Numeric',NULL,NULL,NULL),
(6,'Sequence',NULL,NULL,NULL),
(7,'Matching',NULL,NULL,NULL),
(8,'Fill in the Blanks',NULL,NULL,NULL),
(9,'Select from Lists',NULL,NULL,NULL),
(10,'Drag the Words',NULL,NULL,NULL),
(11,'Hotspot',NULL,NULL,NULL);

/*Table structure for table `quizes` */

DROP TABLE IF EXISTS `quizes`;

CREATE TABLE `quizes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exam_group_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `question_element` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_correct` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_incorrect` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_try_again` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `answer_element` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branching` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_limit_time` tinyint(1) DEFAULT NULL,
  `limit_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shuffle_answers` tinyint(1) DEFAULT NULL,
  `partially_correct` tinyint(1) DEFAULT NULL,
  `limit_number_response` tinyint(1) DEFAULT NULL,
  `case_sensitive` tinyint(1) DEFAULT NULL,
  `correct_score` int(11) DEFAULT NULL,
  `incorrect_score` int(11) DEFAULT NULL,
  `try_again_score` int(11) DEFAULT NULL,
  `media_element` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_elements` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_img` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_element` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio_element` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quizes` */

insert  into `quizes`(`id`,`exam_group_id`,`type_id`,`question_element`,`answer`,`feedback_correct`,`feedback_incorrect`,`feedback_try_again`,`media`,`created_at`,`updated_at`,`order`,`answer_element`,`question_type`,`feedback_type`,`branching`,`score`,`attempts`,`is_limit_time`,`limit_time`,`shuffle_answers`,`partially_correct`,`limit_number_response`,`case_sensitive`,`correct_score`,`incorrect_score`,`try_again_score`,`media_element`,`other_elements`,`background_img`,`video`,`audio`,`video_element`,`audio_element`) values 
(106,1,5,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid black; height: 70px; width: 80%; left: 66px; z-index: 3; position: absolute; top: 20px;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621492757757937\" data-role-resizable=\"true\">Type your response:</div>','==;0;@','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-18 20:29:23','2021-05-20 06:43:00',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 100px; left: 66px; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621492757758287\" data-role-resizable=\"true\"><div class=\"col-md-12\"><input id=\"answer\" type=\"number\" class=\"form-control\" name=\"answer\" autocomplete=\"answer\"></div></div>','graded','by_result',NULL,'by_result','1',0,'01:00',NULL,NULL,NULL,NULL,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group resizable-element\" style=\"z-index: 3; position: absolute; left: 373px; top: 278px;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621492757759787\" data-role-resizable=\"true\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    <span class=\"resize-element\"></span></div>',NULL,NULL,NULL,NULL,NULL,NULL),
(107,1,1,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group\" style=\"border: 1px solid black;height: 70px;width: 80%;left: 10%;z-index: 3;\">Select the correct answer option:</div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-18 20:30:50','2021-05-18 20:30:50',NULL,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Option 1</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Option 2</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;z-index: 3;\"><label for=\"3\">Option 3</label></div></div></div>','graded','by_result','by_result','by_result','1',0,NULL,1,NULL,NULL,NULL,10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(108,1,1,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid rgb(185, 38, 46); height: 74px; width: 403px; left: 127.5px; z-index: 4; position: absolute; top: 238px; color: rgb(255, 255, 255); background: none 0% 0% / auto repeat scroll padding-box border-box rgb(223, 64, 71);\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621370324021300\" data-role-resizable=\"true\">Select the correct answer option:<span class=\"resize-element\"></span></div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-18 20:38:33','2021-05-19 00:59:32',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 100px; left: 65.6015px; z-index: 3; position: absolute; border-color: rgb(197, 96, 20); color: rgb(255, 255, 255); background: none 0% 0% / auto repeat scroll padding-box border-box rgb(233, 118, 36);\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621370324023895\" data-role-resizable=\"true\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Option 1</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Option 2</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">Option 3</label></div></div><span class=\"resize-element\"></span></div>','graded','by_result','by_result','by_result','1',0,'01:00',0,NULL,NULL,NULL,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group resizable-element\" style=\"z-index: 3; position: absolute; left: 263.914px;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621370324024381\" data-role-resizable=\"true\">\n                        <img src=\"#\" alt=\"slide_view_media\">\n                    <span class=\"resize-element\"></span></div>',NULL,'url(\"http://localhost:8000/images/upload/60a426d94c33a.jpeg\")',NULL,NULL,NULL,NULL),
(110,1,2,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid black; height: 70px; width: 80%; left: 10%; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621397820236266\" data-role-resizable=\"true\">Select one or more correct answers:</div>','1;3;','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,'http://localhost:8000/images/upload/60a491439bd4f.png','2021-05-19 04:16:59','2021-05-19 04:17:18',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 100px; left: 10%; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621397820237585\" data-role-resizable=\"true\"><div class=\"col-md-12\"><div class=\"response_item\"><input type=\"checkbox\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Option 1</label></div><div class=\"response_item\"><input type=\"checkbox\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Option 2</label></div><div class=\"response_item\"><input type=\"checkbox\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">Option 3</label></div></div></div>','graded','by_result',NULL,'by_result','1',0,'01:00',0,0,0,NULL,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group resizable-element\" style=\"z-index: 3; position: absolute; width: 213px; height: 212px; left: 183px; top: 108px;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621397820239616\" data-role-resizable=\"true\">\n                        <img src=\"http://localhost:8000/images/upload/60a491439bd4f.png\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    <span class=\"resize-element\"></span></div>',NULL,NULL,NULL,NULL,NULL,NULL),
(111,1,3,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group\" style=\"border: 1px solid black;height: 70px;width: 80%;left: 10%;z-index: 3;\">Choose whether the statement is true or false:</div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-19 05:32:37','2021-05-19 05:32:37',NULL,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 3;\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"true\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"true\">True</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"false\" name=\"answer\" value=\"0\" style=\"padding-right: 10px;\"><label for=\"0\">False</label></div></div></div>','graded','by_result',NULL,NULL,'1',0,NULL,NULL,NULL,NULL,NULL,10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(112,1,4,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid black; height: 70px; width: 80%; left: 10%; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621402506680444\" data-role-resizable=\"true\">Type your response:<span class=\"resize-element\"></span></div>','Correct Answer 1','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-19 05:33:46','2021-05-19 05:35:35',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 192px; left: 61px; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621402506681388\" data-role-resizable=\"true\"><div class=\"col-md-12\"><input id=\"answer\" type=\"text\" class=\"form-control\" name=\"answer\" autocomplete=\"answer\"></div><span class=\"resize-element\"></span></div>','graded','by_result',NULL,'by_result','1',0,'01:00',NULL,NULL,NULL,0,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group resizable-element\" style=\"z-index: 3; position: absolute; left: 461px; top: 348px;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621402506684885\" data-role-resizable=\"true\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    <span class=\"resize-element\"></span></div>',NULL,NULL,NULL,NULL,NULL,NULL),
(116,1,5,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid black; height: 70px; width: 80%; left: 10%; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621403365039528\" data-role-resizable=\"true\">Type your response:<span class=\"resize-element\"></span></div>','==;300;@<<;0;5;@>;400;@','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-19 05:49:24','2021-05-19 06:45:34',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 219px; left: 58px; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621403365040394\" data-role-resizable=\"true\"><div class=\"col-md-12\"><input id=\"answer\" type=\"number\" class=\"form-control\" name=\"answer\" autocomplete=\"answer\"></div></div>','graded','by_result',NULL,'by_result','1',0,'01:00',NULL,NULL,NULL,NULL,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group resizable-element\" style=\"z-index: 3; position: absolute; left: 285px; top: 341px;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621403365041997\" data-role-resizable=\"true\">                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">                    <span class=\"resize-element\"></span></div>',NULL,NULL,NULL,NULL,NULL,NULL),
(117,1,6,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid black; height: 70px; width: 80%; left: 74px; z-index: 3; position: absolute; top: 63px;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621408182918565\" data-role-resizable=\"true\">Arrange the following items in the correct order:</div>','Option 1;Option 2;Option 3;Option 4;','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-19 07:09:42','2021-05-19 07:10:18',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 192px; left: 68px; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621408182920861\" data-role-resizable=\"true\"><div class=\"col-md-12\"><ul id=\"sortable\"><li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span><label class=\"sequence_label\" data-editable=\"\">Option 1</label></li><li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span><label class=\"sequence_label\" data-editable=\"\">Option 2</label></li><li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span><label class=\"sequence_label\" data-editable=\"\">Option 3</label></li><li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span><label class=\"sequence_label\" data-editable=\"\">Option 4</label></li></ul></div></div>','graded','by_result',NULL,'by_result','1',0,'01:00',NULL,0,NULL,NULL,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group resizable-element\" style=\"z-index: 3; position: absolute; left: 344px; top: 368px;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621408182921520\" data-role-resizable=\"true\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    <span class=\"resize-element\"></span></div>',NULL,NULL,NULL,NULL,NULL,NULL),
(118,1,7,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid black; height: 70px; width: 80%; left: 10%; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-162140952526366\" data-role-resizable=\"true\">Match the following items with their descriptions:<span class=\"resize-element\"></span></div>','Item 1;Match 1@Item 2;Match 2@Item 3;Match 3@','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-19 07:32:04','2021-05-19 07:32:41',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 172px; left: 66px; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621409525265591\" data-role-resizable=\"true\"><div class=\"col-md-12\"><div style=\"display: flex;justify-content: space-around;padding-bottom: 10px;\"><div class=\"ui-widget-header droppable\" style=\"width: 40%\"><p>Item 1</p></div><div class=\"ui-widget-content draggable\" style=\"width: 40%\" isdropped=\"false\"><p>Match 1</p></div></div><div style=\"display: flex;justify-content: space-around;padding-bottom: 10px;\"><div class=\"ui-widget-header droppable\" style=\"width: 40%\"><p>Item 2</p></div><div class=\"ui-widget-content draggable\" style=\"width: 40%\" isdropped=\"false\"><p>Match 2</p></div></div><div style=\"display: flex;justify-content: space-around;padding-bottom: 10px;\"><div class=\"ui-widget-header droppable\" style=\"width: 40%\"><p>Item 3</p></div><div class=\"ui-widget-content draggable\" style=\"width: 40%\" isdropped=\"false\"><p>Match 3</p></div></div></div></div>','graded','by_result',NULL,'by_result','1',0,'01:00',0,0,NULL,NULL,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group resizable-element\" style=\"z-index: 3; position: absolute; left: 236px; top: 307px;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621409525266678\" data-role-resizable=\"true\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    <span class=\"resize-element\"></span></div>',NULL,NULL,NULL,NULL,NULL,NULL),
(119,1,8,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid black; height: 70px; width: 80%; left: 10%; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621413273602961\" data-role-resizable=\"true\">Fill in the blank fields in this text:<span class=\"resize-element\"></span></div>','blank;blanks;@okay;ok;OK;@','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-19 08:34:33','2021-05-19 08:35:45',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 100px; left: 10%; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621413273604331\" data-role-resizable=\"true\"><div class=\"col-md-12\">Fill in the <div class=\"fill_blanks_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"fill_blanks_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><input type=\"text\" id=\"0\" style=\"max-width: 100px;\"></div></div>&nbsp;OK!!!&nbsp;<div class=\"fill_blanks_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"fill_blanks_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><input type=\"text\" id=\"1\" style=\"max-width: 100px;\"></div></div>&nbsp;</div></div>','graded','by_result',NULL,'by_result','1',0,'01:00',NULL,0,NULL,0,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group resizable-element\" style=\"z-index: 3; position: absolute; left: 390px; top: 267px;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621413273605725\" data-role-resizable=\"true\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    <span class=\"resize-element\"></span></div>',NULL,NULL,NULL,NULL,NULL,NULL),
(120,1,9,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid black; height: 70px; width: 80%; left: 10%; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621413991719821\" data-role-resizable=\"true\">Choose the correct answer in each drop-down list:<span class=\"resize-element\"></span></div>','Answer 1;OK;','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-19 08:46:31','2021-05-19 08:47:24',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 100px; left: 10%; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621413991721446\" data-role-resizable=\"true\"><div class=\"col-md-12\">Choose the correct <div class=\"select_lists_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"select_lists_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><select id=\"0\"><option value=\"none\">- Select -</option><option value=\"Answer 1\">Answer 1</option><option value=\"Answer 2\">Answer 2</option></select></div></div>&nbsp;OK&nbsp;<div class=\"select_lists_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"select_lists_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><select id=\"1\"><option value=\"none\">- Select -</option><option value=\"NO\">NO</option><option value=\"OK\">OK</option></select></div></div>&nbsp;!!!</div></div>','graded','by_result',NULL,'by_result','1',0,'01:00',0,0,NULL,NULL,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group resizable-element\" style=\"z-index: 3; position: absolute; left: 385px; top: 341px;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621413991722843\" data-role-resizable=\"true\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    <span class=\"resize-element\"></span></div>',NULL,NULL,NULL,NULL,NULL,NULL),
(121,1,10,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid black; height: 70px; width: 80%; left: 10%; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621416219518180\" data-role-resizable=\"true\">Drag and drop the words to their places:</div>','words;places;','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-19 09:23:38','2021-05-19 09:24:13',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 100px; left: 66px; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621416219518836\" data-role-resizable=\"true\"><div class=\"col-md-12\"><div id=\"slide_drag_words_question\">Drag the <div class=\"blank\" style=\"display: inline; width: 70px; height: 100%; border: 1px solid grey; background: white; padding-right: 70px;\"></div> and drop them to the appropriate <div class=\"blank\" style=\"display: inline; width: 70px; height: 100%; border: 1px solid grey; background: white; padding-right: 70px;\"></div> .</div><div id=\"slide_drag_words_answer\"><span style=\"border: 1px solid gray;background: white;color: black;\">words</span><span style=\"border: 1px solid gray;background: white;color: black;\">places</span></div></div><span class=\"resize-element\"></span></div>','graded','by_result',NULL,'by_result','1',0,'01:00',NULL,0,NULL,NULL,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group resizable-element\" style=\"z-index: 3; position: absolute; left: 210px; top: 280px;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621416219518984\" data-role-resizable=\"true\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    <span class=\"resize-element\"></span></div>',NULL,NULL,NULL,NULL,NULL,NULL),
(128,1,11,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid black; height: 70px; width: 80%; left: 10%; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621453802847291\" data-role-resizable=\"true\">Click on the correct area in the image.<span class=\"resize-element\"></span></div>','{\"background\": \"images/upload/60a56bf3b2632.jpeg\"}@{\"type\": \"rect\", \"width\": 19.000753612036874, \"height\": 38.00151467344354, \"top\": 108.0156731123359, \"left\": 116.75749951377296}','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-19 19:50:02','2021-05-19 19:50:21',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 100px; left: 10%; z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621453802848951\" data-role-resizable=\"true\"><div class=\"col-md-12\"><div class=\"canvas-container\" style=\"width: 287px; height: 214px; position: relative; user-select: none;\"><canvas id=\"slide_view_hotspots_canvas\" height=\"235.4000051021576\" width=\"315.7000068426132\" class=\"lower-canvas\" style=\"position: absolute; width: 287px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas><canvas class=\"upper-canvas \" width=\"287\" height=\"214\" style=\"position: absolute; width: 287px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div></div><span class=\"resize-element\"></span></div>','graded','by_result',NULL,'by_result','1',0,'01:00',NULL,0,NULL,NULL,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group resizable-element\" style=\"z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621453802849595\" data-role-resizable=\"true\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    <span class=\"resize-element\"></span></div>',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`slug`,`created_at`,`updated_at`) values 
(1,'Administrator','manager',NULL,NULL),
(2,'Student','student',NULL,NULL);

/*Table structure for table `roles_permissions` */

DROP TABLE IF EXISTS `roles_permissions`;

CREATE TABLE `roles_permissions` (
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `roles_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `roles_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `roles_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles_permissions` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`active`) values 
(1,'Test Admin','manager@gmail.com',NULL,'$2y$10$B.gKC6KKUq6asvFJK4m3deBLqLtLrtksCAjY7yyIt8eClYgGAvXk6',NULL,NULL,NULL,1),
(2,'Test Student','student@gmail.com',NULL,'$2y$10$IfInWaUwzF1XOBIhISKJI.PdLbHxQyw7K7rDP77OCvSqUocjWsQf6',NULL,NULL,NULL,1);

/*Table structure for table `users_permissions` */

DROP TABLE IF EXISTS `users_permissions`;

CREATE TABLE `users_permissions` (
  `user_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `users_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users_permissions` */

/*Table structure for table `users_roles` */

DROP TABLE IF EXISTS `users_roles`;

CREATE TABLE `users_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `users_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `users_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users_roles` */

insert  into `users_roles`(`user_id`,`role_id`) values 
(1,1),
(2,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
