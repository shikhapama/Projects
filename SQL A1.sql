-- Shikha Yadav; Roll No:24WU0202367; Course:MBA(BA) 
-- Create a New Database:
CREATE DATABASE UniversityDB;
-- Use the Database:
USE UniversityDB;
-- Students Table:
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    DepartmentID INT,
    EnrollmentDate DATE
);
-- Departments Table:
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
-- Courses Table:
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT
);
-- Enrollments Table:
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade CHAR(1)
);
-- Students Data:
INSERT INTO Students (StudentID, Name, Gender, Age, DepartmentID, EnrollmentDate)
VALUES
(1, 'John Smith', 'Male', 20, 101, '2021-08-15'),
(2, 'Sarah Johnson', 'Female', 22, 102, '2020-09-10'),
(3, 'Michael Brown', 'Male', 21, 101, '2021-01-20'),
(4, 'Emily Davis', 'Female', 23, 103, '2019-07-25'),
(5, 'Daniel Wilson', 'Male', 20, 104, '2022-03-05');
-- Departments Data:
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'Computer Science'),
(102, 'Business'),
(103, 'Psychology'),
(104, 'Physics');
-- Courses Data:
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits)
VALUES
(201, 'Data Structures', 101, 3),
(202, 'Marketing Basics', 102, 2),
(203, 'Cognitive Science', 103, 4),
(204, 'Quantum Mechanics', 104, 3);
-- Enrollments Data:
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Grade)
VALUES
(1, 1, 201, 'A'),
(2, 2, 202, 'B'),
(3, 3, 201, 'C'),
(4, 4, 203, 'A'),
(5, 5, 204, 'B');
-- Questions and Answers:
-- 1. Retrieve all records from the 'Students' table.
SELECT * FROM Students;
-- 2. Display the names and departments of all students.
SELECT s.Name, d.DepartmentName
FROM Students s
JOIN Departments d ON s.DepartmentID = d.DepartmentID;
-- 3. Select all students who are 20 years old.
SELECT * FROM Students
WHERE Age = 20;
-- 4. Retrieve all courses with exactly 3 credits.
SELECT * FROM Courses
WHERE Credits = 3;
-- 5. Retrieve all enrollments where the grade is 'A'.
SELECT * FROM Enrollments
WHERE Grade = 'A';
-- 6. Group students by 'Gender' and count the number of students in each gender.
SELECT Gender, COUNT(*) AS StudentCount
FROM Students
GROUP BY Gender;
-- 7. Retrieve all students, sorted by their 'EnrollmentDate' in ascending order.
SELECT * FROM Students
ORDER BY EnrollmentDate ASC;
-- 8. Group enrollments by 'CourseID' and count the number of students in each course.
SELECT CourseID, COUNT(*) AS StudentCount
FROM Enrollments
GROUP BY CourseID;
-- 9. Perform an INNER JOIN between 'Students' and 'Departments' tables to retrieve student names and their department names.
SELECT s.Name, d.DepartmentName
FROM Students s
JOIN Departments d ON s.DepartmentID = d.DepartmentID;
-- 10. Find all courses where the 'CourseName' starts with the letter 'D'.
SELECT * FROM Courses
WHERE CourseName LIKE 'D%';
-- 11. Calculate the total credits taken by each student using a JOIN between 'Students', 'Courses', and 'Enrollments'.
SELECT s.Name, SUM(c.Credits) AS TotalCredits
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY s.Name;
-- 12. Find the total number of students in each department using a JOIN.
SELECT d.DepartmentName, COUNT(s.StudentID) AS StudentCount
FROM Students s
JOIN Departments d ON s.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;
-- 13. Calculate the average age of students in each department.
SELECT d.DepartmentName, AVG(s.Age) AS AverageAge
FROM Students s
JOIN Departments d ON s.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;
-- 14. Find the department with the most students enrolled.
SELECT d.DepartmentName, COUNT(s.StudentID) AS StudentCount
FROM Students s
JOIN Departments d ON s.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY StudentCount DESC
LIMIT 1;
-- 15. Find the course with the most enrollments.
SELECT c.CourseName, COUNT(e.EnrollmentID) AS EnrollmentCount
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseName
ORDER BY EnrollmentCount DESC
LIMIT 1;
-- 16. Retrieve all students who enrolled in courses with more than 3 credits.
SELECT DISTINCT s.Name
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.Credits > 3;
-- 17. Calculate the total number of credits for all courses in the 'Physics' department.
SELECT SUM(c.Credits) AS TotalCredits
FROM Courses c
JOIN Departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Physics';
-- 18. Find the student with the highest average grade across all courses.
SELECT s.Name, AVG(
    CASE 
        WHEN e.Grade = 'A' THEN 4
        WHEN e.Grade = 'B' THEN 3
        WHEN e.Grade = 'C' THEN 2
        WHEN e.Grade = 'D' THEN 1
        ELSE 0
    END) AS AverageGrade
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.Name
ORDER BY AverageGrade DESC
LIMIT 1;
-- 19. Retrieve all students who enrolled after 2021-01-01 and are in the 'Computer Science' department.
SELECT s.Name
FROM Students s
JOIN Departments d ON s.DepartmentID = d.DepartmentID
WHERE s.EnrollmentDate > '2021-01-01' AND d.DepartmentName = 'Computer Science';
-- 20. Identify courses where students scored the grade 'A' and calculate the total number of students achieving this grade.
SELECT c.CourseName, COUNT(e.StudentID) AS StudentCount
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
WHERE e.Grade = 'A'
GROUP BY c.CourseName;


















