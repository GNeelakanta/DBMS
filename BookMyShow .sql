create database BookMyShow1

CREATE TABLE Customer
(
    C_Id      INT PRIMARY KEY,
    C_Name    VARCHAR(100),
    Phone     BIGINT NOT NULL,
    Email     VARCHAR(100) NOT NULL UNIQUE,
    City      VARCHAR(50)
)

INSERT INTO Customer VALUES(101,'Ram',7892041011,'qwert123@gmail.com','AP')
INSERT INTO Customer VALUES(102,'Krishna',6301278645,'krishna567@gmail.com','HYD')
INSERT INTO Customer VALUES(103,'Leeladhar',9977612323,'Lallu1455@gmail.com','CTR')
INSERT INTO Customer VALUES(104,'Bala',9105032876,'Bala781@gmail.com','TN')
INSERT INTO Customer VALUES(105,'Neelakanta',9100991936,'Blueneck55@gmail.com','TPT')
INSERT INTO Customer VALUES(106,'Likitha',8919127823,'likki12@gmail.com','TPT')
INSERT INTO Customer VALUES(107,'Praveen',9989940225,'praveen71@gmail.com','Ongle')
INSERT INTO Customer VALUES(108,'Gunnadeep',7541839221,'gunnadeep123@gmail.com','PKL')
INSERT INTO Customer VALUES(109,'Niranjan',7810231543,'niranjanvarma@gmail.com','KLR')
INSERT INTO Customer VALUES(110,'Rani',9913192323,'rani78@gmail.com','TPT')
INSERT INTO Customer VALUES(111,'Neel',9876543123,'neel9876@gmail.com','Assam')
INSERT INTO Customer VALUES(112,'Karthik',8974362212,'karthik234@gmail.com','Pune')
INSERT INTO Customer VALUES(113,'Siri',9988223422,'siri123@gmail.com','TN')
INSERT INTO Customer VALUES(114,'Rebel',7788334523,'rebelhood@gmail.com','HYD')
INSERT INTO Customer VALUES(115,'Man of Mass',8764539202,'manofmass@gmail.com','PKL')

Select * from Customer
drop table Customer

CREATE TABLE Movies
(
    M_Id       INT PRIMARY KEY,
    M_Name     VARCHAR(100),
    Language   VARCHAR(30),
    Genre      VARCHAR(30),
    Duration   INT
)

INSERT INTO Movies VALUES(121,'Bahubali','Telugu','Action',225)
INSERT INTO Movies VALUES(122,'Saalar','Telugu','Action',175)
INSERT INTO Movies VALUES(123,'Davara','Telugu','Action',128)
INSERT INTO Movies VALUES(124,'Leo','Tamil','Thriller',159)
INSERT INTO Movies VALUES(125,'12th Fail', 'Hindi','Drama',162)
INSERT INTO Movies VALUES(126,'Hi Nanna','Telugu','Romance',138)
INSERT INTO Movies VALUES(127,'Premalu','Malayalam','Comedy',120)
INSERT INTO Movies VALUES(128,'Dangol','Hindi','Action',126)
INSERT INTO Movies VALUES(129,'Jawan','Telugu','Action',140)
INSERT INTO Movies VALUES(130,'Papa','Tamil','Romance',120)

select * from Movies
drop table Movies

CREATE TABLE Theater
(
    Theater_Id    INT PRIMARY KEY,
    Theater_Name  VARCHAR(100),
    Location      VARCHAR(50),
    City          VARCHAR(50),
    Screen        INT
)

INSERT INTO Theater VALUES(131,'Inox Cinema','Gachibowli','HYD',5)
INSERT INTO Theater VALUES(132,'PVR Cinema','Moosapet','BLR',6)
INSERT INTO Theater VALUES(133,'PNR Theater','Bus Stand','TPT',4)
INSERT INTO Theater VALUES(134,'Pratap','Annamaya Circle','TPT',5)
INSERT INTO Theater VALUES(135,'Imax','Kapali','Chennai', 4)

select * from Theater
drop table Theater

CREATE TABLE Shows
(
    S_Id      INT PRIMARY KEY,
    M_Id      INT,
    T_Id      INT,
    Date      DATE NOT NULL,
    Time      TIME NOT NULL,
    Type      VARCHAR(20) NOT NULL,
    Price     DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (M_Id) REFERENCES Movies(M_Id),
    FOREIGN KEY (T_Id) REFERENCES Theater(Theater_Id)
)


INSERT INTO Shows VALUES(141,121,131,'2026-08-02','06:30:00','Premium',250)
INSERT INTO Shows VALUES(142,122,131,'2026-08-03','04:00:00','Regular',150)
INSERT INTO Shows VALUES(143,123,132,'2026-08-04','07:00:00','Premium',300)
INSERT INTO Shows VALUES(144,124,132,'2026-08-05','09:30:00','Premium',300)
INSERT INTO Shows VALUES(145,125,134,'2026-08-06','05:30:00','Regular',150)
INSERT INTO Shows VALUES(146,126,135,'2026-09-01','10:00:00','Premium',300)
INSERT INTO Shows VALUES(147,127,131,'2026-09-09','06:00:00','Regular',180)
INSERT INTO Shows VALUES(148,128,132,'2026-09-20','19:30:00','Premium',200)
INSERT INTO Shows VALUES(149,129,131,'2026-09-25','20:00:00','Regular',100)
INSERT INTO Shows VALUES(150,130,135,'2026-09-30','21:30:00','Premium',250)

select * from Shows
drop table Shows

CREATE TABLE Booking
(
    B_Id          INT PRIMARY KEY,
    C_Id          INT,
    S_Id          INT,
    Seats         INT NOT NULL,
    Booking_Date  DATE NOT NULL,

    FOREIGN KEY (C_Id) REFERENCES Customer(C_Id),
    FOREIGN KEY (S_Id) REFERENCES Shows(S_Id)
)

INSERT INTO Booking VALUES(161,112,141,2,'2026-08-08')
INSERT INTO Booking VALUES(162,114,142,3,'2026-08-19')
INSERT INTO Booking VALUES(163,111,144,4,'2026-08-25')
INSERT INTO Booking VALUES(164,107,147,1,'2026-08-31')
INSERT INTO Booking VALUES(165,106,150,5,'2026-09-01')
INSERT INTO Booking VALUES(166,105,145,4,'2026-09-09')
INSERT INTO Booking VALUES(167,115,149,3,'2026-09-15')
INSERT INTO Booking VALUES(168,101,146,6,'2026-09-20')
INSERT INTO Booking VALUES(169,104,148,7,'2026-09-25')
INSERT INTO Booking VALUES(170,105,143,5,'2026-09-29')

select * from Booking
drop table Booking

CREATE TABLE Payment
(
    P_Id       INT PRIMARY KEY,
    B_Id       INT,
    P_Type     VARCHAR(30) NOT NULL,
    Amount     DECIMAL(10,2),
    P_Status   VARCHAR(20) NOT NULL,
    
    FOREIGN KEY (B_Id) REFERENCES Booking(B_Id)
)

INSERT INTO Payment VALUES(181,162,'UPI',400,'Success')
INSERT INTO Payment VALUES(182,164,'Cash',500,'Success')
INSERT INTO Payment VALUES(183,166,'Debit',1000,'Refunded')
INSERT INTO Payment VALUES(184,168,'Credit',900,'Success')
INSERT INTO Payment VALUES(185,170,'UPI',800,'Processing')
INSERT INTO Payment VALUES(186,161,'Net Banking',300,'Pending')
INSERT INTO Payment VALUES(187,163,'Cash',660,'Success')
INSERT INTO Payment VALUES(188,165,'UPI',520,'Pending')
INSERT INTO Payment VALUES(189,167,'Credit',420,'Refunded')
INSERT INTO Payment VALUES(190,169,'UPI',180,'Success')

select * from Payment
drop table Payment


select * from customer
select * from Movies
select * from Theater
select * from Shows
select * from Booking
select * from Payment


1.
SELECT C_Name
FROM Customer
WHERE City = 'TPT'

output:
Neelakanta
Likitha
Rani

2.
SELECT C_Name, Phone
FROM Customer
WHERE City = 'HYD'

output:
Krishna	6301278645
Rebel	7788334523

3.
SELECT * FROM Movies
WHERE Language = 'Telugu'

output:
121	Bahubali  Telugu	Action	225
122	Saalar	  Telugu	Action	175
123	Davara	  Telugu	Action	128
126	Hi Nanna  Telugu	Romance	138
129	Jawan	  Telugu	Action	140

4.
SELECT M_Name, Genre
FROM Movies
WHERE Genre = 'Action'

output:
Bahubali Action
Saalar	 Action
Davara	 Action
Dangol	 Action
Jawan	 Action

5.
SELECT M_Name
FROM Movies
WHERE Duration > 150

output:
Bahubali
Saalar
Leo
12th Fail

6.
SELECT * FROM Theater
WHERE City = 'TPT'

output:
133	PNR Theater	 Bus Stand	      TPT	4
134	Pratap	     Annamaya Circle  TPT	5

7.
SELECT Theater_Name, Location
FROM Theater
WHERE Screen > 3

output:
Inox Cinema	 Gachibowli
PVR Cinema	 Moosapet
PNR Theater	 Bus Stand
Pratap	     Annamaya Circle
Imax	     Kapali

8.
SELECT * FROM Shows
WHERE Date = '2026-08-05'

output:
144	124	132	2026-08-05	09:30:00.0000000	Premium	300.00

9.
SELECT S_Id, M_Id,Time
FROM Shows
WHERE Time > '06:00:00'

output:
141	121	06:30:00.0000000
143	123	07:00:00.0000000
144	124	09:30:00.0000000
146	126	10:00:00.0000000
148	128	19:30:00.0000000
149	129	20:00:00.0000000
150	130	21:30:00.0000000

10.
SELECT * FROM Booking
WHERE Seats > 3

output:
163	111	144	4	2026-08-25
165	106	150	5	2026-09-01
166	105	145	4	2026-09-09
168	101	146	6	2026-09-20
169	104	148	7	2026-09-25
170	105	143	5	2026-09-29

11.
SELECT B_Id, C_Id, Seats
FROM Booking
WHERE Booking_Date > '2026-08-08'

output:
162	114	3
163	111	4
164	107	1
165	106	5
166	105	4
167	115	3
168	101	6
169	104	7
170	105	5

12.
SELECT * FROM Payment
WHERE Amount > 500

output:
183	166	Debit	1000.00	Refunded
184	168	Credit	900.00	Success
185	170	UPI	    800.00	Processing
187	163	Cash	660.00	Success
188	165	UPI	    520.00	Pending

13.
SELECT P_Id, B_Id, P_Type
FROM Payment
WHERE P_Type = 'UPI'

output:
181	162	UPI
185	170	UPI
188	165	UPI
190	169	UPI

14.
SELECT * FROM Payment
WHERE P_Status = 'Success'

output:
181	162	UPI	    400.00	Success
182	164	Cash	500.00	Success
184	168	Credit	900.00	Success
187	163	Cash	660.00	Success
190	169	UPI	    180.00	Success

15.
SELECT C_Name, Email
FROM Customer
WHERE City = 'TPT'
   OR City = 'TN'

output:
Bala	    Bala781@gmail.com
Neelakanta	Blueneck55@gmail.com
Likitha	    likki12@gmail.com
Rani	    rani78@gmail.com
Siri	    siri123@gmail.com

16.
SELECT M_Name
FROM Movies
WHERE Language = 'Telugu'
  AND Genre = 'Action'

output:
Bahubali
Saalar
Davara
Jawan

17.
SELECT M_Name
FROM Movies
WHERE Duration >= 120
  AND Duration < 180

output:
Saalar
Davara
Leo
12th Fail
Hi Nanna
Premalu
Dangol
Jawan
Papa

18.
SELECT * FROM Customer
WHERE City = 'TPT'
  AND Email IS NOT NULL

output:
105	Neelakanta	9100991936	Blueneck55@gmail.com  TPT
106	Likitha	    8919127823	likki12@gmail.com	  TPT
110	Rani	    9913192323	rani78@gmail.com	  TPT


19.
SELECT * FROM Theater
WHERE City = 'TPT'
   OR City = 'HYD'

output:
131	Inox Cinema	Gachibowli	    HYD	5
133	PNR Theater	Bus Stand	    TPT	4
134	Pratap	    Annamaya Circle	TPT	5

20.
SELECT Theater_Name
FROM Theater
WHERE Screen > 2
  AND City = 'TPT'

output:
PNR Theater
Pratap

21.
SELECT * FROM Booking
WHERE Seats >= 2
  AND Seats <= 5

output:
161	112	141	2	2026-08-08
162	114	142	3	2026-08-19
163	111	144	4	2026-08-25
165	106	150	5	2026-09-01
166	105	145	4	2026-09-09
167	115	149	3	2026-09-15
170	105	143	5	2026-09-29

22.
SELECT B_Id, C_Id
FROM Booking
WHERE Booking_Date = '2026-09-09'
   OR Seats > 4

output:
165	106
166	105
168	101
169	104
170	105

23.
SELECT * FROM Payment
WHERE Amount > 500
  AND P_Status = 'Success'

output:
184	168	Credit	900.00	Success
187	163	Cash	660.00	Success

24.
SELECT P_Id, Amount, P_Type
FROM Payment
WHERE P_Type = 'UPI'
   OR P_Type = 'Credit'

output:
181	400.00	UPI
184	900.00	Credit
185	800.00	UPI
188	520.00	UPI
189	420.00	Credit
190	180.00	UPI

25.
SELECT * FROM Customer
WHERE (City = 'TPT' OR City = 'HYD')
  AND Phone IS NOT NULL

output:
102	Krishna	    6301278645	krishna567@gmail.com  HYD
105	Neelakanta	9100991936	Blueneck55@gmail.com  TPT
106	Likitha	    8919127823	likki12@gmail.com	  TPT
110	Rani	    9913192323	rani78@gmail.com	  TPT
114	Rebel	    7788334523	rebelhood@gmail.com	  HYD

26.
SELECT C_Id, C_Name
FROM Customer
WHERE City = 'TPT'

output:
105	Neelakanta
106	Likitha
110	Rani

27.
SELECT M_Name AS Movie_Name, Language, Genre
FROM Movies
WHERE Duration > 120

output:
Bahubali  Telugu	Action
Saaiar	  Telugu	Action
Davara	  Telugu	Action
Leo	      Tamil	    Thriller
12th Fail Hindi	    Drama
Hi Nanna  Telugu	Romance
Dangol	  Hindi	    Action
Jawan	  Telugu	Action

28.
SELECT Theater_Name,City,Screen
FROM Theater
WHERE Screen > 3

output:
Inox Cinema	HYD	5
PVR Cinema	BLR	6
PNR Theater	TPT	4
Pratap	    TPT	5
Imax	Chennai	4

29.
SELECT S_Id AS Show_ID,M_Id AS Movie_ID,Time
FROM Shows
WHERE Time > '06:00:00'

output:
141	121	06:30:00.0000000
143	123	07:00:00.0000000
144	124	09:30:00.0000000
146	126	10:00:00.0000000
148	128	19:30:00.0000000
149	129	20:00:00.0000000
150	130	21:30:00.0000000

30.
SELECT P_Id AS Payment_ID,Amount,P_Status AS Payment_Status
FROM Payment
WHERE Amount > 500

output:
183	1000.00	Refunded
184	900.00	Success
185	800.00	Processing
187	660.00	Success
188	520.00	Pending


31.
SELECT C.C_Name,B.B_Id AS Booking_ID
FROM Customer C
JOIN Booking B
ON C.C_Id = B.C_Id

output:
Karthik	    161
Rebel	    162
Neel	    163
Praveen	    164
Likitha	    165
Neelakanta  166
Man of Mass	167
Ram	        168
Bala	    169
Neelakanta	170

32.
SELECT C.C_Name,C.Phone,B.Seats
FROM Customer C
JOIN Booking B
ON C.C_Id = B.C_Id

output:
Karthik	    8974362212	2
Rebel	    7788334523	3
Neel	    9876543123	4
Praveen	    9989940225	1
Likitha	    8919127823	5
Neelakanta	9100991936	4
Man of Mass	8764539202	3
Ram	        7892041011	6
Bala	    9105032876	7
Neelakanta	9100991936	5

33.
SELECT M.M_Name AS Movie_Name,S.Time
FROM Movies M
JOIN Shows S
ON M.M_Id = S.M_Id

output:
Bahubali   06:30:00.0000000
Saalar	   04:00:00.0000000
Davara	   07:00:00.0000000
Leo	       09:30:00.0000000
12th Fail  05:30:00.0000000
Hi Nanna   10:00:00.0000000
Premalu	   06:00:00.0000000
Dangol	   19:30:00.0000000
Jawan	   20:00:00.0000000
Papa	   21:30:00.0000000

34.
SELECT M.M_Name AS Movie_Name,M.Language,S.Date
FROM Movies M
JOIN Shows S
ON M.M_Id = S.M_Id

output:
Bahubali   Telugu	  2026-08-02
Saaiar	   Telugu	  2026-08-03
Davara	   Telugu	  2026-08-04
Leo	       Tamil	  2026-08-05
12th Fail  Hindi	  2026-08-06
Hi Nanna   Telugu	  2026-09-01
Premalu	   Malayalam  2026-09-09
Dangol	   Hindi	  2026-09-20
Jawan	   Telugu	  2026-09-25
Papa	   Tamil	  2026-09-30

35.
SELECT T.Theater_Name,S.Time
FROM Theater T
JOIN Shows S
ON T.Theater_Id = S.T_Id

output:
Inox Cinema	06:30:00.0000000
Inox Cinema	04:00:00.0000000
PVR Cinema	07:00:00.0000000
PVR Cinema	09:30:00.0000000
Pratap	    05:30:00.0000000
Imax	    10:00:00.0000000
Inox Cinema	06:00:00.0000000
PVR Cinema	19:30:00.0000000
Inox Cinema	20:00:00.0000000
Imax	    21:30:00.0000000

36.
SELECT T.Theater_Name,T.City,S.Date
FROM Theater T
JOIN Shows S
ON T.Theater_Id = S.T_Id

output:
Inox Cinema	HYD	2026-08-02
Inox Cinema	HYD	2026-08-03
PVR Cinema	BLR	2026-08-04
PVR Cinema	BLR	2026-08-05
Pratap	TPT	2026-08-06
Imax	Chennai	2026-09-01
Inox Cinema	HYD	2026-09-09
PVR Cinema	BLR	2026-09-20
Inox Cinema	HYD	2026-09-25
Imax	Chennai	2026-09-30

37.
SELECT M.M_Name AS Movie_Name,T.Theater_Name
FROM Movies M
JOIN Shows S
ON M.M_Id = S.M_Id
JOIN Theater T
ON S.T_Id = T.Theater_Id

output:
Bahubali	Inox Cinema
Saaiar	Inox Cinema
Davara	PVR Cinema
Leo	PVR Cinema
12th Fail	Pratap
Hi Nanna	Imax
Premalu	Inox Cinema
Dangol	PVR Cinema
Jawan	Inox Cinema
Papa	Imax

38.
SELECT M.M_Name AS Movie_Name,T.Theater_Name,T.City
FROM Movies M
JOIN Shows S
ON M.M_Id = S.M_Id
JOIN Theater T
ON S.T_Id = T.Theater_Id
WHERE T.City = 'TPT'

output:
12th Fail	Pratap	TPT

39.
SELECT C.C_Name AS Customer_Name,M.M_Name AS Movie_Name,B.Seats
FROM Customer C
JOIN Booking B
ON C.C_Id = B.C_Id
JOIN Shows S
ON B.S_Id = S.S_Id
JOIN Movies M
ON S.M_Id = M.M_Id
WHERE B.Seats > 2

output:
Rebel	Saaiar	3
Neel	Leo	4
Likitha	Papa	5
Neelakanta	12th Fail	4
Man of Mass	Jawan	3
Ram	Hi Nanna	6
Bala	Dangol	7
Neelakanta	Davara	5

40.
SELECT M.M_Name AS Movie_Name,T.Theater_Name,S.Time
FROM Movies M
JOIN Shows S
ON M.M_Id = S.M_Id
JOIN Theater T
ON S.T_Id = T.Theater_Id
WHERE T.City = 'TPT'
  AND S.Time > '06:00:00'

 output:

41.
SELECT C.C_Name AS Customer_Name,M.M_Name AS Movie_Name,B.Booking_Date
FROM Customer C
JOIN Booking B
ON C.C_Id = B.C_Id
JOIN Shows S
ON B.S_Id = S.S_Id
JOIN Movies M
ON S.M_Id = M.M_Id
WHERE B.Booking_Date > '2026-08-08'

output:
Rebel	Saaiar	2026-08-19
Neel	Leo	2026-08-25
Praveen	Premalu	2026-08-31
Likitha	Papa	2026-09-01
Neelakanta	12th Fail	2026-09-09
Man of Mass	Jawan	2026-09-15
Ram	Hi Nanna	2026-09-20
Bala	Dangol	2026-09-25
Neelakanta	Davara	2026-09-29

42.
SELECT M.M_Name AS Movie_Name,T.Theater_Name,T.City
FROM Movies M
JOIN Shows S
ON M.M_Id = S.M_Id
JOIN Theater T
ON S.T_Id = T.Theater_Id
WHERE M.Language = 'Telugu'
  AND T.City = 'TPT'

output:

43.
UPDATE Customer
SET City = 'CTR'
WHERE C_Id = 106
  AND City = 'TPT'

output:
106	Likitha	8919127823	likki12@gmail.com	CTR

44.
UPDATE Movies
SET Genre = 'Action'
WHERE M_Id = 126

output:
126	Hi Nanna	Telugu	Action	138

45.
UPDATE Theater
SET Screen = Screen + 1
WHERE Theater_Id = 134

output:
134	Pratap	Annamaya Circle	TPT	6

46.
UPDATE Payment
SET P_Status = 'Success'
WHERE P_Id = 186

output:
186	161	Net Banking	300.00	Success

47.
UPDATE Payment
SET P_Type = 'UPI'
WHERE P_Status = 'Pending'
  AND Amount < 500

output:
181	162	UPI	400.00	Success
182	164	Cash	500.00	Success
183	166	Debit	1000.00	Refunded
184	168	Credit	900.00	Success
185	170	UPI	800.00	Processing
186	161	Net Banking	300.00	Success
187	163	Cash	660.00	Success
188	165	UPI	520.00	Pending
189	167	Credit	420.00	Refunded
190	169	UPI	180.00	Success

48.
DELETE FROM Customer
WHERE C_Id = 109

output:
101	Ram	7892041011	qwert123@gmail.com	AP
102	Krishna	6301278645	krishna567@gmail.com	HYD
103	Leeladhar	9977612323	Lallu1455@gmail.com	CTR
104	Bala	9105032876	Bala781@gmail.com	TN
105	Neelakanta	9100991936	Blueneck55@gmail.com	TPT
106	Likitha	8919127823	likki12@gmail.com	CTR
107	Praveen	9989940225	praveen71@gmail.com	Ongle
108	Gunnadeep	7541839221	gunnadeep123@gmail.com	PKL
110	Rani	9913192323	rani78@gmail.com	TPT
111	Neel	9876543123	neel9876@gmail.com	Assam
112	Karthik	8974362212	karthik234@gmail.com	Pune
113	Siri	9988223422	siri123@gmail.com	TN
114	Rebel	7788334523	rebelhood@gmail.com	HYD
115	Man of Mass	8764539202	manofmass@gmail.com	PKL

49.
DELETE FROM Movies
WHERE Duration < 90

output:
121	Bahubali	Telugu	Action	225
122	Saaiar	Telugu	Action	175
123	Davara	Telugu	Action	128
124	Leo	Tamil	Thriller	159
125	12th Fail	Hindi	Drama	162
126	Hi Nanna	Telugu	Action	138
127	Premalu	Malayalam	Comedy	120
128	Dangol	Hindi	Action	126
129	Jawan	Telugu	Action	140
130	Papa	Tamil	Romance	120

50.
DELETE FROM Theater
WHERE Screen < 2
  AND City = 'TPT'

output:
131	Inox Cinema	Gachibowli	HYD	5
132	PVR Cinema	Moosapet	BLR	6
133	PNR Theater	Bus Stand	TPT	4
134	Pratap	Annamaya Circle	TPT	6
135	Imax	Kapali	Chennai	4

51.
DELETE FROM Booking
WHERE Seats = 1
  AND Booking_Date < '2026-08-31'

output:
161	112	141	2	2026-08-08
162	114	142	3	2026-08-19
163	111	144	4	2026-08-25
164	107	147	1	2026-08-31
165	106	150	5	2026-09-01
166	105	145	4	2026-09-09
167	115	149	3	2026-09-15
168	101	146	6	2026-09-20
169	104	148	7	2026-09-25
170	105	143	5	2026-09-29

52.
DELETE FROM Payment
WHERE P_Status = 'Failed'
  AND Amount < 300

output:
181	162	UPI	400.00	Success
182	164	Cash	500.00	Success
183	166	Debit	1000.00	Refunded
184	168	Credit	900.00	Success
185	170	UPI	800.00	Processing
186	161	Net Banking	300.00	Success
187	163	Cash	660.00	Success
188	165	UPI	520.00	Pending
189	167	Credit	420.00	Refunded
190	169	UPI	180.00	Success

53.
UPDATE Movies
SET Duration = Duration + 10
WHERE Duration < 120

output:
121	Bahubali	Telugu	Action	225
122	Saaiar	Telugu	Action	175
123	Davara	Telugu	Action	128
124	Leo	Tamil	Thriller	159
125	12th Fail	Hindi	Drama	162
126	Hi Nanna	Telugu	Action	138
127	Premalu	Malayalam	Comedy	120
128	Dangol	Hindi	Action	126
129	Jawan	Telugu	Action	140
130	Papa	Tamil	Romance	120

54.
UPDATE Theater
SET Screen = Screen + 1
WHERE Screen < 3

output:
131	Inox Cinema	Gachibowli	HYD	5
132	PVR Cinema	Moosapet	BLR	6
133	PNR Theater	Bus Stand	TPT	4
134	Pratap	Annamaya Circle	TPT	6
135	Imax	Kapali	Chennai	4

55.
UPDATE Theater
SET City = 'TPT'
WHERE City = 'CTR'
  AND Screen >= 3

output:
131	Inox Cinema	Gachibowli	HYD	5
132	PVR Cinema	Moosapet	BLR	6
133	PNR Theater	Bus Stand	TPT	4
134	Pratap	Annamaya Circle	TPT	6
135	Imax	Kapali	Chennai	4

56.
UPDATE Movies
SET Language = 'Telugu'
WHERE Language = 'English'
  AND Genre = 'Drama'

output:
121	Bahubali	Telugu	Action	225
122	Saaiar	Telugu	Action	175
123	Davara	Telugu	Action	128
124	Leo	Tamil	Thriller	159
125	12th Fail	Hindi	Drama	162
126	Hi Nanna	Telugu	Action	138
127	Premalu	Malayalam	Comedy	120
128	Dangol	Hindi	Action	126
129	Jawan	Telugu	Action	140
130	Papa	Tamil	Romance	120

57.
UPDATE Movies
SET Genre = 'Action'
WHERE Language = 'Telugu'
  AND Duration > 120

output:
121	Bahubali	Telugu	Action	225
122	Saaiar	Telugu	Action	175
123	Davara	Telugu	Action	128
124	Leo	Tamil	Thriller	159
125	12th Fail	Hindi	Drama	162
126	Hi Nanna	Telugu	Action	138
127	Premalu	Malayalam	Comedy	120
128	Dangol	Hindi	Action	126
129	Jawan	Telugu	Action	140
130	Papa	Tamil	Romance	120

58.
UPDATE Shows
SET Time = '18:00:00'
WHERE Date = '2026-08-08'
  AND Time < '06:00:00'

output:
141	121	131	2026-08-02	06:30:00.0000000	Premium	250.00
142	122	131	2026-08-03	04:00:00.0000000	Regular	150.00
143	123	132	2026-08-04	07:00:00.0000000	Premium	300.00
144	124	132	2026-08-05	09:30:00.0000000	Premium	300.00
145	125	134	2026-08-06	05:30:00.0000000	Regular	150.00
146	126	135	2026-09-01	10:00:00.0000000	Premium	300.00
147	127	131	2026-09-09	06:00:00.0000000	Regular	180.00
148	128	132	2026-09-20	19:30:00.0000000	Premium	200.00
149	129	131	2026-09-25	20:00:00.0000000	Regular	100.00
150	130	135	2026-09-30	21:30:00.0000000	Premium	250.00

59.
UPDATE Booking
SET Seats = Seats + 1
WHERE Seats < 3

output:
161	112	141	3	2026-08-08
162	114	142	3	2026-08-19
163	111	144	4	2026-08-25
164	107	147	2	2026-08-31
165	106	150	5	2026-09-01
166	105	145	4	2026-09-09
167	115	149	3	2026-09-15
168	101	146	6	2026-09-20
169	104	148	7	2026-09-25
170	105	143	5	2026-09-29

60.
UPDATE Booking
SET Booking_Date = '2026-08-15'
WHERE Seats > 4
  AND Booking_Date < '2026-08-10'

output:
161	112	141	3	2026-08-08
162	114	142	3	2026-08-19
163	111	144	4	2026-08-25
164	107	147	2	2026-08-31
165	106	150	5	2026-09-01
166	105	145	4	2026-09-09
167	115	149	3	2026-09-15
168	101	146	6	2026-09-20
169	104	148	7	2026-09-25
170	105	143	5	2026-09-29

61.
UPDATE Payment
SET P_Type = 'UPI'
WHERE P_Type = 'Cash'

output:
181	162	UPI	400.00	Success
182	164	UPI	500.00	Success
183	166	Debit	1000.00	Refunded
184	168	Credit	900.00	Success
185	170	UPI	800.00	Processing
186	161	Net Banking	300.00	Success
187	163	UPI	660.00	Success
188	165	UPI	520.00	Pending
189	167	Credit	420.00	Refunded
190	169	UPI	180.00	Success

62.
UPDATE Payment
SET P_Status = 'Success'
WHERE Amount > 500
  AND P_Status = 'Pending'

output:
181	162	UPI	400.00	Success
182	164	UPI	500.00	Success
183	166	Debit	1000.00	Refunded
184	168	Credit	900.00	Success
185	170	UPI	800.00	Processing
186	161	Net Banking	300.00	Success
187	163	UPI	660.00	Success
188	165	UPI	520.00	Success
189	167	Credit	420.00	Refunded
190	169	UPI	180.00	Success

63.
UPDATE Payment
SET P_Status = 'Failed'
WHERE Amount < 100
  AND P_Status = 'Pending'

output:
181	162	UPI	400.00	Success
182	164	UPI	500.00	Success
183	166	Debit	1000.00	Refunded
184	168	Credit	900.00	Success
185	170	UPI	800.00	Processing
186	161	Net Banking	300.00	Success
187	163	UPI	660.00	Success
188	165	UPI	520.00	Success
189	167	Credit	420.00	Refunded
190	169	UPI	180.00	Success

64.
UPDATE Payment
SET Amount = Amount + 100
WHERE P_Type = 'UPI'
  AND Amount < 500

output:
181	162	UPI	400.00	Success
182	164	UPI	500.00	Success
183	166	Debit	1000.00	Refunded
184	168	Credit	900.00	Success
185	170	UPI	800.00	Processing
186	161	Net Banking	300.00	Success
187	163	UPI	660.00	Success
188	165	UPI	520.00	Success
189	167	Credit	420.00	Refunded
190	169	UPI	180.00	Success

65.
DELETE FROM Customer
WHERE City = 'TPT'
  AND Email = 'likki12@gmail.com'

output:
101	Ram	7892041011	qwert123@gmail.com	AP
102	Krishna	6301278645	krishna567@gmail.com	HYD
103	Leeladhar	9977612323	Lallu1455@gmail.com	CTR
104	Bala	9105032876	Bala781@gmail.com	TN
105	Neelakanta	9100991936	Blueneck55@gmail.com	TPT
106	Likitha	8919127823	likki12@gmail.com	CTR
107	Praveen	9989940225	praveen71@gmail.com	Ongle
108	Gunnadeep	7541839221	gunnadeep123@gmail.com	PKL
110	Rani	9913192323	rani78@gmail.com	TPT
111	Neel	9876543123	neel9876@gmail.com	Assam
112	Karthik	8974362212	karthik234@gmail.com	Pune
113	Siri	9988223422	siri123@gmail.com	TN
114	Rebel	7788334523	rebelhood@gmail.com	HYD
115	Man of Mass	8764539202	manofmass@gmail.com	PKL

66.
DELETE FROM Movies
WHERE Language = 'English'
  AND Duration > 180

output:
121	Bahubali	Telugu	Action	225
122	Saaiar	Telugu	Action	175
123	Davara	Telugu	Action	128
124	Leo	Tamil	Thriller	159
125	12th Fail	Hindi	Drama	162
126	Hi Nanna	Telugu	Action	138
127	Premalu	Malayalam	Comedy	120
128	Dangol	Hindi	Action	126
129	Jawan	Telugu	Action	140
130	Papa	Tamil	Romance	120


67.
DELETE FROM Theater
WHERE (City = 'HYD' OR City = 'TN')
  AND Screen < 3

output:
131	Inox Cinema	Gachibowli	HYD	5
132	PVR Cinema	Moosapet	BLR	6
133	PNR Theater	Bus Stand	TPT	4
134	Pratap	Annamaya Circle	TPT	6
135	Imax	Kapali	Chennai	4

68.
DELETE FROM Shows
WHERE Date = '2026-08-05'
  AND Time < '18:40:00'

 69.
DELETE FROM Booking
WHERE Seats > 4
  AND Booking_Date < '2026-08-08'

output:
161	112	141	3	2026-08-08
162	114	142	3	2026-08-19
163	111	144	4	2026-08-25
164	107	147	2	2026-08-31
165	106	150	5	2026-09-01
166	105	145	4	2026-09-09
167	115	149	3	2026-09-15
168	101	146	6	2026-09-20
169	104	148	7	2026-09-25
170	105	143	5	2026-09-29

70.
DELETE FROM Payment
WHERE Amount > 1000
  AND P_Status = 'Failed'

output:
181	162	UPI	500.00	Success
182	164	UPI	500.00	Success
183	166	Debit	1000.00	Refunded
184	168	Credit	900.00	Success
185	170	UPI	800.00	Processing
186	161	Net Banking	300.00	Success
187	163	UPI	660.00	Success
188	165	UPI	520.00	Success
189	167	Credit	420.00	Refunded
190	169	UPI	280.00	Success

71.
SELECT COUNT(*) AS Number_of_Customers
FROM Customer
WHERE City = 'TPT'
  AND Email LIKE '%@gmail.com'

output:
2

72.
SELECT COUNT(*) AS Number_of_Customers
FROM Customer
WHERE City = 'HYD'
   OR City = 'Chennai'

output:
2

73.
SELECT COUNT(*) AS Number_of_Movies
FROM Movies
WHERE Language = 'Telugu'
  AND Genre = 'Action'

output:
5

74.
SELECT COUNT(*) AS Number_of_Movies
FROM Movies
WHERE Duration > 120
  AND Duration < 180

output:
7

75.
SELECT COUNT(*) AS Number_of_Theaters
FROM Theater
WHERE City = 'TPT'
  AND Screen > 3

output:
2

76.
SELECT COUNT(*) AS Number_of_Bookings
FROM Booking
WHERE Seats >= 3
  AND Seats <= 5

output:
6

77.
SELECT MIN(Duration) AS Minimum_Movie_Duration
FROM Movies
WHERE Language = 'Telugu'
  AND Genre = 'Action'

output:
128

78.
SELECT MAX(Duration) AS Maximum_Movie_Duration
FROM Movies
WHERE Language = 'English'
   OR Language = 'Hindi'

output:
162

79.
SELECT AVG(Duration) AS Average_Movie_Duration
FROM Movies
WHERE Duration > 120
  AND Duration < 180

output:
146

80.
SELECT MIN(Screen) AS Minimum_Screens
FROM Theater
WHERE City = 'TPT'
  AND Screen > 2

output:
4

81.
SELECT MAX(Screen) AS Maximum_Screens
FROM Theater
WHERE City = 'HYD'
   OR City = 'Chennai'

output:
5

82.
SELECT AVG(Screen) AS Average_Screens
FROM Theater
WHERE City = 'TPT'
  AND Screen >= 3

output:
5

83.
SELECT MIN(Seats) AS Minimum_Seats
FROM Booking
WHERE Seats > 1
  AND Seats < 5

output:
 2

84.
SELECT MAX(Seats) AS Maximum_Seats
FROM Booking
WHERE Booking_Date > '2026-08-08'
  AND Seats > 2

output:
7

85.
SELECT AVG(Amount) AS Average_Payment_Amount
FROM Payment
WHERE P_Status = 'Success'
  AND Amount > 500

output:
780.000000

86.
SELECT SUM(Amount) AS Total_Payment_Amount
FROM Payment
WHERE P_Status = 'Success'
  AND Amount > 500

output:
1560.00

87.
SELECT SUM(Amount) AS Total_UPI_Amount
FROM Payment
WHERE P_Type = 'UPI'
  AND Amount > 300

output:
1720.00

88.
SELECT SUM(Amount) AS Total_Payment_Amount
FROM Payment
WHERE P_Status = 'Success'
  AND P_Type = 'UPI'
  AND Amount > 500

output:
NULL

89.
SELECT DISTINCT City
FROM Theater
WHERE Screen > 2
  AND Screen < 6

output:
Chennai
HYD
TPT

90.
SELECT DISTINCT P_Status
FROM Payment
WHERE P_Type = 'UPI'
   OR P_Type = 'Credit'

output:
Pending
Processing
Refunded
Success

91.
SELECT DISTINCT Date
FROM Shows
WHERE Time > '06:00:00'
  AND Time < '10:00:00'

output:
2026-08-02
2026-08-04
2026-08-05

92.
SELECT C_Name
FROM Customer
WHERE C_Name LIKE 'A%'
  AND City = 'TPT'


93.
SELECT C_Name
FROM Customer
WHERE (C_Name LIKE 'R%'
       OR C_Name LIKE 'S%')
  AND City = 'HYD'

output:
Rebel

94.
SELECT C_Name, Email
FROM Customer
WHERE C_Name LIKE '%an%'
  AND Email LIKE '%@gmail.com'

output:
Neelakanta	Blueneck55@gmail.com
Rani	rani78@gmail.com
Man of Mass	manofmass@gmail.com

95.
SELECT M_Name
FROM Movies
WHERE M_Name LIKE 'S%'
  AND Language = 'Telugu'

 output:
 Saalar

96.
SELECT Language,
       AVG(Duration) AS Average_Duration
FROM Movies
WHERE Duration > 100
GROUP BY Language

output:
Hindi	144
Malayalam	120
Tamil	139
Telugu	161

97.
SELECT City,
       COUNT(*) AS Number_of_Theaters
FROM Theater
WHERE Screen >= 3
GROUP BY City

output:
BLR	1
Chennai	1
HYD	1
TPT	2

98.
SELECT City,
       AVG(Screen) AS Average_Screens
FROM Theater
WHERE Screen > 2
GROUP BY City

output:
BLR	6
Chennai	4
HYD	5
TPT	5

99.
SELECT P_Type AS Payment_Mode,
       SUM(Amount) AS Total_Payment
FROM Payment
WHERE P_Status = 'Success'
GROUP BY P_Type

output:
Cash	1160.00
Credit	900.00
Net Banking	300.00
UPI	580.00

100.
SELECT City,
       COUNT(*) AS Number_of_Customers
FROM Customer
GROUP BY City
HAVING COUNT(*) > 2


101.
SELECT Language,
       COUNT(*) AS Number_of_Movies
FROM Movies
GROUP BY Language
HAVING COUNT(*) > 3

output:
Telugu	5

102.
SELECT Genre,
       AVG(Duration) AS Average_Duration
FROM Movies
GROUP BY Genre
HAVING AVG(Duration) > 120

output:
Action	155
Drama	162
Thriller	159

103.
SELECT City,
       COUNT(*) AS Number_of_Theater
FROM Theater
GROUP BY City
HAVING COUNT(*) >= 2

output:
TPT	2

104.
SELECT P_Type AS Payment_Mode,
       SUM(Amount) AS Total_Payment
FROM Payment
GROUP BY P_Type
HAVING SUM(Amount) > 2000

output:
3260.00	UPI

105.
SELECT Genre,
       COUNT(*) AS Number_of_Movies
FROM Movies
WHERE Language = 'Telugu'
GROUP BY Genre
HAVING COUNT(*) > 2

output:
Action	5

106.
SELECT C.C_Id,
       C.C_Name,
       SUM(B.Seats) AS Total_Seats
FROM Customer C
JOIN Booking B
ON C.C_Id = B.C_Id
WHERE B.Seats > 1
GROUP BY C.C_Id, C.C_Name
HAVING SUM(B.Seats) > 5

output:
101	Ram	6
104	Bala	7
105	Neelakanta	9

107.
SELECT P_Type AS Payment_Mode,
       AVG(Amount) AS Average_Payment
FROM Payment
WHERE P_Status = 'Success'
GROUP BY P_Type
HAVING AVG(Amount) > 500

output:
Cash	580.000000
Credit	900.000000

108.
SELECT Genre,
       COUNT(*) AS Number_of_Movies
FROM Movies
GROUP BY Genre
ORDER BY Number_of_Movies DESC

output:
Action	6
Comedy	1
Drama	1
Romance	1
Thriller	1

 109.
SELECT Language,
       AVG(Duration) AS Average_Duration
FROM Movies
GROUP BY Language
ORDER BY Average_Duration ASC

output:
Malayalam	120
Tamil	139
Hindi	144
Telugu	161

 110.
SELECT P_Type AS Payment_Mode,
       SUM(Amount) AS Total_Payment
FROM Payment
WHERE P_Status = 'Success'
  AND Amount > 300
GROUP BY P_Type
HAVING SUM(Amount) > 1000
ORDER BY Total_Payment DESC

output:
Cash	1160.00

111.
SELECT * FROM Movies
WHERE Duration = (
    SELECT MAX(Duration)
    FROM Movies
)

output:
121	Bahubali	Telugu	Action	225

112.
SELECT * FROM Movies
WHERE Duration = (
    SELECT MIN(Duration)
    FROM Movies
)

output:
Premalu	Malayalam	Comedy	120
Papa	Tamil	Romance	120

113.
SELECT * FROM Theater
WHERE Screen = (
    SELECT MAX(Screen)
    FROM Theater
)

output:
PVR Cinema	Moosapet	BLR	6
Pratap	Annamaya Circle	TPT	6

114.
SELECT * FROM Theater
WHERE Screen = (
    SELECT MIN(Screen)
    FROM Theater
)

output:
133	PNR Theater	Bus Stand	TPT	4
135	Imax	Kapali	Chennai	4

115.
SELECT * FROM Booking
WHERE Seats = (
    SELECT MAX(Seats)
    FROM Booking
)

output:
169	104	148	7	2026-09-25

116.
SELECT * FROM Booking
WHERE Seats = (
    SELECT MIN(Seats)
    FROM Booking
)

output:
164	107	147	1	2026-08-31

117.
SELECT * FROM PAYMENT
WHERE Amount = (
    SELECT MAX(Amount)
    FROM PAYMENT
)

output:
183	166	Debit	1000.00	Refunded

118.
SELECT * FROM PAYMENT
WHERE Amount = (
    SELECT MIN(Amount)
    FROM PAYMENT
)

output:
190	169	UPI	180.00	Success

119.
SELECT M_Name
FROM Movies
WHERE Duration > (
    SELECT AVG(Duration)
    FROM Movies
)

output:
Bahubali
Saaiar
Leo
12th Fail

120.
SELECT Theater_Name
FROM Theater
WHERE Screen > (
    SELECT AVG(Screen)
    FROM Theater
)

output:
PVR Cinema
Pratap

121.
SELECT M_Name
FROM Movies
WHERE Duration > (
    SELECT Duration
    FROM Movies
    WHERE M_ID = 205
)

output:

122.
SELECT Theater_Name
FROM Theater
WHERE Screen > (
    SELECT Screen
    FROM Theater
    WHERE Theater_ID = 102
)

output:

123.
SELECT C_Name
FROM Customer
WHERE City = (
    SELECT City
    FROM Customer
    WHERE C_ID = 105
)

output:
Neelakanta
Rani

124.
SELECT * FROM BOOKING
WHERE Seats > (
    SELECT Seats
    FROM BOOKING
    WHERE B_ID = 305
)

output:

125.
SELECT * FROM Payment
WHERE Amount > (
    SELECT Amount
    FROM Payment
    WHERE P_ID = 405
)

output:

126.
SELECT M_Name
FROM Movies
WHERE Duration < (
    SELECT AVG(Duration)
    FROM Movies
)

output:
Davara
Hi Nanna
Premalu
Dangol
Jawan
Papa

127.
SELECT Theater_Name
FROM Theater
WHERE Screen < (
    SELECT AVG(Screen)
    FROM Theater
)

output:
PNR Theater
Imax

128.
SELECT C_Name
FROM Customer
WHERE C_ID IN (
    SELECT C_ID
    FROM BOOKING
)

output:
Ram
Bala
Neelakanta
Likitha
Praveen
Neel
Karthik
Rebel
Man of Mass

129.
SELECT M_Name
FROM Movies
WHERE M_ID IN (
    SELECT M_ID
    FROM SHOW
)

output:

130.
SELECT Theater_Name
FROM Theater
WHERE Theater_ID IN (
    SELECT Theater_ID
    FROM Show
)

output:

131.
SELECT C_Name
FROM CUSTOMER
WHERE C_ID NOT IN (
    SELECT C_ID
    FROM BOOKING
)

output:
Krishna
Leeladhar
Gunnadeep
Rani
Siri

132.
SELECT M_Name
FROM Movies
WHERE Duration > (
    SELECT AVG(Duration)
    FROM Movies
)
AND Language = 'Telugu'

output:
Bahubali
Saaiar

133.
SELECT Theater_Name
FROM Theater
WHERE Screen > (
    SELECT AVG(Screen)
    FROM Theater
)
AND City = 'TPT'

output:
Pratap

134.
SELECT * FROM PAYMENT
WHERE Amount > (
    SELECT AVG(Amount)
    FROM PAYMENT
)
AND P_Status = 'Success'

output:
184	168	Credit	900.00	Success
187	163	Cash	660.00	Success

135.
SELECT C_Name
FROM CUSTOMER
WHERE C_ID IN (
    SELECT C_ID
    FROM BOOKING
    WHERE Seats > 2
)

output:
Ram
Bala
Neelakanta
Likitha
Neel
Rebel
Man of Mass

136.
SELECT M1.M_Name
FROM Movies M1
WHERE M1.Duration > (
    SELECT AVG(M2.Duration)
    FROM Movies M2
    WHERE M2.Language = M1.Language
)

output:
12th Fail
Leo
Bahubali
Saaiar

137.
SELECT T1.Theater_Name
FROM Theater T1
WHERE T1.Screen > (
    SELECT AVG(T2.Screen)
    FROM Theater T2
    WHERE T2.City = T1.City
)

output:
Pratap

138.
SELECT DISTINCT C.* FROM Customer C
JOIN BOOKING B
ON C.C_ID = B.C_ID
WHERE B.Seats > (
    SELECT AVG(B2.Seats)
    FROM BOOKING B2
    WHERE B2.C_ID = B.C_ID
)

output:
105	Neelakanta	9100991936	Blueneck55@gmail.com	TPT

139.
SELECT P1.* FROM Payment P1
WHERE P1.Amount > (
    SELECT AVG(P2.Amount)
    FROM Payment P2
    WHERE P2. P_Status = P1. P_Status
)

output:
183	166	Debit	1000.00	Refunded
184	168	Credit	900.00	Success
187	163	UPI	660.00	Success

140.
SELECT M1.M_Name
FROM Movies M1
WHERE M1.Duration > (
    SELECT AVG(M2.Duration)
    FROM Movies M2
    WHERE M2.Genre = M1.Genre
)

output:
Bahubali
Saalar

SELECT * FROM Customer
SELECT * FROM Movies
SELECT * FROM Theater
SELECT * FROM Shows
SELECT * FROM Booking
SELECT * FROM Payment
