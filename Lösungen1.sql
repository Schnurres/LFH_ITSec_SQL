-- Zuerst muss die richtige Datenbank gesetzt und ein Schema kreiert werden in dem die Tabellen erstellen
USE database db_student28;
CREATE SCHEMA IF NOT EXISTS exercise1;
USE SCHEMA exercise1;

-- Übung 1.1
CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    first_name STRING NOT NULL,
    last_name STRING NOT NULL
);

-- Übung 1.2
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name STRING NOT NULL,
    price DECIMAL(10,2) DEFAULT 0.00
);

-- Übung 1.3
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    customer_name STRING NOT NULL,
    contact_email STRING NOT NULL
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- Übung 1.4
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    first_name STRING NOT NULL,
    last_name STRING NOT NULL,
    email STRING UNIQUE,
    salary DECIMAL(10,2) DEFAULT 0.00 NOT NULL
);


-- Übung 1.5
CREATE TABLE IF NOT EXISTS courses (
    course_id INT PRIMARY KEY,
    course_name STRING NOT NULL
);

CREATE TABLE IF NOT EXISTS enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

---------------------------------------------------------------------------------------------------------------------------------------------
-- ALTER

-- Übung 2.1
ALTER TABLE students
ADD COLUMN birthdate DATE;

-- Übung 2.2
ALTER TABLE customers
RENAME COLUMN contact_email TO email_address;

-- Übung 2.3
ALTER TABLE employees
DROP COLUMN salary;

-- Übung 2.4
ALTER TABLE orders
MODIFY COLUMN order_date SET NOT NULL;

-- Übung 2.5
ALTER TABLE courses
RENAME TO training_courses;

-- Übung 2.6
ALTER TABLE products
MODIFY COLUMN price NUMBER(14,2);

-- Übung 2.7
ALTER TABLE products 
ALTER COLUMN price DROP DEFAULT;

-- Übung 2.8
SHOW UNIQUE KEYS IN TABLE employees;
ALTER TABLE employees
DROP CONSTRAINT "<constraintname>";
ALTER TABLE employees
MODIFY COLUMN email SET NOT NULL;

-- Übung 2.9
ALTER TABLE students ADD COLUMN first_name_temp STRING NOT NULL;
UPDATE students SET first_name_temp = first_name;
ALTER TABLE students DROP COLUMN first_name;
ALTER TABLE students RENAME COLUMN first_name_temp TO first_name;

---------------------------------------------------------------------------------------------------------------------------------------------
-- SELECT

-- Zuerst müssen die richtige Datenbank und Schema ausgewählt werden
USE DATABASE raw_prod;
use schema exercise1;

-- Übung 3.1
SELECT * FROM customers;

-- Übung 3.2
SELECT DISTINCT country FROM customers;

-- Übung 3.3
SELECT * FROM products WHERE price > 500;

-- Übung 3.4
SELECT * FROM customers WHERE customer_name LIKE 'A%';

-- Übung 3.5
SELECT * FROM customers WHERE join_date > '2021-07-01' AND email LIKE '%example.com%';

-- Übung 3.6
SELECT * FROM customers WHERE country ='USA' OR join_date > '2022-01-01';

-- Übung 3.7
SELECT * FROM orders WHERE order_date BETWEEN '2023-01-01' AND '2023-03-31';

-- Übung 3.8
SELECT * FROM products WHERE category_id IN (1, 3);

-- Übung 3.9
SELECT * FROM customers WHERE email LIKE '%example.com';

-- Übung 3.10
SELECT * FROM products WHERE product_name LIKE '%phone%';

-- Übung 3.11
SELECT product_name, price * 2 AS double_price FROM products;

-- Übung 3.12
SELECT customer_name, DATEDIFF(year, join_date, CURRENT_DATE) AS years_as_customer FROM customers;

-- Übung 3.13
SELECT UPPER(customer_name) FROM customers;

-- Übung 3.14
SELECT LEFT(product_name, 3) FROM products;
-- ebenso geht:
SELECT SUBSTRING(product_name, 1, 3) FROM products;

-- Übung 3.15
SELECT
    customer_name,
    email,
    SPLIT_PART(email, '@', 2) AS e_mail_provider
FROM
    customers;

-- Übung 3.16
SELECT order_date, MONTH(order_date) AS order_month, YEAR(order_date) AS order_year FROM orders;

-- Übung 3.17
SELECT * FROM customers ORDER BY customer_name ASC;

-- Übung 3.18
SELECT * FROM products ORDER BY price DESC;

-- Übung 3.19
SELECT COUNT(*) AS customer_count FROM customers;

-- Übung 3.20
SELECT AVG(price) AS average_price FROM products;

-- Übung 3.21
SELECT customer_id, COUNT(*) AS order_count FROM orders GROUP BY customer_id;

-- Übung 3.22
SELECT customer_id, COUNT(*) AS order_count FROM orders GROUP BY customer_id HAVING COUNT(*) > 1;
