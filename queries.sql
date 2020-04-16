-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT CategoryName, ProductName
FROM [product]
JOIN [category]
ON [product].CategoryId = [category].Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT CompanyName, [shipper].Id
FROM [order]
JOIN [shipper]
ON [shipper].Id = [order].ShipVia
WHERE [order].OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT ProductName, [orderDetail].Quantity
FROM [product]
JOIN [orderDetail]
ON [product].Id = [orderDetail].ProductId AND [orderDetail].OrderId = 10251
ORDER BY [product].ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT [customer].CompanyName, [employee].LastName, [order].Id
FROM [order]
JOIN [customer]
JOIN [employee]
ON [order].EmployeeId = [employee].Id
AND [order].CustomerId = [customer].Id

