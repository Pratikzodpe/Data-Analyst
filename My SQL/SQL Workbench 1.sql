CREATE TABLE Employee(
Emp_ID INT,
Name VARCHAR(100),
Age INT,
Company VARCHAR(100)
);

INSERT INTO Employee
VALUES(1,"ROHIT",35,"TCS");

SELECT*FROM Employee;
SELECT Company,Name FROM Employee;

INSERT INTO Employee
VALUES(2,"VIRAT",34,"L&T"),(3,"SURYA",31,"Google");

INSERT INTO Employee(Emp_ID,Name)
VALUES(4,"SIR JADEJA"),(5,"MSD");

DROP TABLE Employee;