-- Queries to test the database
-- Retrieve all customers
SELECT * FROM customer;

-- View orders by a specific customer
SELECT o.order_id, o.order_date, os.order_status_name, sm.shipping_method_name, o.order_status_id
FROM `order` o
JOIN order_status os ON o.order_status_id = os.order_status_id
JOIN shipping_method sm ON o.shipping_method_id = sm.shipping_method_id
WHERE o.customer_id = 1;  

-- View books and authors
SELECT b.title, a.first_name as author_username
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id;

-- View books by a specific publisher
SELECT title, isbn, publication_year, price, stock_quantity
FROM book
WHERE publisher_id = 1;

-- Get Order Line Details for a Specific Order
SELECT ol.order_id, b.title, ol.quantity, b.price
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id
WHERE ol.order_id = 1;

-- View Shipping Methods and Costs
SELECT shipping_method_name, shipping_cost
FROM shipping_method;

-- View Order History for a Specific Order
SELECT oh.change_date, os.order_status_name
FROM order_history oh
JOIN order_status os ON oh.order_status_id = os.order_status_id
WHERE oh.order_id = 1; 

-- View all countries
SELECT * FROM country;

-- List all books and their prices
SELECT title, price
FROM book;


 
