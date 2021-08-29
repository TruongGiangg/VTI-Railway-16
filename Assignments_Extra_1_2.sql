-- CreateDatabase
DROP DATABASE IF EXISTS fresher;
CREATE DATABASE fresher;
-- Use Database
USE fresher;


-- CreateTable
DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee (
    TraineeID 			INT AUTO_INCREMENT PRIMARY KEY,
    Full_Name 			NVARCHAR(50) NOT NULL,
    Birth_Date 			DATE NOT NULL,
    Gender 				ENUM('male', 'female', 'unknown'),
    ET_IQ 				TINYINT UNSIGNED CHECK (ET_IQ <= 20),
    ET_Gmath 			TINYINT UNSIGNED CHECK (ET_Gmath <= 20),
    ET_English 			TINYINT UNSIGNED CHECK (ET_English <= 50),
    Training_Class 		VARCHAR(15) NOT NULL,
    Evaluation_Notes	TEXT,
    VTI_Account 		VARCHAR(30) NOT NULL UNIQUE
);


-- Exercise 2: Data Types
DROP TABLE IF EXISTS DataTypes;
CREATE TABLE DataTypes (
		Column_ID 		INT AUTO_INCREMENT PRIMARY KEY,
		`Column_Name` 	VARCHAR(50) NOT NULL,
        Column_Code		CHAR(5),
        ModifiedDate	DATETIME
);


-- Exercise 3: Data Types (2)
DROP TABLE IF EXISTS DataTypes2;
CREATE TABLE DataTypes2 (
		Column_ID 		INT AUTO_INCREMENT PRIMARY KEY,
		`Column_Name` 	VARCHAR(50) NOT NULL,
        BirthDay		DATE,
        Gender			ENUM('0', '1', 'NULL'), -- 0 là Male, 1là Female, NULL là Unknown
        IsDeletedFlag	ENUM('0', '1') -- 0 là đang hoạt động, 1 là đã xoá
);



