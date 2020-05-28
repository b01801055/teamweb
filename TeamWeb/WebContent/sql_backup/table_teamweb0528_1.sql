CREATE TABLE `orderList` (
  `orderList_id` int NOT NULL COMMENT '訂單流水編號',
  `mem_id` int NOT NULL COMMENT '會員id',
  `orderList_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '訂單日期',
  `orderList_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `orderList_mphone` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手機號碼',
  `orderList_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `orderList_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '郵件信箱',
  PRIMARY KEY (`orderList_id`),
  KEY `mem_id_idx` (`mem_id`),
  CONSTRAINT `mem_id` FOREIGN KEY (`mem_id`) REFERENCES `member` (`mem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='訂單資料';

CREATE TABLE `orderListDetail` (
  `orderList_id` int NOT NULL COMMENT '訂單流水編號',
  `prod_id` int NOT NULL COMMENT '商品ID',
  `quantity` int NOT NULL DEFAULT '1' COMMENT '購買數量',
  PRIMARY KEY (`orderList_id`,`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='訂單明細';

