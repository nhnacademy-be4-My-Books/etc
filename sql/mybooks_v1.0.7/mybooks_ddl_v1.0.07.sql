DROP TABLE IF EXISTS `address`;
DROP TABLE IF EXISTS `book_like`;
DROP TABLE IF EXISTS `book_tag`;
DROP TABLE IF EXISTS `tag`;
DROP TABLE IF EXISTS `book_category`;
DROP TABLE IF EXISTS `book_author`;
DROP TABLE IF EXISTS `author`;
DROP TABLE IF EXISTS `image`;
DROP TABLE IF EXISTS `image_status`;
DROP TABLE IF EXISTS `return_detail`;
DROP TABLE IF EXISTS `book_return`;
DROP TABLE IF EXISTS `return_rule`;
DROP TABLE IF EXISTS `return_rule_name`;
DROP TABLE IF EXISTS `cart_detail`;
DROP TABLE IF EXISTS `cart`;
DROP TABLE IF EXISTS `review`;
DROP TABLE IF EXISTS `point_history`;
DROP TABLE IF EXISTS `point_rule`;
DROP TABLE IF EXISTS `point_rule_name`;
DROP TABLE IF EXISTS `payment`;
DROP TABLE IF EXISTS `order_detail`;
DROP TABLE IF EXISTS `order_detail_status`;
DROP TABLE IF EXISTS `book_order`;
DROP TABLE IF EXISTS `wrap`;
DROP TABLE IF EXISTS `delivery_rule`;
DROP TABLE IF EXISTS `delivery_rule_name`;
DROP TABLE IF EXISTS `user_coupon`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `user_status`;
DROP TABLE IF EXISTS `user_grade`;
DROP TABLE IF EXISTS `coupon`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `book`;
DROP TABLE IF EXISTS `book_status`;
DROP TABLE IF EXISTS `publisher`;
DROP TABLE IF EXISTS `orders_status`;
DROP TABLE IF EXISTS `user_grade_name`;

CREATE TABLE `user` (
	`user_id`	bigint	NOT NULL Auto_Increment,
	`user_grade_id`	int	NOT NULL,
	`user_status_id` varchar(20) NOT NULL,
	`user_password`	varchar(60)	NOT NULL,
	`user_name`	varchar(30)	NOT NULL,
	`user_phone_number`	varchar(13)	NOT NULL,
	`user_email`	varchar(30)	NOT NULL UNIQUE,
	`user_birth_year`	int	NULL,
    `user_birth_month_day` varchar(5) NOT NULL,
	`is_admin`	boolean	NOT NULL,
	`user_created_at`	datetime	NOT NULL,
	`user_latest_login_at`	datetime	NULL,
	`user_deleted_at`	datetime	NULL,
    `user_grade_changed_date` date NULL,
    
    CONSTRAINT PK_USER PRIMARY KEY(`user_id`)
);

CREATE TABLE `address` (
	`address_id`	bigint	NOT NULL Auto_Increment,
	`user_id`	bigint	NOT NULL,
	`address_alias`	varchar(15)	NOT NULL,
	`address_road_name`	varchar(100)	NOT NULL,
    `address_detail` varchar(100) NOT NULL,
    `address_number` int NOT NULL,
    `address_reference` varchar(100) NULL,
    
    CONSTRAINT PK_ADDRESS PRIMARY KEY(`address_id`)
);

CREATE TABLE `book_order` (
	`order_id`	bigint	NOT NULL Auto_Increment,
	`user_id`	bigint	NOT NULL,
	`orders_status_id`	varchar(20)	NOT NULL,
	`delivery_rule_id`	int	NOT NULL,
	`user_coupon_id`	bigint	NULL,
	`wrap_id`	int	NULL,
	`order_out_date`	date	NULL,
    `order_delivery_date` date NULL,
	`order_date`	date	NOT NULL,
	`order_invoice_number`	varchar(20)	NULL UNIQUE,
	`order_receiver_name`	varchar(30)	NOT NULL,
	`order_receiver_address`	varchar(100)	NOT NULL,
	`order_receiver_phone_number`	varchar(13)	NOT NULL,
	`order_receiver_message`	varchar(50)	NULL,
	`order_total_cost`	int	NOT NULL,
	`order_point_cost`	int	NOT NULL DEFAULT 0,
	`order_coupon_cost`	int	NOT NULL DEFAULT 0,
	`is_coupon_used`	boolean	NULL,
	`order_number`	varchar(20)	NOT NULL UNIQUE,
	`order_find_password`	varchar(6)	NULL,
    
    CONSTRAINT PK_BOOK_ORDER PRIMARY KEY(`order_id`)
);

CREATE TABLE `delivery_rule` (
	`delivery_rule_id`	int	NOT NULL Auto_Increment,
	`delivery_rule_name_id`	varchar(50)	NOT NULL,
	`delivery_company_name`	varchar(20)	NOT NULL,
	`delivery_cost`	int	NOT NULL,
	`delivery_rule_cost`	int	NOT NULL,
	`delivery_rule_created_date`	date	NOT NULL,
	`is_available`	boolean	NOT NULL	DEFAULT true,
    
    CONSTRAINT PK_DELIVERY_RULE PRIMARY KEY(`delivery_rule_id`)
);

CREATE TABLE `tag` (
	`tag_id`	int	NOT NULL Auto_Increment,
	`tag_name`	varchar(20)	NOT NULL UNIQUE,
	`tag_created_date`	date	NOT NULL,
    
    CONSTRAINT PK_TAG PRIMARY KEY(`tag_id`)
);

CREATE TABLE `category` (
	`category_id`	int	NOT NULL Auto_Increment,
	`parent_category_id`	int NULL,
	`category_name`	varchar(20)	NOT NULL UNIQUE,
	`category_created_date`	date	NOT NULL,
    
    CONSTRAINT PK_CATEGORY PRIMARY KEY(`category_id`)
);

CREATE TABLE `book` (
	`book_id`	bigint	NOT NULL Auto_Increment,
	`book_status_id`	varchar(20)	NOT NULL,
	`publisher_id`	int	NOT NULL,
	`book_name`	varchar(100)	NOT NULL,
	`book_isbn`	varchar(13)	NOT NULL UNIQUE,
	`book_publish_date`	date	NOT NULL,
	`book_page`	int	NOT NULL,
	`book_index`	text	NOT NULL,
	`book_content`	text	NOT NULL,
	`book_original_cost`	int	NOT NULL,
	`book_sale_cost`	int	NOT NULL,
	`book_discount_rate`	int	NOT NULL,
	`book_stock`	int	NOT NULL,
	`book_view_count`	int	NOT NULL,
	`is_packaging`	boolean	NOT NULL,
	`book_created_date`	date	NOT NULL,
    
    CONSTRAINT PK_BOOK PRIMARY KEY(`book_id`)
);

CREATE TABLE `book_tag` (
	`book_id`	bigint	NOT NULL,
	`tag_id`	int	NOT NULL
);

CREATE TABLE `cart` (
	`cart_id`	bigint	NOT NULL Auto_Increment,
	`user_id`	bigint	NOT NULL,
    
    CONSTRAINT PK_CART PRIMARY KEY(`cart_id`)
);

CREATE TABLE `cart_detail` (
	`cart_detail_id`	bigint	NOT NULL Auto_Increment,
	`cart_id`	bigint	NOT NULL,
	`book_id`	bigint	NOT NULL,
	`cart_detail_amount`	int	NOT NULL,
    
    CONSTRAINT PK_CART_DETAIL PRIMARY KEY(`cart_detail_id`)
);

CREATE TABLE `user_grade_name` (
    `user_grade_name_id` varchar(20) NOT NULL,

    CONSTRAINT PK_USER_GRADE_NAME PRIMARY KEY(`user_grade_name_id`)
);

CREATE TABLE `user_grade` (
	`user_grade_id`	int	NOT NULL Auto_Increment,
	`user_grade_name_id`	varchar(20)	NOT NULL,
	`user_grade_min`	int	NOT NULL,
	`user_grade_max`	int	NOT NULL,
	`user_grade_rate`	int	NOT NULL,
	`user_grade_created_date`	date	NOT NULL,
    `is_available` boolean NOT NULL default true,
    
    CONSTRAINT PK_USER_GRADE PRIMARY KEY(`user_grade_id`)
);

CREATE TABLE `book_category` (
	`book_id`	bigint	NOT NULL,
	`category_id`	int	NOT NULL
);

CREATE TABLE `author` (
	`author_id`	int	NOT NULL Auto_Increment,
	`author_name`	varchar(100)	NOT NULL,
	`author_content`	text	NULL,
	`author_created_date`	date	NOT NULL,
    
    CONSTRAINT PK_AUTHOR PRIMARY KEY(`author_id`)
);

CREATE TABLE `review` (
	`review_id`	bigint	NOT NULL Auto_Increment,
	`user_id`	bigint	NOT NULL,
    `order_detail_id` bigint NOT NULL,
	`review_rate`	int	NOT NULL,
	`review_date`	date	NOT NULL,
	`review_title`	varchar(50)	NOT NULL,
	`review_content`	text	NOT NULL,
    
    CONSTRAINT PK_REVIEW PRIMARY KEY(`review_id`)
);

CREATE TABLE `order_detail` (
	`order_detail_id`	bigint	NOT NULL Auto_Increment,
	`order_id`	bigint	NOT NULL,
	`book_id`	bigint	NOT NULL,
	`order_detail_status_id`	varchar(20)	NOT NULL,
	`user_coupon_id`	bigint	NULL,
	`book_cost`	int	NOT NULL,
	`order_detail_amount`	int	NOT NULL,
	`is_coupon_used`	boolean	NOT NULL,
    
    CONSTRAINT PK_ORDER_DETAIL PRIMARY KEY(`order_detail_id`)
);

CREATE TABLE `point_history` (
	`point_history_id`	bigint	NOT NULL Auto_Increment,
	`user_id`	bigint	NOT NULL,
	`order_id`	bigint	NULL,
	`point_rule_id`	int	NOT NULL,
	`point_status_cost`	int	NOT NULL,
	`point_history_created_date`	date	NOT NULL,
    
    CONSTRAINT PK_POINT_HISTORY PRIMARY KEY(`point_history_id`)
);

CREATE TABLE `point_rule` (
	`point_rule_id`	int	NOT NULL Auto_Increment,
	`point_rule_name_id`	varchar(50)	NOT NULL,
	`point_rule_rate`	int	NULL,
	`point_rule_cost`	int	NULL,
	`point_rule_created_date`	date	NOT NULL,
    `is_available` boolean NOT NULL,
    
    CONSTRAINT PK_POINT_RULE PRIMARY KEY(`point_rule_id`)
);

CREATE TABLE `coupon` (
	`coupon_id`	bigint	NOT NULL Auto_Increment,
	`coupon_name`	varchar(100)	NOT NULL,
	`book_id`	bigint	NULL,
	`category_id`	int	NULL,
	`coupon_order_min`	int	NOT NULL,
	`coupon_discount_cost`	int	NULL,
	`coupon_max_discount_cost`	int	NULL,
	`coupon_discount_rate`	int	NULL,
	`coupon_start_date`	date	NOT NULL,
	`coupon_end_date`	date	NOT NULL,
	`is_rate`	boolean	NOT NULL,
	`is_target_order`	boolean	NOT NULL,
	`coupon_created_date`	date	NOT NULL,
    
    CONSTRAINT PK_COUPON PRIMARY KEY(`coupon_id`)
);

CREATE TABLE `user_coupon` (
	`user_coupon_id`	bigint	NOT NULL Auto_Increment,
	`user_id`	bigint	NOT NULL,
	`coupon_id`	bigint	NOT NULL,
	`user_coupon_created_date`	date	NOT NULL,
	`user_coupon_date`	date	NULL,
	`is_used`	boolean	NOT NULL,
    
    CONSTRAINT PK_USER_COUPON PRIMARY KEY(`user_coupon_id`)
);

CREATE TABLE `wrap` (
	`wrap_id`	int	NOT NULL Auto_Increment,
	`wrap_name`	varchar(20)	NOT NULL,
	`wrap_cost`	int	NOT NULL,
	`wrap_created_date`	date	NOT NULL,
	`is_available`	boolean	NOT NULL	DEFAULT true,
    
    CONSTRAINT PK_WRAP PRIMARY KEY(`wrap_id`)
);

CREATE TABLE `book_author` (
	`book_id`	bigint	NOT NULL,
	`author_id`	int	NOT NULL
);

CREATE TABLE `publisher` (
	`publisher_id`	int	NOT NULL Auto_Increment,
	`publisher_name`	varchar(100)	NULL,
	`publisher_created_date`	date	NOT NULL,
    
    CONSTRAINT PK_PUBLISHER PRIMARY KEY(`publisher_id`)
);

CREATE TABLE `book_status` (
	`book_status_id`	varchar(20)	NOT NULL,
    
    CONSTRAINT PK_BOOK_STATUS PRIMARY KEY(`book_status_id`)
);

CREATE TABLE `book_like` (
	`book_id`	bigint	NOT NULL,
	`user_id`	bigint	NOT NULL
);

CREATE TABLE `user_status` (
	`user_status_id`	varchar(20)	NOT NULL,
    
    CONSTRAINT PK_USER_STATUS PRIMARY KEY(`user_status_id`)
);

CREATE TABLE `orders_status` (
	`orders_status_id`	varchar(20)	NOT NULL,
    `orders_status_created_date` date NOT NULL,
    
    CONSTRAINT PK_ORDERS_STATUS PRIMARY KEY(`orders_status_id`)
);

CREATE TABLE `payment` (
	`payment_id`	bigint	NOT NULL Auto_Increment,
	`order_id`	bigint	NOT NULL,
	`payment_created_at`	datetime	NOT NULL,
	`payment_order_number`	varchar(30)	NOT NULL,
	`payment_status`	varchar(20)	NOT NULL,
	`payment_buyer`	varchar(20)	NOT NULL,
	`payment_cost`	int	NOT NULL,
	`payment_type`	varchar(20)	NOT NULL,
    
    CONSTRAINT PK_PAYMENT PRIMARY KEY(`payment_id`)
);

CREATE TABLE `return_rule` (
	`return_rule_id`	int	NOT NULL Auto_Increment,
	`return_rule_name_id`	varchar(50)	NOT NULL,
	`return_rule_delivery_fee`	int	NOT NULL,
	`return_rule_term`	int	NOT NULL,
	`is_available`	boolean	NOT NULL	DEFAULT true,
	`return_created_date`	date	NOT NULL,
    
    CONSTRAINT PK_RETURN_RULE PRIMARY KEY(`return_rule_id`)
);

CREATE TABLE `return_detail` (
	`return_detail_id`	bigint	NOT NULL Auto_Increment,
	`book_return_id`	bigint	NOT NULL,
	`order_detail_id`	bigint	NOT NULL,
	`return_detail_amount`	int	NOT NULL,
    
    CONSTRAINT PK_RETURN_DETAIL PRIMARY KEY(`return_detail_id`)
);

CREATE TABLE `book_return` (
	`book_return_id`	bigint	NOT NULL Auto_Increment,
	`return_rule_id`	int	NOT NULL,
	`is_damage`	boolean	NOT NULL,
	`return_date`	date	NOT NULL,
    
    CONSTRAINT PK_BOOK_RETURN PRIMARY KEY(`book_return_id`)
);

CREATE TABLE `image` (
	`image_id`	bigint	NOT NULL Auto_Increment,
	`review_id`	bigint	NULL,
	`book_id`	bigint	NULL,
	`image_status_id`	varchar(20)	NOT NULL,
	`image_path`	varchar(200)	NOT NULL,
	`image_file_name`	varchar(200)	NOT NULL,
	`image_extension`	varchar(10)	NOT NULL,
	`image_created_date`	date	NOT NULL,
    
    CONSTRAINT PK_IMAGE PRIMARY KEY(`image_id`)
);

CREATE TABLE `order_detail_status` (
	`order_detail_status_id`	varchar(20)	NOT NULL,
    `order_detail_status_created_date` date NOT NULL,
    
    CONSTRAINT PK_ORDER_DETAIL_STATUS PRIMARY KEY(`order_detail_status_id`)
);

CREATE TABLE `point_rule_name` (
	`point_rule_name_id`	varchar(50)	NOT NULL,
    `point_rule_name_created_date` date NOT NULL,
    
    CONSTRAINT PK_POINT_RULE_NAME PRIMARY KEY(`point_rule_name_id`)
);

CREATE TABLE `return_rule_name` (
	`return_rule_name_id`	varchar(50)	NOT NULL,
	`return_rule_name_created_date`	date	NOT NULL,
    
    CONSTRAINT PK_RETURN_RULE_NAME PRIMARY KEY(`return_rule_name_id`)
);

CREATE TABLE `delivery_rule_name` (
	`delivery_rule_name_id`	varchar(50)	NOT NULL,
	`delivery_rule_name_created_date`	date	NOT NULL,
    
    CONSTRAINT PK_DELIVERY_RULE_NAME PRIMARY KEY(`delivery_rule_name_id`)
);

CREATE TABLE `image_status` (
	`image_status_id`	varchar(20)	NOT NULL,
    
    CONSTRAINT PK_IMAGE_STATUS PRIMARY KEY(`image_status_id`)
);

ALTER TABLE `book_tag` ADD CONSTRAINT `PK_BOOK_TAG` PRIMARY KEY (
	`book_id`,
	`tag_id`
);

ALTER TABLE `book_category` ADD CONSTRAINT `PK_BOOK_CATEGORY` PRIMARY KEY (
	`book_id`,
	`category_id`
);

ALTER TABLE `book_author` ADD CONSTRAINT `PK_BOOK_AUTHOR` PRIMARY KEY (
	`book_id`,
	`author_id`
);

ALTER TABLE `book_like` ADD CONSTRAINT `PK_BOOK_LIKE` PRIMARY KEY (
	`book_id`,
	`user_id`
);

ALTER TABLE `user` ADD CONSTRAINT `FK_user_grade_TO_user_1` FOREIGN KEY (
	`user_grade_id`
)
REFERENCES `user_grade` (
	`user_grade_id`
);

ALTER TABLE `user` ADD CONSTRAINT `FK_user_status_TO_user_1` FOREIGN KEY (
	`user_status_id`
)
REFERENCES `user_status` (
	`user_status_id`
);

ALTER TABLE `user_grade` ADD CONSTRAINT `FK_user_grade_name_TO_user_grade_1` FOREIGN KEY (
    `user_grade_name_id`
)
REFERENCES `user_grade_name` (
    `user_grade_name_id`
);

ALTER TABLE `address` ADD CONSTRAINT `FK_user_TO_address_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `book_order` ADD CONSTRAINT `FK_user_TO_book_order_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `book_order` ADD CONSTRAINT `FK_orders_status_TO_book_order_1` FOREIGN KEY (
	`orders_status_id`
)
REFERENCES `orders_status` (
	`orders_status_id`
);

ALTER TABLE `book_order` ADD CONSTRAINT `FK_delivery_rule_TO_book_order_1` FOREIGN KEY (
	`delivery_rule_id`
)
REFERENCES `delivery_rule` (
	`delivery_rule_id`
);

ALTER TABLE `book_order` ADD CONSTRAINT `FK_user_coupon_TO_book_order_1` FOREIGN KEY (
	`user_coupon_id`
)
REFERENCES `user_coupon` (
	`user_coupon_id`
);

ALTER TABLE `book_order` ADD CONSTRAINT `FK_wrap_TO_book_order_1` FOREIGN KEY (
	`wrap_id`
)
REFERENCES `wrap` (
	`wrap_id`
);

ALTER TABLE `delivery_rule` ADD CONSTRAINT `FK_delivery_rule_name_TO_delivery_rule_1` FOREIGN KEY (
	`delivery_rule_name_id`
)
REFERENCES `delivery_rule_name` (
	`delivery_rule_name_id`
);

ALTER TABLE `category` ADD CONSTRAINT `FK_category_TO_category_1` FOREIGN KEY (
	`parent_category_id`
)
REFERENCES `category` (
	`category_id`
);

ALTER TABLE `book` ADD CONSTRAINT `FK_book_status_TO_book_1` FOREIGN KEY (
	`book_status_id`
)
REFERENCES `book_status` (
	`book_status_id`
);

ALTER TABLE `book` ADD CONSTRAINT `FK_publisher_TO_book_1` FOREIGN KEY (
	`publisher_id`
)
REFERENCES `publisher` (
	`publisher_id`
);

ALTER TABLE `book_tag` ADD CONSTRAINT `FK_book_TO_book_tag_1` FOREIGN KEY (
	`book_id`
)
REFERENCES `book` (
	`book_id`
);

ALTER TABLE `book_tag` ADD CONSTRAINT `FK_tag_TO_book_tag_1` FOREIGN KEY (
	`tag_id`
)
REFERENCES `tag` (
	`tag_id`
);

ALTER TABLE `cart` ADD CONSTRAINT `FK_user_TO_cart_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `cart_detail` ADD CONSTRAINT `FK_cart_TO_cart_detail_1` FOREIGN KEY (
	`cart_id`
)
REFERENCES `cart` (
	`cart_id`
);

ALTER TABLE `cart_detail` ADD CONSTRAINT `FK_book_TO_cart_detail_1` FOREIGN KEY (
	`book_id`
)
REFERENCES `book` (
	`book_id`
);

ALTER TABLE `book_category` ADD CONSTRAINT `FK_book_TO_book_category_1` FOREIGN KEY (
	`book_id`
)
REFERENCES `book` (
	`book_id`
);

ALTER TABLE `book_category` ADD CONSTRAINT `FK_category_TO_book_category_1` FOREIGN KEY (
	`category_id`
)
REFERENCES `category` (
	`category_id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_user_TO_review_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_order_detail_to_review_1` FOREIGN KEY (
    `order_detail_id`
)
REFERENCES `order_detail` (
    `order_detail_id`
);

ALTER TABLE `order_detail` ADD CONSTRAINT `FK_book_order_TO_order_detail_1` FOREIGN KEY (
	`order_id`
)
REFERENCES `book_order` (
	`order_id`
);

ALTER TABLE `order_detail` ADD CONSTRAINT `FK_book_TO_order_detail_1` FOREIGN KEY (
	`book_id`
)
REFERENCES `book` (
	`book_id`
);

ALTER TABLE `order_detail` ADD CONSTRAINT `FK_order_detail_status_TO_order_detail_1` FOREIGN KEY (
	`order_detail_status_id`
)
REFERENCES `order_detail_status` (
	`order_detail_status_id`
);

ALTER TABLE `order_detail` ADD CONSTRAINT `FK_user_coupon_TO_order_detail_1` FOREIGN KEY (
	`user_coupon_id`
)
REFERENCES `user_coupon` (
	`user_coupon_id`
);

ALTER TABLE `point_history` ADD CONSTRAINT `FK_user_TO_point_history_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `point_history` ADD CONSTRAINT `FK_book_order_TO_point_history_1` FOREIGN KEY (
	`order_id`
)
REFERENCES `book_order` (
	`order_id`
);

ALTER TABLE `point_history` ADD CONSTRAINT `FK_point_rule_TO_point_history_1` FOREIGN KEY (
	`point_rule_id`
)
REFERENCES `point_rule` (
	`point_rule_id`
);

ALTER TABLE `point_rule` ADD CONSTRAINT `FK_point_rule_name_TO_point_rule_1` FOREIGN KEY (
	`point_rule_name_id`
)
REFERENCES `point_rule_name` (
	`point_rule_name_id`
);

ALTER TABLE `coupon` ADD CONSTRAINT `FK_book_TO_coupon_1` FOREIGN KEY (
	`book_id`
)
REFERENCES `book` (
	`book_id`
);

ALTER TABLE `coupon` ADD CONSTRAINT `FK_category_TO_coupon_1` FOREIGN KEY (
	`category_id`
)
REFERENCES `category` (
	`category_id`
);

ALTER TABLE `user_coupon` ADD CONSTRAINT `FK_user_TO_user_coupon_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `user_coupon` ADD CONSTRAINT `FK_coupon_TO_user_coupon_1` FOREIGN KEY (
	`coupon_id`
)
REFERENCES `coupon` (
	`coupon_id`
);

ALTER TABLE `book_author` ADD CONSTRAINT `FK_book_TO_book_author_1` FOREIGN KEY (
	`book_id`
)
REFERENCES `book` (
	`book_id`
);

ALTER TABLE `book_author` ADD CONSTRAINT `FK_author_TO_book_author_1` FOREIGN KEY (
	`author_id`
)
REFERENCES `author` (
	`author_id`
);

ALTER TABLE `book_like` ADD CONSTRAINT `FK_book_TO_book_like_1` FOREIGN KEY (
	`book_id`
)
REFERENCES `book` (
	`book_id`
);

ALTER TABLE `book_like` ADD CONSTRAINT `FK_user_TO_book_like_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `payment` ADD CONSTRAINT `FK_book_order_TO_payment_1` FOREIGN KEY (
	`order_id`
)
REFERENCES `book_order` (
	`order_id`
);

ALTER TABLE `return_rule` ADD CONSTRAINT `FK_return_rule_name_TO_return_rule_1` FOREIGN KEY (
	`return_rule_name_id`
)
REFERENCES `return_rule_name` (
	`return_rule_name_id`
);

ALTER TABLE `return_detail` ADD CONSTRAINT `FK_book_return_TO_return_detail_1` FOREIGN KEY (
	`book_return_id`
)
REFERENCES `book_return` (
	`book_return_id`
);

ALTER TABLE `return_detail` ADD CONSTRAINT `FK_order_detail_TO_return_detail_1` FOREIGN KEY (
	`order_detail_id`
)
REFERENCES `order_detail` (
	`order_detail_id`
);

ALTER TABLE `book_return` ADD CONSTRAINT `FK_return_rule_TO_book_return_1` FOREIGN KEY (
	`return_rule_id`
)
REFERENCES `return_rule` (
	`return_rule_id`
);

ALTER TABLE `image` ADD CONSTRAINT `FK_Review_TO_image_1` FOREIGN KEY (
	`review_id`
)
REFERENCES `review` (
	`review_id`
);

ALTER TABLE `image` ADD CONSTRAINT `FK_book_TO_image_1` FOREIGN KEY (
	`book_id`
)
REFERENCES `book` (
	`book_id`
);

ALTER TABLE `image` ADD CONSTRAINT `FK_image_status_TO_image_1` FOREIGN KEY (
	`image_status_id`
)
REFERENCES `image_status` (
	`image_status_id`
);