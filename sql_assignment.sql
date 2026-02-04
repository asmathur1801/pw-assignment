# QUESTION:1= Create a table called employees with the following structure?
#: emp_id (integer, should not be NULL and should be a primary key)Q
#: emp_name (text, should not be NULL)Q
#: age (integer, should have a check constraint to ensure the age is at least 18)Q
#: email (text, should be unique for each employee)Q
#: salary (decimal, with a default value of 30,000).
#Write the SQL query to create the above table with all constraints.
#ANSWER:
create database assi;
use assi;

create table employees(emp_id int(20) not null primary key,
              emp_name varchar(40) not null,
              age int(3) CHECK (age >=18),
              Email varchar(20) unique,
              salary decimal(10,2) default 30000);
              
              select*from employees;
              drop table employees;
              
 #QUESTION -2=. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
#examples of common types of constraints.             
 #ANSWER-->
# CONSTRAINTS ARE KIND OF RULE TO LIMIT THE TYPE OF DATA THAT CAN ENTER  INTO TABLE. THIS ENSURES  ACCURACY AND RELIABILTY OF THE DATA IN THE TABLE.
# WITHOUT CONSTRAINTS, INCORRECT AND DUPLICATE DATA MIGHT ENTER THE SYSTEM, LEADING TO ERRORS IN QUERIES,REPORTS AND DECISIONS. 

# THERE ARE SOME COMMON CONSTRAINTS:-       PRIMARY KEY, FOREIGN KEY, NOT NULL, DEFAULT,CHECK,UNIQUE
# EXAMPLE:-
create table employees(emp_id int(20) not null primary key,
              emp_name varchar(40) not null,
              age int(3) CHECK (age >=18),
              Email varchar(20) unique,
              salary decimal(10,2) default 30000);
              
 # question -3:--Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify
# your answer.
#answer:--  by applying not null contraint  to a column, column field cannot be empty. no , primary key connot contain null values , beacuse it is the unique value to identify each row in a table. 
#primary key = not null + unique    

#QUESTION - 4:-- Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
# example for both adding and removing a constraint.      
# ANSWER-->>
# -->>>Steps to Add a Constraint
#1...Identify the table and column where you want to apply the constraint.
#2...Use the ALTER TABLE ... ADD CONSTRAINT statement.
#3....Give the constraint a name 
ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);

#--->>.Steps to Remove a Constraint
#1...Find the name of the constraint you want to remove (either from your own naming or by querying the database system tables).
# 2....Use the ALTER TABLE ... DROP CONSTRAINT command..
ALTER TABLE employees
DROP CONSTRAINT unique_email;


## QUESTION-5-- Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
#Provide an example of an error message that might occur when violating a constraint.
#ANSWER-->
#Constraints are rules that maintain data integrity in a database. If you try to INSERT, UPDATE, or DELETE data that breaks these
 # rules, the database will reject the operation and return an error. This prevents invalid, inconsistent, or duplicate data from entering the system.
NOT NULL Violation:---
INSERT INTO employees (emp_id, emp_name, age, email) 
VALUES (1, NULL, 25, 'abc@mail.com');
error message:-
ERROR 1048 (23000): Column 'emp_name' cannot be null
PRIMARY KEY Violation:---
INSERT INTO employees (emp_id, emp_name, age, email) 
VALUES (1, 'John', 30, 'john@mail.com');
error message:-
ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'


# ANSWER -6...
#-- Make product_id as primary key
ALTER TABLE products
ADD CONSTRAINT pk_product PRIMARY KEY (product_id);

-- Set default value for price
ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;


#answer --7>
SELECT s.student_name, c.class_name
FROM students s
INNER JOIN classes c ON s.class_id = c.class_id;


#answer --8>>
SELECT o.order_id, c.customer_name, p.product_name
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
LEFT JOIN customers c ON o.customer_id = c.customer_id;

# answer ---9>>
SELECT p.product_name, SUM(o.amount) AS total_sales
FROM products p
INNER JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name;

# answer ---10>>
SELECT o.order_id, c.customer_name, oi.quantity
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id;


