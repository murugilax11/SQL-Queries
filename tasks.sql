-- ALTER QUESTIONS
-- add a column phnoe_number to students
use demo;
ALTER TABLE students ADD phone_number INT;
SELECT * FROM students;

-- modify the datatype of phone_number
ALTER TABLE students MODIFY phone_number BIGINT;

-- rename column phone_number to mobile_number
ALTER TABLE students RENAME COLUMN phone_number to mobile_number;

-- DROP the column mobile number
ALTER TABLE students DROP COLUMN mobile_number;

-- rename table students to college students
RENAME TABLE students to college_students;


-- DROP & TRUNCATE questions
-- truncate the employees table
USE db;
SELECT * FROM employees;
TRUNCATE TABLE employees;

-- DROP products table
DROP TABLE products;

-- DROP multiple tables at once
DROP TABLE employee, product, dept_name;


-- Question-1

CREATE DATABASE college_db;
USE college_db;
CREATE TABLE students (student_id INT PRIMARY KEY AUTO_INCREMENT,
student_name VARCHAR(20),
age INT, city VARCHAR(20), marks INT );
INSERT INTO students(student_name,age,city, marks) VALUE ('Murugi', 20, 'Srivilliputhur', 98), ('Deeps', 20, 'Rajapalayam', 99), ('Uma', 19, 'Srivilliputhur', 98),
('Dharani', 21, 'Rajapalayam', 100), ('Ilakiya', 22, 'Mamsapuram', 88);
SELECT * FROM students;

SELECT student_name,marks FROM students;
UPDATE students SET marks = 100 WHERE marks = 88;
DELETE FROM students WHERE student_id = 4;
ALTER TABLE students ADD email VARCHAR(20);
ALTER TABLE students RENAME COLUMN marks TO score;
ALTER TABLE students MODIFY city VARCHAR(70);
ALTER TABLE students DROP COLUMN email;
TRUNCATE TABLE students;
DROP TABLE students;
DROP DATABASE college_db;


-- QUESTION 2
CREATE DATABASE company_db1;
USE company_db;
CREATE TABLE employee (emp_id INT PRIMARY KEY,emp_name VARCHAR(20),age INT,salary INT,
department VARCHAR(50),joining_date DATE);
INSERT INTO employee VALUES (1,'Abi',25,45000,'IT','2022-01-10'),(2,'Priya',30,60000,'HR','2021-03-15'),
(3,'Karthi',28,55000,'IT','2020-07-20'),(4,'Divya',35,70000,'Finance','2019-05-18'),(5,'Haritha',42,52000,'Marketing','2018-09-12'),
(6,'Sneha',26,48000,'IT','2023-02-01'),(7,'Dhara',38,75000,'Finance','2017-11-25'),(8,'Athii',29,62000,'HR','2020-08-14'),
(9,'Mathu',45,80000,'Management','2015-06-30'),(10,'Keerthi',27,53000,'IT','2021-12-05');
SELECT * FROM employee;

SELECT * FROM employee WHERE salary > 50000;
SELECT * FROM employee WHERE department = 'IT';
UPDATE employee SET salary = salary + (salary * 0.10);
DELETE FROM employee WHERE age > 40;
ALTER TABLE employee ADD emails VARCHAR(100) UNIQUE;
RENAME TABLE employee TO company_staff1;
CREATE TABLE departments1 (dept_id INT PRIMARY KEY AUTO_INCREMENT,dept_name VARCHAR(100));
INSERT INTO departments1(dept_name) VALUES('IT'),('HR'),('Finance'),('Marketing'),('Management');
SELECT *FROM departments1;
ALTER TABLE company_staff1 ADD dept_id INT;
ALTER TABLE company_staff1 ADD FOREIGN KEY (dept_id)
REFERENCES departments(dept_id);
SELECT * FROM company_staff1
ORDER BY salary DESC;
TRUNCATE TABLE company_staff1;

-- Task 3

CREATE TABLE task3 (student_id INT PRIMARY KEY AUTO_INCREMENT,
student_name VARCHAR(20),
age INT, city VARCHAR(20), marks INT );
INSERT INTO task3(student_name,age,city, marks) VALUE ('Murugi', 20, 'madurai', 98), ('Deeps', 20, 'chennai', 99), ('Uma', 19, 'Srivilliputhur', 98),
('Dharani', 21, 'Rajapalayam', 100), ('Ilakiya', 22, 'Mamsapuram', 60);
SELECT * FROM task3;
SELECT * FROM task3 WHERE marks > 80;
SELECT * FROM task3 WHERE city = 'chennai';
SELECT * FROM task3 WHERE marks BETWEEN 60 AND 90;
SELECT * FROM task3 WHERE student_name LIKE('A%');
SELECT *FROM task3 WHERE (fees - paid_fees) > 2000;
SELECT * FROM task3 WHERE city IN('chennai','madurai') AND marks > 75;
SELECT * FROM task3 WHERE marks % 2 = 0;
SELECT * FROM task3 WHERE (attendance + 10) >90;
SELECT * FROM task3 WHERE age > 18;

SELECT * FROM employee WHERE YEAR (joinig_date) >2021;

-- TASK 4

USE psrr; 
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    bonus INT,
    age INT,
    city VARCHAR(50),
    joining_date DATE
);

INSERT INTO employees VALUES
(1, 'Rahul', 'HR', 45000, 5000, 25, 'Chennai', '2022-01-10'),
(2, 'Arun', 'IT', 50000, 7000, 28, 'Madurai', '2021-06-15'),
(3, 'Meena', 'Finance', 65000, 9000, 30, 'Coimbatore', '2020-03-25'),
(4, 'John', 'Testing', 47000, 4000, 27, 'Chennai', '2023-02-12'),
(5, 'Priya', 'IT', 52000, 6000, 26, 'Bangalore', '2022-08-18'),
(6, 'Kavin', 'Management', 75000, 12000, 31, 'Madurai', '2019-11-20'),
(7, 'Sneha', 'HR', 42000, 3500, 24, 'Trichy', '2023-05-14'),
(8, 'Vignesh', 'IT', 68000, 10000, 29, 'Salem', '2020-09-30'),
(9, 'Divya', 'Finance', 58000, 8000, 27, 'Chennai', '2021-12-01'),
(10, 'Akash', 'Testing', 49000, 4500, 26, 'Madurai', '2022-04-11'),
(11, 'Keerthi', 'IT', 72000, 11000, 32, 'Bangalore', '2018-07-19'),
(12, 'Sanjay', 'HR', 46000, 3000, 25, 'Coimbatore', '2023-01-08'),
(13, 'Nivetha', 'Finance', 61000, 8500, 29, 'Chennai', '2020-10-10'),
(14, 'Harish', 'Management', 80000, 15000, 35, 'Madurai', '2017-06-22'),
(15, 'Lavanya', 'Testing', 53000, 5000, 28, 'Trichy', '2021-03-17');

SELECT  COUNT(*) AS total_employee FROM employees; 
SELECT  SUM(salary) AS total_salary FROM employees;
SELECT  AVG(salary) AS avg_salary FROM employees;
SELECT  MAX(salary) AS high_salary FROM employees;
SELECT  MIN(salary) AS low_salary FROM employees;
SELECT  COUNT(*) AS dept_wise FROM employees GROUP BY department;
SELECT  AVG(salary) AS avg_dept_wise FROM employees GROUP BY department;
SELECT  SUM(salary) AS dept_wise FROM employees GROUP BY department HAVING SUM(salary) > 100000;
SELECT UPPER(emp_name) FROM employees;
SELECT LOWER(emp_name) FROM employees;
SELECT LENGTH(emp_name) FROM employees;
SELECT CONCAT(emp_name, '-',department) FROM employees;
SELECT LEFT(emp_name, 3) FROM employees;
SELECT REVERSE(emp_name) FROM employees;
SELECT REPLACE (department,'IT','Developer') FROM employees;
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
SELECT YEAR(joining_date) FROM employees;
SELECT MONTH(joining_date) FROM employees;
SELECT YEAR(joining_date) FROM employees WHERE joining_date > 2021;
SELECT DATE_ADD(joining_date, INTERVAL 30 DAY) FROM employees;
SELECT ROUND(salary) AS round_salary FROM employees;
SELECT MOD(salary, 1000) FROM employees;
SELECT SQRT(salary) FROM employees;
SELECT POWER(salary,2) FROM employees;
SELECT  IF(NULL,'NO department',department) FROM employees;
SELECT emp_name, salary, IF(salary >= 60000, 'High Salary', 'Low Salary') AS salary_category FROM employees;
SELECT CASE
WHEN salary >= 80000 THEN 'excellent'
WHEN salary > 50000 THEN 'good'
ELSE 'average' END AS 'A' FROM employees;

SELECT MAX(salary ORDER BY salary DESC  FROM employees; 
