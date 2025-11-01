-- Employee Database Schema 

CREATE DATABASE Employee;
USE Employee;

-- 1. DDL COMMANDS
CREATE TABLE Departments(
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100)
);

CREATE TABLE Location (
    Location_ID INT PRIMARY KEY,
    Location VARCHAR(30) 
);

CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Gender ENUM('M','F'),
    Age INT,
    Hire_Date DATE,
    Designation VARCHAR(100),
    Department_ID INT,
    Location_ID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID),
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
);

-- 2.Table Alteration (ALTER):

ALTER TABLE Employees ADD COLUMN Email VARCHAR(100);

ALTER TABLE Employees MODIFY COLUMN Designation VARCHAR(200);

ALTER TABLE Employees DROP COLUMN Age;

ALTER TABLE Employees RENAME COLUMN Hire_Date TO Date_of_Joining;


-- 3.Table Renaming (RENAME):

RENAME TABLE Departments TO Departments_Info;

RENAME TABLE Location TO Locations;

-- 4. Table Truncation (Truncate):

TRUNCATE TABLE Employees;

-- 5. Database & Table Dropping (DROP):

-- CONSTRAINTS:

-- 1. Database Recreation:
DROP DATABASE IF EXISTS Employee;

CREATE DATABASE Employee;
USE Employee;

-- 2. Departments Table:

CREATE TABLE Departments(
    Department_ID INT PRIMARY KEY UNIQUE NOT NULL, 
    Department_Name VARCHAR(100) UNIQUE NOT NULL  
);

-- 3. Location Table:

CREATE TABLE Location (
    Location_ID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(30) UNIQUE NOT NULL
);

-- 4. Employees Table:

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
