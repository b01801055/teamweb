CREATE TABLE `product` (
  `prod_id` int NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `prod_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名稱',
  `prod_price` int unsigned NOT NULL COMMENT '商品定價',
  `prod_introduction` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '商品介紹',
  `prod_size_stock` int unsigned NOT NULL COMMENT '商品庫存',
  `prod_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod_view` int unsigned NOT NULL COMMENT '商品上架1上架0下架',
  
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;