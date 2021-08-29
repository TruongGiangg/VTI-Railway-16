-- Insert Data
Use Testing_buoi_1;

-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

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


-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
