-- Creating the database 
CREATE DATABASE bookstore_db;

-- Selecting the database 
USE bookstore_db;

-- Creating tables
-- Customer table
CREATE TABLE customer (
customer_id INT PRIMARY KEY auto_increment,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
phone INT
);

-- Country table
CREATE TABLE country (
country_id INT AUTO_INCREMENT PRIMARY KEY,
country_name VARCHAR(100) NOT NULL
);


-- Address table
CREATE TABLE address(
address_id INT PRIMARY KEY auto_increment,
street VARCHAR(50),
city VARCHAR(50),
postal_code VARCHAR(50),
country_id INT,
FOREIGN KEY(country_id) references country(country_id)
);

-- Address Status table
CREATE TABLE address_status(
address_status_id INT PRIMARY KEY auto_increment,
address_status_name VARCHAR(50)
);     

-- Customer Address table
CREATE TABLE customer_address(
customer_id INT,
address_id INT,
address_status_id INT,
foreign key(customer_id) REFERENCES customer(customer_id),
foreign key(address_id) references address(address_id),
foreign key(address_status_id) references address_status(address_status_id)
); 

-- Shipping Method table
CREATE TABLE shipping_method(
shipping_method_id INT PRIMARY KEY auto_increment,
shipping_method_name VARCHAR(150),
shipping_cost INT
);

-- Order status table
CREATE TABLE order_status(
order_status_id INT PRIMARY KEY auto_increment,
order_status_name VARCHAR(100)
);

-- Order table
CREATE TABLE `order` (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
order_date DATE,
order_status_id INT,
shipping_method_id INT,
FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id),
FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Book Language table
CREATE TABLE book_language (
language_id INT PRIMARY KEY AUTO_INCREMENT,
language_name VARCHAR(50)
);

-- Publisher table
CREATE TABLE publisher (
publisher_id INT PRIMARY KEY AUTO_INCREMENT,
publisher_name VARCHAR(100),
publisher_email VARCHAR(100),
publisher_phone VARCHAR(20)
);


-- Book table
CREATE TABLE book (
book_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
isbn VARCHAR(20) UNIQUE,
publication_year YEAR,
price DECIMAL(10, 2),
stock_quantity INT,
publisher_id INT,
language_id INT,
FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- Order Line table
CREATE TABLE order_line(
order_id INT,
book_id INT,
quantity INT,
FOREIGN KEY(order_id) REFERENCES `order`(order_id),
FOREIGN KEY(book_id) REFERENCES book(book_id)
);

-- Order History
CREATE TABLE order_history(
history_id INT PRIMARY KEY auto_increment,
order_id INT,
order_status_id INT,
change_date datetime,
FOREIGN KEY (order_id) REFERENCES `order`(order_id),
FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- Author table
CREATE TABLE author (
author_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50)
);

-- Book_Author junction table (many-to-many)
CREATE TABLE book_author (
book_id INT,
author_id INT,
FOREIGN KEY (book_id) REFERENCES book(book_id),
FOREIGN KEY (author_id) REFERENCES author(author_id)
);

