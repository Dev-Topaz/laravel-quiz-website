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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `exam_groups` */

insert  into `exam_groups`(`id`,`group_name`,`exam_id`,`created_at`,`updated_at`) values 
(88,'Question Group 1',34,'2021-06-12 06:14:32','2021-06-12 06:14:32'),
(89,'Results',34,'2021-06-12 06:14:32','2021-06-12 06:14:32');

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
  `stuff_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloaded` tinyint(4) NOT NULL,
  `published` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `exams` */

insert  into `exams`(`id`,`name`,`description`,`author_id`,`status`,`attempt_number`,`passing_score`,`created_at`,`updated_at`,`theme_style`,`screen_height`,`screen_width`,`stuff_emails`,`downloaded`,`published`) values 
(34,'iSpring Exam',NULL,1,1,1,100,'2021-06-12 06:14:32','2021-06-14 03:56:30',NULL,450,940,'rto@civilsafety.edu.au,robert@civilsafety.edu.au',1,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(39,'2021_05_20_110731_update_exams_add_2_fields_screen_height_screen_width',21),
(40,'2021_05_28_084732_update_exams_table_add_field_stuff_emails',22),
(41,'2021_05_28_085409_update_exams_table_update_field_stuff_emails',23),
(42,'2016_06_01_000001_create_oauth_auth_codes_table',24),
(43,'2016_06_01_000002_create_oauth_access_tokens_table',24),
(44,'2016_06_01_000003_create_oauth_refresh_tokens_table',24),
(45,'2016_06_01_000004_create_oauth_clients_table',24),
(46,'2016_06_01_000005_create_oauth_personal_access_clients_table',24),
(47,'2021_06_19_033232_update_exams_table_add_fields_downloaded_and_published',25);

/*Table structure for table `oauth_access_tokens` */

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_access_tokens` */

insert  into `oauth_access_tokens`(`id`,`user_id`,`client_id`,`name`,`scopes`,`revoked`,`created_at`,`updated_at`,`expires_at`) values 
('0805bfe145c68b697738b812ee37210a07246c0e2fc1da2e0d109f07c831ddf980cfd72af388a5c3',18,1,'MyApp','[]',0,'2021-06-19 02:02:54','2021-06-19 02:02:54','2022-06-19 02:02:54'),
('0e772a982b73deb3f6be7bc9e41d80b5e5351cff0ba997c3ad9c2c5933028a129d82f1ba976cee42',6,1,'MyApp','[]',0,'2021-06-18 02:33:04','2021-06-18 02:33:04','2022-06-18 02:33:04'),
('0e7fba9f213cf3700d5e8d353538f44b32ccefca242a855b84275bd04f584bfac1838904126be6bf',6,1,'MyApp','[]',0,'2021-06-18 21:45:49','2021-06-18 21:45:49','2022-06-18 21:45:49'),
('158e5bf655704427bf901401538978b45fc14d267011c2732f4436134bc2338eaee475e5bf53b69f',6,1,'MyApp','[]',0,'2021-06-18 21:32:23','2021-06-18 21:32:23','2022-06-18 21:32:23'),
('1592dab74d27ac823ba5779bc4ebcf1b7ce8e2ea2556de9133c1eac4d5885f822cb87e6dd33258cc',17,1,'MyApp','[]',0,'2021-06-18 23:28:31','2021-06-18 23:28:31','2022-06-18 23:28:31'),
('17518a56eb11d3c7c202840809d36a20188656215258b53bf5594c0918b8b815137057d3cbead1d9',15,1,'MyApp','[]',0,'2021-06-18 19:31:58','2021-06-18 19:31:58','2022-06-18 19:31:58'),
('1e9d1cea4d4fac82a8b4ee4fba13774751bf1af1b9e5413fa6faef43c40503d2d4c45c686389dc07',19,1,'MyApp','[]',0,'2021-06-19 02:03:23','2021-06-19 02:03:23','2022-06-19 02:03:23'),
('2735cc460c4b55b313ea1a67a8b0c0f186a9e06a304f03a9b2f2dd0d2b68735139ed29e7d11af102',6,1,'MyApp','[]',0,'2021-06-18 21:47:00','2021-06-18 21:47:00','2022-06-18 21:47:00'),
('3b97b7fd4c4723580a83869ed3ba4235a1cbc7667acfe5b94bc742da91f1165d9f781b3c6fee0439',6,1,'MyApp','[]',0,'2021-06-18 21:52:18','2021-06-18 21:52:18','2022-06-18 21:52:18'),
('3fc989f0a5d473d6599af57d949c7180cf2da3d2efa2df4fea7e0914ea6e2d971577dd3928b6ffd3',15,1,'MyApp','[]',0,'2021-06-18 02:37:54','2021-06-18 02:37:54','2022-06-18 02:37:54'),
('62238f381adb471cd841d2b07357be86d254bdc1f7fd5d02e9be9baeb065290f142514e65f1eb2a5',6,1,'MyApp','[]',0,'2021-06-18 22:55:10','2021-06-18 22:55:10','2022-06-18 22:55:10'),
('65343ca04f8c5266ddd6c7016111fc3feefdfe3641784c6d871bba0e2c7783ddaa9bf1e799d17c5d',15,1,'MyApp','[]',0,'2021-06-18 22:01:14','2021-06-18 22:01:14','2022-06-18 22:01:14'),
('68991f3e3970bc228cbebb47952cb0f0459bb8133e522767bbff947bc1686371c482e9684e9f7e91',6,1,'MyApp','[]',0,'2021-06-18 22:07:42','2021-06-18 22:07:42','2022-06-18 22:07:42'),
('734b87e45aa603f407ff4cb3f4db82b9d78a3e9630853833214d695ed7f34783d01c1d471703d061',6,1,'MyApp','[]',0,'2021-06-18 21:19:57','2021-06-18 21:19:57','2022-06-18 21:19:57'),
('83e2b45745dc977a25ecab11a2470275957a699215359895b8d307f8463ad36440949a10b2a4ada7',6,1,'MyApp','[]',0,'2021-06-18 23:24:26','2021-06-18 23:24:26','2022-06-18 23:24:26'),
('90832981505bb2501ee26ab695be8e7ba20605c5cee70c3887265652abe41ea55e4a5b475580c80e',1,1,'MyApp','[]',0,'2021-06-18 22:01:26','2021-06-18 22:01:26','2022-06-18 22:01:26'),
('9a42c43677af44f4a95d3feaa512e30bb5f34376c73ddf0b47a3775f73de6f7161bc8aa4184483b7',6,1,'MyApp','[]',0,'2021-06-18 21:32:39','2021-06-18 21:32:39','2022-06-18 21:32:39'),
('b8e77501bc49b4fa244612be9ae3eedd3d7cb44256e2fb207f933e054c2c240eb47f196be89190d3',6,1,'MyApp','[]',0,'2021-06-18 21:33:47','2021-06-18 21:33:47','2022-06-18 21:33:47'),
('ddf1056b37256b91fe16642ce9c2a128cdeafa56759ebb51b6e37ecd36b0641b28c94375041a99b5',6,1,'MyApp','[]',0,'2021-06-18 22:00:54','2021-06-18 22:00:54','2022-06-18 22:00:54'),
('e154ee17eb6d334cf5b130ebadfc85786230ffaeafcc67bc9e63b798e136a61b001e403728b9965b',6,1,'MyApp','[]',0,'2021-06-18 21:31:46','2021-06-18 21:31:46','2022-06-18 21:31:46'),
('e24e985db5cc8362bb02dc2757bd9c339d9f179855f1603c3805d78861a599e4fc090162e4aa8299',6,1,'MyApp','[]',0,'2021-06-18 21:33:14','2021-06-18 21:33:14','2022-06-18 21:33:14'),
('e2f8cce184c0f0d161897e140d2511e929006c144fc17ffebfe73ba8054c81cdfb3843b8c8060b4a',6,1,'MyApp','[]',0,'2021-06-18 21:45:53','2021-06-18 21:45:53','2022-06-18 21:45:53');

/*Table structure for table `oauth_auth_codes` */

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_auth_codes` */

/*Table structure for table `oauth_clients` */

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_clients` */

insert  into `oauth_clients`(`id`,`user_id`,`name`,`secret`,`provider`,`redirect`,`personal_access_client`,`password_client`,`revoked`,`created_at`,`updated_at`) values 
(1,NULL,'Quiz Maker Personal Access Client','Ue2aO64A4BBC7eKeUGE8zYAj663gd7fuV1EMricy',NULL,'http://localhost',1,0,0,'2021-06-18 02:18:45','2021-06-18 02:18:45'),
(2,NULL,'Quiz Maker Password Grant Client','MxvuG4DshHgBzj09q5nxSnoASr7XAbAq74xAj0FV','users','http://localhost',0,1,0,'2021-06-18 02:18:45','2021-06-18 02:18:45');

/*Table structure for table `oauth_personal_access_clients` */

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_personal_access_clients` */

insert  into `oauth_personal_access_clients`(`id`,`client_id`,`created_at`,`updated_at`) values 
(1,1,'2021-06-18 02:18:45','2021-06-18 02:18:45');

/*Table structure for table `oauth_refresh_tokens` */

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_refresh_tokens` */

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
) ENGINE=InnoDB AUTO_INCREMENT=668 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quizes` */

insert  into `quizes`(`id`,`exam_group_id`,`type_id`,`question_element`,`answer`,`feedback_correct`,`feedback_incorrect`,`feedback_try_again`,`media`,`created_at`,`updated_at`,`order`,`answer_element`,`question_type`,`feedback_type`,`branching`,`score`,`attempts`,`is_limit_time`,`limit_time`,`shuffle_answers`,`partially_correct`,`limit_number_response`,`case_sensitive`,`correct_score`,`incorrect_score`,`try_again_score`,`media_element`,`other_elements`,`background_img`,`video`,`audio`,`video_element`,`audio_element`) values 
(613,89,14,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 116.97px; width: 80%; left: 98px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 57px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div><span style=\"font-size: 18px; font-weight: bold;\">Congratulations Sophie.&nbsp; You have successfully completed the test assessment.</span></div><div><br></div><div>You will receive an email copy of your results. Please keep this copy as you may be required to produce it in the future.</div></div></div>',NULL,'That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-06-12 06:14:32','2021-06-14 03:53:44',0,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 198px; left: 97px; z-index: 2; padding: 10px; position: absolute; overflow: hidden;\"><div class=\"col-md-12\"><div contenteditable=\"true\"><div class=\"cancel_drag\">Your Score: %%</div><div class=\"cancel_drag\">Passing Score: ##</div></div></div></div>','graded','by_result',NULL,NULL,'1',0,'01:00',NULL,0,NULL,NULL,0,0,0,'<div class=\"slide_view_media_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\">\n                        </video>\n                    </div>',NULL),
(614,89,15,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 127.201px; width: 80%; left: 91px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 101px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div><span style=\"font-size: 20px;\">We may need to do a little work to help you prepare for your studies Sophie.</span></div><div><span style=\"font-size: 20px;\"><br></span></div><div><span style=\"font-size: 20px;\">A Trainer / Assessor will be in contact with you regarding the results of test Assessment.</span></div></div></div>',NULL,'That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-06-12 06:14:32','2021-06-14 03:54:17',1,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 248px; left: 92px; z-index: 2; padding: 10px; position: absolute; overflow: hidden;\"><div class=\"col-md-12\"><div contenteditable=\"true\"><div class=\"cancel_drag\">Your Score: %%</div><div class=\"cancel_drag\">Passing Score: ##</div></div></div></div>','graded','by_result',NULL,NULL,'1',0,'01:00',NULL,0,NULL,NULL,0,0,0,'<div class=\"slide_view_media_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\">\n                        </video>\n                    </div>',NULL),
(645,88,1,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 137.374px; width: 80%; left: 96px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 65px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div><font style=\"font-size: 18px; color: rgb(255, 0, 0); font-family: Calibri; font-weight: bold;\">THIS QUESTION TYPE IS: MULTIPLE CHOICE</font></div><div><font style=\"font-family: Calibri; font-size: 16px; color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</font></div><div><font style=\"font-size: 18px; font-family: Calibri; font-weight: bold;\">A box holds 15 cauliflowers.&nbsp; At the end of the day, the crew had filled 86 boxes.&nbsp; How many cauliflowers is that in total?</font></div></div></div>','3','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.','http://localhost:8000/images/upload/60c6b9eed7fcf.bmp','2021-06-14 01:51:07','2021-06-14 03:16:28',3,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 439.042px; top: 245px; left: 96px; z-index: 2; position: absolute; overflow: hidden;\"><div class=\"col-md-12\" style=\"\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">15 x 86 = 2019 Cauliflowers.</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">15 x 86 = 1920 Cauliflowers.</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">15 x 86 = 1290 Cauliflowers.</label></div></div></div>','graded','by_result',NULL,NULL,'2',0,'01:10',1,NULL,NULL,NULL,10,1,1,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1; position: absolute; top: 232px; left: 537px; width: 33%;\">\n                        <img src=\"http://localhost:8000/images/upload/60c6b9eed7fcf.bmp\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,'url(\"http://localhost:8000/images/upload/60c6ba22b99f9.png\")',NULL,NULL,'<div class=\"slide_view_video_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\">\n                        </video>\n                    </div>',NULL),
(646,88,13,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 225.145px; width: 406.459px; left: 247px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 60px; text-align: center; line-height: 1.15;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div><span style=\"font-size: 32px; font-family: Calibri; font-weight: bold;\">Hi Sophie,</span></div><div><span style=\"font-size: 32px; font-family: Calibri; font-weight: bold;\">This quiz was built using ispring software</span></div><div><span style=\"font-size: 32px; font-family: Calibri; font-weight: bold;\">You can download a trial of the software here</span></div><div><a style=\"font-size: 32px; text-decoration-line: underline; font-weight: bold;\" href=\"https://www.ispringsolutions.com/ispring-suite/trial\" target=\"_blank\">Ispring trial software</a><br></div></div></div>',NULL,'That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-06-14 02:50:13','2021-06-14 02:53:17',0,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 297px; left: 96px; z-index: 2; padding: 10px; position: absolute; text-align: center; font-size: 28px; font-family: Arial;\"><div class=\"col-md-12\" style=\"\"><div contenteditable=\"true\" class=\"cancel_drag\">Click the \"start\" button to see how the quiz works<br></div></div></div>','graded','by_result',NULL,NULL,'1',0,'01:00',NULL,0,NULL,NULL,0,0,0,'<div class=\"slide_view_media_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,'url(\"http://localhost:8000/images/upload/60c6c40bca5ba.png\")',NULL,NULL,'<div class=\"slide_view_video_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\">\n                        </video>\n                    </div>',NULL),
(647,88,12,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 70px; width: 80%; left: 109px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 135px; text-align: center;\"><div contenteditable=\"true\" class=\"cancel_drag\"><span style=\"font-family: &quot;Arial Black&quot;; font-size: 30px;\">Start Sophie\'s Quiz</span></div></div>',NULL,'That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-06-14 03:04:01','2021-06-14 03:05:10',1,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 248px; left: 111px; z-index: 2; padding: 10px; position: absolute; text-align: center;\"><div class=\"col-md-12\" style=\"\"><div contenteditable=\"true\" class=\"cancel_drag\">iSpring Test Quiz</div></div></div>','graded','by_result',NULL,NULL,'1',0,'01:00',NULL,0,NULL,NULL,0,0,0,'<div class=\"slide_view_media_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,'url(\"http://localhost:8000/images/upload/60c6c7611d2c6.png\")',NULL,NULL,'<div class=\"slide_view_video_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\">\n                        </video>\n                    </div>',NULL),
(648,88,4,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 157.879px; width: 585.739px; left: 58px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 98px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><span style=\"font-size: 24px; font-family: Calibri; font-weight: bold;\">This question type allows students to write in their answer. This type of question has to be manually assessed by a trainer, It is not automatically assessed by the quiz engine.</span></div></div>','Correct Answer 1','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.','http://localhost:8000/images/upload/60c6ca2102def.bmp','2021-06-14 03:16:28','2021-06-14 03:18:29',2,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 92%; top: 282px; left: 38px; z-index: 2; position: absolute; overflow: hidden; height: 26%;\"><div class=\"col-md-12\" style=\"\"><input id=\"answer\" type=\"text\" class=\"form-control\" name=\"answer\" autocomplete=\"answer\"></div></div>','survey','by_result',NULL,NULL,'1',0,'01:00',NULL,NULL,NULL,0,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1; position: absolute; top: 97px; left: 697px; width: 183.693px; height: 166.418px;\">\n                        <img src=\"http://localhost:8000/images/upload/60c6ca2102def.bmp\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,'url(\"http://localhost:8000/images/upload/60c6ca389fc7a.png\")',NULL,NULL,'<div class=\"slide_view_video_element slide_view_group\" style=\"z-index: 1; display: none; position: absolute; top: 0px; left: 0px; width: 33%;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\">\n                        </video>\n                    </div>',NULL),
(649,88,1,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 26%; width: 750.166px; left: 97px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 82px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div><span style=\"font-size: 18px; font-family: Calibri; color: rgb(255, 0, 0); font-weight: bold;\">THIS QUESTION TYPE IS: MULTIPLE CHOICE</span></div><div><span style=\"font-family: Calibri; font-size: 16px; color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct.&nbsp;</span></div><div><span style=\"font-family: Calibri; font-size: 16px; color: rgb(0, 176, 240);\">This will automatically be included in the final results that is emailed to the student.</span></div><div><span style=\"font-size: 18px; font-family: Calibri; font-weight: bold;\">Which sign best describes a risk to electrocution.&nbsp;</span></div></div></div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.','http://localhost:8000/images/upload/60c6caa94140d.bmp','2021-06-14 03:18:42','2021-06-14 03:21:33',4,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 45%; top: 238px; left: 86px; z-index: 2; position: absolute; overflow: hidden; height: 113.678px;\"><div class=\"col-md-12\" style=\"\"><div class=\"choice_item\"><input type=\"radio\" id=\"1\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"1\">Sign 1</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"2\" name=\"answer\" value=\"2\" style=\"padding-right: 10px;\"><label for=\"2\">Sign 2</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"3\" name=\"answer\" value=\"3\" style=\"padding-right: 10px;\"><label for=\"3\">Sign 3</label></div></div></div>','graded','by_result',NULL,NULL,'2',0,'01:00',1,NULL,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"z-index: 1; position: absolute; top: 221px; left: 483px; width: 379.376px; height: 152.096px;\">\n                        <img src=\"http://localhost:8000/images/upload/60c6caa94140d.bmp\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,'url(\"http://localhost:8000/images/upload/60c6cb25f1345.png\")',NULL,NULL,'<div class=\"slide_view_video_element slide_view_group\" style=\"z-index: 1; display: none; position: absolute; top: 0px; left: 0px; width: 33%;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\">\n                        </video>\n                    </div>',NULL),
(650,88,9,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 158.594px; width: 80%; left: 99px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 64px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div><span style=\"color: rgb(255, 0, 0); font-weight: bold;\">THIS QUESTION TYPE IS: DROPDOWN</span></div><div><span style=\"color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</span></div><div><span style=\"font-weight: bold;\">Petrol costs $1.77 per litre.&nbsp; The cars fuel tank is empty.&nbsp; When full, it holds 60 litres.&nbsp; It will cost _____________ to fill the car up with fuel.</span></div></div></div>','$106.20;','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-06-14 03:21:55','2021-06-14 03:24:32',5,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 253px; left: 99px; z-index: 2; position: absolute; overflow: hidden;\"><div class=\"col-md-12\" style=\"\">&nbsp;<div class=\"select_lists_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"select_lists_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><select id=\"0\"><option value=\"none\">- Select -</option><option value=\"$160.20\">$160.20</option><option value=\"$102.60\">$102.60</option><option value=\"$106.20\">$106.20</option></select></div></div>&nbsp;</div></div>','graded','by_result',NULL,NULL,'2',0,'01:00',1,0,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,'url(\"http://localhost:8000/images/upload/60c6cba96f367.png\")',NULL,NULL,'<div class=\"slide_view_video_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\">\n                        </video>\n                    </div>',NULL),
(651,88,11,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 129.264px; width: 80%; left: 95px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 44px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div><span style=\"color: rgb(255, 0, 0); font-weight: bold;\">THIS QUESTION TYPE IS: Hotspot</span></div><div><span style=\"color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</span></div><div><span style=\"font-weight: bold;\">Point at Australia on the image. You can drag a hotspot marker to change its position before submitting.</span></div></div></div>','{\"background\": \"images/upload/60c6cc05e5ecd.png\"}@{\"type\": \"circle\", \"radius\": 21.75, \"top\": 146.25, \"left\": 254.40625}','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-06-14 03:24:45','2021-06-14 03:40:15',9,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 185px; left: 94px; z-index: 2; position: absolute; overflow: hidden;\"><div class=\"col-md-12\" style=\"\"><div class=\"canvas-container\" style=\"width: 300px; height: 214px; position: relative; user-select: none;\"><canvas id=\"slide_view_hotspots_canvas\" height=\"214\" class=\"lower-canvas\" width=\"300\" style=\"position: absolute; width: 300px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas><canvas class=\"upper-canvas \" width=\"300\" height=\"214\" style=\"position: absolute; width: 300px; height: 214px; left: 0px; top: 0px; touch-action: none; user-select: none;\"></canvas></div></div></div>','graded','by_result',NULL,NULL,'2',0,'01:00',NULL,0,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\">\n                        </video>\n                    </div>',NULL),
(652,88,3,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 143.903px; width: 80%; left: 100px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 67px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div><span style=\"font-size: 18px; color: rgb(255, 0, 0); font-weight: bold;\">THIS QUESTION TYPE IS: TRUE or FALSE</span></div><div><span style=\"color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</span></div><div><br></div><div><span style=\"font-weight: bold;\">Four (4) bags of sugar at $3.50 each would cost more than three (3) bags of sugar at $5.00 each.&nbsp;</span></div></div></div>','1','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-06-14 03:32:57','2021-06-14 03:42:03',6,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 273px; left: 100px; z-index: 2; position: absolute; overflow: hidden;\"><div class=\"col-md-12\" style=\"\"><div class=\"choice_item\"><input type=\"radio\" id=\"true\" name=\"answer\" value=\"1\" style=\"padding-right: 10px;\"><label for=\"true\">True</label></div><div class=\"choice_item\"><input type=\"radio\" id=\"false\" name=\"answer\" value=\"0\" style=\"padding-right: 10px;\"><label for=\"false\">False</label></div></div></div>','graded','by_result',NULL,NULL,'2',0,'01:00',NULL,NULL,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\">\n                        </video>\n                    </div>',NULL),
(653,88,8,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 164.307px; width: 80%; left: 97px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 74px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div><span style=\"font-weight: bold; color: rgb(255, 0, 0);\">THIS QUESTION TYPE IS: Type in the Word</span></div><div><span style=\"color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</span></div><div><br></div><div><span style=\"font-weight: bold;\">You are eating at a restaurant and the bill is $150.00.&nbsp; You need to split the bill between six (6) people.&nbsp; Each person will pay _____________________ .</span></div></div></div>','twenty five dollar;twenty five;25.00;25.0;25;$ 25.00;$ 25.0;$ 25;$25.00;$25.0;$25;@','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-06-14 03:35:04','2021-06-14 03:41:58',7,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 260px; left: 96px; z-index: 2; position: absolute; overflow: hidden;\"><div class=\"col-md-12\" style=\"\">Fill in the <div class=\"fill_blanks_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"fill_blanks_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><input type=\"text\" id=\"0\" style=\"max-width: 100px;\"></div></div>&nbsp;&nbsp;&nbsp;</div></div>','graded','by_result',NULL,NULL,'2',0,'01:00',NULL,0,NULL,0,10,0,0,'<div class=\"slide_view_media_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\">\n                        </video>\n                    </div>',NULL),
(654,88,9,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 153.697px; width: 80%; left: 97px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 71px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div><span style=\"font-weight: bold; font-size: 18px; color: rgb(255, 0, 0);\">THIS QUESTION TYPE IS: DROPDOWN</span></div><div><span style=\"color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</span></div><div><span style=\"font-weight: bold;\">You start work at 10:00am and your manager tells you on your arrival that your ½ hour lunch break will be in 3 and ½ hours.&nbsp; What time will your lunch break start?</span></div></div></div>','1:30pm;','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-06-14 03:40:15','2021-06-14 03:41:49',8,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 238px; left: 95px; z-index: 2; position: absolute; overflow: hidden;\"><div class=\"col-md-12\" style=\"\"><div class=\"select_lists_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"select_lists_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><select id=\"0\"><option value=\"none\">- Select -</option><option value=\"10:30am\">10:30am</option><option value=\"1:30pm\">1:30pm</option><option value=\"12:30pm\">12:30pm</option></select></div></div>&nbsp;&nbsp;</div></div>','graded','by_result',NULL,NULL,'2',0,'01:00',0,0,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\">\n                        </video>\n                    </div>',NULL),
(655,88,9,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 225.313px; width: 80%; left: 97px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 47px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div><span style=\"color: rgb(255, 0, 0); font-weight: bold;\">THIS QUESTION TYPE IS: DROPDOWN</span></div><div><span style=\"color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</span></div><div><span style=\"font-weight: bold;\">Geoff\'s study aspirations are outlined below. You are required to read the following and answer the questions.&nbsp; Geoff completed school at the age of seventeen and wanted a job that would allow him to work all around the world. Geoff is now nineteen years of age and is considering a career in the hospitality industry. Geoff prides himself on being naturally friendly. He loves to cook meals at home for his friends and family. He is looking at gaining the appropriate training to ensure he can obtain chef qualifications. He wants to attend a one (1) year course to become a qualified chef.&nbsp;</span></div></div></div>','Nineteen;Seventeen;Cook;One;Friendly;','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-06-14 03:42:30','2021-06-14 03:49:18',10,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 287px; left: 96px; z-index: 2; position: absolute; overflow: hidden;\"><div class=\"col-md-12\" style=\"\">How old is Geoff ? <div class=\"select_lists_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"select_lists_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><select id=\"0\"><option value=\"none\">- Select -</option><option value=\"Click and Type content...\">Click and Type content...</option><option value=\"One\">One</option><option value=\"Seventeen\">Seventeen</option><option value=\"Nineteen\">Nineteen</option></select></div></div>&nbsp;<div>Geoff completed school at the age of ?&nbsp;<div class=\"select_lists_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"select_lists_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><select id=\"1\"><option value=\"none\">- Select -</option><option value=\"One\">One</option><option value=\"Seventeen\">Seventeen</option><option value=\"Nineteen\">Nineteen</option></select></div></div>&nbsp;</div><div>Geoff loves to?&nbsp;<div class=\"select_lists_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"select_lists_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><select id=\"2\"><option value=\"none\">- Select -</option><option value=\"Watch TV\">Watch TV</option><option value=\"Cook\">Cook</option><option value=\"Eat\">Eat</option></select></div></div>&nbsp;</div><div>The duration of the course Geoff wants to attend is ?&nbsp;<div class=\"select_lists_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"select_lists_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><select id=\"3\"><option value=\"none\">- Select -</option><option value=\"Three\">Three</option><option value=\"Two\">Two</option><option value=\"One\">One</option></select></div></div>&nbsp;years.</div><div>Geoff prides himself on being naturally&nbsp;<div class=\"select_lists_dropdown\" contenteditable=\"true\" style=\"display: inline;\"><div class=\"select_lists_dropdown_body\" contenteditable=\"false\" style=\"display: inline;\"><select id=\"4\"><option value=\"none\">- Select -</option><option value=\"Friendly\">Friendly</option><option value=\"Funny\">Funny</option><option value=\"Talented\">Talented</option></select></div></div>&nbsp;</div></div></div>','graded','by_result',NULL,NULL,'2',0,'01:00',0,0,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\">\n                        </video>\n                    </div>',NULL),
(656,88,7,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 121.867px; width: 80%; left: 92px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 59px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div><span style=\"color: rgb(255, 0, 0); font-weight: bold;\">THIS QUESTION TYPE IS: Drag and Click</span></div><div><span style=\"color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</span></div><div><span style=\"font-weight: bold;\">Match the following items:</span></div></div></div>','Australia;Australia@India;India@America;America@','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-06-14 03:50:38','2021-06-14 03:52:19',11,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 195px; left: 92px; z-index: 2; position: absolute; overflow: hidden;\"><div class=\"col-md-12\" style=\"\"><div style=\"display: flex;justify-content: space-around;padding-bottom: 10px;\"><div class=\"ui-widget-header droppable\" style=\"width: 40%\"><p>Australia</p></div><div class=\"ui-widget-content draggable\" style=\"width: 40%\" isdropped=\"false\"><p>Australia</p></div></div><div style=\"display: flex;justify-content: space-around;padding-bottom: 10px;\"><div class=\"ui-widget-header droppable\" style=\"width: 40%\"><p>India</p></div><div class=\"ui-widget-content draggable\" style=\"width: 40%\" isdropped=\"false\"><p>India</p></div></div><div style=\"display: flex;justify-content: space-around;padding-bottom: 10px;\"><div class=\"ui-widget-header droppable\" style=\"width: 40%\"><p>America</p></div><div class=\"ui-widget-content draggable\" style=\"width: 40%\" isdropped=\"false\"><p>America</p></div></div></div></div>','graded','by_result',NULL,NULL,'2',0,'01:00',1,0,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\">\n                        </video>\n                    </div>',NULL),
(657,88,6,'<div class=\"slide_view_question_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"height: 118.602px; width: 80%; left: 92px; z-index: 3; overflow: hidden; padding: 10px; position: absolute; top: 67px;\"><div contenteditable=\"true\" class=\"cancel_drag\"><div><span style=\"font-weight: bold; color: rgb(255, 0, 0);\">THIS QUESTION TYPE IS: Drag and Drop</span></div><div><span style=\"color: rgb(0, 176, 240);\">This question type is auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This will automatically be included in the final results that is emailed to the student.</span></div><div><span style=\"font-weight: bold;\">Arrange the following letters in the correct order(where \'A\' is no.1)</span></div></div></div>','Option 1;Option 2;Option 3;Option 4;','That\'s right! You chose the correct response.','You did not choose the correct response.','You did not choose the correct response. Try again.',NULL,'2021-06-14 03:52:26','2021-06-14 03:53:08',12,'<div class=\"slide_view_answer_element slide_view_group ui-resizable ui-draggable ui-draggable-handle\" style=\"width: 80%; top: 205px; left: 92px; z-index: 2; position: absolute; overflow: hidden;\"><div class=\"col-md-12\" style=\"\"><ul id=\"sortable\"><li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span><label class=\"sequence_label\" data-editable=\"\">Option 1</label></li><li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span><label class=\"sequence_label\" data-editable=\"\">Option 2</label></li><li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span><label class=\"sequence_label\" data-editable=\"\">Option 3</label></li><li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span><label class=\"sequence_label\" data-editable=\"\">Option 4</label></li></ul></div></div>','graded','by_result',NULL,NULL,'2',0,'01:00',NULL,0,NULL,NULL,10,0,0,'<div class=\"slide_view_media_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <img src=\"#\" alt=\"slide_view_media\" style=\"width: 100%;height: 100%;\">\n                    </div>',NULL,NULL,NULL,NULL,'<div class=\"slide_view_video_element slide_view_group\" style=\"z-index: 1;display: none;position: absolute;top: 0;left: 0;width:33%;\">\n                        <video controls=\"\" style=\"width: 100%;height: 100%\">\n                            <source src=\"#\">\n                        </video>\n                    </div>',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`active`) values 
(1,'Test Admin','manager@gmail.com',NULL,'$2y$10$B.gKC6KKUq6asvFJK4m3deBLqLtLrtksCAjY7yyIt8eClYgGAvXk6',NULL,NULL,NULL,1),
(6,'Sophie','bolesalavb@gmail.com',NULL,'$2y$10$WSQzjZbqn8wNVCSVxgaJpeB5rXb0Yeei.t8gi9XlhPdGY204m6R4m',NULL,'2021-05-28 08:40:01','2021-06-01 08:03:51',1),
(9,'Admin 1','admin1@gmail.com',NULL,'$2y$10$7JblXu4KOng1q6zcOuEeQuzYk02klOW1wZGXwjoMftKwmRlopuZEa',NULL,'2021-05-31 08:42:49','2021-05-31 09:10:47',1),
(10,'Admin 2','admin2@gmail.com',NULL,'$2y$10$yVa8wx7xuRzw5B4nmcuimeYBhbKrPYrQ0CwvWa1GkVM44dhbayV5S',NULL,'2021-05-31 08:51:51','2021-05-31 08:51:51',1),
(11,'Admin 3','admin3@gmail.com',NULL,'$2y$10$Fs0qIiW9RUmBENonjYg6pOJ.VG5XVj6JIXCyIOH6F15sJSX50LcAC',NULL,'2021-06-14 01:24:44','2021-06-14 01:25:50',1),
(12,'Student 1','student1@gmail.com',NULL,'$2y$10$pKOb.iTahZKsomKNJ4iB7eLaYQxAJN4vNsLMf1YR0zSXo6jKJf3jS',NULL,'2021-06-14 01:25:06','2021-06-14 01:25:06',1),
(15,'Mobile User','mobile.user@gmail.com',NULL,'$2y$10$lJHhhcOoigb5ranYqGi.ZeUo/I5FMw0Bc7UUAec/Ff9UEDpS78ViS',NULL,'2021-06-18 02:37:54','2021-06-18 02:37:54',1),
(18,'sophie','sophie@sophie.com',NULL,'$2y$10$VCVlCnCh5on1XGbiClpntuPAs.HRwSpGXp9JjA4TD89sNor4IKfNC',NULL,'2021-06-19 02:02:54','2021-06-19 02:02:54',1),
(19,'sophie','sophie@gmail.com',NULL,'$2y$10$RzG1axVTXfqFGQTjYb/oBu.PJ3ggmvHx3q8/KPIjD72.fjPrex2RG',NULL,'2021-06-19 02:03:23','2021-06-19 02:03:23',1);

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
(6,2),
(9,1),
(10,1),
(11,1),
(12,2),
(15,2),
(18,2),
(19,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
