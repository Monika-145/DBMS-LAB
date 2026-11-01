CREATE TABLE Student (
    StudentID INT,
    Name VARCHAR(30),
    Age INT
);

INSERT INTO Student VALUES (1, 'Alice', 20);
INSERT INTO Student VALUES (2, 'Bob', 22);
INSERT INTO Student VALUES (3, 'Charlie', 21);

CREATE TABLE Courses (
    CourseID INT,
    CourseName VARCHAR(20)
);

INSERT INTO Courses VALUES (101, 'Math');
INSERT INTO Courses VALUES (102, 'English');
INSERT INTO Courses VALUES (103, 'History');

CREATE TABLE Enrollments (
    EnrollmentID INT,
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(5)
);

INSERT INTO Enrollments VALUES (1, 1, 101, 'A');
INSERT INTO Enrollments VALUES (2, 1, 102, 'B');
INSERT INTO Enrollments VALUES (3, 2, 101, 'A-');
INSERT INTO Enrollments VALUES (4, 3, 103, 'B+');
INSERT INTO Enrollments VALUES (5, 3, 102, 'A');

SELECT Student.StudentID, Student.Name, Student.Age,
       Courses.CourseID, Courses.CourseName, Enrollments.Grade
FROM Student
INNER JOIN Enrollments
ON Student.StudentID = Enrollments.StudentID
INNER JOIN Courses
ON Enrollments.CourseID = Courses.CourseID;

Output:
StudentID	Name	Age	CourseID	CourseName	Grade
1	Alice	20	101	Math	A
1	Alice	20	102	English	B
2	Bob	22	101	Math	A-
3	Charlie	21	103	History	B+
3	Charlie	21	102	English	A

SELECT Student.StudentID, Student.Name, Student.Age,
       Courses.CourseID, Courses.CourseName, Enrollments.Grade
FROM Student
LEFT JOIN Enrollments
ON Student.StudentID = Enrollments.StudentID
LEFT JOIN Courses
ON Enrollments.CourseID = Courses.CourseID;

       Output:
StudentID	Name	Age	CourseID	CourseName	Grade
1	Alice	20	101	Math	A
1	Alice	20	102	English	B
2	Bob	22	101	Math	A-
3	Charlie	21	103	History	B+
3	Charlie	21	102	English	A

SELECT Student.StudentID, Student.Name, Student.Age,
       Courses.CourseID, Courses.CourseName, Enrollments.Grade
FROM Courses
RIGHT JOIN Enrollments
ON Courses.CourseID = Enrollments.CourseID
RIGHT JOIN Student
ON Enrollments.StudentID = Student.StudentID;

Output:
StudentID	Name	Age	CourseID	CourseName	Grade
1	Alice	20	101	Math	A
1	Alice	20	102	English	B
3	Charlie	21	103	History	B+
2	Bob	22	101	Math	A-
3	Charlie	21	102	English	A
