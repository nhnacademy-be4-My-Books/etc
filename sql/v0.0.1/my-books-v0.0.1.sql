DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
	`user_id`	bigint	NOT NULL	DEFAULT Auto Increment,
	`user_grade_id`	int	NOT NULL,
	`user_status_id`	int	NOT NULL,
	`user_password`	varchar(20)	NOT NULL,
	`user_name`	varchar(30)	NOT NULL,
	`user_phonenumber`	varchar(13)	NOT NULL,
	`user_email`	varchar(30)	NOT NULL	COMMENT 'unique',
	`user_birth`	date	NOT NULL,
	`is_admin`	boolean	NOT NULL,
	`user_point`	int	NOT NULL,
	`user_created_at`	datetime	NOT NULL,
	`user_lastest_login`	datetime	NULL,
	`user_delete_at`	datetime	NULL
);

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
	`address_id`	bigint	NOT NULL	DEFAULT Auto Increment,
	`user_id`	bigint	NOT NULL,
	`address_alias`	varchar(15)	NOT NULL,
	`address_address`	varchar(150)	NOT NULL
);

DROP TABLE IF EXISTS `book_order`;

CREATE TABLE `book_order` (
	`order_id`	bigint	NOT NULL	DEFAULT Auto Increment,
	`user_id`	bigint	NOT NULL,
	`orders_status_id`	int	NOT NULL,
	`delivery_rule_id`	int	NOT NULL,
	`user_coupon_id`	bigint	NULL,
	`wrap_id`	int	NULL,
	`order_outdate`	date	NOT NULL,
	`order_date`	date	NOT NULL,
	`order_ invoice_number`	varchar(20)	NULL	COMMENT 'unique',
	`order_receiver_name`	varchar(30)	NOT NULL,
	`order_receiver_address`	varchar(100)	NOT NULL,
	`order_receiver_phonenumber`	varchar(13)	NOT NULL,
	`order_receiver_message`	varchar(50)	NULL,
	`order_total_cost`	int	NOT NULL,
	`order_point_cost`	int	NULL,
	`order_coupon_cost`	int	NULL,
	`is_coupon_used`	boolean	NULL,
	`order_number`	varchar(20)	NOT NULL	COMMENT 'unique',
	`order_find_password`	varchar(6)	NULL
);

DROP TABLE IF EXISTS `delivery_rule`;

CREATE TABLE `delivery_rule` (
	`delivery_rule_id`	int	NOT NULL	DEFAULT Auto Increment,
	`delivery_name_role_id`	int	NOT NULL,
	`delivery_company_name`	varchar(20)	NOT NULL,
	`delivery_cost`	int	NOT NULL,
	`delivery_rule_cost`	int	NOT NULL,
	`delivery_rule_created_at`	date	NOT NULL,
	`is_available`	boolean	NOT NULL	DEFAULT true
);

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
	`tag_id`	int	NOT NULL	DEFAULT Auto Increment,
	`tag_name`	varchar(20)	NOT NULL	COMMENT 'unique',
	`tag_created_at`	date	NOT NULL
);

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
	`category_id`	int	NOT NULL	DEFAULT Auto Increment,
	`parent_category_id`	int	NOT NULL,
	`category_name`	varchar(20)	NOT NULL	COMMENT 'unique',
	`category_created_at`	date	NOT NULL
);

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
	`book_id`	bigint	NOT NULL	DEFAULT Auto Increment,
	`book_status_id`	int	NOT NULL,
	`publisher_id`	int	NOT NULL,
	`book_name`	varchar(100)	NOT NULL,
	`book_isbn`	varchar(13)	NOT NULL,
	`book_publishdate`	date	NOT NULL,
	`book_page`	int	NOT NULL,
	`book_index`	text	NOT NULL,
	`book_content`	text	NOT NULL,
	`book_original_cost`	int	NOT NULL,
	`book_sale_cost`	int	NOT NULL,
	`book_discount_rate`	int	NOT NULL,
	`book_stock`	int	NOT NULL,
	`book_viewcount`	int	NOT NULL,
	`book_total_score`	int	NOT NULL,
	`book_review_count`	int	NOT NULL,
	`book_like_count`	int	NOT NULL,
	`is_packaging`	boolean	NOT NULL,
	`book_created_at`	date	NOT NULL
);

DROP TABLE IF EXISTS `book_tag`;

CREATE TABLE `book_tag` (
	`book_id`	bigint	NOT NULL,
	`tag_id`	int	NOT NULL
);

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
	`cart_id`	bigint	NOT NULL	DEFAULT Auto Increment,
	`user_id`	bigint	NOT NULL
);

DROP TABLE IF EXISTS `cart_detail`;

CREATE TABLE `cart_detail` (
	`cart_detail_id`	bigint	NOT NULL	DEFAULT Auto Increment,
	`cart_id`	bigint	NOT NULL,
	`book_id`	bigint	NOT NULL,
	`cart_detail_amount`	int	NOT NULL
);

DROP TABLE IF EXISTS `user_grade`;

CREATE TABLE `user_grade` (
	`user_grade_id`	int	NOT NULL	DEFAULT Auto Increment,
	`user_grade_name`	varchar(10)	NOT NULL	COMMENT 'unique',
	`user_grade_min`	int	NOT NULL,
	`user_grade_max`	int	NOT NULL,
	`user_grade_rate`	int	NOT NULL,
	`user_grade_created_at`	date	NOT NULL
);

DROP TABLE IF EXISTS `book_category`;

CREATE TABLE `book_category` (
	`book_id`	bigint	NOT NULL,
	`category_id`	int	NOT NULL
);

DROP TABLE IF EXISTS `author`;

CREATE TABLE `author` (
	`author_id`	int	NOT NULL	DEFAULT Auto Increment,
	`author_name`	varchar(30)	NOT NULL,
	`author_content`	text	NULL,
	`author_created_at`	date	NOT NULL
);

DROP TABLE IF EXISTS `Review`;

CREATE TABLE `Review` (
	`review_id`	bigint	NOT NULL	DEFAULT Auto Increment,
	`user_id`	bigint	NOT NULL,
	`book_id`	bigint	NOT NULL,
	`review_rate`	int	NOT NULL,
	`review_date`	date	NOT NULL,
	`review_title`	varchar(50)	NOT NULL,
	`review_content`	text	NOT NULL
);

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
	`order_detail_id`	bigint	NOT NULL	DEFAULT Auto Increment,
	`order_id`	bigint	NOT NULL,
	`book_id`	bigint	NOT NULL,
	`order_detail_status_id`	int	NOT NULL,
	`user_coupon_id`	bigint	NULL,
	`book_cost`	int	NOT NULL,
	`order_detail_amount`	int	NOT NULL,
	`is_coupon_used`	boolean	NOT NULL
);

DROP TABLE IF EXISTS `point_history`;

CREATE TABLE `point_history` (
	`point_history_id`	bigint	NOT NULL	DEFAULT Autu Increment,
	`user_id`	bigint	NOT NULL,
	`order_id`	bigint	NULL,
	`point_rule_id`	int	NOT NULL,
	`is_ accumulate`	boolean	NOT NULL,
	`point_status_cost`	int	NOT NULL,
	`point_history_created_at`	date	NOT NULL
);

DROP TABLE IF EXISTS `point_rule`;

CREATE TABLE `point_rule` (
	`point_rule_id`	int	NOT NULL	DEFAULT Auto Increment,
	`point_name_id`	int	NOT NULL,
	`point_rule_rate`	int	NULL,
	`point_rule_cost`	int	NULL,
	`point_rule_created_at`	date	NOT NULL
);

DROP TABLE IF EXISTS `coupon`;

CREATE TABLE `coupon` (
	`coupon_id`	biginteger	NOT NULL	DEFAULT Auto Increment,
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
	`coupon_created_at`	date	NOT NULL
);

DROP TABLE IF EXISTS `user_coupon`;

CREATE TABLE `user_coupon` (
	`user_coupon_id`	bigint	NOT NULL	DEFAULT Auto Increment,
	`user_id`	bigint	NOT NULL,
	`coupon_id`	bigint	NOT NULL,
	`user_coupon_regist`	date	NOT NULL,
	`user_coupon_date`	date	NULL,
	`is_used`	boolean	NOT NULL
);

DROP TABLE IF EXISTS `wrap`;

CREATE TABLE `wrap` (
	`wrap_id`	int	NOT NULL	DEFAULT Auto Increment,
	`wrap_name`	varchar(20)	NOT NULL,
	`wrap_cost`	int	NOT NULL,
	`wrap_created_at`	date	NOT NULL,
	`is_available`	boolean	NOT NULL	DEFAULT true
);

DROP TABLE IF EXISTS `book_author`;

CREATE TABLE `book_author` (
	`book_id`	bigint	NOT NULL,
	`author_id`	int	NOT NULL
);

DROP TABLE IF EXISTS `publisher`;

CREATE TABLE `publisher` (
	`publisher_id`	int	NOT NULL	DEFAULT Auto Increment,
	`publisher_name`	varchar(30)	NULL,
	`publisher_created_at`	date	NOT NULL
);

DROP TABLE IF EXISTS `book_status`;

CREATE TABLE `book_status` (
	`book_status_id`	int	NOT NULL	DEFAULT Auto Increment,
	`book_status_name`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `book_like`;

CREATE TABLE `book_like` (
	`book_id`	bigint	NOT NULL,
	`user_id`	bigint	NOT NULL
);

DROP TABLE IF EXISTS `user_status`;

CREATE TABLE `user_status` (
	`user_status_id`	int	NOT NULL	DEFAULT Auto Increment,
	`user_status_name`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `orders_status`;

CREATE TABLE `orders_status` (
	`orders_status_id`	int	NOT NULL	DEFAULT Auto Increment,
	`orders_status_name`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
	`payment_id`	bigint	NOT NULL	DEFAULT Auto Increment,
	`order_id`	bigint	NOT NULL,
	`payment_datetime`	datetime	NOT NULL,
	`payment_order_number`	varcher(30)	NOT NULL,
	`payment_status`	varchar(20)	NOT NULL,
	`payment_buyer`	varchar(20)	NOT NULL,
	`payment_cost`	int	NOT NULL,
	`payment_type`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `return_rule`;

CREATE TABLE `return_rule` (
	`return _rule_id`	int	NOT NULL	DEFAULT Auto Increment,
	`return_name_rule_id`	int	NOT NULL,
	`return_rule_delivery_fee`	int	NOT NULL,
	`return_rule_term`	int	NOT NULL,
	`is_available`	boolean	NOT NULL	DEFAULT true,
	`return_created_at`	date	NOT NULL
);

DROP TABLE IF EXISTS `return_detail`;

CREATE TABLE `return_detail` (
	`return_detail_id`	bigint	NOT NULL	DEFAULT Auto Increment,
	`book_return_id`	bigint	NOT NULL,
	`order_detail_id`	bigint	NOT NULL,
	`return_detail_amount`	int	NOT NULL
);

DROP TABLE IF EXISTS `book_return`;

CREATE TABLE `book_return` (
	`book_return_id`	bigint	NOT NULL	DEFAULT Auto Increment,
	`return _rule_id`	int	NOT NULL,
	`is_damage`	boolean	NOT NULL,
	`return_date`	date	NOT NULL
);

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
	`image_id`	bigint	NOT NULL	DEFAULT Auto Increment,
	`review_id`	bigint	NULL,
	`book_id`	bigint	NULL,
	`image_status_id`	int	NOT NULL	DEFAULT Auto Increment,
	`image_path`	varchar(150)	NOT NULL,
	`image_file_name`	varchar(30)	NOT NULL,
	`image_extension`	varchar(10)	NOT NULL,
	`image_created_at`	date	NOT NULL
);

DROP TABLE IF EXISTS `order_detail_status`;

CREATE TABLE `order_detail_status` (
	`order_detail_status_id`	int	NOT NULL	DEFAULT Auto Increment,
	`order_detail_status_name`	varcher(20)	NOT NULL
);

DROP TABLE IF EXISTS `point_name_rule`;

CREATE TABLE `point_name_rule` (
	`point_name_rule_id`	int	NOT NULL	DEFAULT Auto Increment,
	`point_name`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `return_name_rule`;

CREATE TABLE `return_name_rule` (
	`return_name_rule_id`	int	NOT NULL	DEFAULT Auto Increment,
	`return_name`	varcher(50)	NOT NULL,
	`return_name_created_at`	date	NOT NULL
);

DROP TABLE IF EXISTS `delivery_name_role`;

CREATE TABLE `delivery_name_role` (
	`delivery_name_role_id`	int	NOT NULL	DEFAULT Auto Increment,
	`delivery_name`	varchar(50)	NOT NULL,
	`delivery_name_created_at`	date	NOT NULL
);

DROP TABLE IF EXISTS `image_status`;

CREATE TABLE `image_status` (
	`image_status_id`	int	NOT NULL	DEFAULT Auto Increment,
	`image_status_name`	varchar(20)	NOT NULL
);

ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `address` ADD CONSTRAINT `PK_ADDRESS` PRIMARY KEY (
	`address_id`
);

ALTER TABLE `book_order` ADD CONSTRAINT `PK_BOOK_ORDER` PRIMARY KEY (
	`order_id`
);

ALTER TABLE `delivery_rule` ADD CONSTRAINT `PK_DELIVERY_RULE` PRIMARY KEY (
	`delivery_rule_id`
);

ALTER TABLE `tag` ADD CONSTRAINT `PK_TAG` PRIMARY KEY (
	`tag_id`
);

ALTER TABLE `category` ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
	`category_id`
);

ALTER TABLE `book` ADD CONSTRAINT `PK_BOOK` PRIMARY KEY (
	`book_id`
);

ALTER TABLE `book_tag` ADD CONSTRAINT `PK_BOOK_TAG` PRIMARY KEY (
	`book_id`,
	`tag_id`
);

ALTER TABLE `cart` ADD CONSTRAINT `PK_CART` PRIMARY KEY (
	`cart_id`
);

ALTER TABLE `cart_detail` ADD CONSTRAINT `PK_CART_DETAIL` PRIMARY KEY (
	`cart_detail_id`
);

ALTER TABLE `user_grade` ADD CONSTRAINT `PK_USER_GRADE` PRIMARY KEY (
	`user_grade_id`
);

ALTER TABLE `book_category` ADD CONSTRAINT `PK_BOOK_CATEGORY` PRIMARY KEY (
	`book_id`,
	`category_id`
);

ALTER TABLE `author` ADD CONSTRAINT `PK_AUTHOR` PRIMARY KEY (
	`author_id`
);

ALTER TABLE `Review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`review_id`
);

ALTER TABLE `order_detail` ADD CONSTRAINT `PK_ORDER_DETAIL` PRIMARY KEY (
	`order_detail_id`
);

ALTER TABLE `point_history` ADD CONSTRAINT `PK_POINT_HISTORY` PRIMARY KEY (
	`point_history_id`
);

ALTER TABLE `point_rule` ADD CONSTRAINT `PK_POINT_RULE` PRIMARY KEY (
	`point_rule_id`
);

ALTER TABLE `coupon` ADD CONSTRAINT `PK_COUPON` PRIMARY KEY (
	`coupon_id`
);

ALTER TABLE `user_coupon` ADD CONSTRAINT `PK_USER_COUPON` PRIMARY KEY (
	`user_coupon_id`
);

ALTER TABLE `wrap` ADD CONSTRAINT `PK_WRAP` PRIMARY KEY (
	`wrap_id`
);

ALTER TABLE `book_author` ADD CONSTRAINT `PK_BOOK_AUTHOR` PRIMARY KEY (
	`book_id`,
	`author_id`
);

ALTER TABLE `publisher` ADD CONSTRAINT `PK_PUBLISHER` PRIMARY KEY (
	`publisher_id`
);

ALTER TABLE `book_status` ADD CONSTRAINT `PK_BOOK_STATUS` PRIMARY KEY (
	`book_status_id`
);

ALTER TABLE `book_like` ADD CONSTRAINT `PK_BOOK_LIKE` PRIMARY KEY (
	`book_id`,
	`user_id`
);

ALTER TABLE `user_status` ADD CONSTRAINT `PK_USER_STATUS` PRIMARY KEY (
	`user_status_id`
);

ALTER TABLE `orders_status` ADD CONSTRAINT `PK_ORDERS_STATUS` PRIMARY KEY (
	`orders_status_id`
);

ALTER TABLE `payment` ADD CONSTRAINT `PK_PAYMENT` PRIMARY KEY (
	`payment_id`
);

ALTER TABLE `return_rule` ADD CONSTRAINT `PK_RETURN_RULE` PRIMARY KEY (
	`return _rule_id`
);

ALTER TABLE `return_detail` ADD CONSTRAINT `PK_RETURN_DETAIL` PRIMARY KEY (
	`return_detail_id`
);

ALTER TABLE `book_return` ADD CONSTRAINT `PK_BOOK_RETURN` PRIMARY KEY (
	`book_return_id`
);

ALTER TABLE `image` ADD CONSTRAINT `PK_IMAGE` PRIMARY KEY (
	`image_id`
);

ALTER TABLE `order_detail_status` ADD CONSTRAINT `PK_ORDER_DETAIL_STATUS` PRIMARY KEY (
	`order_detail_status_id`
);

ALTER TABLE `point_name_rule` ADD CONSTRAINT `PK_POINT_NAME_RULE` PRIMARY KEY (
	`point_name_rule_id`
);

ALTER TABLE `return_name_rule` ADD CONSTRAINT `PK_RETURN_NAME_RULE` PRIMARY KEY (
	`return_name_rule_id`
);

ALTER TABLE `delivery_name_role` ADD CONSTRAINT `PK_DELIVERY_NAME_ROLE` PRIMARY KEY (
	`delivery_name_role_id`
);

ALTER TABLE `image_status` ADD CONSTRAINT `PK_IMAGE_STATUS` PRIMARY KEY (
	`image_status_id`
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

ALTER TABLE `delivery_rule` ADD CONSTRAINT `FK_delivery_name_role_TO_delivery_rule_1` FOREIGN KEY (
	`delivery_name_role_id`
)
REFERENCES `delivery_name_role` (
	`delivery_name_role_id`
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

ALTER TABLE `Review` ADD CONSTRAINT `FK_user_TO_Review_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `Review` ADD CONSTRAINT `FK_book_TO_Review_1` FOREIGN KEY (
	`book_id`
)
REFERENCES `book` (
	`book_id`
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

ALTER TABLE `point_rule` ADD CONSTRAINT `FK_point_name_rule_TO_point_rule_1` FOREIGN KEY (
	`point_name_id`
)
REFERENCES `point_name_rule` (
	`point_name_rule_id`
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

ALTER TABLE `return_rule` ADD CONSTRAINT `FK_return_name_rule_TO_return_rule_1` FOREIGN KEY (
	`return_name_rule_id`
)
REFERENCES `return_name_rule` (
	`return_name_rule_id`
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
	`return _rule_id`
)
REFERENCES `return_rule` (
	`return _rule_id`
);

ALTER TABLE `image` ADD CONSTRAINT `FK_Review_TO_image_1` FOREIGN KEY (
	`review_id`
)
REFERENCES `Review` (
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

