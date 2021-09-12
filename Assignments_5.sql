USE TestingSystem;

SELECT *
FROM `account`
WHERE AccountID > SOME (SELECT AccountID
						FROM `account`
                        WHERE AccountID = 2 || AccountID = 3 || AccountID = 4);
     
     
DROP VIEW IF EXISTS view_account;
CREATE VIEW view_account AS
SELECT AccountID, Email, Fullname
FROM `account`;

SELECT *
FROM view_account;



-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
DROP VIEW IF EXISTS view_sale;
CREATE OR REPLACE VIEW view_sale AS
SELECT A.*, B.DepartmentName
FROM `account` A
JOIN Department B ON A.DepartmentID = B.DepartmentID
WHERE B.DepartmentName = 'Sale';

SELECT *
FROM view_sale;


-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
DROP VIEW IF EXISTS view_account;
CREATE OR REPLACE VIEW view_account AS
SELECT AccountID, Username, COUNT(AccountID) AS So_GR_tham_gia
FROM GroupAccount
JOIN `account` USING (AccountID)
GROUP BY AccountID
HAVING COUNT(AccountID) = (SELECT COUNT(AccountID) FROM GroupAccount 
							GROUP BY AccountID
							ORDER BY COUNT(AccountID)  DESC
							LIMIT 1);

SELECT * 
FROM view_account;


-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
DROP VIEW IF EXISTS view_content;
CREATE OR REPLACE VIEW view_content AS
SELECT *
FROM Question
WHERE LENGTH(Content) > 300;

SELECT * 
FROM view_content;

DELETE
FROM view_content;


-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
DROP VIEW IF EXISTS view_Department;
CREATE OR REPLACE VIEW view_Department AS
SELECT DepartmentName, COUNT(DepartmentID) AS Phong_Ban_nhieu_nv
FROM `Account`
JOIN Department USING (DepartmentID)
GROUP BY DepartmentID
HAVING count(DepartmentID) =  (SELECT MAX(countDEP_ID) AS maxDEP_ID FROM 
								(SELECT count(A1.DepartmentID) AS countDEP_ID FROM account A1
								GROUP BY A1.DepartmentID) AS TB_countDepID);
                              
							
SELECT * FROM view_Department;


-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
DROP VIEW IF EXISTS view_Answer_5;
CREATE OR REPLACE VIEW view_Answer_5 AS
SELECT B.CategoryID, B.Content, A.FullName AS Creator 
FROM question B
INNER JOIN `account` A ON A.AccountID = B.CreatorID 
WHERE SUBSTRING_INDEX( A.FullName, ' ', 1 ) = 'Nguyễn';

SELECT * FROM view_Answer_5;




-- CTE 
WITH cte1(AccountID,Email) AS (
	SELECT AccountID, Email
    FROM `Account`
    )
    
SELECT *
FROM cte1;