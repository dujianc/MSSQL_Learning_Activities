--Learning Activity 4.5: Create Database & Tables, Add Constraints & Relationships

--1.	Create a new database named Membership.

CREATE DATABASE Membership;

--2.	Write the CREATE TABLE statements needed to implement the following design in the Membership database.
--o	Define IndividualID and GroupID as identity columns.
--o	Decide which columns should allow null values, if any, and explain your decision.
--o	Define the Dues column with a default of zero and a check constraint to allow only positive values.

CREATE TABLE Individuals (
	IndividualID int IDENTITY(1,1) NOT NULL,
	IndividualLName varchar(50) NOT NULL,
	IndividualFName varchar(50) NOT NULL,
	IndividualAddress varchar(50) NULL,
	MembershipDues bit Default 0 NOT NULL,
	PRIMARY KEY (IndividualID)
	);
	
CREATE TABLE Groups (
    GroupID int IDENTITY(1,1) NOT NULL,
    DepartmentName varchar (50) NOT NULL,
    IndividualID int NOT NULL,
	IndividualLName varchar(50) NOT NULL,
	IndividualFName varchar(50) NOT NULL,
    PRIMARY KEY (GroupID),
	FOREIGN KEY (IndividualID) REFERENCES Individuals (IndividualID)
    ); 

--3.	Write an ALTER TABLE statement that adds a new column, DuesPaid, to the Individuals table. Use the bit data type, disallow null values, and assign a default Boolean value of False.

ALTER TABLE Individuals ADD DuesPaid bit Default 'False' NOT NULL;


--4.	 Write a SQL script named registration-schema.sql that creates a database with the following tables:
--o	Student (student_id, name, gpa)
--o	Dept (dept_id,name, dean, building, room)
--o	Course (dept_id, course_id, name, hours), where dept_id is a foreign key referencing the Dept (dept_id)
--o	Enrolled (dept_id, course_id, student_id), where (dept_id, course_id) is a foreign key referencing course (dept_id, course_id) and student_id is a foreign key referencing student (student_id)

--The code of "registration-schema.sql" is as follows:

CREATE DATABASE StudentInfo;

USE StudentInfo;

CREATE TABLE Student (
  student_id int IDENTITY(1,1) NOT NULL,
  name varchar(50) NOT NULL,
  gpa varchar(50) NULL
   PRIMARY KEY (student_id)
  )

CREATE TABLE Dept (
    dept_id int IDENTITY(1,1) NOT NULL,
    name varchar (50) NOT NULL,
	dean varchar(50) NOT NULL,
	building varchar(50) NOT NULL,
	room int NOT NULL
    PRIMARY KEY (dept_id),
    ); 

CREATE TABLE Course (
    dept_id int NOT NULL,
	course_id int IDENTITY(1,1) NOT NULL,
    name varchar (50) NOT NULL,
	hours float NOT NULL,
	PRIMARY KEY (course_id),
	FOREIGN KEY (dept_id) REFERENCES Dept (dept_id)
    );
	
CREATE TABLE Enrolled (
    dept_id int NOT NULL,
	course_id int IDENTITY(1,1) NOT NULL,
	student_id int  NOT NULL,
    PRIMARY KEY (course_id),
	FOREIGN KEY (dept_id) REFERENCES Dept (dept_id),
	FOREIGN KEY (course_id) REFERENCES Course (course_id),
	FOREIGN KEY (student_id) REFERENCES Student (student_id),
    ); 
