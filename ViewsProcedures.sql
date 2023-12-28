-- Use the database
USE DANIELS2023
;

/*
Create Stored Procedure: AddNewStudent to existing STUDENT Table
*/
DROP PROCEDURE IF EXISTS AddNewStudent;

CREATE PROCEDURE AddNewStudent 

  @StudentID INT 
  ,@FirstName VARCHAR(255) 
  ,@LastName VARCHAR(255)
  ,@Enrollment VARCHAR(20)
  ,@Level VARCHAR(255)
  ,@IsActive INT
  ,@PersonalEmail VARCHAR(255)
  ,@SchoolEmail VARCHAR(255)
AS
BEGIN
  INSERT INTO STUDENT (StudentID, FirstName, LastName, Enrollment, Level, IsActive, PersonalEmail, SchoolEmail)
  VALUES (@StudentID, @FirstName, @LastName, @Enrollment, @Level, @IsActive, @PersonalEmail, @SchoolEmail);
END
;

-- Add New Student Using AddNewStudent Stored Procedure

EXEC AddNewStudent 
  @StudentID = 873677720 
  ,@FirstName = 'John'
  ,@LastName = 'Doe'
  ,@Enrollment = 'Full Time' 
  ,@Level = 'Undergraduate'
  ,@IsActive = 1
  ,@PersonalEmail = 'john.doe@example.com' 
  ,@SchoolEmail = 'john.doe@du.edu' 
;

-- Check new addition to STUDENT table
SELECT * FROM STUDENT S;

/*
Create View: DepartmentCourseOfferings
Purpose:To list all courses offered by each department.
*/

DROP VIEW IF EXISTS DepartmentCourseOfferings;

CREATE VIEW DepartmentCourseOfferings AS

SELECT 
	D.DepartmentID
	,D.DepartmentName
	,C.CourseName
	,C.CreditAmount
	,C.Level

FROM DEPARTMENT D

INNER JOIN COURSE C 
	ON D.DepartmentID = C.DepartmentID
;

-- Check View DepartmentCourseOfferings

SELECT * FROM DepartmentCourseOfferings ORDER BY DepartmentID;

/*
Create View: ProfessorTeachingSchedule
Purpose: To display professors, their courses, academic quarters, years, and credit amounts, aiding in academic planning and schedule overview.
*/

DROP VIEW IF EXISTS ProfessorTeachingSchedule;

CREATE VIEW ProfessorTeachingSchedule AS

SELECT 
    T.CourseID
  	,P.DepartmentID
    ,C.CourseName
    ,P.FirstName
    ,P.LastName
    ,C.Quarter
    ,T.Year
    ,C.CreditAmount

FROM PROFESSOR P

JOIN TEACH_SCHEDULE T 
    ON P.ProfID = T.ProfID

JOIN DEPARTMENT D 
    ON P.DepartmentID = D.DepartmentID

JOIN COURSE C 
    ON T.CourseID = C.CourseID
;

-- Check ProfessorTeachingSchedule View
SELECT * FROM ProfessorTeachingSchedule;
