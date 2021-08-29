-- Create DB
DROP DATABASE IF EXISTS Testing_1_buoi_1;
CREATE DATABASE Testing_1_buoi_1;
-- Use Database
USE Testing_1_buoi_1;

-----------------------------------------------------------------------------------------------------------------------------------

-- Create Table 1: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(30) NOT NULL
);


-- Create Table 2: Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position` (
    PositionID INT AUTO_INCREMENT PRIMARY KEY,
    PositionName VARCHAR(30) NOT NULL -- Đoạn này em không để ENUM vì em muốn Insert data khác
);


-- Create Table 3: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(30) NOT NULL,
    Username VARCHAR(50) NOT NULL,
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
    CreateDate DATE NOT NULL
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
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (GroupID)
        REFERENCES `Group` (GroupID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


-- Create Table 6: TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL
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
    Content VARCHAR(50) NOT NULL,
    QuestionID INT NOT NULL,
    isCorrect VARCHAR(50) NOT NULL,
    PRIMARY KEY (AnswerID , QuestionID),
    FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


-- Create Table 10: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
    ExamID INT AUTO_INCREMENT PRIMARY KEY,
    `Code` VARCHAR(50) NOT NULL,
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
    FOREIGN KEY (ExamID)
        REFERENCES Exam (ExamID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


-----------------------------------------------------------------------------------------------------------------------------------

-- Insert tablie 1 Department
INSERT INTO Department (DepartmentID, 	DepartmentName)
VALUES 					(	1, 			'President' ),
						(	2, 			'Marketing' ),
						(	3, 			'security' ),
						(	4,			'Officer' ),
						(	5, 			'Director' );

-- Insert tablie 2 `Position`
INSERT INTO `Position` (PositionID, 		PositionName)
VALUES 					(	1, 				'CEO' ),
						(	2, 				'trainee' ),
						(	3, 				'security Officer' ),
						(	4, 				'developer' ),
						(	5, 				'Founder' );

-- Insert tablie 3 `Account`
INSERT INTO `Account` (AccountID, 		Email, 						Username, 			FullName, 				DepartmentID, 	PositionID, 	CreateDate)
VALUES 					(1, 		'truonggiang@gmail.com',	'truonggiang', 		'Nguyen Truong Giang', 			1,				1,			'2020-03-01' ),
						(2, 		'linhgiang@gmail.com',		'linhgiang', 		'Nguyen Linh Giang', 			2,				2,			'2020-06-20' ),
						(3, 		'sontung@gmail.com',		'sontung', 			'Nguyen Son Tung', 				3,				3,			'2020-12-22' ),
						(4, 		'vanhien@gmail.com',		'vanhien', 			'Nguyen Van Hien', 				4,				4,			'2020-09-21' ),
                        (5, 		'xuanhoan@gmail.com',		'xuanhoan', 		'Dao Xuan Hoan', 				5,				5,			'2020-11-25' ),
                        (6, 		'trungnam@gmail.com',		'trungnam', 		'Nguyen Trung Nam', 			3,				2,			'2020-12-21' ),
                        (7, 		'ducmanh@gmail.com',		'ducmanh', 			'Pham Duc Manh', 				2,				4,			'2020-10-25' ),
                        (8, 		'hieutrung@gmail.com',		'hieutrung', 		'Nguyen Hieu Trung', 			5,				1,			'2020-07-31' ),
                        (9, 		'mailinh@gmail.com',		'mailinh', 			'Mai Thuy Linh', 				1,				3,			'2020-02-25' ),
                        (10, 		'quocviet@gmail.com',		'quocviet', 		'Nguyen Quoc Viet', 			3,				5,			'2020-01-15' );
-- Insert tablie 4 `Group`
INSERT INTO `Group` (GroupID, 	GroupName, 				CreatorID, 		CreateDate)
VALUES 				(1, 		'Devolopment',				1, 			'2020-06-01' ),
					(2, 		'Management',				2, 			'2020-12-24' ),
					(3, 		'Office CEO',				3, 			'2020-07-16' ),
					(4, 		'Sales department',			4, 			'2020-04-15' ),
                    (5, 		'security Officer',			5, 			'2020-04-20' );
        
-- Create Table 5: GroupAccount    
INSERT INTO GroupAccount (GroupID , 	AccountID , 	JoinDate )
VALUES 					 (1, 				4,			'2021-12-24' ),
						 (2, 				2,			'2020-08-16' ),
						 (3, 				1,			'2021-06-01' ),
						 (4, 				5,			'2021-12-24' ),
                         (5, 				3,			'2021-04-30' );
    
-- Create Table 6: TypeQuestion
INSERT INTO TypeQuestion 	(TypeID, 		TypeName)
VALUES 						(1, 			'Easy' ),
							(2, 			'difficult' );

-- Create Table 7: CategoryQuestion
INSERT INTO CategoryQuestion 	(CategoryID, 		CategoryName)
VALUES 							(1, 				'C++' ),
								(2, 				'C#' ),
								(3, 				'Java' ),
								(4, 				'HTML' ),
								(5, 				'CSS' );

-- Create Table 8: Question
INSERT INTO Question 	(QuestionID, 		Content,					CategoryID,				TypeID,				CreatorID,		CreateDate)
VALUES 					(1, 			'Câu hòi về C++',				1, 						1, 					1,				'2020-07-30' ),
						(2, 			'Câu hỏi về C#',				2, 						2, 					2,				'2020-03-07' ),
						(3, 			'Câu hỏi về Java',				3, 						2, 					3,				'2020-06-23' ),
						(4, 			'Câu hỏi về HTML',				4, 						1, 					4,				'2020-12-22' ),
						(5, 			'Câu hỏi về CSS',				5, 						2, 					5,				'2020-09-16' );

-- Create Table 9: Answer 
INSERT INTO Answer 	(AnswerID, 		Content, 			QuestionID, 		isCorrect)
VALUES 				(1, 			'Trả lời về C++',		1,				'Sai'	),
					(2, 			'Trả lời về C#',		2,	 			'Đúng'	),
					(3, 			'Trả lời về Java',		3,				'Đúng'	),
					(4, 			'Trả lời về HTML', 		4,				'Đúng'	),
                    (5, 			'Trả lời về C#',		2,				'Sai'	),
                    (6, 			'Trả lời về C++',		1,				'Đúng'	),
                    (7, 			'Trả lời về CSS',		5,				'Sai'	),
                    (8, 			'Trả lời về HTML',		4,				'Đúng'	),
                    (9, 			'Trả lời về C++',		1,				'Sai'	),
					(10, 			'Trả lời về CSS',		5,				'Đúng'	);

-- Create Table 10: Exam
INSERT INTO Exam 	(ExamID, 		`Code`, 			Title,				CategoryID, 			Duration, 		CreatorID, 		CreateDate)
VALUES 				(1, 			'VTI01',			'Đề thi C++',		1,						90,				2,				'2020-07-30' ),
					(2, 			'VTI02',			'Đề thi C#',		2,						120,			5,				'2020-03-07' ),
					(3, 			'VTI03',			'Đề thi Java',		3,						90,				1,				'2020-06-23' ),
					(4, 			'VTI04',			'Đề thi HTML',		4,						60,				4,				'2020-12-22' ),
					(5, 			'VTI05',			'Đề thi CSS',		5,						120,			3,				'2020-09-16' );

-- Create Table 11: ExamQuestion
INSERT INTO ExamQuestion 	(ExamID, 		QuestionID)
VALUES 						(1, 				1 ),
							(2, 				2 ),
							(3, 				3 ),
							(4, 				4 ),
							(5, 				5 );

-----------------------------------------------------------------------------------------------------------------------------------



-- Question 2: lấy ra tất cả các phòng ban
SELECT 
    *
FROM
    Department;
-- Question 3: lấy ra id của phòng ban "Marketing"
SELECT 	*
FROM	department
WHERE	departmentName = 'Marketing'; 
    
    
-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT 	*
FROM `account` 
WHERE LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) from `account`);


-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT 	*
FROM 	`account` 
WHERE 	FullName = (SELECT MAX(LENGTH(FullName)) from `account`) AND DepartmentID = 3;


-- Question 6: Lấy ra tên group đã tham gia trước ngày 2020-06-01
SELECT		 GroupName
FROM		`group`
WHERE		CreateDate < '2020-06-01';


-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT QuestionID
FROM question
HAVING count(QuestionID) >= 4;


-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 2020-09-01
SELECT `Code`
FROM exam
WHERE Duration > 60 AND CreateDate < '2020-09-01';


-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT *
From `group`
ORDER BY CreateDate DESC LIMIT 5;


-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT  AccountID, Count(AccountID) 
FROM `account`
WHERE DepartmentID = 2;


-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "N" và kết thúc bằng chữ "g"
SELECT FullName
FROM `account`
WHERE FullName LIKE 'N%g';


-- Question 12: Xóa tất cả các exam được tạo trước ngày 2020-07-30
DELETE FROM exam 
WHERE CreateDate < '2020-07-30';
ROLLBACK;


-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE FROM question
WHERE Content = 'Câu Hỏi';


-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `account` Set FullName = "Nguyễn Bá Lộc", Email ="loc.nguyenba@vti.com.vn"
WHERE AccountID = 5;


-- Question 15: update account có id = 3 sẽ thuộc group có id = 4
UPDATE `GroupAccount`
SET AccountID = 3 
WHERE GroupID = 4;