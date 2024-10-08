use ContosoRetailDW


--EXERCICIOS 1

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

--EXERCICIOS 2

--1)
--SELECT TOP(100) SalesAmount
--FROM FactSales
--ORDER BY SalesAmount DESC

--2)
--SELECT TOP (10) UnitPrice, Weight
--FROM DimProduct
--ORDER BY UnitPrice DESC, Weight DESC, AvailableForSaleDate ASC

--3)
--SELECT ProductName AS 'Nome do Produto', Weight AS 'Peso (Libras)'
--FROM DimProduct
--WHERE Weight >= 220
--ORDER BY Weight DESC

--4)
--SELECT 
--	StoreName AS 'Nome da Loja', 
--	OpenDate AS 'Data de Abertura', 
--	EmployeeCount AS 'Quantidade de funcionários'
--FROM 
--	DimStore
--WHERE StoreType = 'Store' AND Status = 'On'
--306 lojas no total e 294 ativas

--5)
--SELECT ProductKey, ProductName, AvailableForSaleDate
--FROM DimProduct
--WHERE ProductName LIKE '%Home Theater%' 
--AND AvailableForSaleDate = '15-03-2009'

--6)
--SELECT *
--FROM DimStore
--WHERE CloseDate IS NOT NULL

--b)
--SELECT *
--FROM DimStore
--WHERE Status = 'Off'

--7)
--SELECT StoreName, EmployeeCount
--FROM DimStore
--WHERE EmployeeCount BETWEEN 1 AND 20
----1 máquina de café

--SELECT StoreName, EmployeeCount
--FROM DimStore
--WHERE EmployeeCount BETWEEN 20 AND 50
----2 máquinas de café

--SELECT StoreName, EmployeeCount
--FROM DimStore
--WHERE EmployeeCount >= 51
----3 máquinas de café

--8)
--SELECT *
--FROM dimProduct
--WHERE ProductDescription LIKE '%LCD%'

--9)
--SELECT *
--FROM dimProduct
--WHERE ColorName IN ('Green', 'Orange', 'Black', 'Silver', 'Pink') AND BrandName IN ('Contoso', 'Litware', 'Fabrikam')

--10)
--SELECT *
--FROM DimProduct
--WHERE ColorName IN ('Silver') AND BrandName IN ('Contoso') AND UnitPrice BETWEEN 10 AND 30
--ORDER BY UnitPrice Desc
