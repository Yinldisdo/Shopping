
INSERT INTO `products`(`id`, `name`, `description`, `key_word`, `price`, `counts`, `type`,`user_id`) VALUES (1, '机械键盘', '响应迅速准确，专业特游戏芯片', '机械键盘;电竞;光效', 199, 100, 2,'313aa95e193c4be6b11fceb92f0ea4aa');
INSERT INTO `products`(`id`, `name`, `description`, `key_word`, `price`, `counts`, `type`,`user_id`) VALUES (2, '床上桌', '可折叠简约学习小桌子', '学习；折叠桌', 39, 10, 5,'313aa95e193c4be6b11fceb92f0ea4aa');
INSERT INTO `products`(`id`, `name`, `description`, `key_word`, `price`, `counts`, `type`,`user_id`) VALUES (3, '羽毛球球拍', '全碳素纤维超轻专业羽毛球球拍！', '运动;球拍', 100, 30, 7,'313aa95e193c4be6b11fceb92f0ea4aa');
INSERT INTO `products`(`id`, `name`, `description`, `key_word`, `price`, `counts`, `type`,`user_id`) VALUES (4, '收纳篮', '带有挂钩的宿舍神器：上铺收纳架子', '收纳;宿舍好物;篮子', 5, 1, 5,'313aa95e193c4be6b11fceb92f0ea4aa');
INSERT INTO `products`(`id`, `name`, `description`, `key_word`, `price`, `counts`, `type`,`user_id`) VALUES (5, '蓝牙耳机', '无线降噪耳机，主动降噪空间音频', '降噪;耳机', 399, 250, 2,'313aa95e193c4be6b11fceb92f0ea4aa');
INSERT INTO `products`(`id`, `name`, `description`, `key_word`, `price`, `counts`, `type`,`user_id`) VALUES (6, '多功能计算器', '无存储多功能计算器，满足计算需求，可带入考场', '计算器，办公；学习', 20, 5, 3,'313aa95e193c4be6b11fceb92f0ea4aa');
INSERT INTO `products`(`id`, `name`, `description`, `key_word`, `price`, `counts`, `type`,`user_id`) VALUES (7, '衣服挂件', '可爱卡通挂件，12个装', '挂件；衣物；装饰;', 12, 5, 1,'313aa95e193c4be6b11fceb92f0ea4aa');
INSERT INTO `products`(`id`, `name`, `description`, `key_word`, `price`, `counts`, `type`,`user_id`) VALUES (8, '化妆品收纳盒', '整洁有序，节省空间', '化妆品；收纳', 15, 5, 6,'313aa95e193c4be6b11fceb92f0ea4aa');
INSERT INTO `products`(`id`, `name`, `description`, `key_word`, `price`, `counts`, `type`,`user_id`) VALUES (9, '钥匙扣', '包包挂件卡通可爱公仔钥匙扣', '钥匙扣;游戏', 32, 20, 4,'413aa95e193c4be6b11fceb92f0ea4aa');

INSERT INTO `user_main`(`id`, `name`, `email`, `nick_name`, `user_id`) VALUES (1, 'user1', 'admin@abc.com', 'admin', '313aa95e193c4be6b11fceb92f0ea4aa');
INSERT INTO `user_main`(`id`, `name`, `email`, `nick_name`, `user_id`) VALUES (3, 'user2', 'test@test.com', '123456', '413aa95e193c4be6b11fceb92f0ea4aa');
INSERT INTO `user_main`(`id`, `name`, `email`, `nick_name`, `user_id`) VALUES (2, 'user3', 'user1@abc.com', 'user1' ,'513aa95e193c4be6b11fceb92f0ea4aa');

INSERT INTO `user_detail`(`id`, `password`, `phone_number`, `sex`, `birthday`, `post_number`, `address`, `register_time`) VALUES (1, 'admin', '12345677654', 0, '2000-01-01', '000000', '地球', '2020-06-01 00:00:00');
INSERT INTO `user_detail`(`id`, `password`, `phone_number`, `sex`, `birthday`, `post_number`, `address`, `register_time`) VALUES (2, '123', '11111111111', 0, '2000-01-01', '000000', '地球', '2020-06-08 00:00:00');
INSERT INTO `user_detail`(`id`, `password`, `phone_number`, `sex`, `birthday`, `post_number`, `address`, `register_time`) VALUES (3, '123', '11111111111', 0, '2000-01-01', '000000', '地球', '2023-06-18 00:00:00');