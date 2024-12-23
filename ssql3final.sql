CREATE DATABASE dikshyaa;
USE dikshyaa;
--DROP TABLE  bookdetails;
--DROP TABLE phonedetails;
--DROP TABLE stds;
CREATE TABLE std(s_id INT PRIMARY KEY,s_fname VARCHAR(15),s_lname VARCHAR(15),s_ward INT,s_municipality VARCHAR(50),s_city VARCHAR(50));
CREATE TABLE phonedetails (ph_id INT,
simType VARCHAR(10),
phoneNo BIGINT,
balance INT,
s_id INT FOREIGN KEY REFERENCES std(s_id)
);
CREATE TABLE bookdetails (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(100),
    author VARCHAR(50),
    price DECIMAL(8,2),
	s_id INT,
	FOREIGN KEY (s_id) REFERENCES std(s_id) ON DELETE CASCADE ON UPDATE SET NULL,
);

CREATE TABLE studentdest(s_id int,s_fname VARCHAR(50));

INSERT INTO std VALUES(32,'dikshya','shrestha',31,'kathmandu','kathmandu');
INSERT INTO std VALUES(20,'rabick','shrestha',4,'bhaktapur','bhaktapur');
INSERT INTO std VALUES(22,'bigyan','gurung',17,'kathmandu','kathmandu');
INSERT INTO std VALUES(38,'jyoti','gupta',21,'lalitpur','lalitpur');
INSERT INTO std VALUES(28,'bishula','khanal',14,'kathmandu','kathmandu');
INSERT INTO std VALUES(31,'dipson','adhikari',31,'kathmandu','kathmandu');
INSERT INTO std VALUES(25,'rojla','shrestha',4,'bhaktapur','bhaktapur');
INSERT INTO std VALUES(29,'bipana','ranabhat',17,'kathmandu','kathmandu');
INSERT INTO std VALUES(37,'isha','karki',21,'lalitpur','lalitpur');
INSERT INTO std VALUES(4,'ashwita','bhatt',14,'kathmandu','kathmandu');


INSERT INTO phonedetails VALUES(1,'NTC',98400,500,32);
INSERT INTO phonedetails VALUES(1,'NTC',98500,50,32);
INSERT INTO phonedetails VALUES(2,'NCELL',98600,80,20);
INSERT INTO phonedetails VALUES(1,'NCELL',98800,500,20);
INSERT INTO phonedetails VALUES(3,'NTC',98500,50,22);
INSERT INTO phonedetails VALUES(1,'NCELL',98500,50,22);
INSERT INTO phonedetails VALUES(4,'JIO',99500,550,38);
INSERT INTO phonedetails VALUES(1,'NTC',96500,50,38);
INSERT INTO phonedetails VALUES(3,'AIRTEL',94500,50,28);
INSERT INTO phonedetails VALUES(3,'AIRTEL',96800,50,28);

INSERT INTO bookdetails VALUES (101, 'Database Systems', 'Navathe', 500.00,32);
INSERT INTO bookdetails VALUES (102, 'Operating Systems', 'Galvin', 600.00,20);
INSERT INTO bookdetails VALUES (103, 'Data Structures', 'Weiss', 450.00,22);
INSERT INTO bookdetails VALUES (104, 'Computer Networks', 'Tanenbaum', 700.00,38);
INSERT INTO bookdetails VALUES (105, 'Discrete Structure', 'Anna', 800.00,28);
INSERT INTO bookdetails VALUES (106, 'Maths', 'Bikky', 900.00,31);
INSERT INTO bookdetails VALUES (107, 'Science ', 'Cathy', 200.00,25);
INSERT INTO bookdetails VALUES (108, 'Social', 'Dora', 300.00,29);
INSERT INTO bookdetails VALUES (109, 'GK', 'Emli', 400.00,37);
INSERT INTO bookdetails VALUES (110, 'Nepali', 'Fukra', 500.00,4);

INSERT INTO studentdest SELECT s_id,s_fullname FROM studentinfos;--copy data from studentinfo to student dest

EXEC sp_rename 'std','studentinfos';--table name change
EXEC sp_rename 'studentinfos.s_fname','s_fullname','column'; --column change

TRUNCATE TABLE studentdest;

--wap to copy data from student to studentdest only if student municipality is kathmandu 

INSERT INTO studentdest SELECT s_id,s_fullname FROM studentinfos WHERE  s_municipality='kathmandu';

--projection:
SELECT s_fullname,s_municipality FROM studentinfos;

--selection:
SELECT *FROM studentinfos where s_municipality ='kathmandu';

--display sname and municipality name who belongs to ktm municipality

SELECT s_fullname,s_municipality FROM studentinfos where s_municipality ='kathmandu';

--display sname and municipality name who donot belongs to ktm municipality

SELECT *FROM studentinfos where s_municipality !='kathmandu';

--display student name and municipality name of student only if he /she belong to kathmandu municipality 31 ward 

SELECT s_fullname,s_municipality FROM studentinfos where s_municipality='kathmandu' AND  s_ward=31;

--display all details of student if he belong to ktm ,lalitpur municipality
SELECT s_fullname,s_municipality FROM studentinfos where s_municipality='kathmandu' OR s_municipality='lalitpur';

--display all book name if the price is between 100 to 300

SELECT *FROM bookdetails where price between 100 AND 400;

select s_municipality from studentinfos;

--disinct municipality
SELECT DISTINCT s_municipality FROM studentinfos;

--DISPLAY 
SELECT *FROM studentinfos where s_municipality IN('kathmandu','lalitpur');

INSERT INTO studentinfos VALUES(9,'ashwika','bhatt',NULL,14,'kathmandu');

--display s_ward=null
SELECT *FROM studentinfos where s_ward IS NULL;

--NAME START WITH D
SELECT *FROM studentinfos WHERE s_fullname LIKE 'd%';

--name start with other rather than d
SELECT *FROM studentinfos WHERE s_fullname NOT LIKE 'd%';

--end with a
SELECT *FROM studentinfos WHERE s_fullname LIKE '%a';
--rather than a
SELECT *FROM studentinfos WHERE s_fullname NOT LIKE '%a';
--start with k and end with u
SELECT *FROM studentinfos WHERE s_municipality LIKE 'k%u';

--detail of student are display in alphabetical order
SELECT *FROM studentinfos ORDER BY s_fullname;
--detail of student are display by book price
SELECT *FROM bookdetails ORDER BY price;
--desending
SELECT *FROM studentinfos ORDER BY  s_fullname DESC ;

INSERT INTO studentinfos VALUES(5,'ashwita','bhatt',14,'lalitpur','lalitpur');

--same name display
SELECT *FROM studentinfos WHERE s_fullname='ashwita' ORDER BY s_municipality;

SELECT TOP 3 *FROM bookdetails; --invalid 

--display book according to highest price
SELECT TOP 3 *FROM bookdetails ORDER BY price;
SELECT *FROM studentinfos;
SELECT *FROM studentdest;
SELECT *FROM bookdetails;
SELECT *FROM phonedetails;