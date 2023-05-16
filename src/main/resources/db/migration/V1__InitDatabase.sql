
CREATE TABLE `cart` (
                        `id` int(11) NOT NULL,
                        `user_id` int(11) NOT NULL,
                        `product_id` int(11) NOT NULL,
                        `quantity` int(11) NOT NULL,
                        `amount` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `categories` (
                              `id` bigint(20) NOT NULL,
                              `category` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `categories` (`id`, `category`) VALUES
                                                (1, 'Vape'),
                                                (2, 'Pod'),
                                                (3, 'Сartridge'),
                                                (4, 'Liquid');
CREATE TABLE `orders` (
                          `id` int(11) NOT NULL,
                          `user_id` int(11) NOT NULL,
                          `order_date` datetime NOT NULL,
                          `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `shipping_address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `shipping_city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `shipping_state` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `shipping_country` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `shipping_zipcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `order_details` (
                                 `id` int(11) NOT NULL,
                                 `order_id` int(11) NOT NULL,
                                 `product_id` int(11) NOT NULL,
                                 `quantity` int(11) NOT NULL,
                                 `amount` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `products` (
                            `id` int(11) NOT NULL,
                            `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
                            `price` decimal(10,2) NOT NULL,
                            `quantity` int(11) NOT NULL,
                            `photo_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `category_id` bigint(20) NOT NULL,
                            `number_of_orders` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `users` (
                         `id` int(11) NOT NULL,
                         `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `registration_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `cart`
    ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);
ALTER TABLE `categories`
    ADD PRIMARY KEY (`id`);
ALTER TABLE `orders`
    ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);
ALTER TABLE `order_details`
    ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);
ALTER TABLE `products`
    ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`);
ALTER TABLE `cart`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `categories`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `orders`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `order_details`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `products`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
ALTER TABLE `users`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
ALTER TABLE `cart`
    ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
ALTER TABLE `orders`
    ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `order_details`
    ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
ALTER TABLE `products`
    ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

