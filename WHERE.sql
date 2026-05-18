create database new;
use new;
CREATE TABLE Employee (
    Emp_id INT,
    Ename VARCHAR(50),
    JobDesc VARCHAR(50),
    Salary INT
);

INSERT INTO Employee (Emp_id, Ename, JobDesc, Salary) VALUES
(1, 'Ram', 'ADMIN', 1000000),
(2, 'Harini', 'MANAGER', 2500000),
(3, 'George', 'SALES', 2000000),
(4, 'Ramya', 'SALES', 1300000),
(5, 'Meena', 'HR', 2000000),
(6, 'Ashok', 'MANAGER', 3000000),
(7, 'Abdul', 'HR', 2000000),
(8, 'Ramya', 'ENGINEER', 1000000),
(9, 'Raghu', 'CEO', 8000000),
(10, 'Arvind', 'MANAGER', 2800000),
(11, 'Akshay', 'ENGINEER', 1000000),
(12, 'John', 'ADMIN', 2200000),
(13, 'Abinaya', 'ENGINEER', 2100000);

SHOW TABLES;
SELECT * FROM Employee;

SELECT Emp_id,Ename FROM Employee
WHERE Salary > 2000000;

SELECT * FROM Employee
WHERE Salary <30000000 AND JobDesc = 'MANAGER';

SELECT * FROM Employee
WHERE JobDesc='ADMIN' OR JobDesc='HR';

SELECT * FROM Employee
WHERE JobDesc IN ('ADMIN','HR'); 

SELECT * FROM Employee
WHERE JobDesc NOT IN ('MANAGER','CEO');

SELECT * FROM employee
WHERE salary BETWEEN 2000000 AND 3000000
LIMIT 5;

SELECT * FROM Employee
LIMIT 5;

SELECT * FROM employee
WHERE ename LIKE 'A%'; -- filters name starting with A

SELECT * FROM employee
WHERE ename LIKE 'R%a'; -- filters name starting WITH R AND ending with a

SELECT * FROM employee
WHERE ename LIKE '%I%'; -- filters name containing I

SELECT * FROM employee
WHERE ename LIKE '__I%'; -- filters name with i as third character

SELECT * FROM employee
WHERE ename LIKE 'R\%'; 