# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: accounts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `accounts` (
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_id_unique` (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = COMPACT;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cartage
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cartage` (
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cartage_id_unique` (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = COMPACT;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: documents
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `documents` (
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documents_id_unique` (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = COMPACT;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: general
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `general` (
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
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = COMPACT;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: ledger
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `ledger` (
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
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = COMPACT;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: profits
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `profits` (
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
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = COMPACT;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: purchases
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `purchases` (
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
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = COMPACT;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: sales
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `sales` (
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
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = COMPACT;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `settings` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = COMPACT;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `users` (
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
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = COMPACT;
# ------------------------------------------------------------
# DATA DUMP FOR TABLE: accounts
# ------------------------------------------------------------

INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'BLB',
    'Bakri Lahore Bulk',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:02:02',
    '2019-03-01 13:02:02',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HASCOL',
    'Hascol Yadgar Carriage',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:04:33',
    '2019-03-01 13:04:33',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030113051315514275131181530',
    'MA',
    'Malik Abbas',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:05:13',
    '2019-03-01 13:05:13',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130648155142760802374848',
    'HA',
    'Haroon Abbassi',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:06:48',
    '2019-03-01 13:06:48',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130801155142768140610448',
    'SM',
    'Shahid Mehar',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:08:01',
    '2019-03-01 13:08:01',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131011155142781136759354',
    'SC',
    'Shaheen Carriage',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:10:11',
    '2019-03-01 13:10:11',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131623155142818347685602',
    'M',
    'Machike',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '7',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:16:23',
    '2019-03-01 13:16:23',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030113172215514282423403921',
    'S',
    'Sihala',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '7',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:17:22',
    '2019-03-01 13:17:22',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131743155142826330750131',
    'G',
    'Gatti',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '7',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:17:43',
    '2019-03-01 13:17:43',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131812155142829202089075',
    'T',
    'Tarujabba',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '7',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:18:12',
    '2019-03-01 13:18:12',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131837155142831767953715',
    'C',
    'Chak Pirana',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '7',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:18:37',
    '2019-03-01 13:18:37',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301132020155142842050914635',
    'V',
    'Vehari',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '7',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:20:20',
    '2019-03-01 13:20:20',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301132101155142846187928925',
    'SAH',
    'Sahiwal',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '7',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:21:01',
    '2019-03-01 13:21:01',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301132123155142848301386691',
    'P',
    'Pso',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '7',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:21:23',
    '2019-03-01 13:21:23',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301132156155142851619431319',
    'L',
    'Local',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '7',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:21:56',
    '2019-03-01 13:21:56',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301132408155142864869355180',
    'AK',
    'Aslam Khan',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 13:24:08',
    '2019-03-01 13:24:08',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301150121155143448126094813',
    'CHB',
    'Ch Basharat',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 15:01:21',
    '2019-03-01 15:01:21',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    'PMG',
    'Premium Motor Gasoline',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '5',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 16:03:49',
    '2019-03-01 16:03:49',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030116041815514382588122429',
    'HSD',
    'High Speed Diesel',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '5',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 16:04:18',
    '2019-03-01 16:04:18',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160505155143830564560407',
    'KO',
    'Kerosene Oil',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '5',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 16:05:05',
    '2019-03-01 16:05:05',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160649155143840910253475',
    'GPMG',
    'Gudham Premium Motor Gasoline',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '5',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 16:06:49',
    '2019-03-01 16:06:49',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160729155143844915133678',
    'GHSD',
    'Gudham High Speed Diesel',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '5',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 16:07:29',
    '2019-03-01 16:07:29',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160801155143848162458894',
    'GK',
    'Gudham Kerosene Oil',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '5',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 16:08:01',
    '2019-03-01 16:08:01',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301161017155143861735836473',
    'SO',
    'Solvent',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '5',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 16:10:17',
    '2019-03-01 16:10:17',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301161059155143865928762611',
    'GS',
    'Gudham Solvent',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '5',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 16:10:59',
    '2019-03-01 16:10:59',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130338155151381805510593',
    'IMP',
    'Irfan Mughal Pura',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:03:38',
    '2019-03-02 13:03:38',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130434155151387422829879',
    'APMG',
    'Afzal PMG',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:04:34',
    '2019-03-02 13:04:34',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130521155151392186291123',
    'AL',
    'Akhter Leya',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:05:21',
    '2019-03-02 13:05:21',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c201903021306321551513992827248',
    'AL-',
    'Al-Makkah',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:06:32',
    '2019-03-02 13:06:32',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130713155151403359646152',
    'AP',
    'Amir Puma',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:07:13',
    '2019-03-02 13:07:13',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130755155151407559929558',
    'RW',
    'Rashid Wazir',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:11:45',
    '2019-03-02 13:07:55',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130836155151411653011362',
    'AW',
    'Asim Walton',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:08:36',
    '2019-03-02 13:08:36',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131014155151421455797778',
    'BMK',
    'Bilal Mustaq Kasur',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:10:14',
    '2019-03-02 13:10:14',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131133155151429346835548',
    'CH',
    'Chand',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:11:33',
    '2019-03-02 13:11:33',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030213120915515143292229741',
    'DF',
    'Data Filling',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:12:09',
    '2019-03-02 13:12:09',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131315155151439512196495',
    'GH',
    'Ghazanfar',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:13:15',
    '2019-03-02 13:13:15',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131446155151448688320876',
    'GHH',
    'Ghulam Hassan',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:14:46',
    '2019-03-02 13:14:46',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131535155151453586421492',
    'HM',
    'Hafiz Mushtaq',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:15:35',
    '2019-03-02 13:15:35',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131602155151456277558353',
    'HAK',
    'Haji Afzal Kasur',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:16:02',
    '2019-03-02 13:16:02',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131633155151459338647354',
    'HF',
    'Hammad Filling',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:16:33',
    '2019-03-02 13:16:33',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131718155151463896921342',
    'HK',
    'Hashim khan',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:17:19',
    '2019-03-02 13:17:19',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030213181215515146924359174',
    'IA',
    'Iftikhar Awan',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:18:12',
    '2019-03-02 13:18:12',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131833155151471351356320',
    'I',
    'Ijaz',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:18:33',
    '2019-03-02 13:18:33',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131914155151475499669018',
    'JS',
    'Jamal Sahotra',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:19:15',
    '2019-03-02 13:19:15',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132107155151486744542977',
    'JB',
    'Javaid Burhan',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:21:07',
    '2019-03-02 13:21:07',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030213213415515148943683248',
    'K',
    'Kashif',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:21:34',
    '2019-03-02 13:21:34',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132202155151492230016932',
    'KK',
    'Khalil Kasur',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:22:02',
    '2019-03-02 13:22:02',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132258155151497847923898',
    'KS',
    'Khurram Shell',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:22:58',
    '2019-03-02 13:22:58',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132323155151500328067083',
    'LM',
    'Latif Multan',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:23:23',
    '2019-03-02 13:23:23',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132411155151505122937172',
    'MMP',
    'Muzamil Momin Pura',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:24:11',
    '2019-03-02 13:24:11',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132439155151507984080265',
    'MP',
    'Majeed PMG',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:24:39',
    '2019-03-02 13:24:39',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132547155151514742336275',
    'MALIKA',
    'Malik Akhter',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:25:47',
    '2019-03-02 13:25:47',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132613155151517303456643',
    'MI',
    'Malik Irfan',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:26:13',
    '2019-03-02 13:26:13',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132703155151522370823653',
    'MAHAD',
    'Mian Ahad',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:27:03',
    '2019-03-02 13:27:03',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132726155151524658816619',
    'MH',
    'Munir Hussain',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:27:26',
    '2019-03-02 13:27:26',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132753155151527381563593',
    'NV',
    'Nadir Vehari',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:27:53',
    '2019-03-02 13:27:53',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132818155151529879744652',
    'N',
    'Nawaz',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:28:18',
    '2019-03-02 13:28:18',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132903155151534385455812',
    'RMA',
    'Rao Muhammad Ali',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:29:03',
    '2019-03-02 13:29:03',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030213293315515153738807455',
    'SR',
    'Sajid Ranjha',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:29:33',
    '2019-03-02 13:29:33',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133017155151541766993689',
    'S1',
    'Setco 1',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:30:17',
    '2019-03-02 13:30:17',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133039155151543914284223',
    'SG',
    'Setco Go',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:30:39',
    '2019-03-02 13:30:39',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133143155151550392726274',
    'SJ',
    'Shafique Jalapure',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:31:43',
    '2019-03-02 13:31:43',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133225155151554540819115',
    'SB',
    'Shahid Butt',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:32:25',
    '2019-03-02 13:32:25',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302134211155151613167622385',
    'SSP',
    'Shams Shadi Pura',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-02 13:42:11',
    '2019-03-02 13:42:11',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030611313815518538980534738',
    'CASH',
    'Cash In Hand',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '4',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:31:38',
    '2019-03-06 11:31:38',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113307155185398714042261',
    'CDFO',
    'Cash Deposit From Office',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '4',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:33:07',
    '2019-03-06 11:33:07',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030611341715518540579976487',
    'EBAH',
    'Electricity bill of Awan house',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '4',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:34:18',
    '2019-03-06 11:34:18',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113514155185411425682633',
    'EBO',
    'Electricty bill',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '4',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:35:14',
    '2019-03-06 11:35:14',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    'EXM',
    'MISC. EXPENSES',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '4',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:35:54',
    '2019-03-06 11:35:54',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030611365815518542186512060',
    'GASBILLAWAN',
    'Sui Gas Bill Awan House',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '4',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:36:58',
    '2019-03-06 11:36:58',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113858155185433870357600',
    'PBAH',
    'Phone Bill of Awan house',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '4',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:38:58',
    '2019-03-06 11:38:58',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114001155185440143437156',
    'WBO',
    'Water Bill of Awan house',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '4',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:40:01',
    '2019-03-06 11:40:01',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114125155185448568041179',
    'GA',
    'Gate  keeper  Afsar',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:41:25',
    '2019-03-06 11:41:25',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114212155185453289771769',
    'AM',
    'Muhammad Amir Munshi',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:42:13',
    '2019-03-06 11:42:13',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114311155185459162929397',
    'MAM',
    'Muhammad Arif Munshi',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:43:11',
    '2019-03-06 11:43:11',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114418155185465816548929',
    'ASIM',
    'Asim rang saaz',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:44:18',
    '2019-03-06 11:44:18',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114656155185481606138396',
    'ABID',
    'ABID UNION',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:46:56',
    '2019-03-06 11:46:56',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114748155185486858130501',
    'CARRIAGE',
    'Carriage Bills',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:47:48',
    '2019-03-06 11:47:48',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114832155185491254098283',
    'D.LIAQAT',
    'Driver Liaqat',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:48:32',
    '2019-03-06 11:48:32',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114937155185497749449358',
    'MAC',
    'MISS ALMAS ZULFIQAR',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:49:37',
    '2019-03-06 11:49:37',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306115019155185501968158272',
    'HAFEEZ',
    'Choqidar Hafeez',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:50:19',
    '2019-03-06 11:50:19',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306115102155185506243178828',
    'IQBAL',
    'Haji Iqbal Electrician',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:51:02',
    '2019-03-06 11:51:02',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306115135155185509589435629',
    'IRFAN',
    'Irfan kamani Makar',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:51:36',
    '2019-03-06 11:51:36',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306115221155185514165218071',
    'KALADINTAR',
    'kala Dintar',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:52:21',
    '2019-03-06 11:52:21',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030611525915518551790699029',
    'LIAQAT',
    'Mistary Liaqat',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:52:59',
    '2019-03-06 11:52:59',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306115405155185524556327027',
    'LUQMAN',
    'Luqman urf Mani',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:54:05',
    '2019-03-06 11:54:05',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306115511155185531114186129',
    'MASLAM',
    'MUNCHI ASLAM',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:55:11',
    '2019-03-06 11:55:11',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306115558155185535850918976',
    'PD',
    'Pervaiz Dinter',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 11:55:58',
    '2019-03-06 11:55:58',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'NOTHBL',
    'Nveed Oil Traders HBL',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '3',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:01:53',
    '2019-03-06 12:01:53',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c201903061203271551855807749659',
    'MIRFAN',
    'Malik Irfan',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:03:27',
    '2019-03-06 12:03:27',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120548155185594857946338',
    'MHC',
    'Muhammad Hasan',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:05:48',
    '2019-03-06 12:05:48',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120624155185598415057247',
    'MASC',
    'Anam Akram',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:06:24',
    '2019-03-06 12:06:24',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c201903061207221551856042610172',
    'RAFIQ',
    'Rafiq Masih',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:07:22',
    '2019-03-06 12:07:22',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120832155185611201037946',
    'SKM',
    'Munshi Sajjad khan',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:08:32',
    '2019-03-06 12:08:32',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120927155185616702653640',
    'MS',
    'Mistary shokat',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:09:27',
    '2019-03-06 12:09:27',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120957155185619776289902',
    'BO',
    'Bilal Office Boy',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:09:57',
    '2019-03-06 12:09:57',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306121103155185626308525853',
    'SGC',
    'Soni Chokidar',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:11:03',
    '2019-03-06 12:11:03',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c201903061211311551856291799903',
    'CZ',
    'Chokidar Zahid',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '6',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:11:31',
    '2019-03-06 12:11:31',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306121320155185640021932883',
    'ABL',
    'Allied Bank 10010',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '3',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:13:20',
    '2019-03-06 12:13:20',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306121402155185644266880217',
    'ABLS',
    'ALLIED BANK LIMITED Shadi pura',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '3',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:14:02',
    '2019-03-06 12:14:02',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306121501155185650121316914',
    'AHL',
    'Alhabib Bank (5509011500162101)',
    'Naveed Hussian',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '3',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:15:01',
    '2019-03-06 12:15:01',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030612170415518566244343966',
    'F/B',
    'Faysal Bank',
    'Muhammad.Nazir(0001372004097001)',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '3',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:17:04',
    '2019-03-06 12:17:04',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306121847155185672789739627',
    'HBL3719',
    'HABIB BANK LIMITED',
    'YADGAR CARRIAGE',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '3',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:18:48',
    '2019-03-06 12:18:48',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306122003155185680333082210',
    'M/B',
    'Meezan Bank',
    'Muhammad.Nazir (0002410102281810)',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '3',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:20:03',
    '2019-03-06 12:20:03',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306122440155185708083838714',
    'MCB',
    'Muslim Commercial Bank',
    'Muhammad.Nazir (0310270201006258)',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '3',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:24:40',
    '2019-03-06 12:24:40',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306122619155185717980791714',
    'UBL',
    'United Bank Limted',
    'Muhammad Nazir (0112193837100334)',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '3',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:26:19',
    '2019-03-06 12:26:19',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306122738155185725832777948',
    'UBL45122',
    'naveed hussain , br draogra',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '3',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:27:38',
    '2019-03-06 12:27:38',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306122826155185730664439509',
    'NOTM',
    'Naveed Oil Trader Meezan Bank',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '3',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:28:26',
    '2019-03-06 12:28:26',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306123058155185745851710566',
    'MNOT',
    'MEEZAN NAVEED OIL TRADER',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '3',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:30:58',
    '2019-03-06 12:30:58',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306123247155185756777051155',
    'AHE',
    'Awan House Expenses',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '4',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:32:47',
    '2019-03-06 12:32:47',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306132204155186052438342612',
    'YCC2',
    'Yadgar Carraige Co Vehicles',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '11',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 13:22:04',
    '2019-03-06 13:22:04',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306132409155186064976079095',
    'PB',
    'Pearl CNG Byco',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 17:15:01',
    '2019-03-06 13:24:09',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306135813155186269315366962',
    'TUD-058',
    'TUD-058 Latif',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 13:58:17',
    '2019-03-06 13:58:17',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306135817155186269789335412',
    'TUD-058',
    'TUD-058 Latif',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 13:58:19',
    '2019-03-06 13:58:19',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306171000155187420003967226',
    'WM',
    'Waqas Mandi Bahudin',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 17:10:00',
    '2019-03-06 17:10:00',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306174509155187630908211351',
    'U',
    'Universal',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 17:45:09',
    '2019-03-06 17:45:09',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030617464115518764011309634',
    'UDF',
    'Umer Deen Filling',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 17:46:42',
    '2019-03-06 17:46:42',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306174822155187650206863358',
    'SNA',
    'Sufi Nazir Awan',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '11',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 17:48:22',
    '2019-03-06 17:48:22',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306174935155187657598577460',
    'NA',
    'Naveed Awan',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '11',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 17:49:36',
    '2019-03-06 17:49:36',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306175034155187663492390661',
    'TA',
    'Tanveer Awan',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '11',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 17:50:35',
    '2019-03-06 17:50:35',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308161453155204369347166643',
    'JQ-0734',
    'JQ-0734',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '8',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:14:53',
    '2019-03-08 16:14:53',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308161517155204371757975398',
    'LEI-14-318',
    'LEI-14-318',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '8',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:15:17',
    '2019-03-08 16:15:17',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308161538155204373822066616',
    'LEI-14-4706',
    'LEI-14-4706',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '8',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:15:38',
    '2019-03-08 16:15:38',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030816155715520437570611686',
    'LXC-7704',
    'LXC-7704',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '8',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:15:57',
    '2019-03-08 16:15:57',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308161623155204378373883739',
    'LXC-7931',
    'LXC-7931',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '8',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:16:23',
    '2019-03-08 16:16:23',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030816164315520438037237701',
    'LXC-7991',
    'LXC-7991',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '8',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:16:43',
    '2019-03-08 16:16:43',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308161701155204382100147665',
    'P-3426',
    'P-3426',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '8',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:17:01',
    '2019-03-08 16:17:01',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308161717155204383721037281',
    'P-3427',
    'P-3427',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '8',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:17:17',
    '2019-03-08 16:17:17',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308161732155204385270694144',
    'SWA-154',
    'swa-154',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '8',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:17:32',
    '2019-03-08 16:17:32',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308161757155204387787522669',
    'TMB-752',
    'TMB-752',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '8',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:17:57',
    '2019-03-08 16:17:57',
    NULL
  );
INSERT INTO
  `accounts` (
    `id`,
    `ac_id`,
    `name`,
    `address`,
    `city`,
    `phone_1`,
    `phone_2`,
    `profile`,
    `email`,
    `website`,
    `type`,
    `is_changed`,
    `created_by`,
    `updated_at`,
    `created_at`,
    `deleted_at`
  )
VALUES
  (
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308161812155204389284455000',
    'TMB-792',
    'TMB-792',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '8',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:18:12',
    '2019-03-08 16:18:12',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cartage
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: documents
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: general
# ------------------------------------------------------------

INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306131200155185992029831038',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030611313815518538980534738',
    0,
    365467,
    'Opning Cash',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:12:00',
    '2019-03-06 13:12:00',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306131240155185996047661112',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030611313815518538980534738',
    0,
    365467,
    'Opning Cash',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:12:40',
    '2019-03-06 13:13:49',
    '2019-03-06 13:13:49'
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306131440155186008031311964',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030213120915515143292229741',
    0,
    200000,
    'Cash Recevied By Raoof',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:14:40',
    '2019-03-06 13:14:40',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306131524155186012475449222',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030611313815518538980534738',
    417977,
    0,
    'Clossing Cash',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:15:24',
    '2019-03-06 13:15:24',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306131611155186017101027245',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    200,
    0,
    'Sheri Zaman Expense',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:16:11',
    '2019-03-06 13:16:11',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306131807155186028797820255',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120548155185594857946338',
    30000,
    0,
    'Salary',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:18:08',
    '2019-03-06 13:18:08',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306131710155186023056092478',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114125155185448568041179',
    11500,
    0,
    'Salary',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:17:10',
    '2019-03-06 13:17:10',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306131857155186033715281251',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120624155185598415057247',
    18000,
    0,
    'Salary',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:18:57',
    '2019-03-06 13:18:57',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306132458155186069813650147',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306115019155185501968158272',
    8000,
    0,
    'Salary',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:24:58',
    '2019-03-06 13:24:58',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306132551155186075128918538',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306121103155185626308525853',
    6000,
    0,
    'Salary',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:25:51',
    '2019-03-06 13:25:51',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306132639155186079999365947',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306115135155185509589435629',
    4000,
    0,
    'Salary',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:26:40',
    '2019-03-06 13:26:40',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306132719155186083921836156',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    500,
    0,
    '5 Hamer Dastye',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:27:19',
    '2019-03-06 13:27:19',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea7412019030613283415518609147446578',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    1120,
    0,
    'walding masla +wair',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:28:34',
    '2019-03-06 13:28:34',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306132949155186098991274465',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    400,
    0,
    '2  Packs Shiling',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:29:50',
    '2019-03-06 13:29:50',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306133035155186103543468833',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306132204155186052438342612',
    67770,
    0,
    'Cash Paid VI',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:30:35',
    '2019-03-06 13:53:28',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030617523315518767537345090',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133225155151554540819115',
    3900000,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 17:52:33',
    '2019-03-06 17:52:33',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306175631155187699194021386',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306174509155187630908211351',
    7130160,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 17:56:32',
    '2019-03-06 17:56:32',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c201903061758441551877124012787',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130755155151407559929558',
    2842880,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 17:58:44',
    '2019-03-06 17:58:44',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306180348155187742839690474',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131718155151463896921342',
    2878610,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 18:03:48',
    '2019-03-06 18:03:48',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306180829155187770910876157',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132818155151529879744652',
    2058880,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 18:08:29',
    '2019-03-06 18:08:29',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307124123155194448369669803',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132411155151505122937172',
    0,
    181760,
    'Cash Recevied',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:41:23',
    '2019-03-07 12:41:23',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307123953155194439338011678',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030611313815518538980534738',
    0,
    417977,
    'Opning Cash',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:39:53',
    '2019-03-07 12:39:53',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307124300155194458049413199',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130836155151411653011362',
    0,
    535000,
    'Cash Recevied By Amir',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:43:00',
    '2019-03-07 12:43:00',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307124353155194463389338309',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    0,
    23400,
    'Mistry Younes Return',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:43:54',
    '2019-03-07 12:43:54',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307124513155194471373751331',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    8000,
    0,
    'Jamya Moques Mostafi Shadi Pura',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:45:13',
    '2019-03-07 12:45:13',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307124728155194484840311811',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c201903061207221551856042610172',
    4500,
    0,
    'Salary',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:47:28',
    '2019-03-07 12:47:28',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307124423155194466396266877',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030611313815518538980534738',
    678612,
    0,
    'Clossing Cash',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:44:24',
    '2019-03-07 12:44:24',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307124613155194477345445588',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    200,
    0,
    'Shire Driver Expense',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:46:13',
    '2019-03-07 12:46:13',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307124846155194492690666589',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120957155185619776289902',
    11000,
    0,
    'Salary',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:48:47',
    '2019-03-07 12:48:47',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307124953155194499349055249',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306123247155185756777051155',
    7500,
    0,
    'Taken by Ijaz Camara',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:49:53',
    '2019-03-07 12:49:53',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307125223155194514314742187',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306174935155187657598577460',
    6350,
    0,
    'Nawaz Pump',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:52:23',
    '2019-03-07 12:52:23',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307125100155194506061853868',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    29000,
    0,
    'Taken by Imran Ready Ater',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:51:00',
    '2019-03-07 12:51:00',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307125547155194534710633165',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    125,
    0,
    '5 Bulbs',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:55:47',
    '2019-03-07 12:55:47',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307125423155194526339172330',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    500,
    0,
    'Shabaz Drive',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:54:23',
    '2019-03-07 12:54:23',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307125523155194532340283215',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    1080,
    0,
    '6 Energy Saver',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:55:23',
    '2019-03-07 12:55:23',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307125646155194540684931334',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    200,
    0,
    'Clothes Pice Workshop',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:56:47',
    '2019-03-07 12:56:47',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307125734155194545478541343',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    300000,
    0,
    'New Vehicle Registion',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:57:34',
    '2019-03-07 12:57:34',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea7412019030712581315519454936513904',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    1000,
    0,
    'Amir Phone Card',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:58:13',
    '2019-03-07 12:58:13',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307125943155194558393272186',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    400,
    0,
    'Amir Machaki +Toll',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:59:44',
    '2019-03-07 12:59:51',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307125906155194554616299656',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    800,
    0,
    'Amir Machaki Expense+ Office',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 12:59:06',
    '2019-03-07 12:59:06',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307130145155194570570294297',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120927155185616702653640',
    13000,
    0,
    'Salary',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 13:01:45',
    '2019-03-07 13:01:45',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307130117155194567722677308',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    10000,
    0,
    'Taken By Amir',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 13:01:17',
    '2019-03-07 13:01:17',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307130223155194574388666497',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    1100,
    0,
    'Walding +Masla',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 13:02:24',
    '2019-03-07 13:02:24',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307130257155194577747576042',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    120,
    0,
    '1 Catur',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 13:02:57',
    '2019-03-07 13:02:57',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307130327155194580782315508',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    850,
    0,
    'Walding Raad',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 13:03:27',
    '2019-03-07 13:03:27',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307130418155194585857876375',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306132204155186052438342612',
    83800,
    0,
    'Cash Paid VI',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 13:04:18',
    '2019-03-07 13:04:18',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307131336155194641628130007',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133143155151550392726274',
    5209020,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:13:36',
    '2019-03-07 13:13:36',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030713171015519466308252627',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301150121155143448126094813',
    9448700,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:17:10',
    '2019-03-07 13:17:10',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307131827155194670756166188',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132258155151497847923898',
    6718640,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:18:27',
    '2019-03-07 13:18:27',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307132427155194706740056586',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306171000155187420003967226',
    2756360,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:24:27',
    '2019-03-07 13:24:27',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307132740155194726044949904',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132107155151486744542977',
    599784,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:27:40',
    '2019-03-07 13:27:40',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307133216155194753607494035',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133017155151541766993689',
    2102610,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:32:16',
    '2019-03-07 13:32:16',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307133327155194760739354078',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133039155151543914284223',
    3901340,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:33:27',
    '2019-03-07 13:33:27',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307133524155194772424898569',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130338155151381805510593',
    1741180,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:35:24',
    '2019-03-07 13:35:24',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307133622155194778265888946',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131833155151471351356320',
    1201170,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:36:22',
    '2019-03-07 13:36:22',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307133754155194787496283739',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132323155151500328067083',
    3289470,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:37:55',
    '2019-03-07 13:37:55',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307133942155194798238992968',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130521155151392186291123',
    10334800,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:39:42',
    '2019-03-07 13:39:42',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307134453155194829357928734',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c201903061203271551855807749659',
    3530930,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:44:53',
    '2019-03-07 13:44:53',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307134722155194844283484355',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030113051315514275131181530',
    0,
    12953500,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:47:22',
    '2019-03-07 13:47:22',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307134926155194856669061593',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132323155151500328067083',
    0,
    808364,
    'Dec Carraige Bill Pending',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:49:26',
    '2019-03-07 13:49:26',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307134947155194858773967694',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114748155185486858130501',
    808364,
    0,
    'Dec Carraige Bill Pending',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:49:47',
    '2019-03-07 13:49:47',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307135022155194862212392303',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132323155151500328067083',
    0,
    407823,
    'Jan Carraige Bill 19',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:50:22',
    '2019-03-07 13:50:22',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030713503415519486344126598',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114748155185486858130501',
    407823,
    0,
    'Jan Carraige Bill 19',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:50:34',
    '2019-03-07 13:51:25',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307135458155194889820468401',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132726155151524658816619',
    8964670,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:54:58',
    '2019-03-07 13:54:58',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307135611155194897128385417',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132903155151534385455812',
    2567060,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:56:11',
    '2019-03-08 11:14:07',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030713572215519490429394786',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130801155142768140610448',
    0,
    2371470,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:57:23',
    '2019-03-07 13:57:23',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307135816155194909646939938',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302134211155151613167622385',
    319457,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:58:16',
    '2019-03-07 13:58:16',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307135908155194914837958895',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030617464115518764011309634',
    4121500,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 13:59:08',
    '2019-03-07 13:59:08',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307140107155194926780381454',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131315155151439512196495',
    1901200,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 14:01:07',
    '2019-03-07 14:01:07',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307140316155194939613989399',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301132408155142864869355180',
    2167700,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 14:03:16',
    '2019-03-07 14:03:16',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307140421155194946175590248',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c201903021306321551513992827248',
    946790,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 14:04:21',
    '2019-03-07 14:04:21',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307140554155194955468433492',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    0,
    22338800,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 14:05:54',
    '2019-03-07 14:05:54',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307140829155194970914015189',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131133155151429346835548',
    1768110,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 14:08:29',
    '2019-03-07 14:08:29',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307141021155194982170721380',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030213120915515143292229741',
    806491,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 14:10:21',
    '2019-03-07 14:10:21',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030714110715519498676756696',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131446155151448688320876',
    527000,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 14:11:07',
    '2019-03-07 14:11:07',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030714122515519499459235457',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131602155151456277558353',
    4822500,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 14:12:26',
    '2019-03-07 14:12:26',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307141322155195000296337655',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131633155151459338647354',
    1286830,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 14:13:23',
    '2019-03-07 14:13:23',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307144257155195177744461911',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130836155151411653011362',
    705700,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 14:42:57',
    '2019-03-07 14:42:57',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307154714155195563488056072',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306121847155185672789739627',
    22066600,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 15:47:14',
    '2019-03-07 15:57:11',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307172206155196132626432412',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132753155151527381563593',
    4356790,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 17:22:06',
    '2019-03-07 17:22:06',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307174204155196252493485970',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    0,
    163234000,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 17:42:05',
    '2019-03-07 17:50:10',
    '2019-03-07 17:50:10'
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307183415155196565533055981',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    0,
    163234,
    'THYRJ',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 18:34:15',
    '2019-03-07 18:34:20',
    '2019-03-07 18:34:20'
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307183705155196582591353946',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    142136000,
    0,
    'Old Account Transfer',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 18:37:06',
    '2019-03-07 18:51:50',
    '2019-03-07 18:51:50'
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308121858155202953831235621',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130801155142768140610448',
    68163,
    0,
    'Carriage Bill Adjust',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:18:58',
    '2019-03-08 12:19:50',
    '2019-03-08 12:19:50'
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea741201903081225141552029914416608',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130801155142768140610448',
    68163,
    0,
    'Carriage Bill',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:25:14',
    '2019-03-08 12:25:14',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308122550155202995011197011',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114748155185486858130501',
    0,
    68163,
    'Carriage Bill Shahied Mehar',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:25:50',
    '2019-03-08 12:25:50',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308123429155203046952240317',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030611313815518538980534738',
    0,
    678612,
    'Opning Cash',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:34:29',
    '2019-03-08 12:34:29',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308123507155203050767998001',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030213120915515143292229741',
    0,
    300000,
    'Cash Recevied By Raoof',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:35:07',
    '2019-03-08 12:35:07',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308123529155203052986566165',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030611313815518538980534738',
    454412,
    0,
    'Clossing Cash',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:35:30',
    '2019-03-08 12:35:30',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea7412019030812360515520305652061638',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    1260,
    0,
    'Computer Paper Ring',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:36:05',
    '2019-03-08 12:36:05',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308123645155203060534331373',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    200,
    0,
    'Shaie Zaman Expense',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:36:45',
    '2019-03-08 12:36:45',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308123825155203070523921109',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    200,
    0,
    'Green Tea 2 Pack',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:38:25',
    '2019-03-08 12:38:30',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308123959155203079953698815',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    300000,
    0,
    'Taken By Haji Khalied',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:39:59',
    '2019-03-08 12:39:59',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308123913155203075311124544',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    1300,
    0,
    'Naveed Sahab Vehicle Bill',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:39:13',
    '2019-03-08 12:39:13',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308124234155203095492127234',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    2000,
    0,
    'Asim Rang Saz',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:42:35',
    '2019-03-08 12:42:35',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308124139155203089949420825',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030113051315514275131181530',
    37000,
    0,
    'TLK-629 Lessans + Carribarshion',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:41:39',
    '2019-03-08 12:41:39',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308124328155203100880053522',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114937155185497749449358',
    18000,
    0,
    'Salary',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:43:28',
    '2019-03-08 12:43:28',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308124358155203103840776979',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    390,
    0,
    'Mdsn Haji Sahab',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:43:58',
    '2019-03-08 12:43:58',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308124427155203106798395681',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    250,
    0,
    'TCS Nadir Vehari',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:44:28',
    '2019-03-08 12:44:28',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308124503155203110358273711',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    400,
    0,
    'Amir Expense Machaki Toll',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:45:03',
    '2019-03-08 12:45:03',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308124600155203116065093752',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030611525915518551790699029',
    9500,
    0,
    'Salary',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:46:00',
    '2019-03-08 12:46:00',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308124644155203120490644528',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030611365815518542186512060',
    2070,
    0,
    'Bill',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:46:45',
    '2019-03-08 12:46:45',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308124758155203127860714227',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113554155185415400730876',
    1930,
    0,
    'Office Bill Gas',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:47:58',
    '2019-03-08 12:47:58',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308124941155203138149546985',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114311155185459162929397',
    15000,
    0,
    'Salary',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:49:41',
    '2019-03-08 13:36:50',
    '2019-03-08 13:34:35'
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308133722155203424202594662',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114311155185459162929397',
    15000,
    0,
    'Salary',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 13:37:22',
    '2019-03-08 13:37:22',
    NULL
  );
INSERT INTO
  `general` (
    `id`,
    `account`,
    `debit`,
    `credit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'GENERAL43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308133758155203427880816284',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306132204155186052438342612',
    134700,
    0,
    'Cash Paid VI',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 13:37:59',
    '2019-03-08 13:37:59',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: ledger
# ------------------------------------------------------------

INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120249155185576910350538',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133017155151541766993689',
    300000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(2695438)',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:02:49',
    '2019-03-06 12:02:49',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120434155185587482337672',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c201903061203271551855807749659',
    150000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(6147309)',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 12:04:34',
    '2019-03-06 12:04:34',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306133302155186118260054193',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132323155151500328067083',
    215000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'UBL(1389)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:33:02',
    '2019-03-06 13:35:02',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306134351155186183131191458',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132323155151500328067083',
    258925,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306114656155185481606138396',
    'ubl',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 13:43:51',
    '2019-03-06 13:44:02',
    '2019-03-06 13:44:02'
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306140201155186292179845076',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306135813155186269315366962',
    200000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'UBL(1389)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 14:02:02',
    '2019-03-06 14:02:02',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306143216155186473646459691',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132726155151524658816619',
    500000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'UBL(1619685141)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 14:32:16',
    '2019-03-06 14:32:16',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306150256155186657626768977',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132258155151497847923898',
    150000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(46996271)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:02:56',
    '2019-03-06 15:02:56',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306152321155186780116312540',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131718155151463896921342',
    200000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'MCB(7406464)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:23:21',
    '2019-03-06 15:23:21',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306155352155186963204912940',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133143155151550392726274',
    800000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(0396)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:53:52',
    '2019-03-06 15:53:52',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306152220155186774082275695',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132258155151497847923898',
    150000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(0337821)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:22:21',
    '2019-03-06 18:58:42',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306160135155187009538778086',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132726155151524658816619',
    880000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'HBL(7499724)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 16:01:35',
    '2019-03-06 16:01:35',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306155257155186957743019482',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132726155151524658816619',
    500000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'HBL(7499723)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:52:57',
    '2019-03-06 15:52:57',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306164102155187246226366528',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131315155151439512196495',
    400000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(45634420)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 16:41:02',
    '2019-03-06 16:41:02',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306165539155187333924334896',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c201903061203271551855807749659',
    150000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(1235890)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 16:55:39',
    '2019-03-06 16:55:39',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306164629155187278935854844',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131133155151429346835548',
    500000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'UBL(1619900204)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 16:46:29',
    '2019-03-06 16:46:29',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306171730155187465057160072',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306171000155187420003967226',
    135000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'UBL(1619872619)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 17:17:30',
    '2019-03-06 17:17:30',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306171851155187473138292141',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131602155151456277558353',
    1500000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(1066)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 17:18:51',
    '2019-03-06 17:19:05',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306172034155187483439628892',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130755155151407559929558',
    500000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'MCB(0242)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 17:20:34',
    '2019-03-06 18:01:42',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306172127155187488777988243',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301132408155142864869355180',
    700000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 17:21:28',
    '2019-03-06 17:21:28',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306175903155187714321714609',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130521155151392186291123',
    316000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'HBL(0805478)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 17:59:03',
    '2019-03-06 17:59:03',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306175945155187718578348449',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130521155151392186291123',
    414000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'HBL(0805477)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 17:59:46',
    '2019-03-06 17:59:46',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306180818155187769876245721',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    1300000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(2418)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 18:08:18',
    '2019-03-06 18:08:18',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306181802155187828205591797',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301150121155143448126094813',
    400000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(0138)MEEZAN C',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 18:18:02',
    '2019-03-06 18:18:02',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306181923155187836312736692',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301150121155143448126094813',
    300000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(0138)MCB C',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 18:19:23',
    '2019-03-06 18:19:23',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306182024155187842479267739',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301150121155143448126094813',
    305000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(0138)ALFALHA',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 18:20:25',
    '2019-03-06 18:20:25',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306182121155187848145589039',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301150121155143448126094813',
    550000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(0138)UBL C',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 18:21:21',
    '2019-03-06 18:21:21',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306184926155188016665620506',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132726155151524658816619',
    135000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'ABL(6725238)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 18:49:26',
    '2019-03-06 18:49:26',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307103829155193710929335871',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132107155151486744542977',
    200000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(0077856)',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 10:38:31',
    '2019-03-07 10:38:31',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030710383215519371123898390',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132107155151486744542977',
    200000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(0077856)',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 10:38:32',
    '2019-03-07 10:38:38',
    '2019-03-07 10:38:38'
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307110648155193880865019470',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131446155151448688320876',
    567000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'HBL',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 11:06:48',
    '2019-03-07 11:06:48',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307131503155194650305980042',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133039155151543914284223',
    100000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(5168959)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 13:15:03',
    '2019-03-07 13:15:03',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307132907155194734700065509',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133039155151543914284223',
    170000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(6435577)HASCOL',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 13:29:07',
    '2019-03-07 13:29:07',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307145244155195236457245308',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132258155151497847923898',
    150000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(2695226)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 14:52:44',
    '2019-03-07 14:52:44',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea741201903071453511551952431893405',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132258155151497847923898',
    100000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(46996274)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 14:53:52',
    '2019-03-07 14:53:52',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea741201903071454491551952489609554',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132258155151497847923898',
    150000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(0166507)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 14:54:49',
    '2019-03-07 14:54:49',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307154421155195546126956630',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131315155151439512196495',
    350000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(45597935)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 15:44:21',
    '2019-03-07 15:44:21',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307154535155195553553286155',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131602155151456277558353',
    300000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030113051315514275131181530',
    'FB',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 15:45:35',
    '2019-03-07 15:45:35',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307155225155195594527982681',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306113307155185398714042261',
    362500,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'FB',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 15:52:25',
    '2019-03-07 15:52:25',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307155914155195635423110792',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306171000155187420003967226',
    100000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'UBL(1620790213)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 15:59:14',
    '2019-03-07 15:59:14',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307162214155195773487810531',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132726155151524658816619',
    625000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'MCB(89624102)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 16:22:15',
    '2019-03-07 16:22:15',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307164419155195905993576445',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132818155151529879744652',
    500000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(34961028)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 16:44:20',
    '2019-03-07 16:44:20',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307164906155195934657623293',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132753155151527381563593',
    1000000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'MCB(89919314)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 16:49:06',
    '2019-03-07 16:49:06',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307165232155195955243550020',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130755155151407559929558',
    350000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'MCB(0242)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 16:52:32',
    '2019-03-07 16:52:32',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307165525155195972573922919',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132726155151524658816619',
    800000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'HBL',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 16:55:25',
    '2019-03-07 16:55:25',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307170448155196028877486906',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132726155151524658816619',
    400000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'HBL',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 17:04:49',
    '2019-03-07 17:04:49',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307171946155196118690249173',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132753155151527381563593',
    2500000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'UBL(1620916428)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 17:19:47',
    '2019-03-07 17:19:47',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307173118155196187831166988',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c201903061203271551855807749659',
    150000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(1235863)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 17:31:18',
    '2019-03-07 17:31:18',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307173242155196196294986783',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132323155151500328067083',
    885000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'MCB(0503)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 17:32:43',
    '2019-03-07 17:32:43',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307173701155196222121286007',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131833155151471351356320',
    601166,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(1993)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 17:37:01',
    '2019-03-07 17:37:01',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190307174040155196244005332186',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133143155151550392726274',
    800000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(0396)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-07 17:40:40',
    '2019-03-07 17:40:40',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307182652155196521267842402',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131718155151463896921342',
    300000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'UBL(1620875870)',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 18:26:52',
    '2019-03-07 18:26:52',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307182744155196526419282725',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301150121155143448126094813',
    500000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(0138)ALFLHA C',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 18:27:44',
    '2019-03-07 18:27:44',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307182818155196529843034321',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301150121155143448126094813',
    800000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(0138)UBL C',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 18:28:18',
    '2019-03-07 18:28:18',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308123008155203020871999588',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131633155151459338647354',
    1287830,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130801155142768140610448',
    'MCB',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:30:08',
    '2019-03-08 12:30:08',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308134016155203441697632653',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131133155151429346835548',
    1041330,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'UBL',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 13:40:17',
    '2019-03-08 13:40:17',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea7412019030814292515520373658343039',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131718155151463896921342',
    299536,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'MCB(7408946)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 14:29:26',
    '2019-03-08 14:42:42',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308152410155204065080396279',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133017155151541766993689',
    300000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(2695681)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 15:24:11',
    '2019-03-08 15:24:11',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308153330155204121000286059',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306171000155187420003967226',
    150000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'ABL(6297246)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 15:33:30',
    '2019-03-08 15:33:30',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308154035155204163532297153',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131718155151463896921342',
    150000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'HBL(33422050)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 15:40:35',
    '2019-03-08 15:40:35',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308154130155204169063445214',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131718155151463896921342',
    200000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'HBL(33422045)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 15:41:30',
    '2019-03-08 15:41:30',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308155819155204269935461661',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132258155151497847923898',
    200000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(0337919)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 15:58:19',
    '2019-03-08 15:58:19',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308155725155204264519164779',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131718155151463896921342',
    300000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'MCB(7406554)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 15:57:25',
    '2019-03-08 15:57:25',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308161211155204353124047370',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131718155151463896921342',
    400000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'UBL(1621644835)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 16:12:11',
    '2019-03-08 16:12:11',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308161359155204363985176124',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131133155151429346835548',
    500000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'UBL(1621660959)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 16:14:00',
    '2019-03-08 16:14:00',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308162459155204429972613728',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130338155151381805510593',
    350000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'ABL(3679444)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 16:24:59',
    '2019-03-08 16:24:59',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308162549155204434989057637',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130338155151381805510593',
    1300000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'HBL(1117561)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 16:25:50',
    '2019-03-08 16:25:50',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea7412019030816293915520445799305085',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131833155151471351356320',
    600000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(1993)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 16:29:40',
    '2019-03-08 16:29:40',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308163133155204469345421049',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301132408155142864869355180',
    240000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(2295165)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 16:31:33',
    '2019-03-08 16:31:33',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308163231155204475112467725',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301132408155142864869355180',
    160000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(2295164)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 16:32:31',
    '2019-03-08 16:32:31',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308163341155204482143775693',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301132408155142864869355180',
    200000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(2295475)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 16:33:41',
    '2019-03-08 16:33:41',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308163632155204499238151055',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132753155151527381563593',
    600000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'HBL(4835990)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 16:36:32',
    '2019-03-08 16:36:32',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308163817155204509745914432',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133039155151543914284223',
    300000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(0447993)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 16:38:17',
    '2019-03-08 16:38:17',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea741201903081644001552045440130145',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132258155151497847923898',
    120000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 16:44:00',
    '2019-03-08 16:44:00',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308164508155204550857883929',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131718155151463896921342',
    1150000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'UBL(1621692948)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 16:45:08',
    '2019-03-08 16:45:08',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308165508155204610832519243',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133143155151550392726274',
    1700000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(0396)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 16:55:08',
    '2019-03-08 16:55:08',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308165604155204616404574371',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132726155151524658816619',
    930000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'HBL(7499815)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 16:56:04',
    '2019-03-08 16:56:04',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308170040155204644039177196',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131602155151456277558353',
    1800000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(1066)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 17:00:40',
    '2019-03-08 17:00:40',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308170938155204697835373430',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306174509155187630908211351',
    500000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(1709)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 17:09:38',
    '2019-03-08 17:09:38',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308171039155204703951728852',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030213293315515153738807455',
    1000000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'MCB(0379)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 17:10:39',
    '2019-03-08 17:10:39',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308171329155204720959716185',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c201903061203271551855807749659',
    200000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(1235194)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 17:13:29',
    '2019-03-08 17:13:29',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308171502155204730257972778',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132726155151524658816619',
    500000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'HBL(7499826)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 17:15:02',
    '2019-03-08 17:15:02',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308171633155204739317518424',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130521155151392186291123',
    1600000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'HBL',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 17:16:33',
    '2019-03-08 17:16:33',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308172407155204784787683945',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c201903061203271551855807749659',
    100000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'AL HABIB',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 17:24:08',
    '2019-03-08 17:24:56',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308173244155204836454914801',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    3300000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'HBL(2418)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 17:32:44',
    '2019-03-08 17:32:44',
    NULL
  );
INSERT INTO
  `ledger` (
    `id`,
    `credit`,
    `total`,
    `debit`,
    `description`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'LEDGER43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308173415155204845583246796',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030617464115518764011309634',
    200000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306120153155185571367162273',
    'HBL(4569963)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 17:34:16',
    '2019-03-08 17:34:16',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: profits
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: purchases
# ------------------------------------------------------------

INSERT INTO
  `purchases` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `supplier`,
    `terminal`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'PURCHASE2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301161242155143876282064922',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    50000,
    90,
    4500000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131837155142831767953715',
    'TLM',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 16:12:42',
    '2019-03-01 16:13:08',
    '2019-03-01 16:13:08'
  );
INSERT INTO
  `purchases` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `supplier`,
    `terminal`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'PURCHASE2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301161658155143901888469020',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160649155143840910253475',
    0,
    0,
    0,
    NULL,
    NULL,
    NULL,
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 16:16:58',
    '2019-03-01 16:17:04',
    '2019-03-01 16:17:04'
  );
INSERT INTO
  `purchases` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `supplier`,
    `terminal`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'PURCHASE2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301181528155144612858378853',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    5000,
    91,
    455000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131837155142831767953715',
    'TLZ-513',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-01 18:15:28',
    '2019-03-04 12:30:44',
    '2019-03-04 12:30:44'
  );
INSERT INTO
  `purchases` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `supplier`,
    `terminal`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'PURCHASE2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306130929155185976941382551',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    57442,
    88.97,
    5110610,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131837155142831767953715',
    'LEI-4706',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 13:09:29',
    '2019-03-07 13:02:59',
    NULL
  );
INSERT INTO
  `purchases` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `supplier`,
    `terminal`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'PURCHASE2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306140205155186292550073898',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    29717,
    88.97,
    2643920,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131837155142831767953715',
    'TUD-566',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 14:02:05',
    '2019-03-07 13:03:49',
    NULL
  );
INSERT INTO
  `purchases` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `supplier`,
    `terminal`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'PURCHASE2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306140304155186298496968029',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    49755,
    88.97,
    4426700,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131837155142831767953715',
    'SMA-327',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 14:03:05',
    '2019-03-07 13:04:22',
    NULL
  );
INSERT INTO
  `purchases` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `supplier`,
    `terminal`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'PURCHASE2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306140417155186305756553965',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    32000,
    88.97,
    2847040,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130433155142747350675467',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131837155142831767953715',
    'GLTA-2983',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-06 14:04:18',
    '2019-03-07 13:05:17',
    NULL
  );
INSERT INTO
  `purchases` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `supplier`,
    `terminal`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'PURCHASE43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190308124852155203133295538809',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160729155143844915133678',
    50000,
    101,
    5050000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030113051315514275131181530',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301132156155142851619431319',
    'TLK-629',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-08 12:48:53',
    '2019-03-08 12:50:09',
    NULL
  );
INSERT INTO
  `purchases` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `supplier`,
    `terminal`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'PURCHASE2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308160224155204294443028552',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    52000,
    89.83,
    4671160,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131837155142831767953715',
    'TLZ-015',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:02:24',
    '2019-03-08 16:02:24',
    NULL
  );
INSERT INTO
  `purchases` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `supplier`,
    `terminal`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'PURCHASE2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308160402155204304295193062',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    50000,
    89.83,
    4491500,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131837155142831767953715',
    'TLW-613',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:04:03',
    '2019-03-08 16:04:03',
    NULL
  );
INSERT INTO
  `purchases` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `supplier`,
    `terminal`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'PURCHASE2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308160440155204308036761546',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    60000,
    89.83,
    5389800,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131837155142831767953715',
    'TLT-531',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:04:40',
    '2019-03-08 16:04:40',
    NULL
  );
INSERT INTO
  `purchases` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `supplier`,
    `terminal`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'PURCHASE2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308162131155204409163010448',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    50000,
    89.83,
    4491500,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131837155142831767953715',
    'LXC-7704',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:21:31',
    '2019-03-08 16:21:31',
    NULL
  );
INSERT INTO
  `purchases` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `supplier`,
    `terminal`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'PURCHASE2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308162255155204417559213101',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    50000,
    89.83,
    4491500,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131837155142831767953715',
    'JQ-1154',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:22:55',
    '2019-03-08 16:22:55',
    NULL
  );
INSERT INTO
  `purchases` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `supplier`,
    `terminal`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'PURCHASE2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308162326155204420686236172',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    40000,
    89.83,
    3593200,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301130202155142732289152875',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301131837155142831767953715',
    'TLX-514',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:23:26',
    '2019-03-08 16:23:26',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: sales
# ------------------------------------------------------------

INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306153102155186826219176567',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    19000,
    90.64,
    1722160,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132258155151497847923898',
    'SALE',
    'LEI-4706(H)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:31:02',
    '2019-03-06 15:38:32',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea7412019030615332815518684086292400',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    9908,
    90.11,
    892810,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133017155151541766993689',
    'SALE',
    'LEI-4706(H)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:33:28',
    '2019-03-07 13:30:01',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306153819155186869968431209',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    29717,
    90,
    2674530,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301150121155143448126094813',
    'SALE',
    'TUD-566(H)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:38:19',
    '2019-03-07 18:41:30',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306154115155186887533436317',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    30000,
    89.27,
    2678100,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131833155151471351356320',
    'SALE',
    'GLTA-2983(H)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:41:15',
    '2019-03-07 13:11:52',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306154621155186918102827347',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    25000,
    89.07,
    2226750,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130755155151407559929558',
    'SALE',
    'LSA-2950',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:46:21',
    '2019-03-08 11:16:43',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306154707155186922768024895',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160729155143844915133678',
    5000,
    107.75,
    538750,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301132408155142864869355180',
    'SALE',
    'SWA-154',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:47:07',
    '2019-03-08 16:10:56',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306154319155186899987656695',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    20000,
    88.97,
    1779400,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c2019030213181215515146924359174',
    'SLAE',
    'LEI-4706(H)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:43:20',
    '2019-03-07 18:47:29',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306153944155186878461495876',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    50000,
    90.05,
    4502500,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302133143155151550392726274',
    'SALE',
    'SMA-327(H)',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:39:44',
    '2019-03-06 17:38:38',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306154950155186939061926905',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160649155143840910253475',
    2000,
    90.88,
    181760,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132411155151505122937172',
    'SALE',
    'SWA-034',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:49:50',
    '2019-03-08 16:10:36',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306155033155186943394854628',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160649155143840910253475',
    9964,
    90,
    896760,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132818155151529879744652',
    'SALE',
    'SWA-154',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:50:34',
    '2019-03-08 16:11:38',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306155108155186946885952122',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160729155143844915133678',
    14964,
    108.25,
    1619850,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132818155151529879744652',
    'SALE',
    'SWA-154',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:51:09',
    '2019-03-08 16:11:43',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306154747155186926716941283',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160649155143840910253475',
    10000,
    90,
    900000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301132408155142864869355180',
    'SALE',
    'SWA-154',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:47:47',
    '2019-03-08 16:11:10',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES43c2a211064671fe6ae2e725d963507274f1ef774a10bbd51ee737d8fdbea74120190306154853155186933330018273',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160649155143840910253475',
    4000,
    90.5,
    362000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130836155151411653011362',
    'SALE',
    'SWA-034',
    0,
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    '2019-03-06 15:48:53',
    '2019-03-08 16:10:26',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190307152610155195437087196014',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    9000,
    90.05,
    810450,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132107155151486744542977',
    'SALE',
    'LEI-4706(H)',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-07 15:26:10',
    '2019-03-07 15:26:10',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308110508155202510858963224',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160729155143844915133678',
    20000,
    109.84,
    2196800,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131633155151459338647354',
    'SALE',
    'SWA-154',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 11:05:08',
    '2019-03-08 15:50:35',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308110541155202514124254786',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160729155143844915133678',
    5000,
    108.85,
    544250,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132107155151486744542977',
    'SALE',
    'SWA-154',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 11:05:41',
    '2019-03-08 15:50:43',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308110821155202530130751067',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160505155143830564560407',
    10000,
    92,
    920000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131446155151448688320876',
    'SALE',
    'LXC-7973',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 11:08:21',
    '2019-03-08 11:08:21',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308110926155202536603566785',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160729155143844915133678',
    6000,
    107.75,
    646500,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301132408155142864869355180',
    'SALE',
    'SWA-037',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 11:09:26',
    '2019-03-08 15:50:50',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308160322155204300235761720',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    52000,
    90,
    4680000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131133155151429346835548',
    'SALE',
    'TLZ-015(B)',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:03:22',
    '2019-03-08 16:36:52',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308160526155204312652684514',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    50000,
    90,
    4500000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302130338155151381805510593',
    'SALE',
    'TLW-613(B)',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:05:26',
    '2019-03-08 16:37:03',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308160625155204318577383863',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    60000,
    90,
    5400000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302131718155151463896921342',
    'SALE',
    'TLT-531(B)',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:06:25',
    '2019-03-08 16:37:12',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308162543155204434375921437',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    50000,
    90,
    4500000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132753155151527381563593',
    'SALE',
    'JQ-1154(B)',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:25:43',
    '2019-03-08 16:37:18',
    NULL
  );
INSERT INTO
  `sales` (
    `id`,
    `product`,
    `quantity`,
    `price`,
    `total`,
    `customer`,
    `description`,
    `reg_no`,
    `is_changed`,
    `created_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'SALES2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190308162754155204447444784855',
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190301160349155143822928962549',
    40000,
    90,
    3600000,
    'ACCOUNT2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190302132753155151527381563593',
    'SALE',
    'TLX-514(B)',
    0,
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    '2019-03-08 16:27:54',
    '2019-03-08 16:37:24',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: settings
# ------------------------------------------------------------

INSERT INTO
  `settings` (`id`, `name`, `value`)
VALUES
  (
    'SETTING554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715133',
    'last_server_sync',
    '2019-03-08 18:13:24'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: users
# ------------------------------------------------------------

INSERT INTO
  `users` (
    `id`,
    `name`,
    `user_name`,
    `password`,
    `profile`,
    `role`,
    `permissions`,
    `is_changed`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'USER554d6fc3f2671c53cce57d59dc168f65fe3d8df50a0e9fc65c1a3eae3d19f23d2019020617324315494563637715111',
    'Muhammad Hasan',
    'hasan',
    'e10adc3949ba59abbe56e057f20f883e',
    NULL,
    '21232f297a57a5a743894a0e4a801fc3',
    '{}',
    0,
    '2018-12-28 20:55:52',
    '2019-02-25 14:05:00',
    NULL
  );
INSERT INTO
  `users` (
    `id`,
    `name`,
    `user_name`,
    `password`,
    `profile`,
    `role`,
    `permissions`,
    `is_changed`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190304135449155168968960929519',
    'Muhammad Hasan',
    'mhasan',
    'e10adc3949ba59abbe56e057f20f883e',
    NULL,
    '202cb962ac59075b964b07152d234b70',
    '{\"daybook\":{\"write\":true},\"cartageBilling\":{\"write\":true},\"cartageDocuments\":{\"write\":true},\"accounts\":{\"read\":true,\"write\":true},\"reports\":{\"read\":true}}',
    0,
    '2019-03-04 13:54:49',
    '2019-03-06 10:42:42',
    '2019-03-06 10:42:42'
  );
INSERT INTO
  `users` (
    `id`,
    `name`,
    `user_name`,
    `password`,
    `profile`,
    `role`,
    `permissions`,
    `is_changed`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES
  (
    'USER2e0f37b41569f401016655b22ef919e319e0ff8ac1dcddb8abdc9d3716b7112c20190306104231155185095107314623',
    'Anam Akram',
    'anam',
    '81dc9bdb52d04dc20036dbd8313ed055',
    NULL,
    'ee11cbb19052e40b07aac0ca060c23ee',
    '{\"daybook\":{\"write\":true},\"cartageBilling\":{\"write\":true},\"cartageDocuments\":{\"write\":true},\"accounts\":{\"read\":true,\"write\":true},\"reports\":{\"read\":true}}',
    0,
    '2019-03-06 10:42:31',
    '2019-03-06 10:42:31',
    NULL
  );