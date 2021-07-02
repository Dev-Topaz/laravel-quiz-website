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
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `exam_groups` */

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
  `email_from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `exams` */

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(47,'2021_06_19_033232_update_exams_table_add_fields_downloaded_and_published',25),
(48,'2021_07_01_064159_update_exams_table_add_3_fields',26);

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
('0b603de77f1ee26cd13e4a248a88472706bcb1365dab8b20ad0e479f5373e4e4a96971c59c51c55a',6,1,'MyApp','[]',0,'2021-06-25 09:42:04','2021-06-25 09:42:04','2022-06-25 09:42:04'),
('0b7fcf5c41e97ff6b5727da3975391b19a1c649bec0bdb64cc74bdcbd2faaf3c2a967a989962229e',6,1,'MyApp','[]',0,'2021-06-25 20:34:47','2021-06-25 20:34:47','2022-06-25 20:34:47'),
('0cf42f0a32722adbc62b54017c59593315137871e729a0dd2b015a33fe1e455d593ea3ca2524575a',6,1,'MyApp','[]',0,'2021-06-25 14:29:31','2021-06-25 14:29:31','2022-06-25 14:29:31'),
('0e772a982b73deb3f6be7bc9e41d80b5e5351cff0ba997c3ad9c2c5933028a129d82f1ba976cee42',6,1,'MyApp','[]',0,'2021-06-18 02:33:04','2021-06-18 02:33:04','2022-06-18 02:33:04'),
('0e7fba9f213cf3700d5e8d353538f44b32ccefca242a855b84275bd04f584bfac1838904126be6bf',6,1,'MyApp','[]',0,'2021-06-18 21:45:49','2021-06-18 21:45:49','2022-06-18 21:45:49'),
('0ecfd92f46f9fb2983f2ce662bd03a26552ddaaf23d60c0a2315371de3813a6f054f6ddabbfd4951',6,1,'MyApp','[]',0,'2021-06-21 17:56:31','2021-06-21 17:56:31','2022-06-21 17:56:31'),
('0f9859c7c956b9d913bebbe0de96f4d612fef4cdb8a5e88ba8954ee60b95a07d087a5cc677618cbf',6,1,'MyApp','[]',0,'2021-06-26 08:23:15','2021-06-26 08:23:15','2022-06-26 08:23:15'),
('158e5bf655704427bf901401538978b45fc14d267011c2732f4436134bc2338eaee475e5bf53b69f',6,1,'MyApp','[]',0,'2021-06-18 21:32:23','2021-06-18 21:32:23','2022-06-18 21:32:23'),
('1592dab74d27ac823ba5779bc4ebcf1b7ce8e2ea2556de9133c1eac4d5885f822cb87e6dd33258cc',17,1,'MyApp','[]',0,'2021-06-18 23:28:31','2021-06-18 23:28:31','2022-06-18 23:28:31'),
('159d2f256334498f5e2846e173dff3d2eadce53b013618829370bc90d930c6e493ea1b1f8bbfdac4',6,1,'MyApp','[]',0,'2021-06-25 12:24:14','2021-06-25 12:24:14','2022-06-25 12:24:14'),
('168de57d0f36c79f7b8dcf8f9a0633fc6a83b5d092ad70c11720f5cbe9b89826af246bd4319c6460',6,1,'MyApp','[]',0,'2021-06-21 20:53:19','2021-06-21 20:53:19','2022-06-21 20:53:19'),
('17518a56eb11d3c7c202840809d36a20188656215258b53bf5594c0918b8b815137057d3cbead1d9',15,1,'MyApp','[]',0,'2021-06-18 19:31:58','2021-06-18 19:31:58','2022-06-18 19:31:58'),
('1a96a9a660147b3218accf52f5ffacc3263bdd61a63d94f30875dbd7dd9d4ac80672893db256fa9d',15,1,'MyApp','[]',0,'2021-06-28 09:51:24','2021-06-28 09:51:24','2022-06-28 09:51:24'),
('1cd53cd0ee87f6f2f820f3b48e9d78f27371958b53909bd69884e5ec49bcf4fa3aafc1343eef868d',6,1,'MyApp','[]',0,'2021-06-25 10:15:21','2021-06-25 10:15:21','2022-06-25 10:15:21'),
('1ced836a6762480cc727cd38381cc3ff88095e425972d2d022f22343ec3a73ff206341fadb2a3ee2',6,1,'MyApp','[]',0,'2021-06-25 09:56:50','2021-06-25 09:56:50','2022-06-25 09:56:50'),
('1e46726adda2d983961bd4b57fb6f1f552c66a893793bcf57f2003cf302a23f440a287b51a0d0e1b',6,1,'MyApp','[]',0,'2021-06-21 21:21:56','2021-06-21 21:21:56','2022-06-21 21:21:56'),
('1e9d1cea4d4fac82a8b4ee4fba13774751bf1af1b9e5413fa6faef43c40503d2d4c45c686389dc07',19,1,'MyApp','[]',0,'2021-06-19 02:03:23','2021-06-19 02:03:23','2022-06-19 02:03:23'),
('1e9e31812f8605d4ac67434610e0bbf4d21397186032808c56d80016934b50ce04b158c73964156a',6,1,'MyApp','[]',0,'2021-06-29 07:11:51','2021-06-29 07:11:51','2022-06-29 07:11:51'),
('1f0b2ba29391cb466d46cbf4dc34a55729ee0025062b321dbcc64dc1c435902ea0f81af294968bd8',6,1,'MyApp','[]',0,'2021-06-25 10:30:47','2021-06-25 10:30:47','2022-06-25 10:30:47'),
('21be6c5e523dec9a7fc6bf3e5aceb5e932dac7fe43ce60f8d950b2b0da080170f1aa867ff7c17602',6,1,'MyApp','[]',0,'2021-06-25 10:13:53','2021-06-25 10:13:53','2022-06-25 10:13:53'),
('21d15638a8dfb765b7009863ee8263334bb42d80f4090c0c7a66013b23521581f1556a444349fa11',6,1,'MyApp','[]',0,'2021-06-25 11:53:43','2021-06-25 11:53:43','2022-06-25 11:53:43'),
('252c44bbd7a50e1106cc707350fc44d8c51b70ec7a8dd3e636bc1b53f31b93b3ae5ece763d51583f',15,1,'MyApp','[]',0,'2021-06-24 23:25:24','2021-06-24 23:25:24','2022-06-24 23:25:24'),
('2580c52e716941b771edddc4f17cef9f6a90728e54e4afdbe0e93b7f0d4f5882241a32783e11f204',6,1,'MyApp','[]',0,'2021-06-28 23:42:29','2021-06-28 23:42:29','2022-06-28 23:42:29'),
('2735cc460c4b55b313ea1a67a8b0c0f186a9e06a304f03a9b2f2dd0d2b68735139ed29e7d11af102',6,1,'MyApp','[]',0,'2021-06-18 21:47:00','2021-06-18 21:47:00','2022-06-18 21:47:00'),
('29924704740c51fb878dca5dc0940eef1bd5f8ec1ccce7af4df1bcca2f5f8063527a252de5b94e3e',6,1,'MyApp','[]',0,'2021-06-26 06:26:04','2021-06-26 06:26:04','2022-06-26 06:26:04'),
('2a41f44afd3ce19d480e4a90a88359237bf401d0eb6249cd394e0646fb1877e44d49392afb644521',6,1,'MyApp','[]',0,'2021-06-21 21:04:03','2021-06-21 21:04:03','2022-06-21 21:04:03'),
('2eb50dbeb94cdc2953021b2813725fcf693bb053dd2fb140b4ef8f360479d04d842cf84e23f0c63d',6,1,'MyApp','[]',0,'2021-06-29 05:53:04','2021-06-29 05:53:04','2022-06-29 05:53:04'),
('2eb6f4ce4f69d299cb6f1c498fe8d1791aa713565d865bc8e0519af382426fa1768eba5302a32ec1',6,1,'MyApp','[]',0,'2021-06-21 21:25:16','2021-06-21 21:25:16','2022-06-21 21:25:16'),
('2ec6e9674f28d6a40e3bf3b4765b3fd4d31334cfed70bdb7970b75b84e6ece09dba8f044bcdb073d',6,1,'MyApp','[]',0,'2021-06-29 08:21:28','2021-06-29 08:21:28','2022-06-29 08:21:28'),
('33ff05ad23a3d93ba67c99e0ff9639892b85d59e981e7ae642146706094e87e75b185e04b74c9493',6,1,'MyApp','[]',0,'2021-06-21 20:55:28','2021-06-21 20:55:28','2022-06-21 20:55:28'),
('370103da856b3ada90e6a217cd1e15de83aa19297acdf6d36d1993e8ed44f991faf1198900ae8da5',6,1,'MyApp','[]',0,'2021-06-25 12:20:55','2021-06-25 12:20:55','2022-06-25 12:20:55'),
('3b97b7fd4c4723580a83869ed3ba4235a1cbc7667acfe5b94bc742da91f1165d9f781b3c6fee0439',6,1,'MyApp','[]',0,'2021-06-18 21:52:18','2021-06-18 21:52:18','2022-06-18 21:52:18'),
('3db64f92f05ca1e27d53944a4ed5603b9ea73a8a99010be60871e6700dcf4c0761e4239c51b8830b',6,1,'MyApp','[]',0,'2021-06-26 03:58:38','2021-06-26 03:58:38','2022-06-26 03:58:38'),
('3edfb5bc5b937f84f4239055529101f8481785726bff1b0f04e2001886fe96ba2f59b54dc4f6abd0',6,1,'MyApp','[]',0,'2021-06-26 06:29:46','2021-06-26 06:29:46','2022-06-26 06:29:46'),
('3fc989f0a5d473d6599af57d949c7180cf2da3d2efa2df4fea7e0914ea6e2d971577dd3928b6ffd3',15,1,'MyApp','[]',0,'2021-06-18 02:37:54','2021-06-18 02:37:54','2022-06-18 02:37:54'),
('41759408d121c9a4ef0b1e03cfe7198f7684b57c1cc4432d021142047799b5ed53f5304255657fda',6,1,'MyApp','[]',0,'2021-06-25 23:25:48','2021-06-25 23:25:48','2022-06-25 23:25:48'),
('41e50eded11e3623d5bbdaacfc2ef1b51c566c42a30e68053411c618035ab4ab1a0c32769441fe58',6,1,'MyApp','[]',0,'2021-06-26 06:57:55','2021-06-26 06:57:55','2022-06-26 06:57:55'),
('43a2b32d068be5cececd27ceef334dac3891c13f09cc32e22c56289a6407ff207272373f125abb87',6,1,'MyApp','[]',0,'2021-06-26 08:27:54','2021-06-26 08:27:54','2022-06-26 08:27:54'),
('4d64f36c010b5d776d016bd06782131fd89e32fa6878872f2f7ecc822be470da7859aa45a937f947',6,1,'MyApp','[]',0,'2021-06-25 11:53:21','2021-06-25 11:53:21','2022-06-25 11:53:21'),
('557a9b38228a307569d49db33970bafd0674e2593c4a4641abc7437614587a9a4b2883aa81e79c9d',6,1,'MyApp','[]',0,'2021-06-29 08:32:10','2021-06-29 08:32:10','2022-06-29 08:32:10'),
('55c1f7a137dab78fa74a73c352b2b5f847137abb79823d877b38ca49641b2b5179f0d75f77c5fc5b',6,1,'MyApp','[]',0,'2021-06-27 16:57:51','2021-06-27 16:57:51','2022-06-27 16:57:51'),
('5e7da5790427cde48fda5fd26ea0cf2b5b2cab4322adf327cb89e131850cda192eec365f3697d8a5',6,1,'MyApp','[]',0,'2021-06-26 06:44:27','2021-06-26 06:44:27','2022-06-26 06:44:27'),
('5ff252b6c94ef1fab3bf8497c160cfbc4b421ca5796f51baa6238b1b033d659439ec0b027ee3f695',6,1,'MyApp','[]',0,'2021-06-25 12:28:37','2021-06-25 12:28:37','2022-06-25 12:28:37'),
('62238f381adb471cd841d2b07357be86d254bdc1f7fd5d02e9be9baeb065290f142514e65f1eb2a5',6,1,'MyApp','[]',0,'2021-06-18 22:55:10','2021-06-18 22:55:10','2022-06-18 22:55:10'),
('65343ca04f8c5266ddd6c7016111fc3feefdfe3641784c6d871bba0e2c7783ddaa9bf1e799d17c5d',15,1,'MyApp','[]',0,'2021-06-18 22:01:14','2021-06-18 22:01:14','2022-06-18 22:01:14'),
('68991f3e3970bc228cbebb47952cb0f0459bb8133e522767bbff947bc1686371c482e9684e9f7e91',6,1,'MyApp','[]',0,'2021-06-18 22:07:42','2021-06-18 22:07:42','2022-06-18 22:07:42'),
('719aae30d20d484e18324fce408f2429e6ca11b5f66ff41436776b001209a41b554973d3b3481811',6,1,'MyApp','[]',0,'2021-06-25 21:42:47','2021-06-25 21:42:47','2022-06-25 21:42:47'),
('71d813b4f96e74c7be1a752dc63fa777b76b01d382e548af5d3df6ff0272a1cc7c791b1330c1096c',6,1,'MyApp','[]',0,'2021-06-21 05:20:22','2021-06-21 05:20:22','2022-06-21 05:20:22'),
('71dea02124064259a525a00762efdba466d1dba608556fde3943747d9ff8c2df8057dc1319fc6389',6,1,'MyApp','[]',0,'2021-06-25 09:51:17','2021-06-25 09:51:17','2022-06-25 09:51:17'),
('734b87e45aa603f407ff4cb3f4db82b9d78a3e9630853833214d695ed7f34783d01c1d471703d061',6,1,'MyApp','[]',0,'2021-06-18 21:19:57','2021-06-18 21:19:57','2022-06-18 21:19:57'),
('79af05e6a85df4878c0b7a1086fe5213373793e5c2873be30092e0aaecae63a4c596c314b89c4457',6,1,'MyApp','[]',0,'2021-06-25 13:52:46','2021-06-25 13:52:46','2022-06-25 13:52:46'),
('7bb8e0178923712d9d844c39093c5600d62b2d98bb5e1530891b33d42634641e8c781b448ac57838',6,1,'MyApp','[]',0,'2021-06-25 10:24:56','2021-06-25 10:24:56','2022-06-25 10:24:56'),
('7cdeb43e4f3f451ba04f4de8e9fec5483d54b2d603b7a6650e4747368ec56a561019ed333a141978',6,1,'MyApp','[]',0,'2021-06-29 08:11:25','2021-06-29 08:11:25','2022-06-29 08:11:25'),
('7e45a1bd7e207e512621ea6022d6775e3f390130156101cc4dc7a10afd5a4ce08bd2a59f3acbb062',6,1,'MyApp','[]',0,'2021-06-21 21:02:52','2021-06-21 21:02:52','2022-06-21 21:02:52'),
('81c35f8df56ade315b748055df733aa56f64df94dba175088657cad98e429a265115098eeeafc9ff',6,1,'MyApp','[]',0,'2021-06-21 05:38:50','2021-06-21 05:38:50','2022-06-21 05:38:50'),
('83e2b45745dc977a25ecab11a2470275957a699215359895b8d307f8463ad36440949a10b2a4ada7',6,1,'MyApp','[]',0,'2021-06-18 23:24:26','2021-06-18 23:24:26','2022-06-18 23:24:26'),
('87010b4ef7c0fc3284ac90fcc57d62ea4f92a067a5500c54e8fc1e2b3ee9f0b972342d39c0df51d3',6,1,'MyApp','[]',0,'2021-06-21 05:38:48','2021-06-21 05:38:48','2022-06-21 05:38:48'),
('88ce4f79cd96242aa82696e1aa3b720e1a90d2ce8c4192870f38ee3f3a83038995e90a041a2d1a33',6,1,'MyApp','[]',0,'2021-06-21 21:27:58','2021-06-21 21:27:58','2022-06-21 21:27:58'),
('8a322b0b055ccd02f677cd52bcfc4ebfd60410d051e21a5fcc953191de5d83aa13e6955b1656ce33',6,1,'MyApp','[]',0,'2021-06-25 09:26:34','2021-06-25 09:26:34','2022-06-25 09:26:34'),
('90832981505bb2501ee26ab695be8e7ba20605c5cee70c3887265652abe41ea55e4a5b475580c80e',1,1,'MyApp','[]',0,'2021-06-18 22:01:26','2021-06-18 22:01:26','2022-06-18 22:01:26'),
('9a37802df5b62c0984673e053748bedc4cf2704838223366a876ca67a216ee565fbb2bfe1e30168b',6,1,'MyApp','[]',0,'2021-06-25 11:52:25','2021-06-25 11:52:25','2022-06-25 11:52:25'),
('9a42c43677af44f4a95d3feaa512e30bb5f34376c73ddf0b47a3775f73de6f7161bc8aa4184483b7',6,1,'MyApp','[]',0,'2021-06-18 21:32:39','2021-06-18 21:32:39','2022-06-18 21:32:39'),
('9b354813d76f702badb5652f4b8e64c46b3277ca3bc0767fe7d4d4053b4b87b80a25782300345770',6,1,'MyApp','[]',0,'2021-06-29 06:34:06','2021-06-29 06:34:06','2022-06-29 06:34:06'),
('9f9c2f50748356a9143f1242677d21f885b52331b23e813577794c8645c49ab04cc5bc6e7b756c4c',6,1,'MyApp','[]',0,'2021-06-26 06:59:23','2021-06-26 06:59:23','2022-06-26 06:59:23'),
('a02ba51ff0383d8cdf7bdf6d78f2553be678d8b83b53cb4547f19d18317b0371a92712a30436b8ca',6,1,'MyApp','[]',0,'2021-06-29 07:58:51','2021-06-29 07:58:51','2022-06-29 07:58:51'),
('a2fb74a38d51fa12325f24302be2b4e692218f8915752c9c1259a91cd85dbc205bb41c8f0c551d0d',6,1,'MyApp','[]',0,'2021-06-25 09:58:36','2021-06-25 09:58:36','2022-06-25 09:58:36'),
('aa152e48668a60336f824d76e98b2efc758e823117fd1d9d5303dca3d7e8c70fd325606a5097b071',6,1,'MyApp','[]',0,'2021-06-26 06:42:28','2021-06-26 06:42:28','2022-06-26 06:42:28'),
('b0adb2a08e7a4efd2c71359f7f871d9421cc429366e79acc1759dcf1a64265a3614233264c6148a3',6,1,'MyApp','[]',0,'2021-06-26 07:33:01','2021-06-26 07:33:01','2022-06-26 07:33:01'),
('b4ff954fd30339dc2fd8005fd3dbe2aae15e644801966098d5ffb75df84f9c81de80b0897203aadd',6,1,'MyApp','[]',0,'2021-06-29 09:50:58','2021-06-29 09:50:58','2022-06-29 09:50:58'),
('b60b520960c3e382ed0126619ed03dd267836ee3842346a5b5f0bef9ccc2b1c5681b19004b16b5f8',6,1,'MyApp','[]',0,'2021-06-25 11:09:30','2021-06-25 11:09:30','2022-06-25 11:09:30'),
('b6f75f9ea32715f5fe3153106e7865f417ed30154eea3106acdc52f26ce452d7789c3adc32146034',6,1,'MyApp','[]',0,'2021-06-25 12:34:25','2021-06-25 12:34:25','2022-06-25 12:34:25'),
('b8e77501bc49b4fa244612be9ae3eedd3d7cb44256e2fb207f933e054c2c240eb47f196be89190d3',6,1,'MyApp','[]',0,'2021-06-18 21:33:47','2021-06-18 21:33:47','2022-06-18 21:33:47'),
('ba4811e7e5003f7ae76efc460554458c9c6fcfd2083ba29df62c825f52c493b70b517c3767538f6d',6,1,'MyApp','[]',0,'2021-06-25 12:33:10','2021-06-25 12:33:10','2022-06-25 12:33:10'),
('c8f50b93b3a0449115e9faec709ef4e2c0bf1b51e5c6a0f33ef109a8b91dc9867b10b39c9eef56b3',15,1,'MyApp','[]',0,'2021-06-24 23:24:53','2021-06-24 23:24:53','2022-06-24 23:24:53'),
('c9d2fda8cb74be00e597a0ebe3d92e334258524e78d0eae326eab1695145fcf76d582c76e85b9ec6',6,1,'MyApp','[]',0,'2021-06-19 06:14:26','2021-06-19 06:14:26','2022-06-19 06:14:26'),
('cbdee78950929c649a630cfc6770c308e0b4238d2beae34315b835cc6119d4fe99b0423c51ab94d3',6,1,'MyApp','[]',0,'2021-06-21 05:32:01','2021-06-21 05:32:01','2022-06-21 05:32:01'),
('cd1262153205cb6fb6ebca1a419f1175b70826cc0a506c852f141ee51c250fa29c8ae329273afafa',6,1,'MyApp','[]',0,'2021-06-26 00:22:09','2021-06-26 00:22:09','2022-06-26 00:22:09'),
('d1bcbb980a130bf0e33a5da46599d5502b2fd7c75d4a9d41e0b64ee3e7484ec2e7f666b94c1f9aaa',6,1,'MyApp','[]',0,'2021-06-25 21:31:08','2021-06-25 21:31:08','2022-06-25 21:31:08'),
('d5df52ef3f6705990c982e70c362c1fccd9ad7a3594ac06f4ad7b118730a1d3e7d991fade309e8d5',6,1,'MyApp','[]',0,'2021-06-21 21:18:08','2021-06-21 21:18:08','2022-06-21 21:18:08'),
('d9a095a950f2771f113669f2393013b0da094433c8a8fd651ee25199da0d0f50f2e1da7d70643f86',6,1,'MyApp','[]',0,'2021-06-25 10:25:49','2021-06-25 10:25:49','2022-06-25 10:25:49'),
('d9dea6b70090c6b6fbb034016d4c4adf30be255b16e8ea3942b0118a26cd3e9c238a0eb32f27cfb0',6,1,'MyApp','[]',0,'2021-06-25 10:25:24','2021-06-25 10:25:24','2022-06-25 10:25:24'),
('dd207f703b07417f407c92c5bb6accb1334daca82777065efe4937f5af0df1cde0e330102fa35eb2',6,1,'MyApp','[]',0,'2021-06-21 06:02:39','2021-06-21 06:02:39','2022-06-21 06:02:39'),
('ddf1056b37256b91fe16642ce9c2a128cdeafa56759ebb51b6e37ecd36b0641b28c94375041a99b5',6,1,'MyApp','[]',0,'2021-06-18 22:00:54','2021-06-18 22:00:54','2022-06-18 22:00:54'),
('e154ee17eb6d334cf5b130ebadfc85786230ffaeafcc67bc9e63b798e136a61b001e403728b9965b',6,1,'MyApp','[]',0,'2021-06-18 21:31:46','2021-06-18 21:31:46','2022-06-18 21:31:46'),
('e177277df7c6fab7cfb3cbbeee4cf738eda6f14a288d14417c1976e2162b34c63336ed374001310e',6,1,'MyApp','[]',0,'2021-06-26 06:24:20','2021-06-26 06:24:20','2022-06-26 06:24:20'),
('e1ab8f0b80a99a281d5eb7049cc1cddadc57cf350611e8aa82245af08f772d3b8af7dce7f47aafbd',6,1,'MyApp','[]',0,'2021-06-21 05:13:48','2021-06-21 05:13:48','2022-06-21 05:13:48'),
('e24e985db5cc8362bb02dc2757bd9c339d9f179855f1603c3805d78861a599e4fc090162e4aa8299',6,1,'MyApp','[]',0,'2021-06-18 21:33:14','2021-06-18 21:33:14','2022-06-18 21:33:14'),
('e2f8cce184c0f0d161897e140d2511e929006c144fc17ffebfe73ba8054c81cdfb3843b8c8060b4a',6,1,'MyApp','[]',0,'2021-06-18 21:45:53','2021-06-18 21:45:53','2022-06-18 21:45:53'),
('e408c306296c7e777b4d796b2d67b0f486b313b4a6394007b8cc90582a407934544f030fe4664df2',6,1,'MyApp','[]',0,'2021-06-29 04:05:59','2021-06-29 04:05:59','2022-06-29 04:05:59'),
('e96231bdb629392d5d2ace2c6cec4b16b97b50cf6be79a4a48d736437b6b2b1a42e96b6b26ad41c5',6,1,'MyApp','[]',0,'2021-06-25 12:46:29','2021-06-25 12:46:29','2022-06-25 12:46:29'),
('e962cd946ea1dd00a2e1b229aef80c5285ca4ef6894e878ba9d4dce5be945848ae005317ab158f8c',6,1,'MyApp','[]',0,'2021-06-21 17:56:27','2021-06-21 17:56:27','2022-06-21 17:56:27'),
('f75108b983a59a0d7fd74b31eca0d63a6747bd80846756b98a46241f829af21d3a126680305f08b5',6,1,'MyApp','[]',0,'2021-06-25 09:49:44','2021-06-25 09:49:44','2022-06-25 09:49:44'),
('fbaab46b4b1e5ddf6f3629b434206fc1e52a4f56f62ddf8fe9e350c3ad9545793284be568bfae4e0',6,1,'MyApp','[]',0,'2021-06-25 10:16:56','2021-06-25 10:16:56','2022-06-25 10:16:56');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(15,'Failed',NULL,NULL,NULL),
(16,'User Info Form',NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=1222 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quizes` */

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
