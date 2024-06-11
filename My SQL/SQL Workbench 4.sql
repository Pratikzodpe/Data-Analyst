#Que. For each status find the total orders placed.
SELECT status,COUNT(orderNumber)AS "Total Orders"
FROM Orders
GROUP BY status;

#Que. Find the top 10 orders with respect to total quantities ordered for each ordernumber.
SELECT OrderNumber, SUM(quantityOrdered)AS"Total Qty"
FROM Orderdetails
GROUP BY orderNumber
ORDER BY SUM(quantityOrdered)DESC
LIMIT 99,2;

SELECT OrderNumber, SUM(quantityOrdered)AS"Total Qty"
FROM Orderdetails
GROUP BY orderNumber
HAVING SUM(quantityOrdered)BETWEEN 600 AND 650
ORDER BY SUM(quantityOrdered)DESC;

SELECT 
orderNumber,
SUM(quantityOrdered)AS"Total Qty",

CASE
  WHEN SUM(quantityOrdered)>500 THEN "High"
  WHEN SUM(quantityOrdered)BETWEEN 100 AND 500 THEN "Medium"
  ELSE "LOW"
END AS"Status"

FROM Orderdetails
GROUP BY orderNumber
ORDER BY SUM(quantityOrdered)DESC;

/*---------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE Laptop(
Lap_Name VARCHAR(100)
);

INSERT INTO Laptop
VALUES("HP"),("Dell");

CREATE TABLE Colours(
Col_Name VARCHAR(100)
);

INSERT INTO Colours
VALUES("White"),("Black"),("Silver");


SELECT*FROM Laptop CROSS JOIN Colours ORDER BY Lap_Name;

CREATE TABLE ClassA(
Roll_No INT,
Student VARCHAR(100),
Teacher_ID INT,
Teacher VARCHAR(100)
);

INSERT INTO classA
VALUES(1,"Kedar",5,"Deepa"),
	  (2,"Pratibha",3,"Raju"),
      (3,"Sanket",10,"Nikhil"),
	  (4,"Prabha",1,"Nikita"),
      (5,"Santosh",2,"Sanjay");

SELECT
T1.Roll_No,
T1.Student,
T2.Teacher_ID,
T2.Teacher;

SELECT*FROM ClassA;



CREATE TABLE Emp_TCL(
Emp_ID INT PRIMARY KEY,
Name VARCHAR(100),
Age int
);

START TRANSACTION;

INSERT INTO Emp_TCL
VALUES(1,"Mukesh",30),(2,"Radha",24),(3,"Saroj",28);
SAVEPOINT test_insert;

UPDATE Emp_TCL
SET Age=40
WHERE Emp_ID=2;
SAVEPOINT test_update;

DELETE FROM Emp_TCL WHERE Emp_ID=2;
SAVEPOINT test_delete;

ROLLBACK TO test_insert;

SELECT*FROM Emp_TCL;