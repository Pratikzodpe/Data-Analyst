CREATE TABLE  Emp_AT(
Emp_ID INT,
Name VARCHAR(100),
Age int
);

INSERT INTO Emp_AT
VALUES(1,"Rahul",30),(2,"Suraj",34),(3,"Abhijeet",25);

ALTER TABLE Emp_AT ADD Country VARCHAR(100);
ALTER TABLE Emp_AT ADD State VARCHAR(100),ADD City VARCHAR(100);
ALTER TABLE Emp_AT ADD Company VARCHAR(100)AFTER Emp_ID;
ALTER TABLE Emp_AT ADD Company_2 VARCHAR(100)NOT NULL FIRST;

SELECT*FROM Emp_AT;

ALTER TABLE Emp_AT DROP Company,DROP Company_2,DROP State,DROP City;

ALTER TABLE Emp_AT MODIFY Country VARCHAR(5000);
ALTER TABLE Emp_AT MODIFY Emp_ID INT PRIMARY KEY AUTO_INCREMENT;

ALTER TABLE Emp_AT RENAME COLUMN Emp_ID TO Sr_No;

ALTER TABLE Emp_AT RENAME ExcelR;

SELECT*FROM ExcelR;




SELECT orderNumber, quantityOrdered FROM Orderdetails
ORDER BY quantityOrdered DESC
LIMIT 1;

SELECT orderNumber, quantityOrdered FROM Orderdetails
WHERe quantityOrdered=(SELECT MAX(quantityOrdered) FROM Orderdetails);

SELECT orderNumber, quantityOrdered FROM Orderdetails
WHERE quantityOrdered=(SELECT MIN(quantityOrdered) FROM Orderdetails);

SELECT orderNumber, quantityOrdered FROM Orderdetails
WHERE quantityOrdered>(SELECT AVG(quantityOrdered) FROM Orderdetails);

SELECT orderNumber, quantityOrdered FROM Orderdetails
WHERE quantityOrdered<(SELECT AVG(quantityOrdered) FROM Orderdetails);

#Que. Show the customernumbers and names who have placed the orders.
SELECT DISTINCT(c.customernumber),c.customerName FROM Customers crossINNER JOIN Orders o
USING(customerNumber);

SELECT customerNumber, customerName FROM Customers
WHERE customerNumber IN(SELECT customerNumber FROM Orders);


#Que. Show the customers and names who haven't placed the orders.
SELECT customerNumber, customerName FROM Customers
WHERE customerNumber NOT IN(SELECT customerNumber FROM Orders);