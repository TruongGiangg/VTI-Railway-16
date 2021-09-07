USE TestingSystem;

-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT *
FROM `Account` A
INNER JOIN Department D ON A.DepartmentID = D.DepartmentID;


-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM `Account`
WHERE CreateDate < '2020-12-20';


-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT A.FullName, P.PositionName
FROM `Account` A 
INNER JOIN Position P ON A.PositionID = P.PositionID
WHERE P.PositionName = 'Dev';


-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT D.DepartmentName, count(a.DepartmentID) AS SL 
FROM `account` a
INNER JOIN department D ON a.DepartmentID = D.DepartmentID
GROUP BY A.DepartmentID
HAVING COUNT(A.DepartmentID) >3;


-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều 
-- nhất
-- xác định table examquestion được sử dụng vì có examID,questionID
-- xem dữ liệu có questionID 10 xuất hiện nhiều nhất trong các đề thi là 3 lần
-- tìm câu hỏi xuất hiện trong đề thi nhiều nhất là bao nhiều lần (dùng câu lệnh truy vẫn con để tìm) = 3 lần
-- lấy ra danh sách câu hỏi được sử dụng trong đề thi 3 lần
SELECT QuestionID,COUNT(QuestionID)
FROM examquestion 
GROUP BY questionID
HAVING COUNT(QuestionID) = (SELECT COUNT(QuestionID) FROM examquestion 
							GROUP BY questionID
							ORDER BY COUNT(QuestionID)  DESC
							LIMIT 1);


-- Question 6: Thông kê mỗi Category Question được sử dụng trong bao nhiêu Question ???
SELECT a.CategoryID, a.CategoryName, count(b.CategoryID) 
FROM categoryquestion a 
JOIN question b ON a.CategoryID = b.CategoryID
GROUP BY b.CategoryID;


-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT a.QuestionID, count(ab.QuestionID) AS SoLanDuocSuDung
FROM examquestion a
LEFT JOIN question ab ON a.QuestionID = ab.QuestionID
GROUP BY ab.QuestionID;


-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT ab.QuestionID, ab.Content, count(A.QuestionID)
FROM Answer A
JOIN question ab ON A.QuestionID = ab.QuestionID
GROUP BY A.QuestionID
 HAVING count(A.QuestionID) = (SELECT max(`count`) FROM
								(SELECT count(B.QuestionID) AS `Count` FROM answer B
								GROUP BY B.QuestionID) AS countAnswer);


-- Question 9: Thống kê số lượng account trong mỗi group 
SELECT A.GroupID, COUNT(B.AccountID) AS SoLuongAccount
FROM GroupAccount B
JOIN `Group` A ON A.groupID = B.groupID
GROUP BY A.GroupID;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT A.PositionID, COUNT(B.AccountID) AS NguoiLamViec
FROM `Account` B
JOIN Position A ON A.PositionID = B.PositionID
GROUP BY A.PositionID
ORDER BY B.AccountID DESC
LIMIT 2;

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT a.DepartmentID,a.DepartmentName, b.PositionName, count(b.PositionName) AS `Số Position`
FROM `Account` ab
JOIN department a ON ab.DepartmentID = a.DepartmentID
JOIN `position` b ON ab.PositionID = b.PositionID
GROUP BY a.DepartmentID, b.PositionID;


-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì,…
SELECT Q.QuestionID, Q.Content, A.FullName, TQ.TypeName AS LoaiCauHoi, B.Content 
FROM question Q
JOIN categoryquestion CQ ON Q.CategoryID = CQ.CategoryID
JOIN typequestion TQ ON Q.TypeID = TQ.TypeID
JOIN `account` A ON A.AccountID = Q.CreatorID
JOIN Answer B ON Q.QuestionID = B.QuestionID
ORDER BY Q.QuestionID ASC;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT TQ.TypeName, COUNT(TQ.TypeID) AS SoLuong
FROM question A
JOIN typequestion TQ ON TQ.TypeID = A.TypeID
GROUP BY TQ.TypeID;

-- Question 14: Lấy ra group không có account nào
SELECT *
FROM `Group` A
LEFT JOIN groupAccount B ON A.GroupID = B.GroupID
WHERE B.GroupID IS NULL;

-- Question 16: Lấy ra question không có answer nào
SELECT *
FROM Question A
LEFT JOIN Answer B ON A.QuestionID = B.QuestionID
WHERE B.QuestionID IS NULL;


-- Question 17: 
-- a) Lấy các account thuộc nhóm thứ 1
-- b) Lấy các account thuộc nhóm thứ 2
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT A.AccountID, A.FullName
FROM `Account` A
JOIN GroupAccount B ON A.AccountID = B.AccountID
WHERE B.GroupID = 1
UNION
SELECT A.AccountID, A.FullName
FROM `Account` A
JOIN GroupAccount B ON A.AccountID = B.AccountID
WHERE B.GroupID = 2;

-- Question 18: 
-- a) Lấy các group có lớn hơn 5 thành viên
-- b) Lấy các group có nhỏ hơn 7 thành viên
-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT B.Groupname, COUNT(B.GroupID) AS ThanhVien
FROM GroupAccount A
JOIN `Group` B ON A.GroupID = B.GroupID
GROUP BY B.GroupID
HAVING COUNT(B.GroupID) >= 5
UNION
SELECT B.Groupname, COUNT(B.GroupID) AS ThanhVien
FROM GroupAccount A
JOIN `Group` B ON A.GroupID = B.GroupID
GROUP BY B.GroupID
HAVING COUNT(B.GroupID) <= 7;
