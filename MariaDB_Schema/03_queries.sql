-- Select all records from the Customer table
SELECT * FROM Customer;

-- List only the names and emails of all customers
SELECT first_name, last_name, email FROM Customer;

-- Cartesian product between Category and Product (shows all possible combinations)
SELECT * FROM Category CROSS JOIN Product;

-- Create a view for active products with their categories
CREATE VIEW ActiveProducts AS
SELECT p.product_id, p.product_name, p.price, c.category_name
FROM Product p
JOIN Category c ON p.category_id = c.category_id
WHERE p.status = 'Active';
-- After creating, select from the view to show it works
SELECT * FROM ActiveProducts;

-- Rename columns in the output for readability
SELECT 
    customer_id AS "ID",
    first_name AS "First Name", 
    last_name AS "Last Name",
    email AS "Email Address"
FROM Customer;

-- Find the total number of products, average price, highest price, and lowest price
SELECT 
    COUNT(*) AS TotalProducts,
    AVG(price) AS AveragePrice,
    MAX(price) AS HighestPrice,
    MIN(price) AS LowestPrice,
    SUM(stock_quantity) AS TotalInventory
FROM Product;

-- Find all products whose name contains the word 'Phone'
SELECT product_id, product_name, price
FROM Product
WHERE product_name LIKE '%Phone%';

-- Combines customer names and product names into one list
SELECT first_name AS name, email AS detail FROM Customer
UNION
SELECT product_name, CAST(price AS CHAR) FROM Product; -- Cast price to CHAR to match email type

-- Using INNER JOIN which acts as an intersection
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM Customer c
INNER JOIN `Order` o ON c.customer_id = o.customer_id
INNER JOIN Address a ON c.customer_id = a.customer_id;

-- Products in the Product table minus products in the CartItem table
SELECT p.product_id, p.product_name
FROM Product p
WHERE p.product_id NOT IN (SELECT product_id FROM CartItem);

-- This mimics division by using a subquery with aggregation
SELECT c.customer_id, c.first_name, c.last_name, o.total_amount
FROM Customer c
JOIN `Order` o ON c.customer_id = o.customer_id
WHERE o.total_amount > (SELECT AVG(total_amount) FROM `Order`);

CREATE VIEW OrderDetails AS
SELECT o.order_id, o.order_date, o.total_amount, o.status, 
       c.customer_id, c.first_name, c.last_name
FROM `Order` o
JOIN Customer c ON o.customer_id = c.customer_id;

-- Uses the view
SELECT * FROM OrderDetails;

-- MariaDB performs a natural join on same-named columns
SELECT p.product_name, c.category_name
FROM Product p
NATURAL JOIN Category c;

SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date
FROM Customer c
LEFT JOIN `Order` o ON c.customer_id = o.customer_id;

-- Should show all orders, even if customer details are missing (unlikely due to FK)
SELECT o.order_id, o.order_date, c.customer_id, c.first_name, c.last_name
FROM Customer c
RIGHT JOIN `Order` o ON c.customer_id = o.customer_id;

-- Shows all customers and all orders, matching where possible
SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date
FROM Customer c
LEFT JOIN `Order` o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date
FROM Customer c
RIGHT JOIN `Order` o ON c.customer_id = o.customer_id;

-- This is not a standard operator. We show unrelated data side-by-side using UNION.
SELECT 
    'Customer' AS source, 
    CONCAT(first_name, ' ', last_name) AS name, 
    NULL AS product_name 
FROM Customer
UNION ALL
SELECT 
    'Product' AS source, 
    NULL AS name, 
    product_name 
FROM Product
LIMIT 10;

SELECT product_id, product_name, price
FROM Product
WHERE category_id IN (
    SELECT category_id FROM Category 
    WHERE category_name = 'Electronics' OR parent_category_id = 1
);

SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM Customer c
JOIN `Order` o ON c.customer_id = o.customer_id
WHERE o.total_amount > ANY (
    SELECT total_amount FROM `Order` WHERE customer_id = 2
);

SELECT p1.product_id, p1.product_name, p1.price, c.category_name
FROM Product p1
JOIN Category c ON p1.category_id = c.category_id
WHERE p1.price > (
    SELECT AVG(p2.price)
    FROM Product p2
    WHERE p2.category_id = p1.category_id
);