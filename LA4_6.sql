--Learning Activity 4.6: Create Database & Tables, Add Constraints & Relationships

--Create a database called Film_World and write SQL statements to create a database with the tables from the following ERD:

--Assume the following:
--1.	Primary keys are indicated in bold.
--2.	Foreign keys are indicated in italics.
--3.	Review score can be any value between 0 and 10, inclusive.
--4.	Movies without set release dates are allowed.
--5.	Movies without a title are not allowed.

CREATE DATABASE Film_World;

USE Film_World;

CREATE TABLE Actor (
    actorId int IDENTITY(1,1) NOT NULL,
	firstName varchar (50) NOT NULL,
	lastName varchar (50) NOT NULL,
	dateOfBirth date NULL
	PRIMARY KEY (actorId),
	);

CREATE TABLE Movie (
  movieId int IDENTITY(1,1) NOT NULL,
  title varchar(50) NOT NULL,
  companyId int NOT NULL,  
  releaseDate date NULL,
  boxOfficeRevenue bit NOT NULL,
  reviewScore int CHECK (reviewScore BETWEEN 0 AND 10) NOT NULL,
  PRIMARY KEY (movieId),
  --FOREIGN KEY (companyId) REFERENCES to what???
  );

  CREATE TABLE ActedIn (
    movieId int  NOT NULL,
    actorId int IDENTITY(1,1) NOT NULL,
	PRIMARY KEY (actorId),
	FOREIGN KEY (movieId) REFERENCES Movie (movieId),
	FOREIGN KEY (actorId) REFERENCES Actor (actorId)
	); 
 