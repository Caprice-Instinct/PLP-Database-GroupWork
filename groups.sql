-- Setting up user groups and roles to control access to the database
-- Creating users
CREATE USER 'order_clerk'@'localhost' IDENTIFIED BY 'order_clerk_pass';
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_user_pass';

-- Create roles
CREATE ROLE 'clerk_role';
CREATE ROLE 'admin_role';

-- Granting permissions
-- Granting all permissions to admin
GRANT ALL PRIVILEGES ON bookstore_db.* TO 'admin_role';

-- Granting specific roles to clerk
-- Read & write customer info
GRANT SELECT, INSERT, UPDATE ON bookstore_db.customer TO 'clerk_role';

-- Manage customer addresses
GRANT SELECT, INSERT, UPDATE ON bookstore_db.customer_address TO 'clerk_role';
GRANT SELECT ON bookstore_db.address_status TO 'clerk_role';
GRANT SELECT ON bookstore_db.address TO 'clerk_role';

-- Create orders
GRANT SELECT, INSERT ON bookstore_db.cust_order TO 'clerk_role';
GRANT SELECT, INSERT ON bookstore_db.order_line TO 'clerk_role';

-- Read-only access to order helpers
GRANT SELECT ON bookstore_db.shipping_method TO 'clerk_role';
GRANT SELECT ON bookstore_db.order_status TO 'clerk_role';

-- View order history
GRANT SELECT ON bookstore_db.order_history TO 'clerk_role';

-- Read-only access to books & related info
GRANT SELECT ON bookstore_db.book TO 'clerk_role';
GRANT SELECT ON bookstore_db.publisher TO 'clerk_role';
GRANT SELECT ON bookstore_db.book_language TO 'clerk_role';
GRANT SELECT ON bookstore_db.author TO 'clerk_role';
GRANT SELECT ON bookstore_db.book_author TO 'clerk_role';


-- Assign roles to the users created earlier
GRANT 'admin_role' TO 'admin_user'@'localhost';
GRANT 'clerk_role' TO 'order_clerk'@'localhost';

-- Setting Default Role for Each User
SET DEFAULT ROLE 'admin_role' TO 'admin_user'@'localhost';
SET DEFAULT ROLE 'clerk_role' TO 'order_clerk'@'localhost';