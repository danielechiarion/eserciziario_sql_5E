/* database avaible at the following link
https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all 

Remove comments to test them in the environment */

SELECT CustomerName FROM Customers WHERE City="Berlin"; -- select customers from the town of Berlin
SELECT AVG(Price) FROM Products; -- calculate the average of each product
SELECT SupplierID,COUNT(ProductID) FROM Products GROUP BY SupplierID; SELECT COUNT(ProductID) as ProductNumber FROM Products AS TabellaProdotti GROUP BY SupplierID; -- count how many products for each supplier and renames attributes

SELECT ProductID,ProductName,Price FROM Products WHERE Price=(SELECT MIN(Price) FROM Products); -- select minimum price from the products displayed
SELECT SupplierID,MAX(Price) FROM Products GROUP BY SupplierID; -- select maximum price for each supplier

/* tried to use join to
add product id and product name as other attributes with the request.
Query not tested */
SELECT p.ProductID, p.ProductName, p.SupplierID, p.Price FROM Products p 
JOIN (
    SELECT SupplierID, MAX(Price) AS MaxPrice
    FROM Products
    GROUP BY SupplierID
) m
ON p.SupplierID = m.SupplierID AND p.Price = m.MaxPrice;

/* use # in place of '
to test and compare dates in the environment */
SELECT EmployeeID,LastName,FirstName,BirthDate FROM Employees WHERE BirthDate>='01/01/1975' ORDER BY BirthDate ASC; -- select employees born after 1975 in ascending order
SELECT COUNT(ProductID) as NumProdotti FROM Products WHERE Price<10; -- count products with price less than 10$
SELECT OrderID,ProductID,Quantity FROM OrderDetails ORDER BY Quantity DESC; -- select products in descending order by quantity