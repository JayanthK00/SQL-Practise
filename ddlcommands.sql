----------ddl------------

create table persons (
	id int not null,
	person_name varchar(50) not null,
	birth_date date ,
	phone varchar(13) not null,
	constraint pk_persons primary key (id)
	)

	select * from persons

--------------------------------
alter table persons
	add email varchar(50) not null

---------------------------------------
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

 CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 18),
    Gender CHAR(1) CHECK (Gender IN ('M','F')),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15) NULL,
    Salary DECIMAL(10,2) DEFAULT 30000,
    Bonus MONEY DEFAULT 0,
    JoiningDate DATE DEFAULT GETDATE(),
    IsActive BIT DEFAULT 1,
    DepartmentID INT NOT NULL,

   /* FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)*/
);
---------------------------------------------
select * from Employees

-------------------------------------------

/* CREATE TABLE EmployeeDetails
(
    EmployeeGUID UNIQUEIDENTIFIER
        ROWGUIDCOL
        CONSTRAINT PK_Employee PRIMARY KEY,

    EmployeeName NVARCHAR(100)
        COLLATE Latin1_General_CI_AS
        NOT NULL,

    Email VARCHAR(100)
        SPARSE
        UNIQUE,

    Salary DECIMAL(10,2)
        MASKED WITH (FUNCTION = 'default()'),

    AadhaarNo NVARCHAR(20)
        ENCRYPTED WITH
        (
            COLUMN_ENCRYPTION_KEY = CEK1,
            ENCRYPTION_TYPE = RANDOMIZED,
            ALGORITHM = 'AEAD_AES_256_CBC_HMAC_SHA_256'
        ),

    Resume VARBINARY(MAX)
        FILESTREAM,

    Photo VARBINARY(MAX),

    DepartmentID INT,

    /*CONSTRAINT FK_Department
        FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)*/
)
ON [PRIMARY]
FILESTREAM_ON [FileStreamGroup]
TEXTIMAGE_ON [PRIMARY];

CREATE CLUSTERED INDEX CI_Employee
ON EmployeeDetails(EmployeeGUID);

CREATE NONCLUSTERED INDEX NCI_Email
ON EmployeeDetails(Email);

CREATE NONCLUSTERED INDEX NCI_Department
ON EmployeeDetails(DepartmentID);  */



--------------------------------------

/* CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employees
(
    EmployeeID INT
        CONSTRAINT PK_Employees PRIMARY KEY,

    Name VARCHAR(50),

    Email VARCHAR(100)
        CONSTRAINT UQ_Email UNIQUE,

    Age INT
        CONSTRAINT CHK_Age CHECK(Age>=18),

    Salary INT
        CONSTRAINT DF_Salary DEFAULT 30000,

    DepartmentID INT,

    CONSTRAINT FK_Employees_Departments
    FOREIGN KEY(DepartmentID)
    REFERENCES Departments(DepartmentID)
);

ALTER TABLE Employees
DROP CONSTRAINT CHK_Age;

ALTER TABLE Employees
DROP CONSTRAINT DF_Salary;

ALTER TABLE Employees
DROP CONSTRAINT UQ_Email;

ALTER TABLE Employees
DROP CONSTRAINT FK_Employees_Departments;

ALTER TABLE Employees
DROP CONSTRAINT PK_Employees;

ALTER TABLE Employees
DROP COLUMN Salary;

DROP TABLE Employees;

DROP TABLE Departments; */