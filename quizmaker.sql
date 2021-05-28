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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `exam_groups` */

insert  into `exam_groups`(`id`,`group_name`,`exam_id`,`created_at`,`updated_at`) values 
(3,'Question Group 1',6,'2021-05-20 15:48:05','2021-05-20 15:48:05'),
(4,'Results',6,'2021-05-20 15:48:05','2021-05-20 15:48:05'),
(7,'Question Group 1',8,'2021-05-21 14:31:47','2021-05-21 14:31:47'),
(9,'Question Group 1',9,'2021-05-27 16:43:02','2021-05-27 16:43:02'),
(10,'Results',9,'2021-05-27 16:43:02','2021-05-27 16:43:02'),
(19,'Question Group 1',10,'2021-05-27 18:19:19','2021-05-27 18:19:19'),
(20,'Results',10,'2021-05-27 18:19:19','2021-05-27 18:19:19'),
(21,'Question Group 1',11,'2021-05-27 18:31:02','2021-05-27 18:31:02'),
(22,'Results',11,'2021-05-27 18:31:02','2021-05-27 18:31:02');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `exams` */

insert  into `exams`(`id`,`name`,`description`,`author_id`,`status`,`attempt_number`,`passing_score`,`created_at`,`updated_at`,`theme_style`,`screen_height`,`screen_width`) values 
(8,'Ultimate Exam',NULL,1,1,2,100,'2021-05-21 14:31:47','2021-05-27 08:22:50','background: unset; font-fmily:Calibri; color:rgb(0, 0, 0); background-image:url(\"http://localhost:8000/images/theme_backgrounds/green_line.png\"); background-size: 100% 100%; background-repeat: no-repeat;',450,940),
(11,'Test Exam',NULL,1,1,2,10,'2021-05-27 18:31:02','2021-05-27 19:25:32',NULL,450,940);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(11,'Hotspot',NULL,NULL,NULL),
(12,'Info Slide',NULL,NULL,NULL),
(13,'Quiz Instructions',NULL,NULL,NULL),
(14,'Passed',NULL,NULL,NULL),
(15,'Failed',NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quizes` */

insert  into `quizes`(`id`,`exam_group_id`,`type_id`,`question_element`,`answer`,`feedback_correct`,`feedback_incorrect`,`feedback_try_again`,`media`,`created_at`,`updated_at`,`order`,`answer_element`,`question_type`,`feedback_type`,`branching`,`score`,`attempts`,`is_limit_time`,`limit_time`,`shuffle_answers`,`partially_correct`,`limit_number_response`,`case_sensitive`,`correct_score`,`incorrect_score`,`try_again_score`,`media_element`,`other_elements`,`background_img`,`video`,`audio`,`video_element`,`audio_element`) values 
(147,3,1,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle selected_slide_view_group\" style=\"height: 70px; width: 326px; left: 292px; z-index: 3; overflow: hidden; padding: 10px; top: 55px;\"><div class=\"cancel_drag\" contenteditable=\"true\">Select the correct answer option:</div></div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-21 13:43:41','2021-05-21 13:44:38',NULL,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 293px; top: 126px; left: 123px; z-index: 3;\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Option 1</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Option 2</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">Option 3</label></div></div></div>','graded','by_result','by_result','by_result','1',0,'01:00',0,NULL,NULL,NULL,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 3;display: none;position: relative;top: 0;left: 0;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,'http://localhost:8000/files/1621604650_small.mp4',NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle selected_slide_view_group\" style=\"z-index: 3; position: relative; top: 9px; left: 460px; width: 319px; height: 178.281px;\">\n                        <video controls=\"\" __idm_id__=\"157550593\">\n                            \n                        <source src=\"http://localhost:8000/files/1621604650_small.mp4\" type=\"video/mp4\"></video>\n                    </div>',NULL),
(148,3,1,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 70px; width: 282px; left: 311px; z-index: 3; overflow: hidden; padding: 10px; top: 53px;\"><div class=\"cancel_drag\" contenteditable=\"true\">Select the correct answer option:</div></div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,'http://localhost:8000/images/upload/60a7ba48eb3c5.bmp','2021-05-21 13:48:17','2021-05-21 13:49:35',NULL,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 102px; left: 156px; z-index: 3;\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Option 1</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Option 2</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">Option 3</label></div></div></div>','graded','by_result','by_result','by_result','1',0,'01:00',0,NULL,NULL,NULL,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 3; position: relative; top: -13px; left: 490px; width: 333px;\">                        <img src=\"http://localhost:8000/images/upload/60a7ba48eb3c5.bmp\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 3;display: none;position: relative;top: 0;left: 0;\">\n                        <video controls=\"\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(225,7,1,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 26%; width: 710.797px; left: 4%; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 8%; border-color: rgb(149, 149, 149); border-width: 3px; border-style: solid; color: rgb(43, 43, 43); background: linear-gradient(rgb(209, 209, 209), rgb(193, 193, 193)) 0% 0% / auto repeat scroll padding-box border-box rgba(0, 0, 0, 0); box-shadow: rgba(0, 0, 0, 0.55) 8px 0px 15px 2px;\"><div class=\"cancel_drag\" contenteditable=\"true\">Select the correct answer option:</div></div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.','http://localhost:8000/images/upload/60aef50053023.bmp','2021-05-27 01:24:51','2021-05-27 20:58:28',18,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 45%; top: 38%; left: 4%; z-index: 2; position: absolute; height: 54%; border-color: rgb(149, 149, 149); border-width: 3px; border-style: solid; color: rgb(43, 43, 43); background: linear-gradient(rgb(209, 209, 209), rgb(193, 193, 193)) 0% 0% / auto repeat scroll padding-box border-box rgba(0, 0, 0, 0); box-shadow: rgba(0, 0, 0, 0.55) 8px 0px 15px 2px;\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Option 1</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Option 2</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">Option 3</label></div></div></div>','graded','by_result',NULL,NULL,'1',NULL,NULL,0,NULL,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1; position: absolute; top: 39.5687%; left: 51%; height: 50.8626%; width: 45%; border-color: rgb(149, 149, 149); border-width: 3px; border-style: solid; color: rgb(43, 43, 43); background: linear-gradient(rgb(209, 209, 209), rgb(193, 193, 193)) 0% 0% / auto repeat scroll padding-box border-box rgba(0, 0, 0, 0); box-shadow: rgba(0, 0, 0, 0.55) 8px 0px 15px 2px;\">                        <img src=\"http://localhost:8000/images/upload/60aef50053023.bmp\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(226,7,1,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div class=\"cancel_drag\" contenteditable=\"true\">Select the correct answer option:</div></div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 05:32:09','2021-05-27 20:58:28',19,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Option 1</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Option 2</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">Option 3</label></div></div></div>','graded','by_result',NULL,NULL,'1',NULL,NULL,0,NULL,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(227,7,3,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Choose whether the statement is true or false:</div></div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 05:32:18','2021-05-27 20:58:28',21,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"true\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"true\">True</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"false\" name=\"answer\" value=\"0\" style=\"padding-right: 10px;\"><label for=\"0\">False</label></div></div></div>','graded','by_result',NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(228,7,8,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Fill in the blank fields in this text:</div></div>','blanks;@','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.','http://localhost:8000/images/upload/60af5c3590bf2.bmp','2021-05-27 05:32:34','2021-05-27 20:58:29',20,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\">Fill in the <div class=\"fill_blanks_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"fill_blanks_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><input type=\"text\" id=\"0\" style=\"max-width: 100px;\"></div></div>&nbsp;&nbsp;</div></div>','graded','by_result',NULL,NULL,'1',NULL,NULL,NULL,0,NULL,0,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1; position: absolute; top: 229px; left: 451px; width: 328px; height: 175px;\">\n                        <img src=\"http://localhost:8000/images/upload/60af5c3590bf2.bmp\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(229,7,4,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Type your response:</div></div>','Correct Answer 1','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 05:32:47','2021-05-27 20:58:29',22,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\"><input id=\"answer\" type=\"text\" class=\"form-control\" name=\"answer\" autocomplete=\"answer\"></div></div>','graded','by_result',NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,0,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(230,7,8,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Fill in the blank fields in this text:</div></div>','blanks;@','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 05:33:01','2021-05-27 20:58:29',23,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\">Fill in the <div class=\"fill_blanks_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"fill_blanks_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><input id=\"0\" type=\"text\" style=\"max-width: 100px;\"></div></div></div></div>','graded','by_result',NULL,NULL,'1',NULL,NULL,NULL,0,NULL,0,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(231,7,11,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Click on the correct area in the image.</div></div>','{\"background\": \"images/upload/60af4b54b9ba1.bmp\"}@{\"type\": \"circle\", \"radius\": 31, \"top\": 103.5, \"left\": 213.296875}','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 05:33:57','2021-05-27 20:58:29',24,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\"><div class=\"canvas-container\" style=\"width: 300px; height: 214px; position: relative; user-select: none;\"><div class=\"canvas-container\" style=\"width: 300px; height: 214px; position: relative; user-select: none;\"><div class=\"canvas-container\" style=\"width: 300px; height: 214px; position: relative; user-select: none;\"><div class=\"canvas-container\" style=\"width: 300px; height: 214px; position: relative; user-select: none;\"><div class=\"canvas-container\" style=\"width: 300px; height: 214px; position: relative; user-select: none;\"><div class=\"canvas-container\" style=\"width: 300px; height: 214px; position: relative; user-select: none;\"><div class=\"canvas-container\" style=\"width: 300px; height: 214px; position: relative; user-select: none;\"><div class=\"canvas-container\" style=\"width: 300px; height: 214px; position: relative; user-select: none;\"><canvas id=\"slide_view_hotspots_canvas\" height=\"214\" class=\"lower-canvas\" width=\"300\" style=\"position: absolute; width: 300px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas><canvas class=\"upper-canvas \" width=\"300\" height=\"214\" style=\"position: absolute; width: 300px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div><canvas class=\"upper-canvas \" width=\"300\" height=\"214\" style=\"position: absolute; width: 300px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div><canvas class=\"upper-canvas \" width=\"300\" height=\"214\" style=\"position: absolute; width: 300px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div><canvas class=\"upper-canvas \" width=\"300\" height=\"214\" style=\"position: absolute; width: 300px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div><canvas class=\"upper-canvas \" width=\"300\" height=\"214\" style=\"position: absolute; width: 300px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div><canvas class=\"upper-canvas \" width=\"300\" height=\"214\" style=\"position: absolute; width: 300px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div><canvas class=\"upper-canvas \" width=\"300\" height=\"214\" style=\"position: absolute; width: 300px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div><canvas class=\"upper-canvas \" width=\"300\" height=\"214\" style=\"position: absolute; width: 300px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div></div></div>','graded','by_result',NULL,NULL,'1',NULL,NULL,NULL,0,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(232,8,1,'<div class=\"slide_view_question_element slide_view_group\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div class=\"cancel_drag\" contenteditable=\"true\">Select the correct answer option:</div></div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 09:32:21','2021-05-27 20:58:29',16,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Option 1</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Option 2</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">Option 3</label></div></div></div>','graded','by_result','by_result','by_result','1',0,NULL,1,NULL,NULL,NULL,10,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(233,8,2,'<div class=\"slide_view_question_element slide_view_group\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Select one or more correct answers:</div></div>','1;','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 09:33:36','2021-05-27 20:58:29',17,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\"><div class=\"response_item\"><input type=\"checkbox\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Option 1</label></div><div class=\"response_item\"><input type=\"checkbox\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Option 2</label></div><div class=\"response_item\"><input type=\"checkbox\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">Option 3</label></div></div></div>','graded','by_result',NULL,'by_result','1',0,NULL,1,0,0,NULL,10,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(236,10,15,'<div class=\"slide_view_question_element slide_view_group\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">You did not pass.</div></div>','','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 16:43:02','2021-05-27 20:58:29',15,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;padding: 10px;position:absolute;\"><div class=\"col-md-12\"><div contenteditable=\"true\" class=\"cancel_drag\"></div></div></div>','graded','by_result',NULL,NULL,'1',0,NULL,NULL,0,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(239,20,14,'<div class=\"slide_view_question_element slide_view_group\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Congratulations, you passed!</div></div>','','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 18:19:19','2021-05-27 20:58:29',13,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;padding: 10px;position:absolute;\"><div class=\"col-md-12\"><div contenteditable=\"true\" class=\"cancel_drag\"></div></div></div>','graded','by_result',NULL,NULL,'1',0,NULL,NULL,0,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(240,20,15,'<div class=\"slide_view_question_element slide_view_group\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">You did not pass.</div></div>','','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 18:19:19','2021-05-27 20:58:29',13,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;padding: 10px;position:absolute;\"><div class=\"col-md-12\"><div contenteditable=\"true\" class=\"cancel_drag\"></div></div></div>','graded','by_result',NULL,NULL,'1',0,NULL,NULL,0,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(241,22,14,'<div class=\"slide_view_question_element slide_view_group\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Congratulations, you passed!</div></div>','','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 18:31:02','2021-05-27 20:58:29',13,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;padding: 10px;position:absolute;\"><div class=\"col-md-12\"><div contenteditable=\"true\"><div class=\"cancel_drag\">Your Score: %%</div><div class=\"cancel_drag\">Passing Score: ##</div></div></div></div>','graded','by_result',NULL,NULL,'1',0,NULL,NULL,0,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(242,22,15,'<div class=\"slide_view_question_element slide_view_group\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">You did not pass.</div></div>','','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 18:31:02','2021-05-27 20:58:29',13,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;padding: 10px;position:absolute;\"><div class=\"col-md-12\"><div contenteditable=\"true\"><div class=\"cancel_drag\">Your Score: %%</div><div class=\"cancel_drag\">Passing Score: ##</div></div></div></div>','graded','by_result',NULL,NULL,'1',0,NULL,NULL,0,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(243,21,1,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div class=\"cancel_drag\" contenteditable=\"true\">Select the correct answer option:</div></div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 19:10:33','2021-05-27 20:58:29',2,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Option 1</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Option 2</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">Option 3</label></div></div></div>','graded','none',NULL,NULL,'1',NULL,NULL,1,NULL,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(244,21,2,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Select one or more correct answers:</div></div>','1;','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 19:59:40','2021-05-27 20:58:29',3,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\"><div class=\"response_item\"><input type=\"checkbox\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Option 1</label></div><div class=\"response_item\"><input type=\"checkbox\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Option 2</label></div><div class=\"response_item\"><input type=\"checkbox\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">Option 3</label></div></div></div>','graded','by_result',NULL,NULL,'1',NULL,NULL,1,0,0,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(245,21,3,'<div class=\"slide_view_question_element slide_view_group\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Choose whether the statement is true or false:</div></div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 19:59:45','2021-05-27 20:58:29',4,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"true\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"true\">True</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"false\" name=\"answer\" value=\"0\" style=\"padding-right: 10px;\"><label for=\"0\">False</label></div></div></div>','graded','by_result',NULL,NULL,'1',0,NULL,NULL,NULL,NULL,NULL,10,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(246,21,4,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Type your response:</div></div>','Correct Answer 1','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 19:59:51','2021-05-27 20:58:29',5,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\"><input id=\"answer\" type=\"text\" class=\"form-control\" name=\"answer\" autocomplete=\"answer\"></div></div>','graded','by_result',NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,0,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(247,21,5,'<div class=\"slide_view_question_element slide_view_group\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Type your response:</div></div>','=;0;@','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 19:59:57','2021-05-27 20:58:29',6,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\"><input id=\"answer\" type=\"number\" class=\"form-control\" name=\"answer\" autocomplete=\"answer\"></div></div>','graded','by_result',NULL,NULL,'1',0,NULL,NULL,NULL,NULL,NULL,10,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(248,21,6,'<div class=\"slide_view_question_element slide_view_group\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Arrange the following items in the correct order:</div></div>','Option 1;Option 2;Option 3;Option 4;','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 20:00:03','2021-05-27 20:58:29',7,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\"><ul id=\"sortable\"><li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span><label class=\"sequence_label\" data-editable>Option 1</label></li><li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span><label class=\"sequence_label\" data-editable>Option 2</label></li><li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span><label class=\"sequence_label\" data-editable>Option 3</label></li><li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span><label class=\"sequence_label\" data-editable>Option 4</label></li></ul></div></div>','graded','by_result',NULL,NULL,'1',0,NULL,NULL,0,NULL,NULL,10,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(249,21,7,'<div class=\"slide_view_question_element slide_view_group\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Match the following items with their descriptions:</div></div>','Item 1;Match 1@Item 2;Match 2@Item 3;Match 3@','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 20:00:13','2021-05-27 20:58:29',8,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\"><div style=\"display: flex;justify-content: space-around;padding-bottom: 10px;\"><div class=\"ui-widget-header droppable\" style=\"width: 40%\"><p>Item 1</p></div><div class=\"ui-widget-content draggable\" style=\"width: 40%\" isdropped=false><p>Match 1</p></div></div><div style=\"display: flex;justify-content: space-around;padding-bottom: 10px;\"><div class=\"ui-widget-header droppable\" style=\"width: 40%\"><p>Item 2</p></div><div class=\"ui-widget-content draggable\" style=\"width: 40%\" isdropped=false><p>Match 2</p></div></div><div style=\"display: flex;justify-content: space-around;padding-bottom: 10px;\"><div class=\"ui-widget-header droppable\" style=\"width: 40%\"><p>Item 3</p></div><div class=\"ui-widget-content draggable\" style=\"width: 40%\" isdropped=false><p>Match 3</p></div></div></div></div>','graded','by_result',NULL,NULL,'1',0,NULL,1,0,NULL,NULL,10,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(250,21,8,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Fill in the blank fields in this text:</div></div>','blanks;@','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 20:00:21','2021-05-27 20:58:29',9,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\">Fill in the <div class=\"fill_blanks_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"fill_blanks_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><input type=\"text\" id=\"0\" style=\"max-width: 100px;\"></div></div>&nbsp;&nbsp;</div></div>','graded','by_result',NULL,NULL,'1',NULL,NULL,NULL,0,NULL,0,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(251,21,9,'<div class=\"slide_view_question_element slide_view_group\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Choose the correct answer in each drop-down list:</div></div>','answer 1;','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 20:00:33','2021-05-27 20:58:29',10,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\">Choose the correct <div class=\"select_lists_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"select_lists_dropdown_body\" contenteditable=\"false\"  style=\"display: inline;\"><select id=\"0\"><option value=\"none\">- Select -</option><option value=\"answer 1\">Answer 1</option><option value=\"answer 2\">Answer 2</option></select></div></div></div></div>','graded','by_result',NULL,NULL,'1',0,NULL,0,0,NULL,NULL,10,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(252,21,10,'<div class=\"slide_view_question_element slide_view_group\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Drag and drop the words to their places:</div></div>','words;places;','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 20:00:42','2021-05-27 20:58:29',11,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\"><div id=\"slide_drag_words_question\">Drag the <div class=\"blank\" style=\"display:inline;width: 70px;height: 100%;border: 1px solid grey;background: white;\"></div> and drop them to the appropriate <div class=\"blank\" style=\"display:inline;width: 70px;height: 100%;border: 1px solid grey;background: white;\"></div> .</div><div id=\"slide_drag_words_answer\"><span style=\"border: 1px solid gray;background: white;color: black;\">words</span><span style=\"border: 1px solid gray;background: white;color:black;\">places</span></div></div></div>','graded','by_result',NULL,NULL,'1',0,NULL,NULL,0,NULL,NULL,10,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(253,21,11,'<div class=\"slide_view_question_element slide_view_group\" style=\"height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;\"><div contenteditable=\"true\" class=\"cancel_drag\">Click on the correct area in the image.</div></div>','','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-27 20:00:51','2021-05-27 20:58:29',12,'<div class=\"slide_view_answer_element slide_view_group\" style=\"width: 80%;top: 100px;left: 10%;z-index: 2;position:absolute;\"><div class=\"col-md-12\"><canvas id=\"slide_view_hotspots_canvas\" height=\"214\"></canvas></div></div>','graded','by_result',NULL,NULL,'1',0,NULL,NULL,0,NULL,NULL,10,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

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
