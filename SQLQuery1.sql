use ContosoRetailDW

--1 a)
--SELECT ProductName
--FROM DimProduct

--1 b)
--SELECT CustomerKey
--FROM DimCustomer
--O número de clientes diminuiu

--2)
--SELECT 
--CustomerKey AS CodCliente,
--FirstName AS PrimeiroNome,
--EmailAddress AS EmailCliente,
--BirthDate AS DataDeNascCliente
--FROM DimCustomer

--3 a)
--SELECT TOP(100) *
--FROM DimCustomer
--WHERE DateFirstPurchase >= '2000-01-01'
--ORDER BY DateFirstPurchase ASC

--3 b)
--SELECT TOP(20) PERCENT *
--FROM DimCustomer
--WHERE DateFirstPurchase >= '2000-01-01'
--ORDER BY DateFirstPurchase ASC

--3 c)
--SELECT TOP(100) PERCENT FirstName, EmailAddress, BirthDate
--FROM DimCustomer
--WHERE DateFirstPurchase >= '2000-01-01'
--ORDER BY DateFirstPurchase ASC

--3 d)
--SELECT 
--FirstName AS PrimeiroNome, 
--EmailAddress AS EmailCliente, 
--BirthDate AS DataDeNascCliente
--FROM DimCustomer

--4)
--SELECT DISTINCT Manufacturer AS Fornecedor
--FROM DimProduct

--5)
--SELECT DISTINCT ProductKey
--FROM FactSales
--SELECT DISTINCT ProductKey
--FROM DimProduct

