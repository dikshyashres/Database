USE dikshya;
CREATE TABLE stud(s_id INT PRIMARY KEY,s_fname VARCHAR(15),s_lname VARCHAR(15),s_street VARCHAR(15),s_ward INT,s_city VARCHAR(15));
CREATE TABLE phone(phid INT,simtype VARCHAR(10),phoneno BIGINT,balance INT,s_id INT FOREIGN KEY REFERENCES students(s_id));
INSERT INTO stud VALUES(32,'dikshya','shrestha','shankhamul',31,'kathmandu');
INSERT INTO stud VALUES(20,'rabick','shrestha','thimi',4,'bhaktapur');
INSERT INTO stud VALUES(22,'bigyan','gurung','newroad',17,'kathmandu');
INSERT INTO stud VALUES(38,'jyoti','gupta','nakkhu',21,'lalitpur');
INSERT INTO stud VALUES(28,'bishula','khanal','kalanki',14,'kathmandu');
INSERT INTO phone VALUES(1,'NTC',9803284111,50,38);
INSERT INTO phone VALUES(1,'NCELL',9863483261,50,38);
INSERT INTO phone VALUES(2,'NTC',9860562278,100,28);
INSERT INTO phone VALUES(2,'NCELL',9654585213,10,32);
INSERT INTO phone VALUES(2,'NTC',9562544489,20,32);
INSERT INTO phone VALUES(3,'NTC',98595554565,20,32);
INSERT INTO phone  VALUES(3,'NTC',9797951203,20,20);
INSERT INTO phone VALUES(3,'NTC',9696332541,20,20);
INSERT INTO phone VALUES(4,'NCELL',9875621489,100,22);
INSERT INTO phone VALUES(4,'NTC',9568688671,20,67);
--DELETE FROM phone WHERE phoneno=9803284111; VALID
--DELETE FROM stdt WHERE s_fname='bigyan'; INVALID
--DELETE FROM stdt WHERE s_fname='bigyan'; VALID 
--UPDATE phone SET phoneno = 9813284211 WHERE phoneno=9803284111;VALID
--UPDATE phone SET s_id=22 where phoneno=9568688671;INVALID
--UPDATE stdt SET s_id=13 WHERE s_fname='bishula'; VALID
--UPDATE phone SET s_id=13 WHERE phoneno=9568688671; VALID
--UPDATE stdt SET s_id=23 where s_fname='bigyan';INVALID
SELECT * FROM stud;
SELECT * FROM phone;