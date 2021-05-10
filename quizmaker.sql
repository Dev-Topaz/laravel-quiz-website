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
/*Table structure for table `answers` */

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) NOT NULL,
  `answer_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `answers` */

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `exams` */

insert  into `exams`(`id`,`name`,`description`,`author_id`,`status`,`attempt_number`,`passing_score`,`created_at`,`updated_at`) values 
(1,'First Text Exam','This is my first exam. I will make it to test. Hope everything is working well.',1,1,2,90,'2021-04-23 22:25:54','2021-04-29 06:00:08'),
(2,'Simple Exam - Attemp Number & Passing Score Test','At first test, Attemp number and passing score are not saving well. So I make a exam again.',1,1,2,80,'2021-04-23 22:29:59','2021-04-23 22:29:59'),
(4,'Mini Simple Exam','This is my mistake. But I will test using this exam.',1,1,1,50,'2021-04-24 03:25:05','2021-04-26 11:41:17');

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(25,'2021_04_29_211602_create_numeric_answer_contents_table',10);

/*Table structure for table `multi_choice_answer_contents` */

DROP TABLE IF EXISTS `multi_choice_answer_contents`;

CREATE TABLE `multi_choice_answer_contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `choice_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `multi_choice_answer_contents` */

insert  into `multi_choice_answer_contents`(`id`,`quiz_id`,`content`,`choice_id`,`created_at`,`updated_at`) values 
(10,8,'Type content...','1','2021-04-28 06:37:26','2021-04-28 06:37:26'),
(17,7,'Type content...','3','2021-04-28 22:08:53','2021-04-28 22:08:53'),
(18,7,'Type content...','2','2021-04-28 22:08:53','2021-04-28 22:08:53'),
(19,7,'Type content...','1','2021-04-28 22:08:53','2021-04-28 22:08:53'),
(22,20,'Option 1','1','2021-05-07 22:16:31','2021-05-07 22:16:31'),
(23,20,'Option 2','2','2021-05-07 22:16:31','2021-05-07 22:16:31'),
(24,20,'Option 3','3','2021-05-07 22:16:31','2021-05-07 22:16:31'),
(25,21,'Option 1','1','2021-05-07 22:20:31','2021-05-07 22:20:31'),
(26,21,'Option 2','2','2021-05-07 22:20:31','2021-05-07 22:20:31'),
(27,21,'Option 3','3','2021-05-07 22:20:31','2021-05-07 22:20:31'),
(28,22,'Option 1','1','2021-05-07 22:23:06','2021-05-07 22:23:06'),
(29,22,'Option 2','2','2021-05-07 22:23:06','2021-05-07 22:23:06'),
(30,22,'Option 3','3','2021-05-07 22:23:06','2021-05-07 22:23:06'),
(31,23,'Option 1','1','2021-05-07 22:25:24','2021-05-07 22:25:24'),
(32,23,'Option 2','2','2021-05-07 22:25:24','2021-05-07 22:25:24'),
(33,23,'Option 3','3','2021-05-07 22:25:24','2021-05-07 22:25:24'),
(34,27,'Option 1','1','2021-05-09 13:01:35','2021-05-09 13:01:35'),
(35,27,'Option 2','2','2021-05-09 13:01:35','2021-05-09 13:01:35'),
(36,27,'Option 3','3','2021-05-09 13:01:35','2021-05-09 13:01:35');

/*Table structure for table `multi_response_answer_contents` */

DROP TABLE IF EXISTS `multi_response_answer_contents`;

CREATE TABLE `multi_response_answer_contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `multi_response_answer_contents` */

insert  into `multi_response_answer_contents`(`id`,`quiz_id`,`content`,`response_id`,`created_at`,`updated_at`) values 
(7,12,'Sign 1','3','2021-04-28 21:55:35','2021-04-28 21:55:35'),
(8,12,'Sign 2','2','2021-04-28 21:55:35','2021-04-28 21:55:35'),
(9,12,'Sign 3','1','2021-04-28 21:55:35','2021-04-28 21:55:35'),
(10,24,'Option 1','1','2021-05-07 22:53:43','2021-05-07 22:53:43'),
(11,24,'Option 2','2','2021-05-07 22:53:43','2021-05-07 22:53:43'),
(12,24,'Option 3','3','2021-05-07 22:53:43','2021-05-07 22:53:43'),
(13,25,'Option 1','1','2021-05-09 12:22:44','2021-05-09 12:22:44'),
(14,25,'Option 2','2','2021-05-09 12:22:44','2021-05-09 12:22:44'),
(15,25,'Option 3','3','2021-05-09 12:22:44','2021-05-09 12:22:44'),
(16,26,'Option 1','1','2021-05-09 12:22:45','2021-05-09 12:22:45'),
(17,26,'Option 2','2','2021-05-09 12:22:45','2021-05-09 12:22:45'),
(18,26,'Option 3','3','2021-05-09 12:22:45','2021-05-09 12:22:45');

/*Table structure for table `numeric_answer_contents` */

DROP TABLE IF EXISTS `numeric_answer_contents`;

CREATE TABLE `numeric_answer_contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) NOT NULL,
  `option_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input_value_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input_value_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `numeric_answer_contents` */

insert  into `numeric_answer_contents`(`id`,`quiz_id`,`option_value`,`input_value_1`,`input_value_2`,`created_at`,`updated_at`) values 
(6,15,'==','300','','2021-04-29 23:27:23','2021-04-29 23:27:23');

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
  `exam_id` int(11) NOT NULL,
  `layout` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `question` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_correct` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_incorrect` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_try_again` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_feedback` tinyint(1) NOT NULL,
  `is_draft` tinyint(1) NOT NULL,
  `media` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `answer_content_id` int(11) DEFAULT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quizes` */

insert  into `quizes`(`id`,`exam_id`,`layout`,`type_id`,`question`,`answer`,`feedback_correct`,`feedback_incorrect`,`feedback_try_again`,`is_feedback`,`is_draft`,`media`,`created_at`,`updated_at`,`answer_content_id`,`answer_id`,`order`) values 
(1,2,1,4,'100 + 200 = _______','300','Correct!','Incorrect!','Try again',1,1,NULL,'2021-04-26 06:46:36','2021-04-26 10:04:32',NULL,NULL,NULL),
(3,2,1,4,'THIS QUESTION TYPE IS: Type in the Word\r\nThis question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.\r\n\r\nYou are eating at a restaurant and the bill is $150.00.  You need to split the bill between six (6) people.  Each person will pay _____________________ .','25.0','Correct!','Incorrect!','Try again',1,0,NULL,'2021-04-26 10:27:26','2021-04-26 12:13:35',NULL,NULL,NULL),
(7,1,1,1,'THIS QUESTION TYPE IS: MULTIPLE CHOICE\r\nThis question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.\r\nA box holds 15 cauliflowers.  At the end of the day, the crew had filled 86 boxes.  How many cauliflowers is that in total?','2','Correct!','Incorrect!','Try again',1,0,NULL,'2021-04-28 05:09:11','2021-04-28 22:08:52',NULL,NULL,NULL),
(8,1,1,1,'<div><div><span style=\"font-size:18px;\"><b><font color=\"#ff0000\">THIS QUESTION TYPE IS: MULTIPLE CHOICE</font></b></span></div><span style=\"font-size:16px;\"><font color=\"#0000ff\">\r\n<span style=\"font-size:18px;\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</span></font></span><div>A box holds 15 cauliflowers.&nbsp; At the end of the day, the crew had filled 86 boxes.&nbsp; How many cauliflowers is that in total?</div></div>','1','Correct!','Incorrect!','Try again',1,0,NULL,'2021-04-28 06:37:26','2021-04-28 06:37:26',NULL,NULL,NULL),
(12,1,1,2,'<div><div><span style=\"font-size:18px;\"><font color=\"#ff0000\">THIS QUESTION TYPE IS: MULTIPLE CHOICE</font></span></div><div><font color=\"#0000ff\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</font></div><div>Which sign best describes a risk to electrocution.&nbsp;</div></div>','3;1;','Correct!','Incorrect!','Try again',1,0,NULL,'2021-04-28 21:45:00','2021-04-28 21:55:35',NULL,NULL,NULL),
(13,1,1,3,'<div><div><span style=\"font-size:18px;\"><font color=\"#ff0000\">THIS QUESTION TYPE IS: TRUE or FALSE</font></span></div><div><font color=\"#0000ff\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</font></div><div><br></div><div>Four (4) bags of sugar at $3.50 each would cost more than three (3) bags of sugar at $5.00 each.&nbsp;</div></div>','0','Correct!','Incorrect!','Try again',1,0,NULL,'2021-04-29 06:34:01','2021-04-29 06:37:01',NULL,NULL,NULL),
(15,1,1,5,'<div>100 + 200 = ?</div>','numeric','Correct!','Incorrect!','Try again',1,0,NULL,'2021-04-29 21:32:57','2021-04-29 23:27:23',NULL,NULL,NULL),
(17,1,1,6,'<div><span style=\"font-size: 14.4px;\"><font color=\"#ff0000\"><span style=\"font-size:18px;\">THIS QUESTION TYPE IS: Drag and Drop</span></font></span><font color=\"#0000ff\"><br></font></div><div><font color=\"#0000ff\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</font></div><div>Arrange the following letters in the correct order(where \'A\' is no.1)</div>','A;B;C;D;E;','Correct!','Incorrect!','Try again',1,0,NULL,'2021-05-02 14:31:35','2021-05-02 14:47:18',NULL,NULL,NULL),
(18,1,1,7,'<div><div><font color=\"#ff0000\"><span style=\"font-size:18px;\"><b>THIS QUESTION TYPE IS: Drag and Click</b></span></font></div><div><font color=\"#0000ff\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</font></div><div>Match the following items:</div></div>','Australia;Australia@America;America@India;India@Brazil;Brazil@','Correct!','Incorrect!','Try again',1,0,NULL,'2021-05-02 21:11:22','2021-05-02 21:24:00',NULL,NULL,NULL),
(28,1,1,8,'ok','ok','ok','ok','ok',1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(29,1,1,9,'ok','ok','ok','ok','ok',1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(30,1,1,10,'ok','ok','ok','ok','ok',1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(31,1,1,11,'ok','ok','ok','ok','ok',1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(32,1,1,4,'short Answer','ok','ok','ok','ok',1,0,NULL,NULL,NULL,NULL,NULL,NULL);

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
