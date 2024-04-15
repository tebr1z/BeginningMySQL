-- Course adında verilənlər bazasını yaratmaq
CREATE DATABASE Course;


-- Course verilənlər bazasını istifadə etmək
USE Course;


-- Users cədvəlini yaratmaq
CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(255) NOT NULL,
    Surname NVARCHAR(255) NOT NULL,
    Age INT,
    Email NVARCHAR(255) NOT NULL,
    IsDeleted BIT
);


-- Educations cədvəlini yaratmaq
CREATE TABLE Educations (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(255) NOT NULL
);


-- Teachers cədvəlini yaratmaq
CREATE TABLE Teachers (
    Id INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(255) NOT NULL,
    Age INT,
    Email NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255),
    IsDeleted BIT
);


-- 1. Butun userlerin siyahisini cixarsin.
SELECT * FROM Users;


-- 2. Yashi 20 den kicik olan userlerin siyahisini cixarsin.
SELECT * FROM Users WHERE Age < 20;


-- 3. Userlerin sayini gosterin.
SELECT COUNT(*) FROM Users;


-- 4. IsDeleted true olan muellimlerin FullName, Age, Address-ni gosterin.
SELECT FullName, Age, Address FROM Teachers WHERE IsDeleted = 1;


-- 5. Yashi 30-dan yuxari olan muellimlerin sayini gosterin.
SELECT COUNT(*) FROM Teachers WHERE Age > 30;


-- Employee table-ı yaradır
CREATE TABLE Employee (
    Id INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(255) NOT NULL,
    Age INT NOT NULL CHECK (Age > 0),
    Email NVARCHAR(255) NOT NULL UNIQUE,
    Salary DECIMAL(10, 2) NOT NULL CHECK (Salary BETWEEN 300 AND 2000)
);


-- Employee-lərin bütün məlumatlarını göstərirsin
SELECT * FROM Employee;


-- OneToMany, OneToOne, ManyToMany nümunələri

-- OneToMany nümunəsi
-- Departments cədvəlini yaratmaq
CREATE TABLE Departments (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(255) NOT NULL
);


-- Employees cədvəlini yaratmaq
CREATE TABLE Employees (
    Id INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(255) NOT NULL,
    DepartmentId INT FOREIGN KEY REFERENCES Departments(Id)
);


-- OneToOne nümunəsi
-- Employees cədvəlini yaratmaq
CREATE TABLE Employees (
    Id INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255) NOT NULL
);


-- EmployeeContacts cədvəlini yaratmaq
CREATE TABLE EmployeeContacts (
    Id INT PRIMARY KEY IDENTITY,
    EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
    PhoneNumber NVARCHAR(20) NOT NULL UNIQUE
);


-- ManyToMany nümunəsi
-- Students cədvəlini yaratmaq
CREATE TABLE Students (
    Id INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(255) NOT NULL
);


-- Courses cədvəlini yaratmaq
CREATE TABLE Courses (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(255) NOT NULL
);


-- StudentCourses cədvəlini yaratmaq
CREATE TABLE StudentCourses (
    StudentId INT FOREIGN KEY REFERENCES Students(Id),
    CourseId INT FOREIGN KEY REFERENCES Courses(Id),
    PRIMARY KEY (StudentId, CourseId)
);



-- Users məlumatlarını daxil edək
INSERT INTO Users (Name, Surname, Age, Email, IsDeleted) VALUES
('Nigar', 'Aliyeva', 25, 'nigar@example.com', 0),
('Tural', 'Abbasov', 30, 'tural@example.com', 0),
('Aysel', 'Mustafayeva', 18, 'aysel@example.com', 0),
('Rauf', 'Huseynov', 22, 'rauf@example.com', 0);

-- Educations məlumatlarını daxil edək
INSERT INTO Educations (Name) VALUES
('Bachelor'),
('Master'),
('PhD');

-- Teachers məlumatlarını daxil edək
INSERT INTO Teachers (FullName, Age, Email, Address, IsDeleted) VALUES
('Nigar Qasimova', 35, 'nigar@example.com', '123 Main St', 0),
('Elşən Sadiqov', 28, 'els@exapmle.com', '456 Elm St', 1),
('Sevda Məmmədova', 40, 'sevda@example.com', '789 Oak St', 0);

-- Employee məlumatlarını daxil edək
INSERT INTO Employee (FullName, Age, Email, Salary) VALUES
('Samir Abbasov', 28, 'samir@example.com', 1500.00),
('Leyla Quliyeva', 32, 'leyla@example.com', 1800.00),
('Orxan Əliyev', 35, 'orxan@example.com', 2000.00);

-- Departments məlumatlarını daxil edək
INSERT INTO Departments (Name) VALUES
('HR'),
('IT'),
('Finance');

-- Employees məlumatlarını daxil edək
INSERT INTO Employees (FullName, DepartmentId) VALUES
('Vüsal Sadıqov', 1),
('Günel İsmayılova', 2),
('Narmin Quliyeva', 3);

-- EmployeeContacts məlumatlarını daxil edək
INSERT INTO EmployeeContacts (EmployeeId, PhoneNumber) VALUES
(1, '123-456-7890'),
(2, '987-654-3210'),
(3, '555-555-5555');

-- Students məlumatlarını daxil edək
INSERT INTO Students (FullName) VALUES
('Eldar Qasımov'),
('Günel Məmmədova'),
('Ramin Şirazlı');

-- Courses məlumatlarını daxil edək
INSERT INTO Courses (Name) VALUES
('Mathematics'),
('Physics'),
('Chemistry');

-- StudentCourses məlumatlarını daxil edək
INSERT INTO StudentCourses (StudentId, CourseId) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3);
