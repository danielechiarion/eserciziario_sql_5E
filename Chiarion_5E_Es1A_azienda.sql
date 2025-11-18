/* database avaible at the following link
https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all */

SELECT CustomerName FROM Customers WHERE City="Berlin"; -- select customers from the town of Berlin
SELECT AVG(Price) FROM Products; -- calculate the average of each product
SELECT SupplierID,COUNT(ProductID) FROM Products GROUP BY SupplierID; -- count the products given by each supplier