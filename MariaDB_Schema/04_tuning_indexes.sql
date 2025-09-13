CREATE INDEX idx_cartitem_product_id ON CartItem (product_id);

CREATE INDEX idx_order_total_amount ON `Order` (total_amount);

CREATE INDEX idx_product_category_id ON Product (category_id);
CREATE INDEX idx_category_name_parent ON Category (category_name, parent_category_id);

CREATE INDEX idx_order_customer_id_amount ON `Order` (customer_id, total_amount);

CREATE INDEX idx_product_category_price ON Product (category_id, price);

CREATE INDEX idx_order_customer_id ON `Order` (customer_id);

CREATE INDEX idx_customer_last_name ON Customer (last_name);

CREATE FULLTEXT INDEX idx_product_name_ft ON Product (product_name);

CREATE INDEX idx_order_date ON `Order` (order_date);

CREATE INDEX idx_product_category_id ON Product (category_id);