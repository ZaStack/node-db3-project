-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT Product.ProductName, Category.CategoryName 
FROM Product
JOIN Category 
ON Product.CategoryId = Category.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT Id, Shipper.CompanyName
FROM "Order"
JOIN Shipper ON "order".ShipVia = Shipper.Id
WHERE OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT Product.ProductName, OrderDetail.Quantity
FROM Product
JOIN OrderDetail ON Product.Id = OrderDetail.ProductId
WHERE OrderDetail.OrderId = 10251; 

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT [Order].Id, Customer.CompanyName, Employee.LastName
FROM [Order] 
JOIN Customer ON [Order].CustomerId = Customer.Id
JOIN Employee on [Order].EmployeeId = Employee.Id 

--STRETCH

--Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.

SELECT CategoryName, COUNT(*) as count
FROM Categories
JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName;

--Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.

SELECT Orders.OrderID, count(OrderDetails.Quantity) as ItemCount
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUp BY Orders.OrderID;
