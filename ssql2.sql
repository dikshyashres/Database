USE Bct07832;
DROP TABLE  books;
DROP TABLE stds;
CREATE TABLE stds(s_id INT PRIMARY KEY,s_fname VARCHAR(15),s_lname VARCHAR(15),s_street VARCHAR(15),s_ward INT,s_city VARCHAR(15));
CREATE TABLE books(bookid INT PRIMARY KEY,bookname VARCHAR(50),authorname VARCHAR(50),
s_id INT FOREIGN KEY REFERENCES stds(s_id) ON DELETE CASCADE ON UPDATE SET NULL );
INSERT INTO stds VALUES(32,'dikshya','shrestha','shankhamul',31,'kathmandu');
INSERT INTO stds VALUES(20,'rabick','shrestha','thimi',4,'bhaktapur');
INSERT INTO stds VALUES(22,'bigyan','gurung','newroad',17,'kathmandu');
INSERT INTO stds VALUES(38,'jyoti','gupta','nakkhu',21,'lalitpur');
INSERT INTO stds VALUES(28,'bishula','khanal','kalanki',14,'kathmandu');
INSERT INTO books VALUES(102,'science','william',32);
INSERT INTO books VALUES(100,'maths','balice',32);
INSERT INTO books VALUES(105,'science','william',20);
INSERT INTO books VALUES(103,'maths','balice',20);
INSERT INTO books VALUES(101,'nepali','bhanu',20);
INSERT INTO books VALUES(104,'nepali','bhanu',22);
INSERT INTO books VALUES(106,'science','william',22);
INSERT INTO books VALUES(107,'social','adda',38);
INSERT INTO books VALUES(109,'social','adda',28);
INSERT INTO books VALUES(108,'eph','shiva',38);
--DELETE FROM books WHERE bookid=103;VALID
--DELETE FROM stds WHERE s_fname='bigyan';INVALID
--DELETE FROM  books WHERE bookid=108;VALID
--DELETE FROM stds WHERE s_fname='bigyan';VALID 
--UPDATE books SET bookname='english' WHERE bookname='eph';VALID
--UPDATE stds SET s_id=13 WHERE s_fname='bishula'; INVALID
--UPDATE books SET s_id=13 WHERE bookname='english'; INVALID
--UPDATE stds SET s_id=13 WHERE s_fname='rabick';VALID 
SELECT *FROM stds;
SELECT *FROM books;
