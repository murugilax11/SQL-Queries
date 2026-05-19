USE psrr;
CREATE TABLE employees1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    manager_id INT,
    salary INT
);
CREATE TABLE departments1 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
INSERT INTO employees1
VALUES
(1, 'Rahul', 101, NULL, 45000),
(2, 'Arun', 102, 1, 50000),
(3, 'Meena', 103, 1, 65000),
(4, 'John', 104, 2, 47000),
(5, 'Priya', NULL, 2, 52000),
(6, 'Kavin', 102, 4, 70000);
INSERT INTO departments1
VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance'),
(105, 'Testing');

-- INNER JOIN
SELECT * FROM employees1 AS e1
INNER JOIN departments1 AS d1
ON e1.dept_id = d1.dept_id;

-- Display customer names and city for customers belonging to IT department.
SELECT * FROM employees1 AS e1
INNER JOIN departments1 AS d1
ON e1.dept_id = d1.dept_id
WHERE d1.dept_name = 'IT';

-- LEFT JOIN
SELECT * FROM employees1 AS e1
LEFT JOIN departments1 AS d1
ON e1.dept_id = d1.dept_id;

-- employee salary with department
SELECT e1.salary, d1.dept_name FROM employees1 AS e1
LEFT JOIN departments1 AS d1
ON e1.dept_id = d1.dept_id;

-- sort employees by salary along with departments
SELECT e1.emp_name,e1.salary, d1.dept_name FROM employees1 AS e1
LEFT JOIN departments1 AS d1
ON e1.dept_id = d1.dept_id
ORDER BY e1.salary ASC;

-- Display customer names with their department names
SELECT e1.emp_name, d1.dept_name
FROM employees1 AS e1
LEFT JOIN departments1 AS d1
ON e1.dept_id = d1.dept_id;

-- Display all customers including customers without departments
SELECT emp_name FROM employees1 AS e1
LEFT JOIN departments1 AS d1
ON e1.dept_id = d1.dept_id;

-- RIGHT JOIN
SELECT * FROM employees1 AS e1
RIGHT JOIN departments1 AS d1
ON e1.dept_id = d1.dept_id;

-- departmnets without employees
SELECT * FROM employees1 AS e1
RIGHT JOIN departments1 AS d1 
ON e1.dept_id = d1.dept_id
WHERE e1.emp_name IS NULL;

-- print department name without null
SELECT e1.emp_name,e1.salary, d1.dept_name FROM employees1 AS e1
RIGHT JOIN departments1 AS d1
ON e1.dept_id = d1.dept_id
ORDER BY e1.salary ASC;

-- FULL JOIN
SELECT * FROM employees1 AS e1
LEFT JOIN departments1 AS d1
ON e1.dept_id = d1.dept_id
UNION
SELECT * FROM employees1 AS e1
RIGHT JOIN departments1 AS d1
ON e1.dept_id = d1.dept_id;

-- SELF JOIN
CREATE TABLE table1 (
    e_id INT PRIMARY KEY,
    e_name VARCHAR(50),
    m_id INT
);
INSERT INTO table1 (e_id, e_name, m_id)
VALUES (1, 'A', 2),(2, 'B', 3),(3, 'C', 1);

-- display all employees with managers & managers with their manager
SELECT t1.e_name AS employee,
t2.e_name AS Manager, t3.e_name AS Manegers_manager 
FROM table1 AS t1
LEFT JOIN table1 AS t2
ON t1.m_id = t2.e_id
LEFT JOIN table1 AS t3
ON t2.m_id = t3.e_id;

-- WQTD the highest level manager
SELECT emp_name FROM table1
WHERE manager_id IS NULL ;

-- count of employees under each manager
SELECT m.emp_name , COUNT(e.emp_id) AS total
FROM employees1 AS e
JOIN employees1 AS m
ON e.manager_id = m.emp_id
GROUP BY e.manager_id;


SELECT e.emp_name AS employee,
       m.emp_name AS manager, e.manager_id
FROM employees1 AS e
JOIN employees1 AS m
ON e.manager_id = m.manager_id
AND e.emp_id <> m.emp_id;

-- manager of jhon
SELECT m.emp_name AS manager,e.emp_name AS employee
FROM employees1 AS e
JOIN employees1 AS m
ON e.manager_id = m.emp_id
WHERE e.emp_name = 'John';

-- jhons managers manager name
 SELECT e.emp_name AS employee,
m.emp_name AS maneger,
mm.emp_name AS managers_manager
FROM employees1 AS e
LEFT JOIN employees1 AS m
ON e.manager_id = m.emp_id   
LEFT JOIN employees1 AS mm
ON m.manager_id = mm.emp_id
WHERE e.emp_name = 'john';  



