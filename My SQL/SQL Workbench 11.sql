CREATE TABLE Emp_UDF(
Emp_ID INT PRIMARY KEY,
Name VARCHAR(100),
DOB date
);

INSERT INTO Emp_UDF
VALUES(1,"Kedar","1995-06-15"),
      (2,"Smita","1998-08-30"),
      (3,"Pavan","2000-05-10"),
      (4,"Geeta","1994-03-21");
      
DELIMITER //
CREATE FUNCTION Calculate_Age(XYZ DATE)
RETURNS int
DETERMINISTIC
BEGIN

  RETURN TIMESTAMPDIFF(YEAR,XYZ,NOW());
  

END //

SELECT *,Calculate_Age(DOB)AS Age
FROM Emp_UDF;

/*--------------------------------------------------------------------------------------*/

DELIMITER //
CREATE PROCEDURE MyLoop()
BEGIN
  DECLARE x INT;
  SET x = 1;
  SELECT x;
  
  abc: LOOP
	   SET x = x + 2;
       SELECT x;
       
       IF x = 9 THEN LEAVE abc;
       END IF;
  END LOOP abc;
  
END //

CALL MyLoop();

/*---------------------------------------------------------------------------------------------------*/

DELIMITER //
CREATE PROCEDURE RepeatDemo()
BEGIN
  DECLARE counter INT DEFAULT 23;
  DECLARE result VARCHAR(100)DEFAULT"";
  
  REPEAT
    SET result = CONCAT(result,counter,',');
    SET counter = counter + 23;
  UNTIL counter > 231
  END REPEAT;
  
  SELECT result;
  
END //

CALL RepeatDemo();

/*--------------------------------------------------------------------------------------------------*/

DELIMITER //
CREATE PROCEDURE while_loop(starting_value INT)
BEGIN 
  DECLARE income INT DEFAULT 0;
  
  shubham: WHILE income <=3000 DO
   SET income = income + starting_value;
  END WHILE Shubham;

SELECT income;

END //

CALL while_loop(100);

/*------------------------------------------------------------------------------------------*/

DELETE FROM Contacts
WHERE id IN(
            SELECT id FROM
						  (SELECT *,ROW_NUMBER()OVER(PARTITION BY email)AS rn
                          FROM Contacts)AS ExcelR
			WHERE rn > 1
            );
            
/*---------------------------------------------------------------------------------------------------------*/

DELIMITER //
CREATE PROCEDURE getFullName (INOUT fullNameList VARCHAR(4000))

BEGIN

  DECLARE finished INTEGER DEFAULT 0;
  DECLARE fullName VARCHAR(100) DEFAULT"";
  
  DECLARE curName CURSOR FOR SELECT CONCAT(contactFirstName,',',contactLastName) FROM customers LIMIT 10;
  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
  
  OPEN curName;
  
    Shubham: LOOP
			   FETCH curName INTO fullName;
               IF finished = 1 THEN LEAVE Shubham;
               END IF;
               SET fullNameList = CONCAT(fullName,",",fullNameList);
	END LOOP Shubham;
  CLOSE curName;
  
END //

SET @xyz = "";
CALL getFullName(@xyz);
SELECT @xyz;

/*-------------------------------------------------------------------------------------------------------------*/

CREATE TABLE Customers2(
Name VARCHAR(100)
);

INSERT INTO Customers2
VALUES("    N   i mi  t  "),("  ro  sHA  N  "),("K  e  DA   r  ");

SET SQL_SAFE_UPDATES = 0;
UPDATE Customers2
SET Name = CONCAT(UPPER(LEFT(REPLACE(Name," ",""),1)),  LOWER(SUBSTRING(REPLACE(Name," ",""),2)) );

SELECT * FROM Customers2;

/*----------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE A1(
City VARCHAR(100),
Amount INT
);

INSERT INTO A1
VALUES("Pune",200),("Pune",500),("Pune",700),("Mumbai",1100),("Mumbai",1900);

SELECT * FROM A1;

SELECT City,SUM(Amount)AS Total_Amount
FROM A1
GROUP BY City;

SELECT *,SUM(Amount)OVER(PARTITION BY City)AS Total_Amount
FROM A1
ORDER BY City DESC;


