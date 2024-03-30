-- Active: 1708616196249@@127.0.0.1@3306@mydb#test


INSERT INTO employees
VALUES (2,"Squiward","Tentacles",15.00,"2023-01-03"),
 (3,"Spongebob","Squarepants",12.50,"2023-01-05"),
 (4,"Patrick","Star",12.50,"2023-01-06"),
 (5,"Sandy","Cheeks",17.50,"2023-01-07");

 INSERT INTO employees (employee_id, first_name, last_name)
 VALUES(6, "Sheldon ","Plankton");


--SELECT * FROM employees;  /*selecting everything*/
SELECT * FROM employees
WHERE employee_id=3;
--select keyword 
SELECT * FROM employees
WHERE hourly_pay >=15;


SELECT * FROM employees
WHERE employee_id !=3;

SELECT * FROM employees
WHERE hire_date IS NULL;

--updating and deleting data from a table
UPDATE employees
SET hourly_pay = 10.50,
    hire_date = NULL
WHERE employee_id =6;

SELECT * FROM employees;

DELETE FROM employees
WHERE employee_id =6;
SELECT * FROM employees;

--auto-commit 
--set auto commit = OFF it's like commiting in git and you having
--an old version already there (safepoint)
-- tho when you set autocommit to off you need to commit everything manually
--and u could use ROLLBACK

CREATE TABLE test(
    my_date DATE,
    my_time TIME,
    my_datetime DATETIME
);

INSERT INTO test 
VALUES (CURRENT_DATE() , CURRENT_TIME,NOW());

DROP TABLE test;

--making sure everything is unique 

CREATE TABLE products (
 product_id INT,
 product_name VARCHAR(25) UNIQUE,
 price DECIMAL(4,2)
);

SELECT * FROM products;

INSERT INTO products
VALUES (100,"hamburger", 3.99),
(101,"fries",1.89),
(102,"soda",1.00),
(103,"ice cream",1.49);

--the not null constraint
ALTER TABLE products
MODIFY price DECIMAL(4,2) NOT NULL;

INSERT INTO products
VALUES (104,"cheese",0);

ALTER TABLE employees
ADD CONSTRAINT chk_hourly_pay CHECK(hourly_pay >= 10.00);

SELECT * FROM employees;

ALTER TABLE employees
DROP CHECK chk_hourly_pay;

SELECT * FROM products;

INSERT INTO products 
VALUES (104,"straw",0.00),
(105,"napkin",0.00),
(106,"fork",0.00),
(107,"spoon",0.00);

DELETE FROM products
WHERE product_id>= 104;

ALTER TABLE products
ALTER price  SET DEFAULT 0;

INSERT INTO products (product_id, product_name)
VALUES (104,"straw"),
(105,"napkin"),
(106,"fork"),
(107,"spoon");

CREATE TABLE transactions (
   transaction_id INT PRIMARY KEY AUTO_INCREMENT,
   amount DECIMAL(5,2),
   customer_id INT,
   FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
   order_date DATE
);

SELECT * FROM transactions;

INSERT INTO transactions (transaction_id, amount, customer_id, order_date) 
VALUES 
   (1000, '4.99', 3, '2023-01-01'),
   (1001, '2.89', 2, '2023-01-01'),
   (1002, '3.38', 3, '2023-01-02'),
   (1003, '4.99', 1, '2023-01-02'),
   (1004, '1.00', NULL, '2023-01-03'),
   (1005, '2.49', 4, '2023-01-03'),
   (1006, '5.48', NULL, '2023-01-04');

INSERT INTO transactions (amount, customer_id)
VALUES (8.89, 3),(3.45, 2),(4.56, 3),(8.89, 1);

DROP TABLE transactions;

--primary key CONSTRAINT
--ALTER TABLE transcations 
--ADD CONSTRAINT
--PRIMARY KEY(transaction_id);

SELECT amount FROM transactions
WHERE  transaction_id = 1002;

ALTER TABLE transactions
AUTO_INCREMENT =1000;

DELETE FROM transactions;

--foreign key CONSTRAINT
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

SELECT* FROM customers;

INSERT INTO customers (first_name, last_name)
VALUES ("Fred","Fish"),
("Larry","Lobster"),
("Bubble","Bass");

--joins 

INSERT INTO transactions (amount , customer_id)
VALUES (1.00, NULL);
SELECT * FROM transactions;

INSERT INTO customers(first_name, last_name)
VALUES ("poppy","puff");
SELECT * FROM customers;

--inner JOIN
SELECT transaction_id, amount, first_name, last_name
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;

--LEFT JOIN
SELECT *
FROM transactions LEFT JOIN customers
ON transactions.customer_id = customers.customer_id;

--RIGHT JOIN
SELECT transaction_id, amount, first_name, last_name
FROM transactions RIGHT JOIN customers
ON transactions.customer_id = customers.customer_id;

--basically a join is used to combine between ROWS of 2 or more tables
--based on a link between them such as a foreign key 

--functions in MYSQL

SELECT AVG(amount) AS "avg"
FROM transactions;

SELECT * FROM employees;

SELECT CONCAT(first_name," " ,last_name) AS "Full_name"
FROM employees;

--logical operators AND /OR / NOT / BETWEEN /IN /LIKE

ALTER TABLE employees
ADD COLUMN job VARCHAR(25) AFTER hourly_pay;

SELECT * from employees;

UPDATE employees
SET job="janitor"
WHERE employee_id=6;

INSERT INTO employees
VALUES (6, "Sheldon","Plankton",10.00,"janitor","2023-01-07");

--checking many conditions 
SELECT * FROM employees
WHERE job="cook" OR job="cashier" AND NOT job="manager";

--% and _ 
-- to substitute one or more characters in a string 
SELECT * FROM employees
WHERE first_name LIKE "P%" AND last_name LIKE "%r";
SELECT * FROM employees
WHERE hire_date LIKE "____-01-__";

--order by clause
SELECT * FROM employees
ORDER BY hire_date DESC;

SELECT * FROM transactions
ORDER BY amount , customer_id ASC;
--if the rows have the same amount then order by another column 

--Limit clause
--used to limit the number of records
--can be used for pagination by setting a limit then adding an offset

SELECT * FROM customers
ORDER BY last_name DESC LIMIT 3;

--union operation
--it combines the results of two or more select STATEments

--the tables must have the same amount of columns
SELECT first_name , last_name FROM employees
UNION ALL
SELECT first_name , last_name FROM customers;

INSERT INTO customers
VALUES (5, "Sheldon" , "Plankton");

--SELF JOIN 
--joining another copy of a table to itself
--used to compare rows of the same TABLE
--helps to display a hiarchy of DATA

ALTER TABLE customers
ADD referral_id INT;

UPDATE customers
SET referral_id =2
WHERE customer_id =4;

SELECT * FROM customers;

SELECT a.customer_id, a.first_name, a.last_name ,
    CONCAT(b.first_name," ",b.last_name) AS "referred_by"
FROM customers AS a 
INNER JOIN customers AS b
ON a.referral_id = b.customer_id;

--another exemple of self joins 
ALTER TABLE employees
ADD supervisor_id INT;

UPDATE employees
SET supervisor_id = 1
WHERE employee_id =5;
SELECT * FROM employees;
--hiarchy of data using the self join
SELECT a.first_name, a.last_name, CONCAT(b.first_name," ", b.last_name) AS "reports to" 
FROM employees AS a 
INNER JOIN employees AS b 
ON a.supervisor_id =b.employee_id;

--VIEWS 
--a virtual table based on the result-set of an SQL STATEMENT
--the fields in a view are fields from one or more real tables in the db
--not real tables but can be interacted with as if they were 

CREATE VIEW employee_attendance AS 
SELECT first_name , last_name 
FROM employees;

SELECT * FROM employee_attendance;

SELECT * from customers;

ALTER TABLE customers
ADD COLUMN email VARCHAR(50);

UPDATE customers
SET email ="PPuff@gmail.com"
WHERE customer_id=4;

CREATE VIEW custumer_emails AS
SELECT email
FROM customers;

SELECT * from custumer_emails;

INSERT INTO customers
VALUES (6,"Pearl","Krabs",NULL,"PKrabs@gmail.com");

--INDEX (BTree data structure )
--Indexes are used to find values within a specific column more quickly 
--MySql normally searches sequentially through a COLUMN
--The longer the column the more expensive the operation is 
--Update takes more time Than SELECT

SELECT * FROM transactions;

SHOW INDEXES FROM customers;

--to create an INDEX
CREATE INDEX last_name_idx
ON customers(last_name);

SELECT * FROM customers
WHERE last_name = "Puff";

--multi column INDEX
CREATE INDEX last_name_first_name_idx 
ON customers(last_name, first_name);

SHOW INDEXES FROM customers;

ALTER TABLE customers
DROP INDEX last_name_idx;

SELECT * FROM customers
WHERE last_name ="Puff" AND first_name ="Poppy";

--SUBQUERIES
--a query within another query 
--query (subquery)

SELECT * FROM employees;

SELECT first_name, last_name, hourly_pay, (SELECT AVG(hourly_pay) FROM employees) AS avg_pay FROM employees;



SELECT first_name, last_name, hourly_pay FROM employees
WHERE hourly_pay > 15.45;

SELECT  FROM transactions;

SELECT customer_id FROM transactions
WHERE customer_id IS NOT NULL;
--we dont know who the customers are so we use subqueries 

SELECT first_name, last_name 
FROM customers
WHERE customer_id IN (1,2,3);

--basically subqueries is we execute the subquery first and whataver
--result we get it will be used in the larger query (outer query)

--GROUP BY clause = aggregate all rows by a specific column
-- often used with aggregate functions 
-- ex. SUM(), MIN , MAX , AVG , COUNT ...

SELECT * FROM transactions;

UPDATE transactions
SET order_date = CASE 
                    WHEN transaction_id = 1002 THEN '2023-01-02'
                    WHEN transaction_id = 1003 THEN '2023-01-02'
                    WHEN transaction_id = 1004 THEN '2023-01-03'
                    WHEN transaction_id = 1005 THEN '2023-01-03'
                    WHEN transaction_id = 1006 THEN '2023-01-04'
                    -- Add more WHEN conditions as needed for other transactions
                END
WHERE transaction_id IN (1002, 1003, 1004, 1005, 1006);

--he needs to know much money he made per day 
--calculating the sum of every amount per day

SELECT  SUM(amount) , order_date FROM transactions
GROUP BY order_date;

SELECT MAX(amount) , order_date FROM transactions
GROUP BY order_date;

SELECT MIN(amount) , order_date FROM transactions
GROUP BY order_date;

SELECT AVG(amount) , order_date FROM transactions
GROUP BY order_date;


SELECT COUNT(amount) , order_date FROM transactions
GROUP BY order_date;
--the sum of how much each customer has spent in total
SELECT SUM(amount), customer_id FROM transactions
GROUP BY customer_id;
--we can do the same for the min , max , avg and count 

--using a where clause along with the groupby clause 
--but we use the keyword 'HAVING'

SELECT COUNT(amount) , customer_id FROM transactions
GROUP BY customer_id
HAVING COUNT(amount) >1 AND customer_id IS NOT NULL;

--ROLLUP CLAUSE , extension of the GROUP BY CLAUSE
--produces another row and shows the GRAND TOTAL (super-aggregate value)

SELECT * FROM transactions;

--we first group each amount by order_date and then produce a grand total

SELECT SUM(amount), order_date
FROM transactions
GROUP BY order_date WITH ROLLUP;
--we add an additional row for the grand total

SELECT COUNT(transaction_id) AS "nb of orders", customer_id
FROM transactions
GROUP BY customer_id WITH ROLLUP;

--grouping employees by employee id then display the rollup of their hourly pay
--how much are we spending on our employees per hour as a business ?

SELECT SUM(hourly_pay) AS "hourly-pay", employee_id FROM employees
GROUP BY employee_id WITH ROLLUP;

--ON DELETE CLAUSE 
--ON DELETE SET NULL= when a FK is deleted, replace FK with NULL
--ON DELETE CASCADE = when a FK is deleted, delete row






