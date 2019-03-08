SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

SET AUTOCOMMIT = 0;

START TRANSACTION;

SET time_zone = "+00:00";

DROP TABLE IF EXISTS `accounts`;

CREATE TABLE `accounts` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ac_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'user',
  `phone_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(199) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(199) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_changed` tinyint(4) DEFAULT '1',
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'User id',
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `cartage`;

CREATE TABLE `cartage` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Account Id',
  `ledger` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debit` float DEFAULT '0',
  `credit` float DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_changed` tinyint(4) DEFAULT '1',
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User Id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

DROP TABLE IF EXISTS `documents`;

CREATE TABLE `documents` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reg_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Account Id',
  `passing` date DEFAULT '0000-00-00',
  `dip_chart` date DEFAULT '0000-00-00',
  `route` date DEFAULT NULL,
  `token` date DEFAULT NULL,
  `insurance` date DEFAULT NULL,
  `explosive` date DEFAULT NULL,
  `tracker` date DEFAULT NULL,
  `is_changed` tinyint(4) DEFAULT '1',
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User Id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

DROP TABLE IF EXISTS `general`;

CREATE TABLE `general` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Account Id',
  `debit` float DEFAULT '0',
  `credit` float DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_changed` tinyint(4) DEFAULT '1',
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User Id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

DROP TABLE IF EXISTS `ledger`;

CREATE TABLE `ledger` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `credit` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Credit Account Id',
  `total` float NOT NULL DEFAULT '0',
  `debit` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Credit Account Id',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_changed` tinyint(4) DEFAULT '1',
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User Id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

DROP TABLE IF EXISTS `profits`;

CREATE TABLE `profits` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Account Id',
  `debit` float DEFAULT '0',
  `credit` float DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_changed` tinyint(4) DEFAULT '1',
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User Id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

DROP TABLE IF EXISTS `purchases`;

CREATE TABLE `purchases` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `price` float DEFAULT '0',
  `total` float DEFAULT '0',
  `supplier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `terminal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_changed` tinyint(4) DEFAULT '1',
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User Id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `price` float DEFAULT '0',
  `total` float DEFAULT '0',
  `customer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_changed` tinyint(4) DEFAULT '1',
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User Id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
('SETTING554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715133', 'last_server_sync', '2019-01-14 05:54:14');

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'user',
  `permissions` text COLLATE utf8_unicode_ci,
  `is_changed` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;


INSERT INTO `users` (`id`, `name`, `user_name`, `password`, `profile`, `role`, `permissions`, `is_changed`, `created_at`, `updated_at`, `deleted_at`) VALUES('USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111', 'Muhammad Hasan', 'hasan', 'e10adc3949ba59abbe56e057f20f883e', NULL, '21232f297a57a5a743894a0e4a801fc3', '{}', 0, '2018-12-29 01:55:52', '2019-02-25 19:05:00', NULL);


ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_id_unique` (`id`) USING BTREE;


ALTER TABLE `cartage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cartage_id_unique` (`id`) USING BTREE;


ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documents_id_unique` (`id`) USING BTREE;


ALTER TABLE `general`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `general_id_unique` (`id`) USING BTREE;


ALTER TABLE `ledger`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ledger_id_unique` (`id`) USING BTREE;

ALTER TABLE `profits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profit_id_unique` (`id`) USING BTREE;

ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_id_unique` (`id`) USING BTREE;


ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sale_id_unique` (`id`) USING BTREE;


ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_id_unique` (`id`) USING BTREE;


ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_id_unique` (`id`) USING BTREE,
  ADD UNIQUE KEY `users_name_unique` (`user_name`) USING BTREE;
COMMIT;