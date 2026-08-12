create database BookMyShow

CREATE TABLE Users
(
User_Id INT PRIMARY KEY,
Name VARCHAR(100),
Phone_No INT NOT NULL,
Email VARCHAR(50),
Age INT 
)

INSERT INTO Users VALUES(6,'Ram',78920410,'qwert123@gmail.com',19)
INSERT INTO Users VALUES(3,'Krishna',63012786,'krishna567@gmail.com',43)
INSERT INTO Users VALUES(12,'Leeladhar',99776123,'Lallu1455@gmail.com',20)
INSERT INTO Users VALUES(15,'Bala',9105032,'Bala781@gmail.com',18)
INSERT INTO Users VALUES(18,'Neelakanta',91009919,'Blueneck55@gmail.com',23)
INSERT INTO Users VALUES(21,'Likitha',89191278,'likki12@gmail.com',36)
INSERT INTO Users VALUES(73,'Praveen',99899402,'praveen71@gmail.com',19)
INSERT INTO Users VALUES(54,'Gunnadeep',75418392,'gunnadeep123@gmail.com',38)
INSERT INTO Users VALUES(32,'Niranjan',781023,'niranjanvarma@gmail.com',45)
INSERT INTO Users VALUES(39,'Rani',99131923,'rani78@gmail.com',17)

select * from Users

CREATE TABLE Movies
(
Movie_name VARCHAR(100) NOT NULL,
Duration   INT,
Language VARCHAR(20),
Movie_ID INT primary key,
Rating INT check (Rating >= 1 or Rating <= 10)
)

INSERT INTO Movies VALUES('Bahubali',180,'Telugu',2015,5)
INSERT INTO Movies VALUES('OG',180,'Telugu',15,4)
INSERT INTO Movies VALUES('Vikram',140,'Tamil',67,4)
INSERT INTO Movies VALUES('Kalki',160,'Telugu',25,4)
INSERT INTO Movies VALUES('Vishnu Vinyasam',190,'Telugu',12,5)
INSERT INTO Movies VALUES('Off Campus',360,'English',21,4)
INSERT INTO Movies VALUES('Rajasab',195,'Telugu',7,3)
INSERT INTO Movies VALUES('Mirchi',180,'Telugu',11,4)
INSERT INTO Movies VALUES('Spider Man',210,'English',26,5)
INSERT INTO Movies VALUES('Tourist Family',220,'Tamil',54,3)

select * from Movies


CREATE TABLE Theater
(
Theater_Name  VARCHAR(50),
Theater_Id    INT PRIMARY KEY,
Total_screens     VARCHAR(20) NOT NULL,
City   VARCHAR(50),
Contact_Number INT
)

INSERT INTO Theater VALUES('Gaiety Theatre',101,2,'Shimla',783293)
INSERT INTO Theater VALUES('Prithvi  Theatre',102,3,'Mumbai',956191)
INSERT INTO Theater VALUES('Prasads IMAX',103,1,'Hyderabad',876193)
INSERT INTO Theater VALUES('Pratap Theatre',104,2,'Nandyal',672392)
INSERT INTO Theater VALUES('Sangeeth Theatre',205,1,'Kurnool',832131)
INSERT INTO Theater VALUES('PVR',106,4,'Vijayawada',712131)
INSERT INTO Theater VALUES('PGR Cinemas',107,1,'Tirupati',6320131)
INSERT INTO Theater VALUES('Padma Picture',308,1,'Chennai',9989981)
INSERT INTO Theater VALUES('Sangam',501,4,'Mumbai',994211)
INSERT INTO Theater VALUES('JVM Cinemas',912,1,'Coimbatore',891989)

select * from Theater


CREATE TABLE Event
(
Event_Id   INT PRIMARY KEY,
Event_Name VARCHAR(50),
Event_Type VARCHAR(20),
Event_Date DATE,
Location VARCHAR(100) NOT NULL
)

INSERT INTO Event VALUES(32,'Nesan Musical Comedy','Musical','2026-08-06','Tirupati')
INSERT INTO Event VALUES(81,'Grin club','Dance','2026-06-12','Chennai')
INSERT INTO Event VALUES(95,'Magic Beans Workshop','Study','2025-11-21','Mumbai')
INSERT INTO Event VALUES(64,'New Year Celebrations','Enjoyment','2026-01-01','Hydrabad')

select * from Event


CREATE TABLE Payment
(
Payment_Id  INT PRIMARY KEY,
Payment_Type VARCHAR(20) NOT NULL,
Amount INT,
Payment_Date DATE
)

INSERT INTO Payment VALUES(7921,'UPI',9000,'2026-11-08')
INSERT INTO Payment VALUES(5622,'Debit',5100,'2025-08-28')
INSERT INTO Payment VALUES(3219,'Card',34200,'2026-04-12')

select * from Payment


