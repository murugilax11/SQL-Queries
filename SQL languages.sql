CREATE DATABASE db;
use db;

-- DDL- DATA DEFINITION LANGUAGE

CREATE TABLE employees(emp_id INT PRIMARY KEY AUTO_INCREMENT, emp_name VARCHAR(50) NOT NULL, salary DECIMAL(10,2),department VARCHAR(30) );
SELECT * FROM employees;

DESC employees;
ALTER TABLE employees ADD age INT;
ALTER TABLE employees MODIFY department VARCHAR(40);
ALTER TABLE employees RENAME COLUMN age TO empolyee_aage;

RENAME TABLE projects TO assignments;
TRUNCATE TABLE projects;
DROP TABLE projects;

-- DML- DATA MANIPULATION LANGUAGE

CREATE TABLE employee ( emp_id INT PRIMARY KEY AUTO_INCREMENT,
emp_name VARCHAR(30),
age INT,
salary DECIMAL(10,2),
department VARCHAR(30));
USE db;
INSERT INTO employee(emp_name,age,salary,department) VALUES ('dinga',20,1200000,'ECE'),('dingi',20,100000,'CSE'),
('dinga2',20,700000,'IT'),('dingi',20,850000,'AIDS') ;
SELECT * FROM employee;

UPDATE employee 
set emp_name = "dingi3"
WHERE department = 'IT';

DELETE FROM employee
WHERE emp_id = 4;

-- DQL- DATA QUERY LANGUAGE

SELECT * FROM employee
WHERE salary > 700000;

CREATE TABLE employee1 ( emp_id INT PRIMARY KEY AUTO_INCREMENT,
emp_name VARCHAR(30),
age INT,
salary DECIMAL(10,2),
department VARCHAR(30));
USE db;
INSERT INTO employee1(emp_name,age,salary,department) VALUES ('dinga',20,1200000,'ECE'),('dingi',20,100000,'CSE'),
('dinga2',20,700000,'IT'),('dingi',20,850000,'AIDS') ;
SELECT * FROM employee;

SELECT emp_name FROM employee1
WHERE age < 20 AND salary > 500000;

SELECT * FROM employee1
WHERE department = 'IT' AND salary < 700000;
 
CREATE TABLE employee(emp_name VARCHAR(20),emp_salary INT);
INSERT INTO employee  VALUES('murugi',10000),('uma',20000);
SELECT * FROM employee;

SELECT salary+20000 AS UPDATE_salary;
SELECT curdate();