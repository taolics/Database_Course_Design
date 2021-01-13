/*
 Navicat Premium Data Transfer

 Source Server         : Demo
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : carpool

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 09/12/2020 21:28:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `group_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content_type_id` int(0) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add market', 1, 'add_market');
INSERT INTO `auth_permission` VALUES (2, 'Can change market', 1, 'change_market');
INSERT INTO `auth_permission` VALUES (3, 'Can delete market', 1, 'delete_market');
INSERT INTO `auth_permission` VALUES (4, 'Can view market', 1, 'view_market');
INSERT INTO `auth_permission` VALUES (5, 'Can add compinfo', 2, 'add_compinfo');
INSERT INTO `auth_permission` VALUES (6, 'Can change compinfo', 2, 'change_compinfo');
INSERT INTO `auth_permission` VALUES (7, 'Can delete compinfo', 2, 'delete_compinfo');
INSERT INTO `auth_permission` VALUES (8, 'Can view compinfo', 2, 'view_compinfo');
INSERT INTO `auth_permission` VALUES (9, 'Can add identifyinfo', 3, 'add_identifyinfo');
INSERT INTO `auth_permission` VALUES (10, 'Can change identifyinfo', 3, 'change_identifyinfo');
INSERT INTO `auth_permission` VALUES (11, 'Can delete identifyinfo', 3, 'delete_identifyinfo');
INSERT INTO `auth_permission` VALUES (12, 'Can view identifyinfo', 3, 'view_identifyinfo');
INSERT INTO `auth_permission` VALUES (13, 'Can add orders', 4, 'add_orders');
INSERT INTO `auth_permission` VALUES (14, 'Can change orders', 4, 'change_orders');
INSERT INTO `auth_permission` VALUES (15, 'Can delete orders', 4, 'delete_orders');
INSERT INTO `auth_permission` VALUES (16, 'Can view orders', 4, 'view_orders');
INSERT INTO `auth_permission` VALUES (17, 'Can add 用户', 5, 'add_user');
INSERT INTO `auth_permission` VALUES (18, 'Can change 用户', 5, 'change_user');
INSERT INTO `auth_permission` VALUES (19, 'Can delete 用户', 5, 'delete_user');
INSERT INTO `auth_permission` VALUES (20, 'Can view 用户', 5, 'view_user');
INSERT INTO `auth_permission` VALUES (21, 'Can add log entry', 6, 'add_logentry');
INSERT INTO `auth_permission` VALUES (22, 'Can change log entry', 6, 'change_logentry');
INSERT INTO `auth_permission` VALUES (23, 'Can delete log entry', 6, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (24, 'Can view log entry', 6, 'view_logentry');
INSERT INTO `auth_permission` VALUES (25, 'Can add permission', 7, 'add_permission');
INSERT INTO `auth_permission` VALUES (26, 'Can change permission', 7, 'change_permission');
INSERT INTO `auth_permission` VALUES (27, 'Can delete permission', 7, 'delete_permission');
INSERT INTO `auth_permission` VALUES (28, 'Can view permission', 7, 'view_permission');
INSERT INTO `auth_permission` VALUES (29, 'Can add group', 8, 'add_group');
INSERT INTO `auth_permission` VALUES (30, 'Can change group', 8, 'change_group');
INSERT INTO `auth_permission` VALUES (31, 'Can delete group', 8, 'delete_group');
INSERT INTO `auth_permission` VALUES (32, 'Can view group', 8, 'view_group');
INSERT INTO `auth_permission` VALUES (33, 'Can add user', 9, 'add_user');
INSERT INTO `auth_permission` VALUES (34, 'Can change user', 9, 'change_user');
INSERT INTO `auth_permission` VALUES (35, 'Can delete user', 9, 'delete_user');
INSERT INTO `auth_permission` VALUES (36, 'Can view user', 9, 'view_user');
INSERT INTO `auth_permission` VALUES (37, 'Can add content type', 10, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (38, 'Can change content type', 10, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (39, 'Can delete content type', 10, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (40, 'Can view content type', 10, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (41, 'Can add session', 11, 'add_session');
INSERT INTO `auth_permission` VALUES (42, 'Can change session', 11, 'change_session');
INSERT INTO `auth_permission` VALUES (43, 'Can delete session', 11, 'delete_session');
INSERT INTO `auth_permission` VALUES (44, 'Can view session', 11, 'view_session');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(0) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content_type_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (6, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (8, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (7, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (9, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (10, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'login', 'user');
INSERT INTO `django_content_type` VALUES (2, 'market', 'compinfo');
INSERT INTO `django_content_type` VALUES (3, 'market', 'identifyinfo');
INSERT INTO `django_content_type` VALUES (1, 'market', 'market');
INSERT INTO `django_content_type` VALUES (4, 'market', 'orders');
INSERT INTO `django_content_type` VALUES (11, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-12-03 06:13:39.108066');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-12-03 06:13:39.342357');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-12-03 06:13:40.326544');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-12-03 06:13:40.701422');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-12-03 06:13:40.732697');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2020-12-03 06:13:41.060757');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2020-12-03 06:13:41.263832');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2020-12-03 06:13:41.466904');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2020-12-03 06:13:41.498098');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2020-12-03 06:13:41.685598');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2020-12-03 06:13:41.685598');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2020-12-03 06:13:41.732460');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2020-12-03 06:13:41.935546');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2020-12-03 06:13:42.122990');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2020-12-03 06:13:42.326082');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2020-12-03 06:13:42.357322');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2020-12-03 06:13:42.544753');
INSERT INTO `django_migrations` VALUES (18, 'login', '0001_initial', '2020-12-03 06:13:42.591732');
INSERT INTO `django_migrations` VALUES (19, 'login', '0002_user_state', '2020-12-03 06:13:42.638447');
INSERT INTO `django_migrations` VALUES (20, 'login', '0003_auto_20201130_1155', '2020-12-03 06:13:42.700973');
INSERT INTO `django_migrations` VALUES (21, 'market', '0001_initial', '2020-12-03 06:13:42.747798');
INSERT INTO `django_migrations` VALUES (22, 'market', '0002_auto_20201201_1135', '2020-12-03 06:13:43.247726');
INSERT INTO `django_migrations` VALUES (23, 'market', '0003_market_contact', '2020-12-03 06:13:43.325832');
INSERT INTO `django_migrations` VALUES (24, 'market', '0004_auto_20201203_1328', '2020-12-03 06:13:44.153720');
INSERT INTO `django_migrations` VALUES (25, 'market', '0005_auto_20201203_1345', '2020-12-03 06:13:44.825484');
INSERT INTO `django_migrations` VALUES (26, 'sessions', '0001_initial', '2020-12-03 06:13:44.872293');
INSERT INTO `django_migrations` VALUES (27, 'market', '0006_market_safe', '2020-12-07 02:58:57.550399');
INSERT INTO `django_migrations` VALUES (28, 'market', '0007_auto_20201207_1057', '2020-12-07 02:58:57.623206');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1dri8p3ibv7eh9pc3lkvshrzpornqd3i', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1kkoGc:2WSkOMUE5NXBYlSKLZmTg6jQnlbcd-JBUjbJ9FkacVM', '2020-12-17 13:03:26.104849');
INSERT INTO `django_session` VALUES ('3u3raqomfka7jxw6orzrzmc1dqqzusj1', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MTQsInVzZXJfbmFtZSI6Ilx1NmQ5Ylx1NWI1MCJ9:1km6e9:QiRtDCjUHs298aTzyaam2NihxFiV_wQtf9ndI6gsApI', '2020-12-21 02:53:05.568920');
INSERT INTO `django_session` VALUES ('4st3oubi8shk6bmszfuygt5q4o3k2rcb', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1kkmWT:-9MSDIn0Y_Kb6QEuTr8UkAONJfxzuBQKXGBNLWH2ANI', '2020-12-17 11:11:41.208651');
INSERT INTO `django_session` VALUES ('51cyjuops2jluyixp1b9jz67g712v6jw', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1klnYS:hYwr5Vr4spKlA0Q60J_gRyrC6GoHwgiztEZDUKRrbrs', '2020-12-20 06:29:56.351713');
INSERT INTO `django_session` VALUES ('66ja5qlttfbgjkjbbm2l11sss5zkwtu6', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1klnAA:-8u0i7e5PvH5nD0xTK5Tg3Z5-ntdKcKcTBA9iNGBbB8', '2020-12-20 06:04:50.662477');
INSERT INTO `django_session` VALUES ('6r23e5i2ta6qh0j4x0533zcxz4gg9x18', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1kkpJQ:Y0riMaLCy80kMxeRsvZDbeisPhv1rj7C4CcEaiHXCZM', '2020-12-17 14:10:24.901806');
INSERT INTO `django_session` VALUES ('ce17w7hbtjvq7b09ilajot8jqrfe8lfz', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1kknns:7ZIXPnH65V6NPBk9uRuffXyulDI3RjpAh5DruyIGBNA', '2020-12-17 12:33:44.797141');
INSERT INTO `django_session` VALUES ('em0ssp1gui89k5kkpszfmslz1gkoecsh', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1kkrL9:eP_9CSmjnq5HksAqnlqXAJwYeangYkFqL2roOvNx14k', '2020-12-17 16:20:19.296432');
INSERT INTO `django_session` VALUES ('i6utfmjwz6y3vfqmxqsymfsj2f8kcmld', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1kknbq:DmwkjKfzqxbgy7jKv1IUwOqVD96fzl14b6ab_iceRuE', '2020-12-17 12:21:18.743468');
INSERT INTO `django_session` VALUES ('i75hlekz1ifi0rw1b3ecwv4joiofp5xz', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1klZRW:Zis3vnDFzHoy9F0Fgni1-l8Fz_FQ0sWAi0V0_FQq0F4', '2020-12-19 15:25:50.784497');
INSERT INTO `django_session` VALUES ('kv1mo222pt8neftjhttyicbeerj48hp9', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MTQsInVzZXJfbmFtZSI6Ilx1NmQ5Ylx1NWI1MCJ9:1km6kK:S0HTcq4lp95G3XshsZZWmO_XWbjeuhYWCkQa3RRlbnw', '2020-12-21 02:59:28.852178');
INSERT INTO `django_session` VALUES ('l6yhyr7q1pjh82811bsqh4s6q4be4b3j', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1kkoKI:PE6C2XTuQ63S97xwETjkxaplCZ6LlP5vEya6MKbybY0', '2020-12-17 13:07:14.586100');
INSERT INTO `django_session` VALUES ('mckpnypehpxcjv7w9qpd0nb2izewd7xb', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1kkoeY:XymdDc_0pmdEujNVV31IK-dFZR-zJn3MlEmvmZJVFNc', '2020-12-17 13:28:10.831535');
INSERT INTO `django_session` VALUES ('o0x1su90h1qqx065hfis7lqgu1c1x5wt', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1kkrCm:8HcZHAQUrloleROrGf3vV5JNILmyKrJlpSYQoAjje3Y', '2020-12-17 16:11:40.322939');
INSERT INTO `django_session` VALUES ('ppk4lw0t4p4n2a14lgt79mfora8jvcj7', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1kko4t:f_XLOCztZqjML1qKnhKc0oKhY9y4zFahbqJvf5JTwtw', '2020-12-17 12:51:19.257186');
INSERT INTO `django_session` VALUES ('r10ptx3qzd2pkmqtyhd8ft7i8ny0fnml', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1kkrXS:CBfQINkd_yT3H2lCaj3xiXCWk6a_nb1BMsm61vf9WD0', '2020-12-17 16:33:02.119458');
INSERT INTO `django_session` VALUES ('sc9n9ctvtjbt14sbndfbgn9ajw9hld2o', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1kkqG5:2AjWhsD-IQXIdYBLYEvfTbLmpqZGgTYEdLhcBTxR-Ww', '2020-12-17 15:11:01.774034');
INSERT INTO `django_session` VALUES ('twlc46cpnwfssofipvwyo8w8x9uszcmn', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1kknJw:-KzBp_gl6w4WJr8a2qMPUT2K5JjpNddUvojyCJE3b38', '2020-12-17 12:02:48.977574');
INSERT INTO `django_session` VALUES ('vf2xf4k2rdiy3n1ny0njtyfk0js3tz2r', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MiwidXNlcl9uYW1lIjoiYWRtaW4ifQ:1kmTJn:6SSQdo5CFHMiI9FdoCHfA_GWW06OhvbymuCuwbfsS1w', '2020-12-22 03:05:35.269937');
INSERT INTO `django_session` VALUES ('w873hn802kgnwdbpqb9x7zwwuqvmfdun', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1kknWd:QAQCVCCMoMxaj205VZmZPhgApU7EBpol4uYb-rMh9GU', '2020-12-17 12:15:55.171665');
INSERT INTO `django_session` VALUES ('z3est813d0snk7mtsmgraux8baplyx5t', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzIn0:1kkhtE:s_Je8JPMeAd7x5IBREd-jCFpioGE4B48qXZ0NrhZgz0', '2020-12-17 06:14:52.060021');

-- ----------------------------
-- Table structure for login_user
-- ----------------------------
DROP TABLE IF EXISTS `login_user`;
CREATE TABLE `login_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sex` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `c_time` datetime(6) NOT NULL,
  `state` int(0) NOT NULL,
  `contact` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `credit` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_user
-- ----------------------------
INSERT INTO `login_user` VALUES (2, 'admin', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '899@qq.com', 'male', '2020-12-03 10:49:03.294389', 7, 'contact', 0);
INSERT INTO `login_user` VALUES (10, '卿卿', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1353064275@qq.com', 'male', '2020-12-06 07:29:42.289839', 1, '1353064275', 76);
INSERT INTO `login_user` VALUES (15, '浩斌', 'ef9a84e305a506a907c7d4f96d89733cf72cb47b57dffe1df8a316dd9ed4faac', '8945675679@qq.com', 'male', '2020-12-06 13:22:05.124821', 0, '1162764059', 16);
INSERT INTO `login_user` VALUES (16, '大超', '35d4066f7fa0ca83a6a92c3e12f8fc1aa1e19d12ecb02192c6879a486166e60d', '1233456455@qq.com', 'male', '2020-12-06 13:29:36.794073', 0, '350624637', 6);
INSERT INTO `login_user` VALUES (17, '湘湘', '5dde896887f6754c9b15bfe3a441ae4806df2fde94001311e08bf110622e0bbe', 'ta2534cs@foxmail.com', 'female', '2020-12-06 13:41:25.964136', 0, '3367075339', 33);
INSERT INTO `login_user` VALUES (20, '涛子', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'taolics@foxmail.com', 'male', '2020-12-07 04:35:09.185679', 1, '823805899', 105);
INSERT INTO `login_user` VALUES (21, '123', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '123454275@qq.com', 'male', '2020-12-08 03:01:25.012675', 1, '23惹4', 100);

-- ----------------------------
-- Table structure for market_compinfo
-- ----------------------------
DROP TABLE IF EXISTS `market_compinfo`;
CREATE TABLE `market_compinfo`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userac_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `userpa_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `processstate` int(0) NOT NULL,
  `adminid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `market_compinfo_userac_id_68d345f8`(`userac_id`) USING BTREE,
  INDEX `market_compinfo_userpa_id_10fdf1ba`(`userpa_id`) USING BTREE,
  CONSTRAINT `market_compinfo_userac_id_68d345f8_fk_login_user_name` FOREIGN KEY (`userac_id`) REFERENCES `login_user` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `market_compinfo_userpa_id_10fdf1ba_fk_login_user_name` FOREIGN KEY (`userpa_id`) REFERENCES `login_user` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of market_compinfo
-- ----------------------------
INSERT INTO `market_compinfo` VALUES (6, '浩斌', '卿卿', '发布者取消订单未通知！', 1, '2');
INSERT INTO `market_compinfo` VALUES (7, '卿卿', '浩斌', '发布与拼车无关信息！', 1, '2');
INSERT INTO `market_compinfo` VALUES (9, '湘湘', '卿卿', '发布者违约', 1, '2');
INSERT INTO `market_compinfo` VALUES (10, '涛子', '涛子', '123', 1, '2');
INSERT INTO `market_compinfo` VALUES (11, '卿卿', '卿卿', '123456', 1, '2');
INSERT INTO `market_compinfo` VALUES (12, '卿卿', '涛子', '违约', 1, '2');
INSERT INTO `market_compinfo` VALUES (13, '涛子', '涛子', 'fjgh', 0, ' ');

-- ----------------------------
-- Table structure for market_identifyinfo
-- ----------------------------
DROP TABLE IF EXISTS `market_identifyinfo`;
CREATE TABLE `market_identifyinfo`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userid` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `adminid` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stunumber` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `identifystate` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of market_identifyinfo
-- ----------------------------
INSERT INTO `market_identifyinfo` VALUES (9, '20', '2', '2018141461029', '白石桥', 1);
INSERT INTO `market_identifyinfo` VALUES (10, '10', '2', '234345', '白石桥', 1);
INSERT INTO `market_identifyinfo` VALUES (11, '21', '2', '236734', '水电费水电费', 1);

-- ----------------------------
-- Table structure for market_market
-- ----------------------------
DROP TABLE IF EXISTS `market_market`;
CREATE TABLE `market_market`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `seats` int(0) NOT NULL,
  `addinfo` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `departure` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `destination` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  `contact` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `safe` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of market_market
-- ----------------------------
INSERT INTO `market_market` VALUES (36, '湘湘', 5, '无', '四川大学江安校区', '成都东火车站', '2020-12-07 12:12:00.000000', '3367075339', 14);
INSERT INTO `market_market` VALUES (38, '湘湘', 3, '仅限女生拼车', '四川大学华西校区', '成都东火车站', '2020-12-07 12:15:00.000000', '3367075339', 20);
INSERT INTO `market_market` VALUES (45, '浩斌', 3, '无', '四川大学江安校区', '成都东火车站', '2020-12-07 12:18:00.000000', '1162764059', 13);
INSERT INTO `market_market` VALUES (46, '浩斌', 3, '无', '四川大学江安校区', '成都东火车站', '2020-12-07 12:18:00.000000', '1162764059', 16);
INSERT INTO `market_market` VALUES (47, '卿卿', 3, '无', '四川大学江安校区', '双流机场T2航站楼', '2020-12-07 12:22:00.000000', '1353064275', -14);
INSERT INTO `market_market` VALUES (48, '卿卿', 3, '无', '江安校区西南门', '成都东火车站', '2020-12-07 12:22:00.000000', '1353064275', -11);
INSERT INTO `market_market` VALUES (52, '涛子', 3, '无', '四川大学江安校区', '双流机场T2航站楼', '2020-12-07 12:45:00.000000', '823805899', 14);
INSERT INTO `market_market` VALUES (53, '涛子', 3, '无', '四川大学江安校区', '四川大学望江校区', '2020-12-07 12:45:00.000000', '823805899', 17);
INSERT INTO `market_market` VALUES (54, '涛子', 2, '第一个订单', '江安', '成都东火车站', '2020-12-07 15:51:00.000000', '823805899', 56);
INSERT INTO `market_market` VALUES (55, '涛子', 3, '无', '四川大学江安校区', '双流机场T2航站楼', '2020-12-07 15:51:00.000000', '823805899', 123);
INSERT INTO `market_market` VALUES (56, '涛子', 3, '无', '四川大学江安校区', '成都东火车站', '2020-12-07 16:00:00.000000', '823805899', 116);
INSERT INTO `market_market` VALUES (57, '涛子', 2, '无', '四川大学江安校区', '四川大学望江校区', '2020-12-07 22:41:00.000000', '823805899', 58);
INSERT INTO `market_market` VALUES (58, '涛子', 2, '无', '四川大学江安校区', '四川大学望江校区', '2020-12-08 10:11:00.000000', '823805899', 95);
INSERT INTO `market_market` VALUES (59, '涛子', 2, '无', '四川大学江安校区', '四川大学望江校区', '2020-12-09 10:57:00.000000', '823805899', 92);
INSERT INTO `market_market` VALUES (60, '卿卿', 3, '无', '江安', '成都东火车站', '2020-12-08 10:59:00.000000', '1353064275', 76);

-- ----------------------------
-- Table structure for market_orders
-- ----------------------------
DROP TABLE IF EXISTS `market_orders`;
CREATE TABLE `market_orders`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NOT NULL,
  `orderid` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of market_orders
-- ----------------------------
INSERT INTO `market_orders` VALUES (46, 17, 36);
INSERT INTO `market_orders` VALUES (48, 17, 38);
INSERT INTO `market_orders` VALUES (55, 15, 45);
INSERT INTO `market_orders` VALUES (56, 15, 46);
INSERT INTO `market_orders` VALUES (57, 10, 47);
INSERT INTO `market_orders` VALUES (58, 10, 48);
INSERT INTO `market_orders` VALUES (64, 20, 52);
INSERT INTO `market_orders` VALUES (65, 20, 53);
INSERT INTO `market_orders` VALUES (66, 20, 54);
INSERT INTO `market_orders` VALUES (67, 20, 55);
INSERT INTO `market_orders` VALUES (68, 20, 56);
INSERT INTO `market_orders` VALUES (69, 10, 54);
INSERT INTO `market_orders` VALUES (70, 20, 57);
INSERT INTO `market_orders` VALUES (71, 10, 57);
INSERT INTO `market_orders` VALUES (72, 20, 58);
INSERT INTO `market_orders` VALUES (73, 10, 58);
INSERT INTO `market_orders` VALUES (74, 20, 59);
INSERT INTO `market_orders` VALUES (75, 10, 59);
INSERT INTO `market_orders` VALUES (76, 10, 60);

SET FOREIGN_KEY_CHECKS = 1;
