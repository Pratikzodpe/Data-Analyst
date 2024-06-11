SELECT MAX(Total_Orders) AS "Max Value"
FROM(
	SELECT status,COUNT(orderNumber) AS Total_Orders
    FROM Orders
    GROUP BY status
    
    ) AS ExcelR;
    
    
/*--------------------------------------------------------------------------------------------------------------*/
    
    
    SELECT SUM(Total), AVG(Total), MIN(Total), MAX(Total)
    FROM(
          SELECT orderNumber, COUNT(productCode) AS Total
          FROM Orderdetails
          GROUP BY orderNumber
          
          ) AS Shubham;
          
/*--------------------------------------------------------------------------------------------------------------------------------------*/



SELECT CHAR_LENGTH("India")AS Result;
SELECT LOWER("Amazon")AS Result;
SELECT UPPER("Amazon")AS Result;

SELECT LEFT("United States Of America",13)AS Result;
SELECT RIGHT("United States Of America",7)AS Result;

SELECT CONCAT("The population of India is",140,"crores")AS Result;

SELECT("   R   o   hi   t   ")AS Result;
SELECT TRIM("   R  o   hi  t   ")AS Result;
SELECT REPLACE("    R   o   hi   t   "," ",  "")AS Result;          

/*---------------------------------------------------------------------------------------------------------------------*/

SELECT
    CONCAT(
           CONCAT(UPPER(LEFT(REPLACE("   m   y   nam   e  i  s   shubh   a   m   "," ",""),1)),
                  SUBSTRING(REPLACE("   m   y   nam   e  i  s   shubh   a   m   "," ",""),2,1))," ",
           
           SUBSTRING(REPLACE("   m   y   nam   e  i  s   shubh   a   m   "," ",""),3,4)," ",
           
           SUBSTRING(REPLACE("   m   y   nam   e  i  s   shubh   a   m   "," ",""),7,2)," ",
           
           CONCAT(UPPER(SUBSTRING(REPLACE("   m   y   nam   e  i  s   shubh   a   m   "," ",""),9,1)),
                  SUBSTRING(REPLACE("   m   y   nam   e  i  s   shubh   a   m   "," ",""),10))
                  
           ) AS Result;     
           
/*------------------------------------------------------------------------------------------------------------------------------------*/

SELECT SUBSTRING("www.twitter.com",5)AS Result;
SELECT SUBSTRING("www.twitter.com",5,7)AS Result;
SELECT SUBSTRING("www.twitter.com",-11)AS Result;
SELECT SUBSTRING("www.twitter.com",-11,7)AS Result;

SELECT LOCATE("","Rohit Sharma")AS Result;

SELECT SUBSTRING_INDEX("www.twitter.com",".",-2)AS Result;

SELECT
   SUBSTRING_INDEX( SUBSTRING_INDEX("Mahendra Singh Dhoni"," ",2)," ",-1)AS Result;
   
     
SELECT
   SUBSTRING_INDEX( SUBSTRING_INDEX("Sachin Ramesh Tendulkar"," ",2)," ",-1)AS Result;
  
   

/*------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE Players(
Name VARCHAR(100)
);

INSERT INTO Players
VALUES("Rohit Sharma"),("Shubham Gill"),("Virat Kohli"),("Suryakumar Yadav"),("Ravindra Jadeja"),("Ishan Kishan");

SELECT
  Name, 
   LEFT(Name,LOCATE(" ",Name)-1)AS First_Name,
   RIGHT(Name,CHAR_LENGTH(Name)-LOCATE(" ",Name))AS Last_Name
FROM Players;
             
           
           
           

