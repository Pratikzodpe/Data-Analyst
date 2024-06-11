#Que. Show the second highest quantityOrdered value.

SELECT quantityOrdered FROM Orderdetails
ORDER BY quantityOrdered DESC
LIMIT 1,1;


#Que. Show the second highest quantityOrdered for each orderNumber.

SELECT orderNumber, quantityOrdered, Result
FROM(SELECT orderNumber, quantityOrdered,
     DENSE_RANK()OVER(PARTITION BY orderNumber ORDER BY quantityOrdered DESC)AS Result
     FROM Orderdetails
     )AS ExcelR
WHERE Result=2;


#Que. Find thetotal orders in each year.

SELECT
  YEAR(orderDate)AS Year,
  COUNT(orderNumber)AS Total_Orders,
  CONCAT(ROUND(((COUNT(orderNumber)-LAG(COUNT(orderNumber),1)OVER())/LAG(COUNT(orderNumber),1)OVER())*100),"%")AS "%YOY Change"
FROM Orders
GROUP BY Year;  