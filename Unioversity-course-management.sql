-- =========================================================
-- UNIVERSITY COURSE MANAGEMENT SYSTEM
-- PART A : DATABASE SETUP
-- =========================================================

CREATE DATABASE IF NOT EXISTS UniversityCourseManagement;
USE UniversityCourseManagement;

SELECT DATABASE() AS CurrentDatabase;
SELECT VERSION() AS MySQLVersion;
SHOW TABLES;

-- =========================================================
-- PART B : TABLE CREATION
-- =========================================================

DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    BirthDate DATE NOT NULL,
    EnrollmentDate DATE NOT NULL
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentID INT NOT NULL,
    Credits INT NOT NULL,
    CONSTRAINT chk_course_credits CHECK (Credits BETWEEN 1 AND 6),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    DepartmentID INT NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    UNIQUE (StudentID, CourseID)
);

-- Verify tables
SHOW TABLES;

-- =========================================================
-- PART C : INSERT SAMPLE DATA
-- =========================================================

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Business Administration'),
(4, 'Physics');

INSERT INTO Students
(StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2021-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2022-08-01'),
(3, 'Michael', 'Brown', 'michael.brown@email.com', '2001-03-10', '2023-08-01'),
(4, 'Emily', 'Davis', 'emily.davis@email.com', '2000-07-20', '2024-01-15'),
(5, 'Daniel', 'Wilson', 'daniel.wilson@email.com', '1999-11-05', '2022-01-10'),
(6, 'Sophia', 'Miller', 'sophia.miller@email.com', '2001-09-12', '2023-01-12'),
(7, 'James', 'Moore', 'james.moore@email.com', '2000-12-01', '2021-01-15'),
(8, 'Olivia', 'Taylor', 'olivia.taylor@email.com', '2002-02-18', '2024-08-01'),
(9, 'William', 'Anderson', 'william.anderson@email.com', '1999-06-22', '2022-08-01'),
(10, 'Ava', 'Thomas', 'ava.thomas@email.com', '2001-10-30', '2023-08-01'),
(11, 'Alexander', 'Jackson', 'alexander.jackson@email.com', '2000-04-14', '2021-08-01'),
(12, 'Isabella', 'White', 'isabella.white@email.com', '2002-01-09', '2024-01-15'),
(13, 'Ethan', 'Harris', 'ethan.harris@email.com', '2000-08-17', '2022-01-10'),
(14, 'Mia', 'Martin', 'mia.martin@email.com', '2001-05-03', '2023-01-12'),
(15, 'Lucas', 'Thompson', 'lucas.thompson@email.com', '1999-09-27', '2021-01-15');

INSERT INTO Courses
(CourseID, CourseName, DepartmentID, Credits) VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 1, 4),
(103, 'Database Management', 1, 4),
(104, 'Web Development', 1, 3),
(105, 'Mathematics I', 2, 4),
(106, 'Calculus', 2, 4),
(107, 'Statistics', 2, 3),
(108, 'Business Analytics', 3, 3),
(109, 'Physics I', 4, 4);

INSERT INTO Instructors
(InstructorID, FirstName, LastName, Email, DepartmentID, Salary) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 72000.00),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 68000.00),
(3, 'Carol', 'Walker', 'carol.walker@univ.com', 3, 65000.00),
(4, 'David', 'Hall', 'david.hall@univ.com', 4, 70000.00),
(5, 'Emma', 'Allen', 'emma.allen@univ.com', 1, 76000.00);

-- More than 5 students are intentionally enrolled in Course 101.
INSERT INTO Enrollments
(EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, 101, '2021-08-01'),
(2, 2, 101, '2022-08-01'),
(3, 3, 101, '2023-08-01'),
(4, 4, 101, '2024-01-15'),
(5, 5, 101, '2022-01-10'),
(6, 6, 101, '2023-01-12'),
(7, 7, 101, '2021-01-15'),
(8, 8, 102, '2024-08-01'),
(9, 9, 102, '2022-08-01'),
(10, 10, 102, '2023-08-01'),
(11, 11, 103, '2021-08-01'),
(12, 12, 104, '2024-01-15'),
(13, 13, 105, '2022-01-10'),
(14, 14, 106, '2023-01-12'),
(15, 15, 107, '2021-01-15'),
(16, 1, 105, '2021-08-01'),
(17, 2, 106, '2022-08-01'),
(18, 3, 107, '2023-08-01'),
(19, 4, 108, '2024-01-15'),
(20, 5, 109, '2022-01-10'),
(21, 6, 102, '2023-01-12'),
(22, 7, 103, '2021-01-15'),
(23, 8, 104, '2024-08-01'),
(24, 9, 105, '2022-08-01'),
(25, 10, 106, '2023-08-01'),
(26, 11, 107, '2021-08-01'),
(27, 12, 108, '2024-01-15'),
(28, 13, 109, '2022-01-10'),
(29, 14, 101, '2023-01-12'),
(30, 15, 102, '2021-01-15');

-- =========================================================
-- PART D : CRUD OPERATIONS
-- =========================================================

-- CREATE
INSERT INTO Students
(StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES
(16, 'Test', 'Student', 'test.student@email.com', '2002-06-15', '2025-01-10');

-- READ
SELECT * FROM Students;

-- UPDATE
UPDATE Students
SET Email = 'updated.student@email.com'
WHERE StudentID = 16;

SELECT * FROM Students WHERE StudentID = 16;

-- DELETE
DELETE FROM Students
WHERE StudentID = 16;

SELECT * FROM Students WHERE StudentID = 16;

-- =========================================================
-- PART E : FILTERING, GROUPING AND AGGREGATE FUNCTIONS
-- =========================================================

-- Query 2: Students enrolled after 2022
SELECT *
FROM Students
WHERE EnrollmentDate > '2022-12-31';

-- Query 3: Mathematics courses, maximum 5
SELECT c.CourseID, c.CourseName, c.Credits
FROM Courses c
INNER JOIN Departments d
    ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;

-- Query 4: Courses with more than 5 enrolled students
SELECT
    c.CourseID,
    c.CourseName,
    COUNT(e.StudentID) AS TotalStudents
FROM Courses c
INNER JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(e.StudentID) > 5;

-- Query 5: Students enrolled in BOTH Introduction to SQL and Data Structures
SELECT
    s.StudentID,
    s.FirstName,
    s.LastName
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.CourseName) = 2;

-- Query 6: Students enrolled in Introduction to SQL OR Data Structures
SELECT DISTINCT
    s.StudentID,
    s.FirstName,
    s.LastName,
    s.Email
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');

-- Query 7: Average course credits
SELECT
    AVG(Credits) AS AverageCredits
FROM Courses;

-- =========================================================
-- PART F : SALARY, JOIN AND SUBQUERY
-- =========================================================

-- Query 8: Maximum instructor salary
SELECT
    MAX(Salary) AS MaximumInstructorSalary
FROM Instructors;

-- Query 9: Number of students enrolled in each department
SELECT
    d.DepartmentID,
    d.DepartmentName,
    COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Courses c
    ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY d.DepartmentID;

-- Query 10: INNER JOIN - students and their courses
SELECT
    s.StudentID,
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    c.CourseID,
    c.CourseName,
    e.EnrollmentDate
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID
ORDER BY s.StudentID;

-- Query 11: LEFT JOIN - all students including students without enrollment
SELECT
    s.StudentID,
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    c.CourseName
FROM Students s
LEFT JOIN Enrollments e
    ON s.StudentID = e.StudentID
LEFT JOIN Courses c
    ON e.CourseID = c.CourseID
ORDER BY s.StudentID;

-- Query 12: Subquery - students enrolled in courses with more than 10 students
SELECT *
FROM Students
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollments
    WHERE CourseID IN (
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 10
    )
);

-- =========================================================
-- PART G : STRING, DATE, WINDOW FUNCTION AND CASE
-- =========================================================

-- Query 13: Extract enrollment year
SELECT
    StudentID,
    EnrollmentDate,
    YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students
ORDER BY EnrollmentDate;

-- Query 14: Concatenate instructor first and last name
SELECT
    InstructorID,
    CONCAT(FirstName, ' ', LastName) AS InstructorName
FROM Instructors;

-- Query 15: Running total of enrollments by date
SELECT
    EnrollmentDate,
    EnrollmentID,
    StudentID,
    SUM(1) OVER (
        ORDER BY EnrollmentDate, EnrollmentID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotal
FROM Enrollments
ORDER BY EnrollmentDate, EnrollmentID;

-- Query 16: Senior / Junior using CASE
SELECT
    StudentID,
    FirstName,
    LastName,
    EnrollmentDate,
    CASE
        WHEN TIMESTAMPDIFF(YEAR, EnrollmentDate, CURDATE()) > 4
            THEN 'Senior'
        ELSE 'Junior'
    END AS StudentLevel
FROM Students
ORDER BY EnrollmentDate;

-- =========================================================
-- PART H : FINAL VERIFICATION
-- =========================================================

SELECT COUNT(*) AS TotalDepartments FROM Departments;
SELECT COUNT(*) AS TotalStudents FROM Students;
SELECT COUNT(*) AS TotalCourses FROM Courses;
SELECT COUNT(*) AS TotalInstructors FROM Instructors;
SELECT COUNT(*) AS TotalEnrollments FROM Enrollments;

-- Display final data
SELECT * FROM Departments;
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Enrollments;

-- =========================================================
-- END OF UNIVERSITY COURSE MANAGEMENT SYSTEM PROJECT
-- =========================================================
