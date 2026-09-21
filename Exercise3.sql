-- 1. List the first name, last name, and hire date of all employees hired after January 1st, 1994.
SELECT FirstName, LastName, HireDate
FROM Employees
WHERE HireDate > '1994-01-01';


-- 2. Count how many orders each customer has placed.
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Orders
GROUP BY CustomerID;


-- 3. Find the names of all customers who have ordered the product "Chai".
SELECT DISTINCT c.CompanyName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [OrderDetails] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Chai';


-- 4. Find all orders that have been placed but not yet shipped.
SELECT * FROM Orders
WHERE ShippedDate IS NULL;


-- 5. Find the customer who has placed the most orders.
SELECT c.CompanyName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY OrderCount DESC
LIMIT 1;