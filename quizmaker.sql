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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `exam_groups` */

insert  into `exam_groups`(`id`,`group_name`,`exam_id`,`created_at`,`updated_at`) values 
(3,'Question Group 1',6,'2021-05-20 15:48:05','2021-05-20 15:48:05'),
(4,'Results',6,'2021-05-20 15:48:05','2021-05-20 15:48:05'),
(7,'Question Group 1',8,'2021-05-21 14:31:47','2021-05-21 14:31:47');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `exams` */

insert  into `exams`(`id`,`name`,`description`,`author_id`,`status`,`attempt_number`,`passing_score`,`created_at`,`updated_at`,`theme_style`,`screen_height`,`screen_width`) values 
(8,'Ultimate Exam',NULL,1,1,2,100,'2021-05-21 14:31:47','2021-05-25 09:03:52','background: unset; font-fmily:Calibri; color:rgb(77, 77, 77); background-image:url(\"http://localhost:8000/images/theme_backgrounds/default.png\"); background-size: 100% 100%; background-repeat: no-repeat;',450,940);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(13,'Quiz Instructions',NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quizes` */

insert  into `quizes`(`id`,`exam_group_id`,`type_id`,`question_element`,`answer`,`feedback_correct`,`feedback_incorrect`,`feedback_try_again`,`media`,`created_at`,`updated_at`,`order`,`answer_element`,`question_type`,`feedback_type`,`branching`,`score`,`attempts`,`is_limit_time`,`limit_time`,`shuffle_answers`,`partially_correct`,`limit_number_response`,`case_sensitive`,`correct_score`,`incorrect_score`,`try_again_score`,`media_element`,`other_elements`,`background_img`,`video`,`audio`,`video_element`,`audio_element`) values 
(147,3,1,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle selected_slide_view_group\" style=\"height: 70px; width: 326px; left: 292px; z-index: 3; overflow: hidden; padding: 10px; top: 55px;\"><div class=\"cancel_drag\" contenteditable=\"true\">Select the correct answer option:</div></div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,NULL,'2021-05-21 13:43:41','2021-05-21 13:44:38',NULL,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 293px; top: 126px; left: 123px; z-index: 3;\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Option 1</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Option 2</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">Option 3</label></div></div></div>','graded','by_result','by_result','by_result','1',0,'01:00',0,NULL,NULL,NULL,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 3;display: none;position: relative;top: 0;left: 0;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,'http://localhost:8000/files/1621604650_small.mp4',NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle selected_slide_view_group\" style=\"z-index: 3; position: relative; top: 9px; left: 460px; width: 319px; height: 178.281px;\">\n                        <video controls=\"\" __idm_id__=\"157550593\">\n                            \n                        <source src=\"http://localhost:8000/files/1621604650_small.mp4\" type=\"video/mp4\"></video>\n                    </div>',NULL),
(148,3,1,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 70px; width: 282px; left: 311px; z-index: 3; overflow: hidden; padding: 10px; top: 53px;\"><div class=\"cancel_drag\" contenteditable=\"true\">Select the correct answer option:</div></div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.',NULL,'http://localhost:8000/images/upload/60a7ba48eb3c5.bmp','2021-05-21 13:48:17','2021-05-21 13:49:35',NULL,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 102px; left: 156px; z-index: 3;\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Option 1</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Option 2</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">Option 3</label></div></div></div>','graded','by_result','by_result','by_result','1',0,'01:00',0,NULL,NULL,NULL,10,0,NULL,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 3; position: relative; top: -13px; left: 490px; width: 333px;\">                        <img src=\"http://localhost:8000/images/upload/60a7ba48eb3c5.bmp\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 3;display: none;position: relative;top: 0;left: 0;\">\n                        <video controls=\"\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(212,7,4,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 26%; width: 656.797px; left: 60.5938px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 95.5px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><span style=\"font-weight: bold;\"><span style=\"font-size: 16px;\">This question type allows students to write in their answer. This type of question has to be manually assessed by a trainer, It is not automatically assessed by the quiz engine.</span></span></div></div>','Correct Answer 1','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.','http://localhost:8000/images/upload/60ad6abbe8c0a.bmp','2021-05-25 21:22:47','2021-05-25 21:25:16',0,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 92%; top: 250px; left: 36.5938px; z-index: 2; height: 26%;\"><div class=\"col-md-12\"><input id=\"answer\" type=\"text\" class=\"form-control\" name=\"answer\" autocomplete=\"answer\"></div></div>','survey','by_result',NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,0,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1; position: absolute; top: 77px; left: 732.766px; width: 14.0897%; height: 26%;\">                        <img src=\"http://localhost:8000/images/upload/60ad6abbe8c0a.bmp\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">                    </div>',NULL,'url(\"http://localhost:8000/images/upload/60ad6b250a69d.png\")',NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1; display: none; position: absolute; top: 8%; left: 50%; width: 0%;\">\n                        <video controls=\"\" style=\"width: 100%;\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(213,7,1,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 153px; width: 752px; left: 90px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 69px;\"><div class=\"cancel_drag\" contenteditable=\"true\"><div class=\"cancel_drag\"></div><span style=\"font-size: 16px;\"></span><span style=\"font-size: 16px; color: rgb(255, 0, 0);\">THIS QUESTION TYPE IS: MULTIPLE CHOICE&nbsp;&nbsp;</span><div><span style=\"font-size: 16px; color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.&nbsp;&nbsp;</span></div><div><span style=\"font-size: 16px;\">A box holds 15 cauliflowers.&nbsp; At the end of the day, the crew had filled 86 boxes.&nbsp; How many cauliflowers is that in total?</span><div><span style=\"font-size: 16px;\"></span><div class=\"cancel_drag\"></div></div></div></div></div>','3','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.','http://localhost:8000/images/upload/60ad6b802ff47.bmp','2021-05-25 21:25:30','2021-05-25 21:30:04',1,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 339px; top: 221px; left: 88px; z-index: 2; height: 137.016px;\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">15 x 86 = 2019 Cauliflowers.</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">15 x 86 = 1920 Cauliflowers.</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">15 x 86 = 1290 Cauliflowers.</label></div></div></div>','graded','by_result',NULL,NULL,'2',NULL,NULL,0,NULL,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1; position: absolute; top: 191px; left: 427px;\">                        <img src=\"http://localhost:8000/images/upload/60ad6b802ff47.bmp\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">                    </div>',NULL,'url(\"http://localhost:8000/images/upload/60ad6c58876ee.png\")',NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1; display: none; position: absolute; top: 0px; left: 0px; width: 300px; height: 150px;\">\n                        <video controls=\"\" style=\"width: 100%;\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(214,7,1,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle displayed_block\" style=\"height: 128px; width: 80%; left: 119px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 90px;\"><div class=\"cancel_drag\" contenteditable=\"true\"><div class=\"cancel_drag\"><span style=\"color: rgb(255, 0, 0);\">THIS QUESTION TYPE IS: MULTIPLE CHOICE</span></div><div class=\"cancel_drag\"><span style=\"color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</span></div><div class=\"cancel_drag\">Which sign best describes a risk to electrocution.&nbsp;</div></div></div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.','http://localhost:8000/images/upload/60ad6ce60a6ad.bmp','2021-05-25 21:32:11','2021-05-25 21:34:13',2,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle displayed_block\" style=\"width: 80%; top: 224px; left: 130px; z-index: 1;\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Sign 1</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Sign 2</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">Sign 3</label></div></div></div>','graded','by_result',NULL,NULL,'2',NULL,NULL,0,NULL,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle displayed_block\" style=\"z-index: 2; position: absolute; top: 221px; left: 466px; width: 328px; height: 125px;\">                        <img src=\"http://localhost:8000/images/upload/60ad6ce60a6ad.bmp\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">                    </div>',NULL,'url(\"http://localhost:8000/images/upload/60ad6d4d2713f.png\")',NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <video controls=\"\" style=\"width: 100%;\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(215,7,9,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 142px; width: 80%; left: 89px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 75px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div class=\"cancel_drag\"><span style=\"color: rgb(255, 0, 0);\">THIS QUESTION TYPE IS: DROPDOWN</span></div><div class=\"cancel_drag\"><span style=\"color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</span></div><div class=\"cancel_drag\">Petrol costs $1.77 per litre.&nbsp; The cars fuel tank is empty.&nbsp; When full, it holds 60 litres.&nbsp; It will cost _____________ to fill the car up with fuel.</div></div></div>','$106.20;','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-25 21:35:43','2021-05-25 21:43:51',3,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 234px; left: 98px; z-index: 2;\"><div class=\"col-md-12\"><div class=\"select_lists_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"select_lists_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><select id=\"0\"><option value=\"none\">- Select -</option><option value=\"$160.20\">$160.20</option><option value=\"$102.60\">$102.60</option><option value=\"$106.20\">$106.20</option></select></div></div>&nbsp;&nbsp;</div></div>','graded','by_result',NULL,NULL,'2',NULL,NULL,0,0,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">                    </div>',NULL,'url(\"http://localhost:8000/images/upload/60ad6efe45309.png\")',NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <video controls=\"\" style=\"width: 100%;\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(216,7,3,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 30%; width: 92%; left: 41.5938px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 80px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div class=\"cancel_drag\"><span style=\"color: rgb(255, 0, 0);\">THIS QUESTION TYPE IS: TRUE or FALSE</span></div><div class=\"cancel_drag\"><span style=\"color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</span></div><div class=\"cancel_drag\"><br></div><div class=\"cancel_drag\">Four (4) bags of sugar at $3.50 each would cost more than three (3) bags of sugar at $5.00 each.&nbsp;</div></div></div>','0','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-25 21:47:57','2021-05-25 21:49:21',4,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 776.797px; top: 238px; left: 87.5938px; z-index: 2; height: 129px;\"><div class=\"col-md-12\"><div class=\"choice_item\"><input type=\"radio\" id=\"true\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"true\">True</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"false\" name=\"answer\" value=\"0\" style=\"padding-right: 10px;\"><label for=\"0\">False</label></div></div></div>','graded','by_result',NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1; display: none; position: absolute; top: 0px; left: 0px;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,'url(\"http://localhost:8000/images/upload/60ad70d80883b.png\")',NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1; display: none; position: absolute; top: 0px; left: 0px;\">\n                        <video controls=\"\" style=\"width: 100%;\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(217,7,8,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 166px; width: 92%; left: 37.5938px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 73px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div class=\"cancel_drag\"><span style=\"color: rgb(255, 0, 0);\">THIS QUESTION TYPE IS: Type in the Word</span></div><div class=\"cancel_drag\"><span style=\"color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</span></div><div class=\"cancel_drag\"><br></div><div class=\"cancel_drag\">You are eating at a restaurant and the bill is $150.00.&nbsp; You need to split the bill between six (6) people.&nbsp; Each person will pay _____________________ .</div></div></div>','twenty five dollars;twenty five;25;25.0;25.00;$25;$25.0;$25.00;@','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-25 21:50:18','2021-05-25 21:54:58',5,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 653.797px; top: 248px; left: 133.594px; z-index: 2; height: 162px;\"><div class=\"col-md-12\">Fill in the <div class=\"fill_blanks_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"fill_blanks_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><input type=\"text\" id=\"0\" style=\"max-width: 100px;\"></div></div>&nbsp;&nbsp;</div></div>','graded','by_result',NULL,NULL,'2',NULL,NULL,NULL,0,NULL,0,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>','<div class=\"slide_view_group just_added_slide_view_element other_slide_view_element ui-draggable ui-draggable-handle ui-resizable\" style=\"left: 497px; z-index: 1; overflow: hidden; padding: 10px; position: absolute; top: 205px;\"><img src=\"http://localhost:8000/images/upload/60ad7229c5b01.bmp\" style=\"width: 100%;height: 100%;\"></div>','url(\"http://localhost:8000/images/upload/60ad71a0eb6c8.png\")',NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <video controls=\"\" style=\"width: 100%;\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(218,7,9,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 216px; width: 52%; left: 46.5938px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 61px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div class=\"cancel_drag\"><span style=\"color: rgb(255, 0, 0);\">THIS QUESTION TYPE IS: DROPDOWN</span></div><div class=\"cancel_drag\"><span style=\"color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</span></div><div class=\"cancel_drag\">You start work at 10:00am and your manager tells you on your arrival that your ½ hour lunch break will be in 3 and ½ hours.&nbsp; What time will your lunch break start?</div></div></div>','1:30pm;','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.','http://localhost:8000/images/upload/60ad73b7bbfe3.bmp','2021-05-25 22:00:49','2021-05-25 22:03:31',6,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 381.797px; top: 273px; left: 66.5938px; z-index: 2; height: 109px;\"><div class=\"col-md-12\"><div class=\"select_lists_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"select_lists_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><select id=\"0\"><option value=\"none\">- Select -</option><option value=\"10:30am\">10:30am</option><option value=\"1:30pm\">1:30pm</option><option value=\"12:30pm\">12:30pm</option></select></div></div>&nbsp;</div></div>','graded','by_result',NULL,NULL,'2',NULL,NULL,0,0,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1; position: absolute; top: 21.6126%; left: 59%; height: 56.7748%; width: 37%;\">                        <img src=\"http://localhost:8000/images/upload/60ad73b7bbfe3.bmp\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">                    </div>',NULL,'url(\"http://localhost:8000/images/upload/60ad742f6c8ac.png\")',NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1; display: none; position: absolute; top: 8%; left: 77.5%; width: 0%;\">\n                        <video controls=\"\" style=\"width: 100%;\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL),
(219,7,11,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 148px; width: 760px; left: 100px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 64px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div class=\"cancel_drag\"><span style=\"color: rgb(255, 0, 0);\">THIS QUESTION TYPE IS: Hotspot</span></div><div class=\"cancel_drag\"><span style=\"color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</span></div><div class=\"cancel_drag\">Point at Australia on the image. You can drag a hotspot marker to change its position before submitting.</div></div></div>','{\"background\": \"images/upload/60ad7484d8f13.png\"}@{\"type\": \"circle\", \"radius\": 23.5, \"top\": 160, \"left\": 253.234375}','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-05-25 22:04:44','2021-05-25 22:06:37',7,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 184px; left: 96px; z-index: 2;\"><div class=\"col-md-12\"><div class=\"canvas-container\" style=\"width: 300px; height: 214px; position: relative; user-select: none;\"><canvas id=\"slide_view_hotspots_canvas\" height=\"214\" class=\"lower-canvas\" width=\"300\" style=\"position: absolute; width: 300px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas><canvas class=\"upper-canvas \" width=\"300\" height=\"214\" style=\"position: absolute; width: 300px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none; cursor: default;\"></canvas></div></div></div>','graded','by_result',NULL,NULL,'2',NULL,NULL,NULL,0,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;\">\n                        <video controls=\"\" style=\"width: 100%;\">\n                            <source src=\"#\" type=\"video/mp4\">\n                        </video>\n                    </div>',NULL);

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
