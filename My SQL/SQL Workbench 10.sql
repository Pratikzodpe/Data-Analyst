CREATE TABLE Emp_AIT(
Emp_ID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(100),
Age int);

CREATE TABLE Audit(
Sr_No INT PRIMARY KEY AUTO_INCREMENT,
Description VARCHAR(5000)
);

DELIMITER //
CREATE TRIGGER after_insert_trigger
AFTER INSERT
ON Emp_AIT FOR EACH ROW
BEGIN

INSERT INTO Audit(Description)
VALUES(CONCAT("A new employee has been inserted in Emp table at", DATE_FORMAT(NOW(),"%d-%m-%y %h:%i:%s")));

END //

INSERT INTO Emp_AIT(Name,Age)
VALUES("Rahul",26);

INSERT INTO Emp_AIT(Name,Age)
VALUES("Rohit",36);

SELECT * FROM Emp_AIT;
SELECT * FROM Audit;

/*--------------------------------------------------------------------------------------------------------------------------------------------*/

DELIMITER //
CREATE TRIGGER after_insert_trigger
AFTER INSERT
ON Emp_AIT FOR EACH ROW
BEGIN

INSERT INTO Audit(Description)
VALUES(CONCAT("A new employee with name as",NEW.Name,"and age as",NEW.Age,"has been inserted in Emp table at", DATE_FORMAT(NOW(),"%d-%m-%y %h:%i:%s")));
END //

/*----------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE Products(
ID INT PRIMARY KEY,
Name VARCHAR(100),
Qty int);

INSERT INTO Products
VALUES(1,"Apple",20),(2,"Samsung",15),(3,"Dettol",40);

DELIMITER //
CREATE TRIGGER before_update_trigger
BEFORE UPDATE
ON Products FOR EACH ROW
BEGIN
  
  DECLARE error_msg VARCHAR(4000);
  SET error_msg=CONCAT("The new quantity",NEW.Qty,"cannot be more than 3 times the current quantity",OLD.Qty);
  
  IF NEW.Qty>(OLD.Qty * 3)THEN
     SIGNAL SQLSTATE'45000'
     SET MESSAGE_TEXT = error_msg;
     
     END IF;
     
END //

UPDATE Products
SET Qty = 100
WHERE ID = 1;     

UPDATE Products
SET Qty = 50
WHERE ID = 1;

SELECT * FROM Products;

/*--------------------------------------------------------------------------------------------------------------------------------------*/

DELIMITER //
CREATE TRIGGER before_update_trigger
BEFORE UPDATE
ON Products FOR EACH ROW
BEGIN
  
  DECLARE error_msg VARCHAR(4000);
  SET error_msg=CONCAT("The new quantity",NEW.Qty,"cannot be same as current quantity",OLD.Qty);
  
  IF NEW.Qty = OLD.Qty THEN
     SIGNAL SQLSTATE'45000'
     SET MESSAGE_TEXT = error_msg;
     
     END IF;
     
END //

/*-------------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE Products_AUT(
ID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(100),
Qty int);

INSERT INTO Products_AUT(Name,Qty)
VALUES("Apple",20),("Samsung",15),("Dettol",40);

CREATE TABLE History(
Sr_No INT PRIMARY KEY AUTO_INCREMENT,
ID INT,
Old_Qty INT,
New_Qty INT,
Last_Modified_Data DATETIME DEFAULT NOW()
);

DELIMITER //
CREATE TRIGGER after_update_trigger
AFTER UPDATE
ON Products_AUT FOR EACH ROW
BEGIN

  INSERT INTO History(ID,Old_Qty,New_Qty)
  VALUES(OLD.ID,OLD.Qty,NEW.QTY);
  
  END //
  
  UPDATE Products_AUT
  SET Qty = 50
  WHERE ID = 1;
  
  UPDATE Products_AUT
  SET Qty = 5000
  WHERE ID = 3;
  
  SELECT * FROM Products_AUT;
  SELECT * FROM History;
  
  /*----------------------------------------------------------------------------------------------------------------------------------*/
  
CREATE TABLE Emp_BDT(
Emp_ID INT PRIMARY KEY,
Name VARCHAR(100),
Age INT
);
  
INSERT INTO Emp_BDT
VALUES(101,"Raju",28),(102,"Preeti",27),(103,"Ashish",34);
  
CREATE TABLE Alumni(
Sr_No INT PRIMARY KEY AUTO_INCREMENT,
EID INT,
Name VARCHAR(100),
Last_Deleted_At DATETIME DEFAULT NOW()
);
  
DELIMITER //
CREATE TRIGGER before_delete_trigger
BEFORE DELETE
ON Emp_BDT FOR EACH ROW
BEGIN
  
  INSERT INTO Alumni(EID,Name)
  VALUES(OLD.Emp_ID,OLD.Name);
  
END //

DELETE FROM Emp_BDT WHERE Emp_ID = 101;
DELETE FROM Emp_BDT WHERE Emp_ID = 103;  

SELECT * FROM Emp_BDT;
SELECT * FROM Alumni;

/*--------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE Emp_ADT(
Emp_ID INT PRIMARY KEY,
Name VARCHAR(100),
Salary INT 
);

INSERT INTO Emp_ADT
VALUES(1,"A",25000),(2,"B",10000),(3,"C",20000);

CREATE TABLE Budget(
Amount INT
);

INSERT INTO Budget
    SELECT SUM(Salary)FROM Emp_ADT;
    
DELIMITER //
CREATE TRIGGER after_delete_trigger
AFTER DELETE ON Emp_ADT FOR EACH ROW 
BEGIN  
  
    UPDATE Budget
    SET Amount = Amount - OLD.Salary;
    
END //

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Emp_ADT WHERE Emp_ID = 2;  

DELETE FROM Emp_ADT WHERE Emp_ID = 3;  

SELECT * FROM Emp_ADT;
SELECT * FROM Budget;

/*-------------------------------------------------------------------------------------------------------------------------------------------*/

SELECT 

YEAR(OrderDate)AS YEAR,

COUNT(orderNumber)AS Total_Orders,

CONCAT(ROUND(((COUNT(orderNumber)-LAG(COUNT(ordrNumber),1)OVER())/LAG(COUNT(orderNumber),1)OVER())*100),"%")AS"YoY Change(%)")

CONCAT(ROUND((COUNT(orderNumber)/(SELECT COUNT(orderNumber)FROM Orders))*100),"%")AS"% of Total"

FROM Orders
GROUP BY Year;

/*----------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE Orders(
Order_Date DATE,
Sales INT
);

INSERT INTO Orders
VALUES("2023-06-01",25),
      ("2023-06-02",75),
      ("2023-06-03",20),
      ("2023-06-04",50),
      
# Individual sales of last 3 days
SELECT * FROM Orders WHERE Order_Date > NOW()-INTERVAL 4 DAY AND Order_Date <> CURRENT_DATE();

# Previous day sales
SELECT * FROM Orders WHERE Order_Date > NOW()-INTERVAL 2 DAY AND Order_Date <> CURRENT_DATE();

# Total sales of last 3 days
SELECT SUM(Sales) FROM Orders WHERE Order_Date > NOW()-INTERVAL 4 DAY AND Order_Date <> CURRENT_DATE();

    
    

