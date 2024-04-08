--Create Department
CREATE TABLE Departments (
    DepId INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(100)
);

--ADD Department
INSERT INTO Departments (DepartmentName) VALUES
('Finance'),
('Human Resources'),
('It');

--Create Employees table
CREATE TABLE Employees(
 IdEmp INT PRIMARY KEY IDENTITY(1,1),
 Fullname VARCHAR(100),
 Age INT,
 Email VARCHAR(100),
 Salary DECIMAL(10,2),
 DepId INT,
 FOREIGN KEY (DepId) REFERENCES Departments(DepId)
);
--Add Employees
INSERT INTO Employees (Fullname, Age, Email, Salary,DepId) VALUES
('Tabriz Hashimov' ,23,'tabriz@gmail.com',700,1),
('Tural Tural',27,'tural@gmail.com',900,2),
('Doler Ipsum',28,'doler@gmail.com',500,3),
('Sit amet',33,'sit@gmail.com',450,2);

--Deletion, editing and various operations
EXEC sp_rename 'Employee.Personid', 'Id', 'COLUMN';
SELECT * FROM Departments;
SELECT * FROM Employees;
UPDATE Employees SET Salary = 550 WHERE IdEmp = 1;
SELECT * FROM Employees WHERE Salary = 550;
SELECT Fullname, Email, Salary FROM Employees;
DELETE FROM Employees WHERE DepId IS NULL;

--add user again
INSERT INTO Employees (Fullname, Age, Email, Salary, DepId)
SELECT 'Amet Hash', 30, 'Amet@gmail.com', 500,1
UNION ALL SELECT 'Umid Yashar', 25, 'umid@gmail.com', 600,2









