-- Insert Data
Use Testing_buoi_1;

-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- Insert tablie 1 Department
INSERT INTO Department  (		DepartmentName		)
VALUES 					(	 	'President'			),
						(	 	'Marketing'			),
						(		'security'			),
						(		'Officer'			),
						(	 	'Director'			);

-- Insert tablie 2 `Position`
INSERT INTO `Position`  ( 		PositionName			)
VALUES 					(			'Dev' 				),
						(	 		'Test' 				),
						(			'Scrum Master' 		),
						(			'PM' 				);


-- Insert tablie 3 `Account`
INSERT INTO `Account` (AccountID, 		Email, 						Username, 			FullName, 				DepartmentID, 	PositionID, 	CreateDate)
VALUES 					(1, 		'truonggiang@gmail.com',	'truonggiang', 		'Nguyen Truong Giang', 			1,				1,			'2020-03-01' ),
						(2, 		'linhgiang@gmail.com',		'linhgiang', 		'Nguyen Linh Giang', 			2,				2,			'2020-06-20' ),
						(3, 		'sontung@gmail.com',		'sontung', 			'Nguyen Son Tung', 				3,				2,			'2020-12-22' ),
						(4, 		'vanhien@gmail.com',		'vanhien', 			'Nguyen Van Hien', 				4,				4,			'2020-09-21' ),
                        (5, 		'xuanhoan@gmail.com',		'xuanhoan', 		'Dao Xuan Hoan', 				5,				3,			'2020-11-25' ),
                        (6, 		'trungnam@gmail.com',		'trungnam', 		'Nguyen Trung Nam', 			3,				2,			'2020-12-21' ),
                        (7, 		'ducmanh@gmail.com',		'ducmanh', 			'Pham Duc Manh', 				2,				4,			'2020-10-25' ),
                        (8, 		'hieutrung@gmail.com',		'hieutrung', 		'Nguyen Hieu Trung', 			5,				1,			'2020-07-31' ),
                        (9, 		'mailinh@gmail.com',		'mailinh', 			'Mai Thuy Linh', 				1,				3,			'2020-02-25' ),
                        (10, 		'quocviet@gmail.com',		'quocviet', 		'Nguyen Quoc Viet', 			3,				3,			'2020-01-15' );
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
VALUES 						(1, 			'Essay' ),
							(2, 			'Multiple-Choice' );

-- Create Table 7: CategoryQuestion
INSERT INTO CategoryQuestion 	(CategoryID, 		CategoryName)
VALUES 							(1, 				'C++' ),
								(2, 				'C#' ),
								(3, 				'Java' ),
								(4, 				'HTML' ),
								(5, 				'CSS' );

-- Create Table 8: Question
INSERT INTO Question 	(QuestionID, 		Content,					CategoryID,				TypeID,				CreatorID,		CreateDate)
VALUES 					(1, 			'C??u h??i v??? C++',				1, 						1, 					1,				'2020-07-30' ),
						(2, 			'C??u h???i v??? C#',				2, 						2, 					2,				'2020-03-07' ),
						(3, 			'C??u h???i v??? Java',				3, 						2, 					3,				'2020-06-23' ),
						(4, 			'C??u h???i v??? HTML',				4, 						1, 					4,				'2020-12-22' ),
						(5, 			'C??u h???i v??? CSS',				5, 						2, 					5,				'2020-09-16' );

-- Create Table 9: Answer 
INSERT INTO Answer 	(AnswerID, 		Content, 			QuestionID, 		isCorrect)
VALUES 				(1, 			'Tr??? l???i v??? C++',		1,				True	),
					(2, 			'Tr??? l???i v??? C#',		2,	 			False	),
					(3, 			'Tr??? l???i v??? Java',		3,				True	),
					(4, 			'Tr??? l???i v??? HTML', 		4,				True	),
                    (5, 			'Tr??? l???i v??? C#',		2,				False	),
                    (6, 			'Tr??? l???i v??? C++',		1,				True	),
                    (7, 			'Tr??? l???i v??? CSS',		5,				False	),
                    (8, 			'Tr??? l???i v??? HTML',		4,				True	),
                    (9, 			'Tr??? l???i v??? C++',		1,				False	),
					(10, 			'Tr??? l???i v??? CSS',		5,				True	);

-- Create Table 10: Exam
INSERT INTO Exam 	(ExamID, 		`Code`, 			Title,				CategoryID, 			Duration, 		CreatorID, 		CreateDate)
VALUES 				(1, 			'VTI01',			'????? thi C++',		1,						90,				2,				'2020-07-30' ),
					(2, 			'VTI02',			'????? thi C#',		2,						120,			5,				'2020-03-07' ),
					(3, 			'VTI03',			'????? thi Java',		3,						90,				1,				'2020-06-23' ),
					(4, 			'VTI04',			'????? thi HTML',		4,						60,				4,				'2020-12-22' ),
					(5, 			'VTI05',			'????? thi CSS',		5,						120,			3,				'2020-09-16' );

-- Create Table 11: ExamQuestion
INSERT INTO ExamQuestion 	(ExamID, 		QuestionID)
VALUES 						(1, 				3 ),
							(2, 				1 ),
							(3, 				2 ),
							(4, 				4 ),
							(5, 				5 );


