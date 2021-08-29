-- Create DB
DROP DATABASE IF EXISTS Testing_buoi_1;
CREATE DATABASE Testing_buoi_1;
-- Use Database
USE Testing_buoi_1;


-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------


-- Create Table 1: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(30) NOT NULL UNIQUE
);


-- Create Table 2: Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position` (
    PositionID INT AUTO_INCREMENT PRIMARY KEY,
    PositionName ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL UNIQUE
);                   			
                       	
                       			
-- Create Table 3: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(30) NOT NULL UNIQUE,
    Username VARCHAR(50) NOT NULL UNIQUE ,
    FullName VARCHAR(50) NOT NULL,
    DepartmentID INT NOT NULL,
    PositionID INT NOT NULL,
    CreateDate DATE NOT NULL,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department (DepartmentID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (PositionID)
        REFERENCES `Position` (PositionID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


-- Create Table 4: Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
    GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(50) NOT NULL,
    CreatorID INT NOT NULL,
    CreateDate DATE NOT NULL,
    FOREIGN KEY (CreatorID)
		REFERENCES `Account` (AccountID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


-- Create Table 5: GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount (
    GroupID INT NOT NULL,
    AccountID INT NOT NULL,
    JoinDate DATE NOT NULL,
    PRIMARY KEY (GroupID, AccountID),
    FOREIGN KEY (AccountID)
        REFERENCES `Account` (AccountID)
        ON DELETE CASCADE ,
    FOREIGN KEY (GroupID)
        REFERENCES `Group` (GroupID)
        ON DELETE CASCADE 
);


-- Create Table 6: TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName ENUM('Essay' ,'Multiple-Choice') NOT NULL
);


-- Create Table 7: CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);


-- Create Table 8: Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
    QuestionID INT AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(50) NOT NULL,
    CategoryID INT NOT NULL,
    TypeID INT NOT NULL,
    CreatorID INT NOT NULL,
    CreateDate DATE NOT NULL,
    FOREIGN KEY (CreatorID)
        REFERENCES `Account` (AccountID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion (CategoryID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (TypeID)
        REFERENCES TypeQuestion (TypeID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


-- Create Table 9: Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (
    AnswerID INT AUTO_INCREMENT,
    Content TEXT,
    QuestionID INT NOT NULL,
    isCorrect BOOLEAN NOT NULL,
    PRIMARY KEY (AnswerID , QuestionID),
    FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


-- Create Table 10: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
    ExamID INT AUTO_INCREMENT PRIMARY KEY,
    `Code` VARCHAR(20) NOT NULL,
    Title VARCHAR(50) NOT NULL,
    CategoryID INT NOT NULL,
    Duration VARCHAR(50) NOT NULL,
    CreatorID INT NOT NULL,
    CreateDate DATE NOT NULL,
    FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion (CategoryID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


-- Create Table 11: ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
    ExamID INT NOT NULL,
    QuestionID INT NOT NULL,
    PRIMARY KEY (ExamID, QuestionID),
    FOREIGN KEY (ExamID)
        REFERENCES Exam (ExamID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
        ON DELETE CASCADE ON UPDATE CASCADE
);










