USE DATABASE RAW_PROD;
CREATE SCHEMA IF NOT EXISTS  exercise1;
USE SCHEMA exercise1;
-- Tabelle customers

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    customer_name STRING NOT NULL,
    email STRING NOT NULL,
    join_date DATE,
    city STRING,
    country STRING
);

INSERT INTO customers (customer_id, customer_name, email, join_date, city, country) VALUES
(1, 'Alice Johnson', 'alice@outlook.com', '2021-06-15', 'New York', 'USA'),
(2, 'Bob Lee', 'bob@example.com', '2021-07-20', 'Los Angeles', 'USA'),
(3, 'Charlie Kim', 'charlie@gmail.com', '2021-08-25', 'Berlin', 'Germany'),
(4, 'David Park', 'david@example.com', '2021-09-10', 'Houston', 'USA'),
(5, 'Eva Green', 'eva@gmail.com', '2021-10-05', 'Amsterdam', 'Netherlands'),
(6, 'Frank Brown', 'frank@posteo.de', '2021-11-12', 'Trier', 'Germany'),
(7, 'Grace Lee', 'grace@example.com', '2021-12-18', 'Vienna', 'Austria'),
(8, 'Hannah Wilson', 'hannah@posteo.com', '2022-01-15', 'San Diego', 'USA'),
(9, 'Ian Taylor', 'ian@posteo.de', '2022-02-20', 'Hamburg', 'Germany'),
(10, 'Jack Harris', 'jack@example.com', '2022-03-25', 'San Jose', 'USA');

-- Tabelle suppliers
CREATE TABLE IF NOT EXISTS suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name STRING NOT NULL,
    contact_name STRING NOT NULL,
    contact_email STRING NOT NULL
);

INSERT INTO suppliers (supplier_id, supplier_name, contact_name, contact_email) VALUES
(1, 'Tech Supplies Inc.', 'John Tech', 'john.tech@tdwi.com'),
(2, 'Gadgets and More', 'Linda Gadget', 'linda.gadget@nintendo.com'),
(3, 'Accessories Co.', 'Mike Accessory', 'mike.accessory@example.com');

-- Tabelle categories
CREATE TABLE IF NOT EXISTS categories (
    category_id INT PRIMARY KEY,
    category_name STRING NOT NULL
);

INSERT INTO categories (category_id, category_name) VALUES
(1, 'Computers'),
(2, 'Mobile Devices'),
(3, 'Accessories');

-- Tabelle products
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name STRING NOT NULL,
    price DECIMAL(10,2) DEFAULT 0.00,
    category_id INT,
    supplier_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

INSERT INTO products (product_id, product_name, price, category_id, supplier_id) VALUES
(1, 'Laptop', 999.99, 1, 1),
(2, 'Smartphone', 499.99, 2, 2),
(3, 'Tablet', 299.99, 2, 2),
(4, 'Headphones', 89.99, 3, 3),
(5, 'Monitor', 199.99, 1, 1),
(6, 'Mouse', 25.99, 3, 3),
(7, 'Keyboard', 49.99, 3, 3),
(8, 'Charger', 19.99, 3, 2),
(9, 'USB Cable', 9.99, 3, 3),
(10, 'Webcam', 59.99, 1, 1);

-- Tabelle orders
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, order_date, customer_id) VALUES
(1, '2023-01-15', 1),
(2, '2023-02-20', 2),
(3, '2023-03-25', 3),
(4, '2023-04-30', 1),
(5, '2023-05-05', 4),
(6, '2023-06-10', 5),
(7, '2023-07-15', 6),
(8, '2023-08-20', 7),
(9, '2023-09-25', 8),
(10, '2023-10-30', 9);

-- Tabelle order_items
CREATE TABLE IF NOT EXISTS order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 1),
(4, 4, 2, 1),
(5, 5, 4, 3),
(6, 6, 5, 2),
(7, 7, 6, 5),
(8, 8, 7, 4),
(9, 9, 8, 1),
(10, 10, 9, 3),
(11, 1, 10, 2),
(12, 2, 5, 1),
(13, 3, 4, 2),
(14, 4, 3, 3),
(15, 5, 2, 2),
(16, 6, 1, 1),
(17, 7, 7, 3),
(18, 8, 6, 2),
(19, 9, 9, 4),
(20, 10, 8, 2);

-- Tabelle reviews
CREATE TABLE IF NOT EXISTS reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    review_date DATE NOT NULL,
    rating INT,
    comment STRING,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO reviews (review_id, product_id, customer_id, review_date, rating, comment) VALUES
(1, 1, 1, '2023-01-20', 5, 'Excellent laptop!'),
(2, 2, 2, '2023-02-25', 4, 'Good smartphone, but a bit expensive.'),
(3, 3, 3, '2023-03-30', 3, 'Average tablet.'),
(4, 4, 4, '2023-04-10', 4, 'Great headphones!'),
(5, 5, 5, '2023-05-15', 5, 'Excellent monitor for the price.'),
(6, 6, 6, '2023-06-20', 2, 'Mouse stopped working after a month.'),
(7, 7, 7, '2023-07-25', 4, 'Nice keyboard.'),
(8, 8, 8, '2023-08-30', 5, 'Fast charger!'),
(9, 9, 9, '2023-09-05', 3, 'USB cable is okay.'),
(10, 10, 10, '2023-10-10', 4, 'Good quality webcam.'),
(11, 1, 2, '2023-01-22', 4, 'Laptop is good.'),
(12, 2, 3, '2023-02-27', 5, 'Love this smartphone!'),
(13, 3, 4, '2023-03-29', 4, 'Tablet is fine.'),
(14, 4, 5, '2023-04-12', 3, 'Headphones are okay.'),
(15, 5, 6, '2023-05-17', 5, 'Monitor is great.'),
(16, 6, 7, '2023-06-22', 1, 'Mouse broke quickly.'),
(17, 7, 8, '2023-07-27', 5, 'Excellent keyboard.'),
(18, 8, 9, '2023-08-31', 4, 'Good charger.'),
(19, 9, 10, '2023-09-06', 2, 'USB cable is too short.'),
(20, 10, 1, '2023-10-11', 3, 'Webcam is average.');
