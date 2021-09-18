-- Create DataBase
DROP DATABASE IF EXISTS schema_database;
CREATE DATABASE schema_database;
-- Use DataBase
USE schema_database;


-- CREATE DataBase: CUSTOMER
DROP TABLE IF EXISTS CUSTOMER;
CREATE TABLE CUSTOMER (
			CustomerID 		INT primary key AUTO_INCREMENT,
			`Name` 			NVARCHAR(50),
			Phone 			INT,
			Email 			VARCHAR(50),
			Address 		VARCHAR(50),
			Note 			VARCHAR(200)
);

-- CREATE DataBase: CAR
DROP TABLE IF EXISTS CAR;
CREATE TABLE CAR (
			CarID 			INT primary key AUTO_INCREMENT,
			Maker 			ENUM('HONDA', 'TOYOTA', 'NISSAN') NOT NULL,
			Model 			VARCHAR(50) NOT NULL,
			`Year` 			INT UNIQUE NOT NULL,
			Color 			VARCHAR(20) NOT NULL,
			Note 			VARCHAR(200) NOT NULL
);

-- CREATE DataBase: CAR_ORDER
DROP TABLE IF EXISTS CAR_ORDER;
CREATE TABLE CAR_ORDER (
			OrderID 			INT primary key AUTO_INCREMENT,
			CustomerID 			INT NOT NULL,
			CarID 				INT NOT NULL,
			Amount				INT DEFAULT 1 NOT NULL,
			SalePrice 			DOUBLE NOT NULL,
			OrderDate 			DATETIME NOT NULL,
            DeliveryDate 		DATETIME NOT NULL,
            DeliveryAddress 	VARCHAR(50) NOT NULL,
            Staus 				TINYINT(2) DEFAULT(0) NOT NULL,
            Note 				VARCHAR(200) NOT NULL,
            FOREIGN KEY (CarID) REFERENCES CAR(CarID) ON DELETE CASCADE,
            FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID) ON DELETE CASCADE
);

-- Insert DataBase: CUSTOMER
INSERT INTO	CUSTOMER
	(`Name`,				Phone,				Email,					Address,			Note	)
	VALUES
	(N'Giang',				'023456',			'giang@gmail.com',		'HN',				'1'		),
	(N'Linh',				'034567',			'linh@gmail.com',		'SL',				'21'	),
	(N'Nghĩa',				'045678',			'nghia@gmail.com',		'HCM',				'124'	),
    (N'Hoan',				'045777',			'hoan@gmail.com',		'HN',				'123'	),
    (N'Trung',				'045888',			'trung@gmail.com',		'HCM',				'127'	);
	
-- Insert DataBase: CAR 
 INSERT INTO	CAR
	(Maker,					 Model,				`Year`,					Color,					Note)
	VALUES
	('HONDA',				'HONDA1',			1990,					'RED',					'12'	),
	('TOYOTA',				'TOYOTA1',			2000,					'BLUE',					'55'	),
	('NISSAN',				'NISSAN1',			2010,					'BLACK',				'307'	),
    ('HONDA',				'HONDA2',			2015,					'WHITE',				'357'	),
    ('TOYOTA',				'TOYOTA2',			2013,					'BLACK',				'237'	);

-- Insert DataBase: CAR_ORDER 
INSERT INTO		CAR_ORDER 
	(CustomerID,			CarID,				Amount,					SalePrice, 						OrderDate, 					DeliveryDate, 				DeliveryAddress, 		Note)
	VALUES
	(1,						2,					2,						 5.000000,						'2010-03-01',				'2010-06-01',				 'HN' ,					'1234'	),
	(2,						2,					3,						 6.000000,						'2020-05-04',				'2020-07-04',				 'SL',					'12345'	),
	(3,						3,					2,						 8.000000,						'2020-04-08',				'2020-05-08',				 'HCM',					'12356'	),
	(2,						4,					5,						 20.000000,						'2020-06-08',				'2020-08-08',				 'SL',					'12357'	),
    (4,						5,					2,						 15.000000,						'2020-09-20',				'2020-11-20',				 'HN',					'12323'	),
    (5,						1,					4,						 30.000000,						'2020-07-10',				'2020-10-10',				 'HCM',					'12235'	);
    
    
-- Ques 2: Viết lệnh lấy ra thông tin của khách hàng: tên, 
-- số lượng oto khách hàng đã mua và sắp sếp tăng dần theo số lượng oto đã mua.
SELECT A.`Name`, NumberCars
FROM CUSTOMER A
JOIN (	SELECT CustomerID, SUM(Amount) As NumberCars
		FROM CAR_ORDER 
		GROUP BY CustomerID
        HAVING SUM(Amount) > 0
        ) AS NumberCars USING(CustomerID)
ORDER BY NumberCars ASC;
		

-- Ques3: Viết hàm trả về tên hãng sản xuất đã bán được nhiều oto nhất trong năm nay.

-- Ques4: Viết 1 thủ tục để xóa các đơn hàng đã bị hủy của những năm trước. In ra số lượng bản ghi đã bị xóa.

-- Ques5: Viết 1 thủ tục (có CustomerID parameter) để in ra thông tin của các đơn 
-- hàng đã đặt hàng bao gồm: tên của khách hàng, mã đơn hàng, số lượng oto và tên hãng sản xuất.



-- Ques6 :Viết trigger để tránh trường hợp người dụng nhập thông tin không hợp lệ vào database (DeliveryDate < OrderDate + 15)
