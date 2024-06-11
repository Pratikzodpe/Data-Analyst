CREATE TABLE Emp_AI(
Emp_ID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(100)
);

INSERT INTO Emp_AI
VALUES(1,"A");

INSERT INTO Emp_AI(Name)
VALUES("Pankaj");

INSERT INTO Emp_AI
VALUES(NULL,"Sanjay");

SELECT*FROM Emp_AI;






SELECT customerNumber,customerName,country FROM Customers WHERE country="Australia";

SELECT customerNumber,customerName,country FROM Customers WHERE country<>"Australia";

SELECT customerNumber,customerName,country FROM Customers WHERE country IN("Australia","UK");

SELECT customerNumber,customerName,country FROM Customers WHERE country NOT IN("Australia","UK");




SELECT customerNumber,customerName,country,creditLimit
FROM Customers
WHERE country="USA" AND creditLimit NOT BETWEEN 50000 AND 100000;




SELECT DISTINCT(country)FROM Customers WHERE country LIKE"F%";
SELECT DISTINCT(country)FROM Customers WHERE country LIKE"%s";
SELECT DISTINCT(country) FROM Customers WHERE country LIKE"%S%";
SELECT DISTINCT(country) FROM Customers WHERE country LIKE"A%A";
SELECT DISTINCT(country) FROM Customers WHERE country LIKE"_R%";
SELECT DISTINCT(country) FROM Customers WHERE country NOT LIKE"%s%" ORDER BY country DESC;




SELECT SUM(quantityOrdered)AS"Total Qty"FROM Orderdetails;

SELECT AVG(quantityOrdered)AS"AVG Qty"FROM Orderdetails;

SELECT MIN(quantityOrdered)AS"MIN Qty"FROM Orderdetails;

SELECT MAX(quantityOrdered)AS"MAX Qty"FROM Orderdetails;

SELECT COUNT(*)AS"Total Rows"FROM Orderdetails;






SELECT COUNT(*)FROM Customers; #122 Rows
SELECT COUNT(*)FROM Customers WHERE state IS NULL; #73 Rows
SELECT COUNT(*)FROM Customers WHERE state IS NOT NULL; #49 Rows

SELECT COUNT(DISTINCT(state))FROM Customers; #18 unique states