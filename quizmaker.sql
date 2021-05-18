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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `exams` */

insert  into `exams`(`id`,`name`,`description`,`author_id`,`status`,`attempt_number`,`passing_score`,`created_at`,`updated_at`,`theme_style`) values 
(5,'Professional Exam','This is Professional Exam',1,1,2,100,'2021-05-11 07:29:11','2021-05-16 17:28:20','background: unset; font-fmily:Calibri; color:rgb(255, 255, 255); background-image:url(\"http://localhost:8000/images/theme_backgrounds/dark_brown_abstract.png\"); background-size: 100% 100%; background-repeat: no-repeat;');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(36,'2021_05_18_194120_update_quizes_table_add_field_background_img',19);

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
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quizes` */

insert  into `quizes`(`id`,`exam_group_id`,`type_id`,`question_element`,`answer`,`feedback_correct`,`feedback_incorrect`,`feedback_try_again`,`media`,`created_at`,`updated_at`,`order`,`answer_element`,`question_type`,`feedback_type`,`branching`,`score`,`attempts`,`is_limit_time`,`limit_time`,`shuffle_answers`,`partially_correct`,`limit_number_response`,`case_sensitive`,`correct_score`,`incorrect_score`,`try_again_score`,`media_element`,`other_elements`,`background_img`) values 
(78,1,7,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid black; height: 70px; width: 80%; left: 77px; position: absolute; top: 98px;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621009277418246\" data-role-resizable=\"true\">Match the following items with their descriptions:<span class=\"resize-element\"></span></div>','Item 1;Match 1@Item 1;Match 1@Item 1;Match 1@Item 1;Match 1@','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,'http://localhost:8000/images/upload/60a41440b0968.png','2021-05-14 15:33:34','2021-05-18 20:19:32',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 207px; left: 7px; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621009277420708\" data-role-resizable=\"true\"><div class=\"col-md-12\"><div style=\"display: flex;justify-content: space-around;padding-bottom: 10px;\"><div class=\"ui-widget-header droppable\" style=\"width: 40%\"><p>Item 1</p></div><div class=\"ui-widget-content draggable\" style=\"width: 40%\" isdropped=\"false\"><p>Match 1</p></div></div><div style=\"display: flex;justify-content: space-around;padding-bottom: 10px;\"><div class=\"ui-widget-header droppable\" style=\"width: 40%\"><p>Item 1</p></div><div class=\"ui-widget-content draggable\" style=\"width: 40%\" isdropped=\"false\"><p>Match 1</p></div></div><div style=\"display: flex;justify-content: space-around;padding-bottom: 10px;\"><div class=\"ui-widget-header droppable\" style=\"width: 40%\"><p>Item 1</p></div><div class=\"ui-widget-content draggable\" style=\"width: 40%\" isdropped=\"false\"><p>Match 1</p></div></div><div style=\"display: flex;justify-content: space-around;padding-bottom: 10px;\"><div class=\"ui-widget-header droppable\" style=\"width: 40%\"><p>Item 1</p></div><div class=\"ui-widget-content draggable\" style=\"width: 40%\" isdropped=\"false\"><p>Match 1</p></div></div></div></div>','graded','by_result',NULL,'by_result','1',0,'01:00',0,0,NULL,NULL,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group resizable-element\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621365814962613\" style=\"position: absolute; width: 102px; height: 121px; left: 539px; top: 212px;\" data-role-resizable=\"true\">                    <img src=\"http://localhost:8000/images/upload/60a41440b0968.png\" alt=\"slide_view_media\">                <span class=\"resize-element\"></span></div>',NULL,'url(\"http://localhost:8000/images/upload/60a42143477a4.jpeg\")'),
(91,1,10,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group\" style=\"border: 1px solid black;height: 70px;width: 80%;left: 10%\">Drag and drop the words to their places:</div>','words;places;','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-15 01:24:00','2021-05-15 01:24:00',NULL,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%\"><div class=\"col-md-12\"><div id=\"slide_drag_words_question\">Drag the <div class=\"blank\" style=\"display:inline;width: 70px;height: 100%;border: 1px solid grey;background: white;\"></div> and drop them to the appropriate <div class=\"blank\" style=\"display:inline;width: 70px;height: 100%;border: 1px solid grey;background: white;\"></div> .</div><div id=\"slide_drag_words_answer\"><span style=\"border: 1px solid gray;background: white;color: black;\">words</span><span style=\"border: 1px solid gray;background: white;color:black;\">places</span></div></div></div>','graded','by_result',NULL,NULL,'1',0,NULL,NULL,0,NULL,NULL,10,0,NULL,NULL,NULL,NULL),
(95,1,8,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid black; height: 70px; width: 80%; left: 73px; position: absolute; top: 18px;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621185373686392\" data-role-resizable=\"true\">Fill in the <span style=\"font-family: &quot;Arial Black&quot;; font-weight: bold; font-style: italic; text-decoration-line: underline line-through; vertical-align: sub; color: rgb(255, 0, 0);\">blank </span>fie<span style=\"color: rgb(0, 176, 80);\">lds in thi</span>s text:</div>','blank;blanks;@OK;@','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-16 17:13:42','2021-05-16 17:20:56',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 100px; left: 10%; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621185373687315\" data-role-resizable=\"true\"><div class=\"col-md-12\">Fill in the <div class=\"fill_blanks_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"fill_blanks_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><input type=\"text\" id=\"0\" style=\"max-width: 100px;\"></div></div>&nbsp;Testing quiz...&nbsp;<div class=\"fill_blanks_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"fill_blanks_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><input type=\"text\" id=\"1\" style=\"max-width: 100px;\"></div></div>&nbsp;OK!!!!!!! Very good!&nbsp;&nbsp;&nbsp;</div></div>','graded','by_result',NULL,'by_result','1',0,'01:00',NULL,0,NULL,0,10,0,NULL,NULL,NULL,NULL),
(99,1,9,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid black; height: 70px; width: 80%; left: 10%; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621198659130128\" data-role-resizable=\"true\">Choose the correct answer in each drop-down list:</div>','Answer 2;Good;','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-16 18:21:30','2021-05-16 21:40:28',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 100px; left: 67px; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621198659132893\" data-role-resizable=\"true\"><div class=\"col-md-12\">Choose the correct <div class=\"select_lists_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"select_lists_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><select id=\"0\"><option value=\"none\">- Select -</option><option value=\"Answer 1\">Answer 1</option><option value=\"Answer 2\">Answer 2</option></select></div></div>&nbsp;Testing...&nbsp;<div class=\"select_lists_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"select_lists_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><select id=\"1\"><option value=\"none\">- Select -</option><option value=\"Good\">Good</option><option value=\"Nice\">Nice</option><option value=\"OK\">OK</option></select></div></div>&nbsp;Great!!&nbsp;&nbsp;</div></div>','graded','by_result',NULL,'by_result','1',0,'01:00',0,0,NULL,NULL,10,0,NULL,NULL,NULL,NULL),
(105,1,11,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid black; height: 70px; width: 80%; left: 10%; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621316827211603\" data-role-resizable=\"true\">Click on the correct area in the image.</div>','{\"background\": \"images/upload/60a354e1122df.png\"}@{\"type\": \"polyline\", \"points\" : [{\"x\":148,\"y\":23},{\"x\":43,\"y\":100},{\"x\":133,\"y\":178},{\"x\":262,\"y\":134},{\"x\":130,\"y\":100},{\"x\":130,\"y\":100},{\"x\":148,\"y\":23}]}','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-17 22:35:00','2021-05-18 06:56:52',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 100px; left: 10%; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621316827213914\" data-role-resizable=\"true\"><div class=\"col-md-12\"><div class=\"canvas-container\" style=\"width: 287px; height: 214px; position: relative; user-select: none;\"><div class=\"canvas-container\" style=\"width: 287px; height: 214px; position: relative; user-select: none;\"><div class=\"canvas-container\" style=\"width: 287px; height: 214px; position: relative; user-select: none;\"><div class=\"canvas-container\" style=\"width: 287px; height: 214px; position: relative; user-select: none;\"><div class=\"canvas-container\" style=\"width: 287px; height: 214px; position: relative; user-select: none;\"><div class=\"canvas-container\" style=\"width: 287px; height: 214px; position: relative; user-select: none;\"><div class=\"canvas-container\" style=\"width: 287px; height: 214px; position: relative; user-select: none;\"><div class=\"canvas-container\" style=\"width: 287px; height: 214px; position: relative; user-select: none;\"><div class=\"canvas-container\" style=\"width: 287px; height: 214px; position: relative; user-select: none;\"><canvas id=\"slide_view_hotspots_canvas\" height=\"214\" width=\"287\" class=\"lower-canvas\" style=\"position: absolute; width: 287px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas><canvas class=\"upper-canvas \" width=\"287\" height=\"214\" style=\"position: absolute; width: 287px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div><canvas class=\"upper-canvas \" width=\"287\" height=\"214\" style=\"position: absolute; width: 287px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div><canvas class=\"upper-canvas \" width=\"287\" height=\"214\" style=\"position: absolute; width: 287px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div><canvas class=\"upper-canvas \" width=\"287\" height=\"214\" style=\"position: absolute; width: 287px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div><canvas class=\"upper-canvas \" width=\"287\" height=\"214\" style=\"position: absolute; width: 287px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div><canvas class=\"upper-canvas \" width=\"287\" height=\"214\" style=\"position: absolute; width: 287px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div><canvas class=\"upper-canvas \" width=\"287\" height=\"214\" style=\"position: absolute; width: 287px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div><canvas class=\"upper-canvas \" width=\"287\" height=\"214\" style=\"position: absolute; width: 287px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div><canvas class=\"upper-canvas \" width=\"287\" height=\"214\" style=\"position: absolute; width: 287px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none; cursor: default;\"></canvas></div></div><span class=\"resize-element\"></span></div>','graded','by_result',NULL,'by_result','1',0,'01:00',NULL,0,NULL,NULL,10,0,NULL,NULL,NULL,NULL),
(106,1,5,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group\" style=\"border: 1px solid black;height: 70px;width: 80%;left: 10%;z-index: 3;\">Type your response:</div>','=;0;@','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-18 20:29:23','2021-05-18 20:29:23',NULL,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 3;\"><div class=\"col-md-12\"><input id=\"answer\" type=\"number\" class=\"form-control\" name=\"answer\" autocomplete=\"answer\"></div></div>','graded','by_result',NULL,NULL,'1',0,NULL,NULL,NULL,NULL,NULL,10,0,NULL,NULL,NULL,NULL),
(107,1,1,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group\" style=\"border: 1px solid black;height: 70px;width: 80%;left: 10%;z-index: 3;\">Select the correct answer option:</div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-18 20:30:50','2021-05-18 20:30:50',NULL,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Option 1</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Option 2</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;z-index: 3;\"><label for=\"3\">Option 3</label></div></div></div>','graded','by_result','by_result','by_result','1',0,NULL,1,NULL,NULL,NULL,10,0,NULL,NULL,NULL,NULL),
(108,1,1,'<div contenteditable=\"true\" class=\"slide_view_question_element slide_view_group resizable-element\" style=\"border: 1px solid rgb(185, 38, 46); height: 70px; width: 80%; left: 117px; z-index: 4; position: absolute; top: 229px; color: rgb(255, 255, 255); background: none 0% 0% / auto repeat scroll padding-box border-box rgb(223, 64, 71);\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621370324021300\" data-role-resizable=\"true\">Select the correct answer option:<span class=\"resize-element\"></span></div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-18 20:38:33','2021-05-18 20:43:10',NULL,'<div class=\"slide_view_answer_element slide_view_group resizable-element\" style=\"width: 80%; top: 100px; left: 66px; z-index: 3; position: absolute; border-color: rgb(197, 96, 20); color: rgb(255, 255, 255); background: none 0% 0% / auto repeat scroll padding-box border-box rgb(233, 118, 36);\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621370324023895\" data-role-resizable=\"true\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Option 1</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Option 2</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">Option 3</label></div></div><span class=\"resize-element\"></span></div>','graded','by_result','by_result','by_result','1',0,'01:00',0,NULL,NULL,NULL,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group resizable-element\" style=\"z-index: 3; position: absolute;\" data-role-draggable=\"true\" data-role=\"draggable,resizable\" id=\"draggable-1621370324024381\" data-role-resizable=\"true\">\n                        <img src=\"#\" alt=\"slide_view_media\">\n                    <span class=\"resize-element\"></span></div>',NULL,'url(\"http://localhost:8000/images/upload/60a426d94c33a.jpeg\")');

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
