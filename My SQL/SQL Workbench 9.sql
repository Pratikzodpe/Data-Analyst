# This procedure is showing the customers from user provided country.
DELIMITER //
CREATe PROCEDURE GetCustomers(IN p_country VARCHAR(100))
BEGIN

SELECT customerNumber, customerName, country
FROM Customers
WHERE country = p_country
ORDER BY country;

END //

CALL GetCustomers("Canada");
CALL GetCustomers("singapore");

DROP PROCEDURE GetCustomers;

/*-----------------------------------------------------------------------------------------------------------------------------------*/

DELIMITER //
CREATE PROCEDURE Customers_Status(IN p_customernumber INT,OUT p_status VARCHAR(100))

BEGIN

DECLARE variable DECIMAL;

SELECT creditlimit INTO variable
FROM customers
WHERE customerNumber = p_customernumber;

IF variable > 100000 THEN SET p_status = "Platinum";
ELSEIF variable BETWEEN 25000 AND 100000 THEN SET p_status = "Gold";
ELSE SET p_status = "Silver";

END IF;

END //

CALL Customers_status(415,@xyz);
SELECT @xyz;

CALL Customers_status(141,@xyz);
SELECT @xyz;

/*--------------------------------------------------------------------------------------------------------------------------------------*/

DELIMITER //
CREATE PROCEDURE SetCounter(INOUT X INT,IN Y INT)

BEGIN

SET X = X+Y;

END //

SET @abc = 0;
CALL SetCounter(@abc,5);
SELECT @abc;

CALL SetCounter(@abc,5);
SELECT @abc;

CALL SetCounter(@abc,5);
SELECT @abc;

/*------------------------------------------------------------------------------------------------------------------------------------*/

SELECT COUNT(*) FROM Customers #122

SELECT COUNT(*) FROM Customers WHERE country="USA"; #36 rows

EXPLAIN SELECT * FROM Customers WHERE country="USA"; #scans all 122 rows

SHOW INDEXES FROM Customers;

CREATE INDEX Shubham ON Customers(country);

EXPLAIN SELECT * FROM Customers WHERE country="USA"; #scans only 36 USA rows

EXPLAIN SELECT *FROM Customers WHERE country="Australia"; #scans only 5 Australia rows

DROP INDEX Shubham ON Customers;

/*-------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE Customers(
ID INT PRIMARY KEY,
Name VARCHAR(100),
Phone BIGINT,
Email VARCHAR(100)UNIQUE
);

SHOW INDEXES FROM Customers;

INSERT INTO Customers
VALUES(1,"Karen",9876543210,"karen@gmail.com"),
      (2,"Peter",9765418352,"peter@gmail.com"),
      (3,"John",9638527410,"john@gmail.com");
      
EXPLAIN SELECT *FROM Customers WHERE Name="Peter"; # 3rows

CREATE UNIQUE INDEX ExcelR ON Customers(Name,Phone);

EXPLAIN SELECT * FROM Customers WHERE Name="Peter"; # 1 row

INSERT INTO Customers
VALUES(4,"Peter",9765418351,"peter123@gmail.com");

INSERT INTO Customers
VALUES(5,"Peter",9765418352,"peter1234@gmail.com");

SELECT * FROM Customers;

/*--------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE Emp_EH(
Emp_ID INT PRIMARY KEY,
Name VARCHAR(100)NOT NULL,
Age INT CHECK(Age BETWEEN 20 AND 60)
);

DELIMITER //
CREATE PROCEDURE Insert_Data(IN p_empid INT,IN p_name VARCHAR(100),IN p_age INT)
BEGIN

    DECLARE EXIT HANDLER FOR 1048 SELECT "Don't insert NULL values in both Emp ID and Name." AS Message;
    DECLARE EXIT HANDLER FOR 1062 SELECT "Don't insert duplicate values in Emp ID." AS Message;
    DECLARE EXIT HANDLER FOR 3819 SELECT "The age must be betwwen 20 and 60." AS Message;
    
    INSERT INTO Emp_EH
    VALUES(p_empid,p_name,p_age);
    
    SELECT * FROM Emp_EH;
    
END //

CALL Insert_Data(NULL,"A",25);
CALL Insert_Data(1,"A",25);
CALL Insert_Data(1,"B",35);
CALL INSERT_Data(2,NULL,35);
CALL Insert_Data(2,"B",75);  









