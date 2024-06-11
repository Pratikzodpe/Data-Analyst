SELECT NOW() AS Result;
SELECT CURRENT_DATE()AS Result;
SELECT CURRENT_TIME()AS Result;

SELECT DATE("2023-04-15 03:15:25")AS Result;
SELECT TIME("2023-04-15 15:15:25")AS Result;
SELECT CURRENT_TIMESTAMP()AS Result;

SELECT YEAR(NOW())AS Result;
SELECT MONTH(NOW())AS Result;
SELECT MONTHNAME(NOW())AS Result;
SELECT DAY(NOW())AS Result;
SELECT DAYNAME(NOW())AS Result;
SELECT CONCAT("Q",QUARTER(NOW()))AS Result;
SELECT CONCAT("Week",WEEK(NOW()))AS Result;
SELECT DAYOFWEEK(NOW())AS Result;
SELECT HOUR(NOW())AS Result;
SELECT MINUTE(NOW())AS Result;
SELECT SECOND(NOW())AS Result;

/*------------------------------------------------------------------------------------------------------------------------------*/


SELECT DATE_FORMAT(NOW(),"%d-%m-%y %h:%i:%s:%p")AS Result;
SELECT DATE_FORMAT(NOW(),"%D %M %Y")AS Result;
SELECT DATE_FORMAT(NOW(),"%D %b %Y")AS Result;
SELECT DATE_FORMAT(NOW(),"%M %Y")AS Result;

SELECT DATEDIFF("2093-01-05","2023-01-03")AS Result;

SELECT TIMESTAMPDIFF(SECOND,"2023-01-03 13:05:45","2023-01-03 16:16:16")AS Result;

SELECT DATE_ADD(NOW(),INTERVAL-3 DAY)AS Result;

/*--------------------------------------------------------------------------------------------------------------------*/

SELECT orderNumber,SUM(quantityOrdered)AS Total_Qty
FROM Orderdetails
GROUP BY orderNumber;

SELECT DISTINCT(orderNumber),SUM(quantityOrdered)OVER(PARTITION BY orderNumber)AS Total_Qty
FROM Orderdetails;

SELECT
  orderNumber,
  quantityOrdered,
  ROW_NUMBER()OVER()AS"Sr No",
  
  RANK()OVER(PARTITION BY orderNumber ORDER BY quantityOrdered DESC)AS "Rank",
  
  DENSE_RANK()OVER(PARTITION BY orderNumber ORDER BY quantityOrdered DESC)AS "Dense Rank"
  
FROM Orderdetails;
SELECT*FROM classicmodels.orderdetails;

/*-------------------------------------------------------------------------------------------------------------------------*/


SELECT
 
    orderNumber,
    quantityOrdered,
    LAG(quantityOrdered,1)OVER(PARTITION BY orderNumber)AS "Lag Value",
    LEAD(quantityOrdered,1)OVER(PARTITION BY orderNumber)AS "Lead Value",
    FIRST_VALUE(quantityOrdered)OVER(PARTITION BY orderNumber)AS "First Value",
    LAST_VALUE(quantityOrdered)OVER(PARTITION BY orderNumber)AS "Last Value",
    NTH_VALUE(quantityOrdered,2)OVER(PARTITION BY orderNumber)AS "Nth Value"

FROM Orderdetails;    