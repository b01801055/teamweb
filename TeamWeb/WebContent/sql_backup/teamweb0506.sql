CREATE TABLE `viewcount` (
  `view_id` int(11) NOT NULL,
  `view_time` datetime DEFAULT NULL,
  `view_ip` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
