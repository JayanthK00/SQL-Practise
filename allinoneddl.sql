/*

------------------------------------------------------------
-- Add One Column
------------------------------------------------------------

ALTER TABLE Employees
ADD Phone VARCHAR(15);


------------------------------------------------------------
-- Add Multiple Columns
------------------------------------------------------------

ALTER TABLE Employees
ADD
    City VARCHAR(50),
    Country VARCHAR(50);


------------------------------------------------------------
-- Alter Data Type
------------------------------------------------------------

ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);


------------------------------------------------------------
-- Alter NOT NULL
------------------------------------------------------------

ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100) NOT NULL;


------------------------------------------------------------
-- Alter NULL
------------------------------------------------------------

ALTER TABLE Employees
ALTER COLUMN Email VARCHAR(100) NULL;


------------------------------------------------------------
-- Add PRIMARY KEY
------------------------------------------------------------

ALTER TABLE Employees
ADD CONSTRAINT PK_Employees
PRIMARY KEY(EmployeeID);


------------------------------------------------------------
-- Drop PRIMARY KEY
------------------------------------------------------------

ALTER TABLE Employees
DROP CONSTRAINT PK_Employees;


------------------------------------------------------------
-- Add FOREIGN KEY
------------------------------------------------------------

ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Departments
FOREIGN KEY(DepartmentID)
REFERENCES Departments(DepartmentID);


------------------------------------------------------------
-- Drop FOREIGN KEY
------------------------------------------------------------

ALTER TABLE Employees
DROP CONSTRAINT FK_Employees_Departments;


------------------------------------------------------------
-- Add UNIQUE
------------------------------------------------------------

ALTER TABLE Employees
ADD CONSTRAINT UQ_Email
UNIQUE(Email);


------------------------------------------------------------
-- Drop UNIQUE
------------------------------------------------------------

ALTER TABLE Employees
DROP CONSTRAINT UQ_Email;


------------------------------------------------------------
-- Add CHECK
------------------------------------------------------------

ALTER TABLE Employees
ADD CONSTRAINT CHK_Age
CHECK(Age >= 18);


------------------------------------------------------------
-- Drop CHECK
------------------------------------------------------------

ALTER TABLE Employees
DROP CONSTRAINT CHK_Age;


------------------------------------------------------------
-- Add DEFAULT
------------------------------------------------------------

ALTER TABLE Employees
ADD CONSTRAINT DF_Salary
DEFAULT 30000 FOR Salary;


------------------------------------------------------------
-- Drop DEFAULT
------------------------------------------------------------

ALTER TABLE Employees
DROP CONSTRAINT DF_Salary;


------------------------------------------------------------
-- Drop Column
------------------------------------------------------------

ALTER TABLE Employees
DROP COLUMN Phone;


------------------------------------------------------------
-- Rename Table
------------------------------------------------------------

EXEC sp_rename
'Employees',
'Staff';


------------------------------------------------------------
-- Rename Column
------------------------------------------------------------

EXEC sp_rename
'Staff.Name',
'EmployeeName',
'COLUMN';


------------------------------------------------------------
-- Add Computed Column
------------------------------------------------------------

ALTER TABLE Orders
ADD Total AS (Price * Quantity);


---------------------------------------------------------
-------------------------------------------------------------
-------------------------------------------------------------

------------------------------------------------------------
-- Drop Database
------------------------------------------------------------

DROP DATABASE CompanyDB;


------------------------------------------------------------
-- Drop Table
------------------------------------------------------------

DROP TABLE Employees;


------------------------------------------------------------
-- Drop Multiple Tables
------------------------------------------------------------

DROP TABLE Employees, Departments;


------------------------------------------------------------
-- Drop Column
------------------------------------------------------------

ALTER TABLE Employees
DROP COLUMN Phone;


------------------------------------------------------------
-- Drop PRIMARY KEY
------------------------------------------------------------

ALTER TABLE Employees
DROP CONSTRAINT PK_Employees;


------------------------------------------------------------
-- Drop FOREIGN KEY
------------------------------------------------------------

ALTER TABLE Employees
DROP CONSTRAINT FK_Employees_Departments;


------------------------------------------------------------
-- Drop UNIQUE
------------------------------------------------------------

ALTER TABLE Employees
DROP CONSTRAINT UQ_Email;


------------------------------------------------------------
-- Drop CHECK
------------------------------------------------------------

ALTER TABLE Employees
DROP CONSTRAINT CHK_Age;


------------------------------------------------------------
-- Drop DEFAULT
------------------------------------------------------------

ALTER TABLE Employees
DROP CONSTRAINT DF_Salary;


------------------------------------------------------------
-- Drop View
------------------------------------------------------------

DROP VIEW EmployeeView;


------------------------------------------------------------
-- Drop Procedure
------------------------------------------------------------

DROP PROCEDURE GetEmployees;


------------------------------------------------------------
-- Drop Function
------------------------------------------------------------

DROP FUNCTION CalculateSalary;


------------------------------------------------------------
-- Drop Trigger
------------------------------------------------------------

DROP TRIGGER trg_Insert;


------------------------------------------------------------
-- Drop Schema
------------------------------------------------------------

DROP SCHEMA HR;


------------------------------------------------------------
-- Drop Sequence
------------------------------------------------------------

DROP SEQUENCE EmployeeSequence;


------------------------------------------------------------
-- Drop Clustered Index
------------------------------------------------------------

DROP INDEX CI_Employees
ON Employees;


------------------------------------------------------------
-- Drop Nonclustered Index
------------------------------------------------------------

DROP INDEX NCI_Email
ON Employees;

-----------------------------------------------------------------------
-----------------------------------------------------------------------------
----------------------------------------------------------------------

------------------------------------------------------------
-- Create Database
------------------------------------------------------------

CREATE DATABASE CompanyDB;


------------------------------------------------------------
-- Create Table
------------------------------------------------------------

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50)
);


------------------------------------------------------------
-- Create Table with Constraints
------------------------------------------------------------

CREATE TABLE Employees
(
    EmployeeID INT IDENTITY(1,1)
        CONSTRAINT PK_Employees PRIMARY KEY,

    Name VARCHAR(50)
        CONSTRAINT NN_Name NOT NULL,

    Age INT
        CONSTRAINT CHK_Age CHECK(Age >= 18),

    Email VARCHAR(100)
        CONSTRAINT UQ_Email UNIQUE,

    Salary DECIMAL(10,2)
        CONSTRAINT DF_Salary DEFAULT 30000,

    DepartmentID INT
        CONSTRAINT FK_Employees_Departments
        REFERENCES Departments(DepartmentID)
);


------------------------------------------------------------
-- Create View
------------------------------------------------------------

CREATE VIEW EmployeeView
AS
SELECT *
FROM Employees;


------------------------------------------------------------
-- Create Procedure
------------------------------------------------------------

CREATE PROCEDURE GetEmployees
AS
SELECT *
FROM Employees;


------------------------------------------------------------
-- Create Function
------------------------------------------------------------

CREATE FUNCTION GetBonus
(
    @Salary INT
)
RETURNS INT
AS
BEGIN
    RETURN @Salary * 10 / 100;
END;


------------------------------------------------------------
-- Create Trigger
------------------------------------------------------------

CREATE TRIGGER trg_Insert
ON Employees
AFTER INSERT
AS
PRINT 'Employee Inserted';


------------------------------------------------------------
-- Create Schema
------------------------------------------------------------

CREATE SCHEMA HR;


------------------------------------------------------------
-- Create Sequence
------------------------------------------------------------

CREATE SEQUENCE EmployeeSequence
START WITH 1
INCREMENT BY 1;


------------------------------------------------------------
-- Create Clustered Index
------------------------------------------------------------

CREATE CLUSTERED INDEX CI_Employees
ON Employees(EmployeeID);


------------------------------------------------------------
-- Create Nonclustered Index
------------------------------------------------------------

CREATE NONCLUSTERED INDEX NCI_Email
ON Employees(Email);


------------------------------------------------------------
-- Create Unique Index
------------------------------------------------------------

CREATE UNIQUE INDEX UI_Email
ON Employees(Email);


------------------------------------------------------------
-- Create Computed Column
------------------------------------------------------------

CREATE TABLE Orders
(
    Price DECIMAL(10,2),
    Quantity INT,
    Total AS (Price * Quantity)
);

--------------------------------------------------------


index,schema,view,function,procedure,trigger
