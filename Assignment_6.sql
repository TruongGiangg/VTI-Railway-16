USE TestingSystem;

-- TẠO 1 hàm thủ tục Stored procedure lấy ra danh sách phòng ban
DROP PROCEDURE IF EXISTS get_all_department;
DELIMITER $$ 
CREATE PROCEDURE get_all_department()
	BEGIN
		SELECT * FROM Department;
	END $$
DELIMITER ;

CALL get_all_department();

----------- OUT --------------
SET @v_Department_1_name= ' ';
CALL Get_Department_name ('d001', @v_Department_1_name);
SELECT @v_Department_1_name;




-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các `account` thuộc phòng ban đó
DROP PROCEDURE IF EXISTS get_all_Account_in_department;
DELIMITER $$ 
CREATE PROCEDURE get_all_Account_in_department(IN TenPhongBan NVARCHAR(50))
	BEGIN
		SELECT * 
        FROM `Account`
        JOIN department USING(DepartmentID)
        WHERE DepartmentName = TenPhongBan;
	END $$
DELIMITER ;

-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS Get_count_account;
DELIMITER $$ 
CREATE PROCEDURE Get_count_account(IN group_name NVARCHAR(50))
	BEGIN
		SELECT GroupID, GroupName, COUNT(AccountID) AS SoLuongAccount
        FROM GroupAccount
        JOIN `Group` USING (GroupID)
        WHERE GroupName = group_name;
	END $$
DELIMITER ;


-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DROP PROCEDURE IF EXISTS Get_question;
DELIMITER $$ 
CREATE PROCEDURE Get_question()
	BEGIN
		SELECT TypeName, COUNT(TypeID) AS SoLuongQuestion
        FROM Question
        JOIN TypeQuestion USING (TypeID)
		WHERE month(CreateDate) = MONTH(NOW()) AND year(CreateDate) = YEAR(NOW())
        GROUP BY TypeID;
	END $$
DELIMITER ;

CALL Get_question()


-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS sp_GetCountQuesFromType;
DELIMITER $$
CREATE PROCEDURE sp_GetCountQuesFromType()
BEGIN
WITH CTE_MaxTypeID AS(
SELECT count(q.TypeID) AS SL FROM question q
GROUP BY q.TypeID
)
SELECT tq.TypeName, count(q.TypeID) AS SL FROM question q
INNER JOIN typequestion tq ON tq.TypeID = q.TypeID
GROUP BY q.TypeID
HAVING count(q.TypeID) = (SELECT MAX(SL) FROM CTE_MaxTypeID);
END$$
DELIMITER ;
Call sp_GetCountQuesFromType();


-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
DROP PROCEDURE IF EXISTS sp_GetCountQuesFromType;
DELIMITER $$
CREATE PROCEDURE sp_GetCountQuesFromType()
BEGIN
WITH CTE_MaxTypeID AS(
SELECT count(q.TypeID) AS SL FROM question q
GROUP BY q.TypeID
)
SELECT tq.TypeName, count(q.TypeID) AS SL FROM question q
INNER JOIN typequestion tq ON tq.TypeID = q.TypeID
GROUP BY q.TypeID
HAVING count(q.TypeID) = (SELECT MAX(SL) FROM CTE_MaxTypeID);
END$$
DELIMITER ;
Call sp_GetCountQuesFromType();


-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
DROP PROCEDURE IF EXISTS sp_DeleteExamWithID;
DELIMITER $$
CREATE PROCEDURE sp_DeleteExamWithID (IN in_ExamID TINYINT UNSIGNED)
BEGIN
DELETE FROM examquestion WHERE ExamID = in_ExamID;
DELETE FROM Exam WHERE ExamID = in_ExamID;
END$$
DELIMITER ;
CALL sp_DeleteExamWithID(7);
