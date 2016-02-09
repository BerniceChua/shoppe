



-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'products'
--
-- ---

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `title` MEDIUMTEXT NULL DEFAULT NULL,
  `price` INTEGER NULL DEFAULT NULL,
  `description` MEDIUMTEXT NULL DEFAULT NULL,
  `inventory` INTEGER NULL DEFAULT NULL,
  `picture` MEDIUMTEXT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'orders'
--
-- ---

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `order_date` DATETIME NULL DEFAULT NULL,
  `quantity` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'receipts'
-- This is the join table for products & orders: products have many orders, products belong to orders; AND orders have many products, & orders belong to products.
-- ---

DROP TABLE IF EXISTS `receipts`;

CREATE TABLE `receipts` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_products` INTEGER NULL DEFAULT NULL,
  `id_orders` INTEGER NULL DEFAULT NULL,
  `total_price` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT='This is the join table for products & orders: products have ';

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `receipts` ADD FOREIGN KEY (id_orders) REFERENCES `orders` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `products` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `orders` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `receipts` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `products` (`id`,`title`,`price`,`description`,`inventory`,`picture`,`created_at`,`updated_at`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `orders` (`id`,`order_date`,`quantity`) VALUES
-- ('','','');
-- INSERT INTO `receipts` (`id`,`id_products`,`id_orders`,`total_price`) VALUES
-- ('','','','');

