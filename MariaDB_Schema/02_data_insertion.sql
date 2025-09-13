INSERT INTO Customer (email, password_hash, first_name, last_name, phone, registration_date) VALUES
('alice.johnson@email.com', 'hash1', 'Alice', 'Johnson', '123-456-7890', '2024-01-15'),
('bob.smith@email.com', 'hash2', 'Bob', 'Smith', '123-456-7891', '2024-02-20'),
('charlie.brown@email.com', 'hash3', 'Charlie', 'Brown', NULL, '2024-03-05'),
('diana.prince@email.com', 'hash4', 'Diana', 'Prince', '123-456-7893', '2024-03-10'),
('evan.lee@email.com', 'hash5', 'Evan', 'Lee', '123-456-7894', '2024-04-22'),
('fiona.campbell@email.com', 'hash6', 'Fiona', 'Campbell', '123-456-7895', '2024-05-30');

INSERT INTO Category (category_name, description, parent_category_id) VALUES
('Electronics', 'Gadgets and devices', NULL),
('Computers', 'Desktop and laptop computers', 1),
('Laptops', 'Portable computers', 2),
('Smartphones', 'Mobile phones', 1),
('Fashion', 'Clothing and accessories', NULL),
('Men''s Clothing', 'Clothing for men', 5);

INSERT INTO Product (product_name, description, price, stock_quantity, weight, date_added, status, category_id) VALUES
('Smartphone X', 'Latest model with high-resolution camera', 749.99, 50, 0.2, '2024-05-01', 'Active', 4),
('Gaming Laptop Pro', 'Powerful laptop for gaming and productivity', 1599.99, 15, 2.5, '2024-04-15', 'Active', 3),
('Wireless Earbuds', 'Noise-cancelling wireless earbuds', 129.99, 100, 0.05, '2024-05-10', 'Active', 1),
('Cotton T-Shirt', '100% cotton, comfortable fit', 24.99, 200, 0.3, '2024-03-20', 'Active', 6),
('Men''s Running Shoes', 'Lightweight and breathable for running', 89.99, 75, 0.8, '2024-02-25', 'Active', 6),
('Bluetooth Speaker', 'Portable speaker with 10-hour battery', 59.99, 30, 0.7, '2024-05-05', 'Active', 1);

INSERT INTO ProductImage (product_id, image_url) VALUES
(1, 'https://example.com/images/smartphone_x_1.jpg'),
(1, 'https://example.com/images/smartphone_x_2.jpg'), -- Product 1 has 2 images
(2, 'https://example.com/images/laptop_pro_1.jpg'),
(3, 'https://example.com/images/earbuds_1.jpg'),
(4, 'https://example.com/images/tshirt_1.jpg'),
(5, 'https://example.com/images/runningshoes_1.jpg');
-- Product 6 intentionally has no image for later DELETE operation

INSERT INTO Address (customer_id, address_line1, address_line2, city, state, zip_code, address_type) VALUES
(1, '123 Main St', 'Apt 4B', 'Colombo', 'Western', '10000', 'Shipping'),
(1, '456 Central Rd', NULL, 'Galle', 'Southern', '20000', 'Billing'), -- Customer 1 has 2 addresses
(2, '789 Park Ave', NULL, 'Kandy', 'Central', '30000', 'Shipping'),
(3, '321 Oak Lane', 'Floor 5', 'Jaffna', 'Northern', '40000', 'Billing'),
(4, '555 Beach Rd', NULL, 'Matara', 'Southern', '50000', 'Shipping'),
(5, '999 Hill St', 'Suite 100', 'Negombo', 'Western', '60000', 'Shipping');

INSERT INTO ShoppingCart (creation_date, customer_id) VALUES
('2024-06-01', 1),
('2024-06-02', 2),
('2024-06-03', 3),
('2024-06-04', 4),
('2024-06-05', 5),
('2024-06-06', 6);

INSERT INTO CartItem (cart_id, product_id, quantity) VALUES
(1, 1, 1),  -- Cart 1 has Product 1 (Smartphone X)
(1, 3, 2),  -- Cart 1 also has Product 3 (Wireless Earbuds), quantity 2
(2, 4, 5),  -- Cart 2 has Product 4 (Cotton T-Shirt), quantity 5
(3, 2, 1),  -- Cart 3 has Product 2 (Gaming Laptop Pro)
(4, 5, 1),  -- Cart 4 has Product 5 (Running Shoes)
(5, 6, 2);  -- Cart 5 has Product 6 (Bluetooth Speaker), quantity 2
-- Cart 6 is intentionally left empty for demonstration

INSERT INTO `Order` (order_date, total_amount, status, customer_id) VALUES
('2024-06-10 09:30:00', 749.99, 'Paid', 1),          -- Order for Customer 1
('2024-06-11 14:22:15', 124.95, 'Shipped', 2),       -- Order for Customer 2 (5 * 24.99 = 124.95)
('2024-06-12 10:05:43', 1599.99, 'Delivered', 3),    -- Order for Customer 3
('2024-06-13 16:45:30', 89.99, 'Pending', 4),        -- Order for Customer 4
('2024-06-14 11:11:11', 119.98, 'Paid', 5),          -- Order for Customer 5 (2 * 59.99 = 119.98)
('2024-06-15 12:00:00', 0.00, 'Pending', 6);         -- An empty "Pending" order for Customer 6

INSERT INTO OrderItem (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 749.99),   -- Order 1 contains 1x Smartphone X @ 749.99
(2, 4, 5, 24.99),    -- Order 2 contains 5x Cotton T-Shirt @ 24.99
(3, 2, 1, 1599.99),  -- Order 3 contains 1x Gaming Laptop Pro @ 1599.99
(4, 5, 1, 89.99),    -- Order 4 contains 1x Running Shoes @ 89.99
(5, 6, 2, 59.99),    -- Order 5 contains 2x Bluetooth Speaker @ 59.99
(1, 3, 1, 129.99);   -- Order 1 also contains 1x Wireless Earbuds @ 129.99
-- Note: This makes the total for Order 1 = 749.99 + 129.99 = 879.98, which we will update next.

INSERT INTO Payment (payment_method, amount, transaction_date, status, order_id) VALUES
('Credit Card', 879.98, '2024-06-10 09:31:05', 'Success', 1),
('PayPal', 124.95, '2024-06-11 14:25:00', 'Success', 2),
('Bank Transfer', 1599.99, '2024-06-12 10:06:20', 'Success', 3),
('Credit Card', 89.99, '2024-06-13 16:46:00', 'Failed', 4),  -- This payment failed
('Debit Card', 119.98, '2024-06-14 11:12:00', 'Success', 5),
-- Order 6 is still pending, so it has no payment record yet.
-- We'll insert a 6th payment for a different order to meet the requirement.
('Cash on Delivery', 0.00, '2024-06-15 12:00:00', 'Success', 6);