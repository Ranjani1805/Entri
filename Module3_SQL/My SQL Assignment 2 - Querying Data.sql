CREATE DATABASE Employee;
USE Employee;

CREATE TABLE Departments(
    Department_ID INT PRIMARY KEY UNIQUE NOT NULL, 
    Department_Name VARCHAR(100) UNIQUE NOT NULL  
);

CREATE TABLE Location (
    Location_ID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE Employees (
    Employee_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_Name VARCHAR(50) NOT NULL,
    Gender ENUM('M','F') NOT NULL,
    Age INT CHECK  (Age>=18),
    Hire_Date DATE DEFAULT (CURRENT_DATE),
    Designation VARCHAR(100),
    Department_ID INT,
    Location_ID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID),
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
);

--   --  --  Assignment 2 - Querying Data -- -- -- -- -- -- -- -- -- --

USE employee;

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Software Development'),
(2, 'Marketing'),
(3, 'Data Science'),
(4, 'Human Resources'),
(5, 'Product Management'),
(6, 'Content Creation'),
(7, 'Finance'),
(8, 'Design'),
(9, 'Research and Development'),
(10, 'Customer Support'),
(11, 'Business Development'),
(12, 'IT'),
(13, 'Operations');

INSERT INTO location (location) VALUES
('Chennai'),
('Bangalore'),
('Hyderabad'),
('Pune');

INSERT INTO employees (employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary) VALUES
(5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 4, 60000),
(5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 1, 80000),
(5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
(5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 3, 70000),
(5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 1, 55000),
(5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 2, 65000),
(5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 2, 3, 90000),
(5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 8, 4, 70000),
(5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 11, 3, 55000),
(5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 12, 4, 80000),
(5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 2, 1, 60000),
(5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 13, 2, 95000),
(5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 10, 3, 75000),
(5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst', 10, 2, 60000),
(5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 1, 85000),
(5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 4, 4, 100000),
(5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist', 12, 2, 80000),
(5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 9, 3, 75000),
(5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 4, 4, 55000),
(5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 1, 1, 90000),
(5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 3, 85000),
(5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 4, 4, 60000),
(5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 2, 2, 70000),
(5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 5, 1, 95000),
(5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 3, 4, 100000),
(5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 3, 2, 75000),
(5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 6, 3, 60000),
(5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 6, 1, 60000),
(5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 12, 2, 80000),
(5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 5, 1, 90000);

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM location;


-- 1. Distinct Values 
-- a query to retrieve distinct salaries from the Employees table.

SELECT DISTINCT Salary FROM Employees;

-- 2. Alias (AS) 
-- Provide aliases for the "age" and "salary" columns as "Employee_Age" and "Employee_Salary" respectively.

SELECT Age AS Employee_Age , Salary AS Employee_Salary 
FROM Employees;

-- 3. WHERE Clause & Operators

-- 3a.Retrieve employees with a salary greater than ₹50000 and hired before 2016-01-01.

SELECT * FROM Employees 
WHERE Salary > 50000 AND Hire_Date < '2016-01-01';

-- 3b.Find the employee whose designation is missing and fill it with "Data Scientist".

UPDATE Employees SET Designation = 'Data Scientist' 
WHERE Designation IS NULL;

-- SORTING AND GROUPING DATA:

-- 1.ORDER BY 
-- Find employees sorted by department ID in ascending order and salary in descending order.

SELECT * FROM Employees 
ORDER BY Department_ID ASC, Salary DESC;

-- 2.LIMIT 
-- Display the first 5 employees hired in the year 2018.

SELECT * FROM Employees 
WHERE YEAR(Hire_Date)=2018 
ORDER BY Hire_Date ASC LIMIT 5;

-- 3. Aggregate Functions:

-- 3a.Calculate the sum of all salaries in the Finance department.

SELECT SUM(Salary) AS Total_Finance_Salary
FROM Employees e
JOIN Departments d
ON e.Department_ID = d.Department_ID
WHERE d.Department_Name = 'Finance';

-- 3b.Find the minimum age among all employees.

SELECT Employee_ID, Employee_Name, Age
FROM Employees
WHERE Age = (SELECT MIN(Age) FROM Employees);

-- 4. GROUP BY: 
-- 4a.List the maximum salary for each location.

SELECT l.Location, MAX(e.Salary) AS Max_Salary
FROM Employees e
JOIN Location l
ON e.Location_ID = l.Location_ID
GROUP BY l.Location;

-- 4b.Calculate the average salary for each designation containing the word 'Analyst'.

SELECT Designation, AVG(Salary) AS Avg_Salary FROM Employees 
WHERE Designation Like '%Analyst%'
GROUP BY Designation;

-- 5. HAVING: 
-- 5a.Find departments with less than 3 employees.

SELECT d.Department_Name,
COUNT(e.Employee_ID) AS Num_Employees 
FROM Employees e
JOIN Departments d
ON e.Department_ID = d.Department_ID
GROUP BY d.Department_Name 
HAVING COUNT(e.Employee_ID) < 3;

-- 5b.Find locations with female employees whose average age is below 30.

SELECT l.location AS Location_Name, AVG(e.age) AS Avg_Age
FROM location l
JOIN employees e 
ON l.location_id = e.location_id
WHERE e.gender = 'F'
GROUP BY l.location
HAVING AVG(e.age) < 30;

-- Joins:
-- 1.Inner Join:
-- List employee names, their designations, and department names where employees are assigned to a department.

SELECT e.Employee_Name, e.Designation, d.Department_Name
FROM Employees e
INNER JOIN Departments d 
ON e.Department_ID = d.Department_ID;

-- 2. Left Join:
-- List all departments along with the total number of employees in each department, including departments with no employees.

SELECT d.Department_Name, COUNT(e.Employee_ID) AS Total_Employees
FROM Employees e
LEFT JOIN Departments d 
ON e.Department_ID = d.Department_ID
GROUP BY d.Department_Name;

-- 3. Right Join:
-- Display all locations along with the names of employees assigned to each location. If no employees are assigned 
-- to a location, display NULL for employee name.

SELECT l.location, e.Employee_Name
FROM Employees e
RIGHT JOIN location L 
ON e.location_ID = l.Location_ID;






