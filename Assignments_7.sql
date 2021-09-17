USE TestingSystem;


-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước
DROP TRIGGER IF EXISTS trigger_1year_ago;
DELIMITER $$
		CREATE TRIGGER trigger_1year_ago
        BEFORE INSERT ON Question
        FOR EACH ROW
        BEGIN
			DECLARE v_Timestamp DATETIME;
            SET v_Timestamp = (DATE_SUB(NOW(), INTERVAL 1 YEAR));
			IF NEW.CreateDate < v_Timestamp THEN
			   SIGNAL SQLSTATE '12344' --
               SET MESSAGE_TEXT = " Time Input Error "; 
            END IF;
        END $$
DELIMITER ;

INSERT INTO `Group`	(  GroupName			, CreatorID		, CreateDate)
VALUES 				(N'Testing System 5'		,   3			,'2020-03-05');
SELECT *
FROM `Group`;


-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào 
--  department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
--  "Sale" cannot add more user"

DROP TRIGGER IF EXISTS trigger_cannot_add;
DELIMITER $$
		CREATE TRIGGER trigger_cannot_add
        BEFORE INSERT ON `account`
        FOR EACH ROW
        BEGIN
			DECLARE v_DepartmentID INT;
			SELECT d.DepartmentID INTO v_DepartmentID FROM department d WHERE d.DepartmentName = 'Sale';
				IF (NEW.DepartmentID = v_DepartmentID) THEN
					SIGNAL SQLSTATE '11223'
					SET MESSAGE_TEXT = 'Cant add more User to Sale Department';
				END IF;
        END $$
DELIMITER ;


INSERT INTO `Account`(Email								, Username			, FullName					, DepartmentID		, PositionID, CreateDate)
VALUES 				('truonggiang12@gmail.com'	, 		'truonggiang'		,'Nguyen truong giang'		,   '2'				,   '1'		,'2020-03-05');


-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
DROP TRIGGER IF EXISTS trigger_group_5_user;
DELIMITER $$
		CREATE TRIGGER trigger_group_5_user
        BEFORE INSERT ON `groupaccount`
        FOR EACH ROW
        BEGIN
        DECLARE v_CountGroupID INT;
		SELECT count(a.GroupID) INTO v_CountGroupID FROM groupAccount a WHERE a.GroupID = NEW.GroupID;
				IF (v_CountGroupID >5) THEN
					SIGNAL SQLSTATE '12233'
					SET MESSAGE_TEXT = 'Group này không thể quá 5 user';
				END IF;
        END $$
DELIMITER ;

INSERT INTO `GroupAccount`	(  GroupID	, AccountID	, JoinDate	 )
VALUES 						(	1		,    5		,'2019-03-05');


-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
DROP TRIGGER IF EXISTS trigger_question_10;
DELIMITER $$
		CREATE TRIGGER trigger_question_10
        BEFORE INSERT ON ExamQuestion
        FOR EACH ROW
        BEGIN
        DECLARE v_Countquestion INT;
		SELECT count(a.ExamID) INTO v_Countquestion FROM ExamQuestion a WHERE a.ExamID = NEW.ExamID;
				IF (v_Countquestion > 10) THEN
					SIGNAL SQLSTATE '12334'
					SET MESSAGE_TEXT = 'Exem này không thể quá 10 question';
				END IF;
        END $$
DELIMITER ;

SET foreign_key_checks=0;
INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	6	,		12		);


-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là 
--  admin@gmail.com (đây là tài khoản admin, không cho phép user xóa), 
--  còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông 
--  tin liên quan tới user đó

DROP TRIGGER IF EXISTS trigger_delete_account;
DELIMITER $$
CREATE TRIGGER trigger_delete_account
BEFORE DELETE ON `Account`
FOR EACH ROW
	BEGIN
		DECLARE v_Email VARCHAR(50);
		SET v_Email = 'admin@gmail.com';
			IF (OLD.Email = v_Email) THEN
				SIGNAL SQLSTATE '12344'
				SET MESSAGE_TEXT = 'đây là tài khoản admin, không cho phép user xóa';
			END IF;
END $$
DELIMITER ; 

DELETE 
FROM `account`
WHERE Email = 'admin@gmail.com';


-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table 
--  Account, hãy tạo trigger cho phép người dùng khi tạo account không điền 
--  vào departmentID thì sẽ được phân vào phòng ban "waiting Department"

DROP TRIGGER IF EXISTS Trigger_SetDep;
DELIMITER $$
CREATE TRIGGER Trigger_SetDep
BEFORE INSERT ON `account`
FOR EACH ROW
BEGIN
	DECLARE v_WaittingRoom VARCHAR(50);
	SELECT DepartmentID INTO v_WaittingRoom FROM department WHERE DepartmentName = 'Waitting Room';
		IF (NEW.DepartmentID IS NULL ) THEN
			SET NEW.DepartmentID = v_WaittingRoom;
		END IF;
END $$
DELIMITER ;

INSERT INTO `account` 		(`Email`					, `Username`	, `FullName`	, `PositionID`	, `CreateDate`) 
VALUES 						('giang223@gmail.com'		,	'3'			, 	'3'			, 		'1'		, '2020-07-15');



-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi question, trong đó có tối đa 2 đáp án đúng.
DROP TRIGGER IF EXISTS Trigger_4_question;
DELIMITER $$
CREATE TRIGGER Trigger_4_question
BEFORE INSERT ON `Answer`
FOR EACH ROW
BEGIN
	DECLARE v_4answer_QuestionID INT;
    DECLARE v_2AnswerIsCorrects INT;
	SELECT count(a.QuestionID) INTO v_4answer_QuestionID FROM Answer a WHERE a.QuestionID = NEW.QuestionID;
    SELECT count(b.QuestionID) INTO v_2AnswerIsCorrects FROM Answer b WHERE b.QuestionID = NEW.QuestionID AND b.isCorrect = NEW.isCorrect;
		IF (v_4answer_QuestionID > 4 ) OR (v_2AnswerIsCorrects > 2) THEN
			SIGNAL SQLSTATE '22334'
			SET MESSAGE_TEXT = 'Không thể tạo thêm answer';
		END IF;
END $$
DELIMITER ;

INSERT INTO `answer` 	(`Content`			, 		`QuestionID`	, `isCorrect`	) 
VALUES 					('tra loi 11'		, 			'4'			, 		1		);


-- Question 8: Viết trigger sửa lại dữ liệu cho đúng: 
--  Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định 
--  Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database
DROP TRIGGER IF EXISTS trigger_update_user;
DELIMITER $$
CREATE TRIGGER trigger_update_user
BEFORE UPDATE ON `account`
FOR EACH ROW
	BEGIN
		IF NEW.Gender = 'Nam' THEN
			SET NEW.Gender = 'M';
			ELSEIF NEW.Gender = 'Nu' THEN
			SET NEW.Gender = 'F';
			ELSEIF NEW.Gender = 'Chua Xac Dinh' THEN
			SET NEW.Gender = 'U';
		END IF ;
	END $$
DELIMITER ;

-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày
DROP TRIGGER IF EXISTS Trigger_DeleteExem;
DELIMITER $$
CREATE TRIGGER Trigger_DeleteExem
BEFORE DELETE ON `exam`
FOR EACH ROW
BEGIN
	DECLARE CreateDate DATETIME;
	SET CreateDate = DATE_SUB(NOW(),INTERVAL 2 DAY);
		IF (OLD.CreateDate > vCreateDate) THEN
			SIGNAL SQLSTATE '23456'
			SET MESSAGE_TEXT = 'Không thể xoá Exem mới tạo 2 ngày';
		END IF ; 
END $$
DELIMITER ;

DELETE FROM exam WHERE ExamID = 1;

-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các question khi question đó chưa nằm trong exam nào
DROP TRIGGER IF EXISTS Trigger_DeleteQues;
DELIMITER $$
CREATE TRIGGER Trigger_DeleteQues
BEFORE UPDATE ON `Question`
FOR EACH ROW
BEGIN

END $$
DELIMITER ;


-- Question 12: Lấy ra thông tin exam trong đó:
-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 60 thì sẽ đổi thành giá trị "Long time"
SELECT * 
FROM exam;
SELECT ExamID, `Code`, Title , CASE
	WHEN Duration <= 30 THEN 'Short time'
	WHEN Duration <= 60 THEN 'Medium time'
	ELSE 'Longtime'
END AS Duration, CreateDate, Duration
FROM exam;


-- Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên 
-- là the_number_user_amount và mang giá trị được quy định như sau:
-- Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
-- Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
-- Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher
SELECT GroupID, COUNT(GroupID), CASE 
	WHEN COUNT(GroupID) <= 5 THEN 'few'
	WHEN COUNT(GroupID) <= 20 THEN 'normal'
ELSE 'higher'
END AS the_number_user_amount
FROM groupaccount
GROUP BY GroupID;

-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào không có user thì sẽ thay đổi giá trị 0 thành "Không có User"
SELECT DepartmentID, COUNT(AccountID) AS So_Luong_User, CASE
	WHEN COUNT(AccountID) < 1 THEN 'Không có User'
END AS So_Luong
FROM department 
LEFT JOIN `account` USING(DepartmentID)
GROUP BY DepartmentID;

