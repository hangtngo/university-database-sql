

-- Create the database

CREATE DATABASE DANIELS2023
;

-- Use the database
USE DANIELS2023
;

/*
Create STUDENT table
*/

DROP TABLE IF EXISTS STUDENT;

CREATE TABLE STUDENT
(
    StudentID INT PRIMARY KEY NOT NULL
    ,FirstName VARCHAR(255) NOT NULL
    ,LastName VARCHAR(255) NOT NULL
    ,Enrollment VARCHAR(20) NOT NULL
    ,Level VARCHAR(255) NOT NULL
    ,IsActive INT CHECK (IsActive IN (0, 1))
    ,PersonalEmail VARCHAR(255) NOT NULL
    ,SchoolEmail VARCHAR(255) NOT NULL
)
;

-- Insert values into STUDENT table
INSERT INTO STUDENT (StudentID, FirstName, LastName, Enrollment, Level, IsActive, PersonalEmail, SchoolEmail)
VALUES
	(873677710, 'Olivia', 'Smith', 'Full Time', 'Undergraduate', 1, 'oliviasmith2@gmail.com', 'olivia.smith@du.edu')
	,(873677711, 'Rajesh', 'Koothrapali', 'Full Time', 'Undergraduate', 1, 'rajeshisthebest@gmail.com', 'rajesh.koothrapali@du.edu')
	,(873677712, 'Lucia', 'Rossi', 'Part Time', 'Undergraduate', 1, 'luciarossi13@gmail.com', 'lucia.rossi@du.edu')
	,(873677713, 'Anh', 'Nguyen', 'Part Time', 'Graduate', 1, 'anhnguyen123@gmail.com', 'anh.nguyen@du.edu')
	,(873677714, 'Fatima', 'Al-Mansoori', 'Full Time', 'Graduate', 1, 'fatimamansoori@gmail.com', 'fatima.almansoori@du.edu')
	,(873677715, 'Carlos', 'Silva', 'Full Time', 'PhD', 1, 'silvacarlos7@outlook.com', 'carlos.silva@du.edu')
	,(873677716, 'Timothee', 'Gayer', 'Part Time', 'PhD', 1, 'gayer@gmail.com', 'timothee.gayer@du.edu')
	,(873677717, 'Rachel', 'Green', 'Full Time', 'Undergraduate', 1, 'racheljanesgreen@gmail.com', 'rachel.green@du.edu')
	,(873677718, 'Aiko', 'Tanaka', 'Part Time', 'Undergraduate', 1, 'tanakaaiko70@outlook.com', 'aiko.tanaka@du.edu')
	,(873677719, 'Li', 'Wei', 'Full Time', 'Graduate', 1, 'liwei90@outlook.com', 'li.wei@du.edu')
;

-- Check STUDENT table
SELECT * FROM STUDENT S;

/* 
Create DEPARTMENT table
*/

DROP TABLE IF EXISTS DEPARTMENT;

CREATE TABLE DEPARTMENT
(
    DepartmentID INT PRIMARY KEY NOT NULL
    ,DepartmentName VARCHAR(100) NOT NULL
    ,DepartmentDescription TEXT
)
;

-- Insert values into DEPARTMENT table
INSERT INTO DEPARTMENT (DepartmentID, DepartmentName, DepartmentDescription)
VALUES
	(101, 'Accounting', 'Focuses on the principles and practices of financial reporting, managerial accounting, auditing, and taxation. This department prepares students for careers in accounting and finance, emphasizing accuracy, ethics, and regulatory compliance.')
	,(102, 'Finance', 'Dedicated to teaching the fundamentals of financial analysis, investment management, corporate finance, and financial markets. The department prepares students for careers in banking, investment, and financial planning with a strong foundation in financial theory and practice.')
	,(103, 'Marketing', 'Explores marketing strategies, consumer behavior, digital marketing, and market research. This department equips students with skills in advertising, branding, and market analysis, preparing them for dynamic roles in the marketing sector.')
	,(104, 'Management', 'Focuses on leadership, organizational behavior, strategic planning, and human resources management. This department prepares future leaders and managers with skills in decision-making, team management, and business strategy.')
	,(105, 'Operations Management', 'Centers around the use of information technology in business, covering topics like data analytics, systems design, and IT management. This department prepares students for roles in the rapidly evolving digital business landscape.')
	,(106, 'Information Systems', 'Focuses on new venture creation, business innovation, and startup management. The department encourages entrepreneurial thinking and provides practical skills for starting and growing business ventures.')
	,(107, 'Entrepreneurship', 'Explores global trade, international market dynamics, and cross-cultural management. This department prepares students for careers in a globalized business environment, emphasizing international business strategies and practices.')
	,(108, 'International Business', 'Offers insights into economic theories, policies, and microeconomic and macroeconomic analysis. The department prepares students for diverse careers in economics, finance, and policy analysis.')
	,(109, 'Economics', 'Deals with legal aspects of business operations, corporate governance, and ethical business practices. This department prepares students to navigate the complex legal and ethical dimensions of the business world.')
	,(110, 'Business Ethics and Law', 'Deals with legal aspects of business operations, corporate governance, and ethical business practices. This department prepares students to navigate the complex legal and ethical dimensions of the business world.')
;

-- Check DEPARTMENT table
SELECT * FROM DEPARTMENT D;

/*
Create COURSE table
*/

DROP TABLE IF EXISTS COURSE;

CREATE TABLE COURSE
(
    CourseID INT PRIMARY KEY NOT NULL
    ,DepartmentID INT NOT NULL
    ,CourseName VARCHAR(100) NOT NULL
    ,CreditAmount INT NOT NULL
    ,Quarter VARCHAR(10) CHECK (Quarter IN ('Spring', 'Summer', 'Fall', 'Winter')) NOT NULL
    ,Level VARCHAR(255) NOT NULL
    ,FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENT(DepartmentID)
)
;

-- Insert values into COURSE table
INSERT INTO COURSE (CourseID, DepartmentID, CourseName, CreditAmount, Quarter, Level)
VALUES
	(40101, 101, 'Advanced Financial Accounting', 4, 'Fall', 'Graduate')
	,(30102, 102, 'Investment Strategies and Portfolio Management', 4, 'Spring', 'Undergraduate')
	,(50103, 103, 'Digital Marketing and Social Media Strategies', 2, 'Fall', 'PhD')
	,(30104, 104, 'Leadership and Organizational Change', 1, 'Summer', 'Undergraduate')
	,(40105, 105, 'Marketing Behaviors', 2, 'Winter', 'Graduate')
	,(40106, 106, 'Analytics for Business Decision-Making', 4, 'Winter', 'Graduate')
	,(50107, 107, 'Investment Analysis and Portfolio Management', 4, 'Fall', 'PhD')
	,(40108, 108, 'Global Business Dynamics', 2, 'Spring', 'Graduate')
	,(50109, 109, 'Economic Policy and Business Environment', 4, 'Winter', 'PhD')
	,(30110, 110, 'Corporate Ethics and Compliance', 1, 'Summer', 'Undergraduate')
;

-- Check COURSE table
SELECT * FROM COURSE C;

/*
Create TAKE_SCHEDULE table
*/

DROP TABLE IF EXISTS TAKE_SCHEDULE;

CREATE TABLE TAKE_SCHEDULE
(
    StudentID INT NOT NULL
    ,CourseID INT NOT NULL
    ,Year INT CHECK (LEN(CAST(Year AS CHAR(4))) = 4) NOT NULL
    ,FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID)
    ,FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID)
    ,PRIMARY KEY (StudentID, CourseID, Year)
)
;

-- Insert values into TAKE_SCHEDULE table
INSERT INTO TAKE_SCHEDULE (StudentID, CourseID, Year)
VALUES
	(873677710, 30102, 2023)
	,(873677711, 30102, 2022)
	,(873677712, 30110, 2023)
	,(873677713, 40101, 2023)
	,(873677714, 40101, 2024)
	,(873677715, 50103, 2024)
	,(873677716, 50103, 2023)
	,(873677717, 30102, 2022)
	,(873677718, 30102, 2024)
	,(873677719, 40108, 2023)
;

-- Check TAKE_SCHEDULE table
SELECT * FROM TAKE_SCHEDULE TS;


/*
Create SCHOLARSHIP table
*/

DROP TABLE IF EXISTS SCHOLARSHIP;

CREATE TABLE SCHOLARSHIP
(
    ScholarshipID INT PRIMARY KEY NOT NULL
    ,ScholarshipName VARCHAR(500) NOT NULL
    ,ScholarshipCategory VARCHAR(500) NOT NULL
    ,ScholarshipAmount DECIMAL(10,2) NOT NULL
    ,ScholarshipCriteria DECIMAL(3, 1) NOT NULL CHECK (ScholarshipCriteria >= 0 AND ScholarshipCriteria <= 4.0)
    ,ScholarshipDeadline DATE NOT NULL
)
;

-- Insert values into SCHOLARSHIP tables
INSERT INTO SCHOLARSHIP (ScholarshipID, ScholarshipName, ScholarshipCategory, ScholarshipAmount, ScholarshipCriteria, ScholarshipDeadline)
VALUES
	(552877631, 'FootLocker scholarship', 'Athletics scholarship', 1500.00, 3.5, '2023-06-30')
	,(552877632, 'Jackie Robinson Foundation scholarship', 'African American scholarship', 1800.00, 3.5, '2023-10-30')
	,(552877633, 'Microsoft scholarship program', 'STEM scholarship', 1200.00, 2.8, '2024-02-25')
	,(552877634, 'VFW student scholarships', 'Military scholarship', 1200.00, 2.5, '2024-06-30')
	,(552877635, 'Biology students scholarship', 'Alumni scholarship', 4000.00, 3.0, '2024-06-25')
	,(552877636, 'Alfred Lloyd scholarship', 'Undergraduate scholarship', 700.00, 3.0, '2024-11-17')
	,(552877637, 'DU Grad scholarship', 'Graduate scholarship', 3200.00, 3.0, '2024-02-14')
	,(552877638, 'Jenifer Lopez scholarship', 'Student specific scholarship', 1250, 3.0, '2024-04-04')
	,(552877639, 'Monroe scholarship', 'Need-based scholarship', 2600.00, 3.5, '2024-03-31')
	,(552877640, 'John F. Kennedy scholarship', 'Scholarship for extracurriculars', 5000.00, 3.0, '2024-03-15')
;

-- Check SCHOLARSHIP table
SELECT * FROM SCHOLARSHIP;

/*
Create STUDENT_SCHOLARSHIP table
*/

DROP TABLE IF EXISTS STUDENT_SCHOLARSHIP;

CREATE TABLE STUDENT_SCHOLARSHIP
(
    StudentID INT
    ,ScholarshipID INT
    ,ScholarshipQuarter VARCHAR(10) CHECK (ScholarshipQuarter IN ('Spring', 'Summer', 'Fall', 'Winter'))
    ,ScholarshipStatus VARCHAR(10) CHECK (ScholarshipStatus IN ('accepted', 'rejected', 'on-hold'))
    ,Year INT CHECK (LEN(CAST(Year AS CHAR(4))) = 4)
    ,FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID)
    ,FOREIGN KEY (ScholarshipID) REFERENCES SCHOLARSHIP(ScholarshipID)
    ,PRIMARY KEY (StudentID, ScholarshipID, ScholarshipQuarter, Year)
)
;

-- Insert values into STUDENT_SCHOLARSHIP table
INSERT INTO STUDENT_SCHOLARSHIP (StudentID, ScholarshipID, ScholarshipQuarter, ScholarshipStatus, Year)
VALUES
	(873677710, 552877632, 'Winter', 'Accepted', 2023)
	,(873677716, 552877633, 'Spring', 'Accepted', 2022)
	,(873677717, 552877631, 'Fall', 'Accepted', 2023)
	,(873677716, 552877634, 'Fall', 'Accepted', 2021)
	,(873677712, 552877636, 'Winter', 'Rejected', 2023)
	,(873677715, 552877635, 'Fall', 'Accepted', 2024)
	,(873677718, 552877638, 'Summer', 'Rejected', 2022)
	,(873677719, 552877637, 'Spring', 'Rejected', 2024)
	,(873677717, 552877640, 'Summer', 'Accepted', 2021)
	,(873677714, 552877639, 'Summer', 'Accepted', 2024)
;

-- Check the STUDENT_SCHOLARSHIP table
SELECT * FROM STUDENT_SCHOLARSHIP;

/*
Create SALARY table
*/

DROP TABLE IF EXISTS SALARY;

CREATE TABLE SALARY
(
    SalaryID INT PRIMARY KEY NOT NULL
    ,HourlyRate DECIMAL(5, 2) NOT NULL
    ,LastChange DATE NOT NULL
)
;

-- Insert values into SALARY table
INSERT INTO SALARY (SalaryID, HourlyRate, LastChange)
VALUES
	(1, 25, '2020-05-01')
	,(2, 27, '2018-03-01')
	,(3, 30, '2018-02-01')
	,(4, 32, '2020-06-01')
	,(5, 34, '2020-04-01')
	,(6, 36, '2019-07-01')
	,(7, 38, '2015-05-01')
	,(8, 40, '2016-09-01')
	,(9, 42, '2021-04-01')
	,(10, 44, '2016-06-01')
;

-- Check the SALARY table
SELECT * FROM SALARY;

/*
Create STAFF table
*/

DROP TABLE IF EXISTS STAFF
;

CREATE TABLE STAFF
(
    StaffID INT PRIMARY KEY NOT NULL
    ,FirstName VARCHAR(255) NOT NULL
    ,LastName VARCHAR(255) NOT NULL
    ,WorkEmail VARCHAR(255) NOT NULL
    ,DateOfBirth DATE NOT NULL
    ,Gender CHAR(1) CHECK (Gender IN ('M', 'F')) NOT NULL
    ,HiredDate DATE NOT NULL
    ,SalaryID INT
    ,DepartmentID INT
    ,JobTitle VARCHAR(100)  
    ,FOREIGN KEY (SalaryID) REFERENCES SALARY(SalaryID)
    ,FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENT(DepartmentID)
)
;

-- Insert values into STAFF table with updated SalaryID values and JobTitle
INSERT INTO STAFF (StaffID, FirstName, LastName, WorkEmail, DateOfBirth, Gender, HiredDate, SalaryID, DepartmentID, JobTitle)
VALUES
	(1000, 'Ashley', 'Brown', 'ashley.brown@du.edu', '1982-06-15', 'F', '2020-05-01', 8, 101, 'Head of Finance')
	,(1001, 'Benjamin', 'Smith', 'benjamin.smith@du.edu', '1994-08-21', 'M', '2018-03-01', 6, 101, 'Accountant')
	,(1002, 'Catherine', 'Hunt', 'catherine.hunt@du.edu', '1985-01-09', 'F', '2018-02-01', 5, 102, 'Career Advisor')
	,(1003, 'Jason', 'Gibbs', 'jason.gibbs@du.edu', '1990-07-25', 'M', '2020-06-01', 5, 102, 'Course Advisor')
	,(1004, 'Scarlett', 'Walker', 'scarlett.walker@du.edu', '1980-04-30', 'F', '2020-04-01', 8, 103, 'Head of IT')
	,(1005, 'Jack', 'Larson', 'jack.larson@du.edu', '1992-06-19', 'M', '2019-07-01', 6, 103, 'IT Officer')
	,(1006, 'Elizabeth', 'Lopez', 'elizabeth.lopez@du.edu', '1981-07-21', 'F', '2015-05-01', 8, 105, 'Head of HR')
	,(1007, 'William', 'Hudson', 'william.hudson@du.edu', '1991-03-18', 'M', '2016-09-01', 5, 105, 'HR Officer')
	,(1008, 'Mary', 'Blake', 'mary.blake@du.edu', '1989-03-18', 'F', '2021-04-01', 5, 110, 'Cook')
	,(1009, 'Connor', 'Miller', 'connor.miller@du.edu', '1995-05-20', 'M', '2016-06-01', 5, 110, 'Janitor')
;

-- Check STAFF table
SELECT * FROM STAFF;

/*
Create PROFESSOR table
*/

DROP TABLE IF EXISTS PROFESSOR;

CREATE TABLE PROFESSOR
(
    ProfID INT PRIMARY KEY NOT NULL
    ,FirstName VARCHAR(255) NOT NULL
    ,LastName VARCHAR(255) NOT NULL
    ,EffectiveStartDate DATE NOT NULL
    ,DepartmentID INT NOT NULL
    ,SalaryID INT NOT NULL
    ,IsActive INT NOT NULL
    ,FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENT(DepartmentID)
    ,FOREIGN KEY (SalaryID) REFERENCES SALARY(SalaryID)
)
;

-- Insert values into PROFESSOR table
INSERT INTO PROFESSOR (ProfID, FirstName, LastName, EffectiveStartDate, DepartmentID, SalaryID, IsActive)
VALUES
	(1001, 'Gaylord', 'Jones', '2010-05-03', 101, 7, 1)
	,(1002, 'Martin', 'Riggs', '2012-06-14', 102, 6, 1)
	,(1003, 'Nestor', 'Osborn', '2012-07-25', 103, 6, 1)
	,(1004, 'Del', 'Snyder', '2015-06-25', 104, 5, 1)
	,(1005, 'Sophie', 'Kelly', '2015-07-14', 105, 5, 1)
	,(1006, 'Benita', 'Gross', '2020-05-26', 110, 5, 1)
	,(1007, 'Filiberto', 'Gordon', '2021-02-17', 109, 5, 1)
	,(1008, 'Ruth', 'Beasley', '2021-06-21', 108, 5, 1)
	,(1009, 'Katherine', 'Carroll', '2023-11-24', 106, 5, 1)
	,(1010, 'Jane', 'Freeman', '2023-12-14', 107, 5, 1)
;

-- Check PROFESSOR table
SELECT * FROM PROFESSOR;

/*
Create TEACH_SCHEDULE table
*/

DROP TABLE IF EXISTS TEACH_SCHEDULE;

CREATE TABLE TEACH_SCHEDULE
(
    ProfID INT NOT NULL
    ,CourseID INT NOT NULL
    ,Year INT NOT NULL CHECK (LEN(CAST(Year AS CHAR(4))) = 4)
    ,PRIMARY KEY (ProfID, CourseID, Year)
    ,FOREIGN KEY (ProfID) REFERENCES PROFESSOR(ProfID)
    ,FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID)
)
;

-- Insert values into TEACH_SCHEDULE table

INSERT INTO TEACH_SCHEDULE (ProfID, CourseID, Year)
VALUES
	(1001, 40101, 2021)
    ,(1002, 30102, 2022)
    ,(1003, 50103, 2021)
    ,(1004, 30104, 2023)
    ,(1005, 40105, 2022)
    ,(1006, 40106, 2022)
    ,(1007, 50107, 2023)
    ,(1008, 40108, 2021)
    ,(1009, 50109, 2023)
    ,(1010, 30110, 2022)
;

-- Check TEACH_SCHEDULE table
SELECT * FROM TEACH_SCHEDULE;
