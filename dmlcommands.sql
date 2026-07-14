CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments
VALUES
(1,'HR'),
(2,'IT');

CREATE TABLE Employees
(
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 18),
    Email VARCHAR(100) UNIQUE,
    Salary INT DEFAULT 30000,
    DepartmentID INT,

    FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees
(Name, Age, Email, DepartmentID)
VALUES
('Alice',25,'alice@gmail.com',2);

INSERT INTO Employees
(Name, Age, Email, Salary, DepartmentID)
VALUES
('Bob',30,'bob@gmail.com',DEFAULT,1);

INSERT INTO Employees
(Name, Age, Email, DepartmentID)
VALUES
('Charlie',17,'charlie@gmail.com',2);

select * from employees

--------------------------------------------

select * from customers
-------------------------------------------
update customers
set score = null
where score=0
-----------------------------------
delete from customers
where id>5
---------------------
drop table persons