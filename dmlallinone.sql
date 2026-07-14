/*

------------------------------------------------------------
-- Insert all columns
------------------------------------------------------------

INSERT INTO Employees
VALUES
(1,'Alice',25,'alice@gmail.com',30000,1);


------------------------------------------------------------
-- Insert specific columns
------------------------------------------------------------

INSERT INTO Employees
(Name,Age,Email,Salary)
VALUES
('Bob',30,'bob@gmail.com',40000);


------------------------------------------------------------
-- Insert multiple rows
------------------------------------------------------------

INSERT INTO Employees
(Name,Age,Email,Salary)
VALUES
('Charlie',26,'charlie@gmail.com',35000),
('David',28,'david@gmail.com',45000),
('Eva',31,'eva@gmail.com',50000);


------------------------------------------------------------
-- Insert NULL
------------------------------------------------------------

INSERT INTO Employees
(Name,Age,Email,Phone)
VALUES
('Frank',29,'frank@gmail.com',NULL);


------------------------------------------------------------
-- Insert DEFAULT
------------------------------------------------------------

INSERT INTO Employees
(Name,Age,Email,Salary)
VALUES
('Grace',27,'grace@gmail.com',DEFAULT);


------------------------------------------------------------
-- Insert using SELECT
------------------------------------------------------------

INSERT INTO EmployeeBackup
SELECT *
FROM Employees;


------------------------------------------------------------
-- Insert selected columns using SELECT
------------------------------------------------------------

INSERT INTO EmployeeBackup
(Name,Salary)
SELECT
    Name,
    Salary
FROM Employees;


------------------------------------------------------------
-- Insert using SELECT with WHERE
------------------------------------------------------------

INSERT INTO EmployeeBackup
SELECT *
FROM Employees
WHERE DepartmentID = 2;


------------------------------------------------------------
-- Insert selected columns using SELECT + WHERE
------------------------------------------------------------

INSERT INTO EmployeeBackup
(Name,Salary)
SELECT
    Name,
    Salary
FROM Employees
WHERE Salary > 50000;


------------------------------------------------------------
-- Insert using ORDER BY
------------------------------------------------------------

INSERT INTO EmployeeBackup
SELECT *
FROM Employees
ORDER BY Salary DESC;


------------------------------------------------------------
-- Insert TOP rows
------------------------------------------------------------

INSERT INTO EmployeeBackup
SELECT TOP 5 *
FROM Employees
ORDER BY Salary DESC;


------------------------------------------------------------
-- Insert DISTINCT values
------------------------------------------------------------

INSERT INTO Departments
(DepartmentName)
SELECT DISTINCT DepartmentName
FROM Employees;


------------------------------------------------------------
-- Insert using JOIN
------------------------------------------------------------

INSERT INTO EmployeeReport
(EmployeeID,Name,DepartmentName)
SELECT
    E.EmployeeID,
    E.Name,
    D.DepartmentName
FROM Employees E
JOIN Departments D
ON E.DepartmentID = D.DepartmentID;


------------------------------------------------------------
-- Insert using GROUP BY
------------------------------------------------------------

INSERT INTO DepartmentSummary
(DepartmentID,TotalEmployees)
SELECT
    DepartmentID,
    COUNT(*)
FROM Employees
GROUP BY DepartmentID;


------------------------------------------------------------
-- Insert using HAVING
------------------------------------------------------------

INSERT INTO DepartmentSummary
(DepartmentID,TotalEmployees)
SELECT
    DepartmentID,
    COUNT(*)
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) > 5;


------------------------------------------------------------
-- Insert using Subquery
------------------------------------------------------------

INSERT INTO HighSalaryEmployees
SELECT *
FROM Employees
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employees
);


------------------------------------------------------------
-- View inserted rows
------------------------------------------------------------

INSERT INTO Employees
(Name,Age)
OUTPUT inserted.*
VALUES
('Henry',25);


-----------------------------------------------------------------
------------------------------------------------------------------------------
-------------------------------------------------------------------------

------------------------------------------------------------
-- Update one column
------------------------------------------------------------

UPDATE Employees
SET Salary = 50000
WHERE EmployeeID = 1;


------------------------------------------------------------
-- Update multiple columns
------------------------------------------------------------

UPDATE Employees
SET
    Salary = 60000,
    Age = 30
WHERE EmployeeID = 2;


------------------------------------------------------------
-- Update all rows
------------------------------------------------------------

UPDATE Employees
SET Salary = 35000;


------------------------------------------------------------
-- Update using WHERE
------------------------------------------------------------

UPDATE Employees
SET Salary = 70000
WHERE DepartmentID = 2;


------------------------------------------------------------
-- Update using AND
------------------------------------------------------------

UPDATE Employees
SET Salary = 80000
WHERE DepartmentID = 2
AND Age > 25;


------------------------------------------------------------
-- Update using OR
------------------------------------------------------------

UPDATE Employees
SET Salary = 40000
WHERE DepartmentID = 1
OR DepartmentID = 2;


------------------------------------------------------------
-- Update using IN
------------------------------------------------------------

UPDATE Employees
SET Salary = 45000
WHERE DepartmentID IN (1,2);


------------------------------------------------------------
-- Update using BETWEEN
------------------------------------------------------------

UPDATE Employees
SET Salary = Salary + 5000
WHERE Salary BETWEEN 30000 AND 50000;


------------------------------------------------------------
-- Update using LIKE
------------------------------------------------------------

UPDATE Employees
SET Salary = 60000
WHERE Name LIKE 'A%';


------------------------------------------------------------
-- Update using IS NULL
------------------------------------------------------------

UPDATE Employees
SET Phone = '9999999999'
WHERE Phone IS NULL;


------------------------------------------------------------
-- Arithmetic Update
------------------------------------------------------------

UPDATE Employees
SET Salary = Salary + 5000;


------------------------------------------------------------
-- Update using Expressions
------------------------------------------------------------

UPDATE Employees
SET
    Salary = Salary * 1.10,
    Age = Age + 1;


------------------------------------------------------------
-- Update using CASE
------------------------------------------------------------

UPDATE Employees
SET Salary =
CASE
    WHEN DepartmentID = 1 THEN 50000
    WHEN DepartmentID = 2 THEN 70000
    ELSE 40000
END;


------------------------------------------------------------
-- Update using DEFAULT
------------------------------------------------------------

UPDATE Employees
SET Salary = DEFAULT
WHERE EmployeeID = 3;


------------------------------------------------------------
-- Update using JOIN
------------------------------------------------------------

UPDATE E
SET E.Salary = B.Salary
FROM Employees E
JOIN EmployeeBackup B
ON E.EmployeeID = B.EmployeeID;


------------------------------------------------------------
-- Update using Subquery
------------------------------------------------------------

UPDATE Employees
SET Salary =
(
    SELECT AVG(Salary)
    FROM Employees
);



--------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
---------------------------------------------------------------------------------
------------------------------------------------------------
-- Delete all rows
------------------------------------------------------------

DELETE FROM Employees;


------------------------------------------------------------
-- Delete using WHERE
------------------------------------------------------------

DELETE FROM Employees
WHERE EmployeeID = 1;


------------------------------------------------------------
-- Delete using AND
------------------------------------------------------------

DELETE FROM Employees
WHERE DepartmentID = 2
AND Salary > 50000;


------------------------------------------------------------
-- Delete using OR
------------------------------------------------------------

DELETE FROM Employees
WHERE DepartmentID = 1
OR DepartmentID = 3;


------------------------------------------------------------
-- Delete using IN
------------------------------------------------------------

DELETE FROM Employees
WHERE DepartmentID IN (1,2,3);


------------------------------------------------------------
-- Delete using BETWEEN
------------------------------------------------------------

DELETE FROM Employees
WHERE Salary BETWEEN 30000 AND 50000;


------------------------------------------------------------
-- Delete using LIKE
------------------------------------------------------------

DELETE FROM Employees
WHERE Name LIKE 'A%';


------------------------------------------------------------
-- Delete using NOT LIKE
------------------------------------------------------------

DELETE FROM Employees
WHERE Name NOT LIKE 'A%';


------------------------------------------------------------
-- Delete using IS NULL
------------------------------------------------------------

DELETE FROM Employees
WHERE Phone IS NULL;


------------------------------------------------------------
-- Delete using IS NOT NULL
------------------------------------------------------------

DELETE FROM Employees
WHERE Phone IS NOT NULL;


------------------------------------------------------------
-- Delete using EXISTS
------------------------------------------------------------

DELETE FROM Employees
WHERE EXISTS
(
    SELECT *
    FROM Departments
    WHERE Departments.DepartmentID = Employees.DepartmentID
);


------------------------------------------------------------
-- Delete using NOT EXISTS
------------------------------------------------------------

DELETE FROM Employees
WHERE NOT EXISTS
(
    SELECT *
    FROM Departments
    WHERE Departments.DepartmentID = Employees.DepartmentID
);


------------------------------------------------------------
-- Delete using Subquery
------------------------------------------------------------

DELETE FROM Employees
WHERE Salary <
(
    SELECT AVG(Salary)
    FROM Employees
);


------------------------------------------------------------
-- Delete TOP rows
------------------------------------------------------------

DELETE TOP (5)
FROM Employees;


------------------------------------------------------------
-- Delete TOP rows using ORDER BY
------------------------------------------------------------

DELETE FROM Employees
WHERE EmployeeID IN
(
    SELECT TOP (5) EmployeeID
    FROM Employees
    ORDER BY Salary DESC
);


------------------------------------------------------------
-- Delete using JOIN
------------------------------------------------------------

DELETE E
FROM Employees E
JOIN Departments D
ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'HR';


------------------------------------------------------------
-- Delete with OUTPUT
------------------------------------------------------------

DELETE FROM Employees
OUTPUT deleted.*
WHERE EmployeeID = 1;










---------------------------------------------------------
------------------------------------------------------------
-- Basic TRUNCATE
------------------------------------------------------------

TRUNCATE TABLE Employees;


------------------------------------------------------------
-- TRUNCATE inside Transaction
------------------------------------------------------------

BEGIN TRANSACTION;

TRUNCATE TABLE Employees;

ROLLBACK;


------------------------------------------------------------
-- Commit TRUNCATE
------------------------------------------------------------

BEGIN TRANSACTION;

TRUNCATE TABLE Employees;

COMMIT;