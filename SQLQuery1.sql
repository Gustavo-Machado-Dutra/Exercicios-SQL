use ContosoRetailDW


--EXERCICIOS 1

--1 a)Voc� � respons�vel por controlar os dados de clientes e de produtos da
--sua empresa. O que voc� precisar� fazer � confirmar se:

--a. Existem 2.517 produtos cadastrados na base e, se n�o tiver, voc�
--dever� reportar ao seu gestor para saber se existe alguma
--defasagem no controle dos produtos.

SELECT ProductName
FROM DimProduct

--1 b)At� o m�s passado, a empresa tinha um total de 19.500 clientes na
--base de controle. Verifique se esse n�mero aumentou ou reduziu.

SELECT CustomerKey
FROM DimCustomer
--O n�mero de clientes diminuiu

--2) Voc� trabalha no setor de marketing da empresa Contoso e acaba de ter
--uma ideia de oferecer descontos especiais para os clientes no dia de
--seus anivers�rios. Para isso, voc� vai precisar listar todos os clientes e as
--suas respectivas datas de nascimento, al�m de um contato.

--a. Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela dimCustomer.
--b. Renomeie as colunas dessa tabela usando o alias (comando AS).

SELECT 
CustomerKey AS CodCliente,
FirstName AS PrimeiroNome,
EmailAddress AS EmailCliente,
BirthDate AS DataDeNascCliente
FROM DimCustomer

--3 A Contoso est� comemorando anivers�rio de inaugura��o de 10 anos e
--pretende fazer uma a��o de premia��o para os clientes. A empresa quer
--presentear os primeiros clientes desde a inaugura��o.
--Voc� foi alocado para levar adiante essa a��o. Para isso, voc� ter� que
--fazer o seguinte:

--a. A Contoso decidiu presentear os primeiros 100 clientes da hist�ria com um vale compras de R$ 10.000.
--Utilize um comando em SQL para retornar uma tabela com os primeiros 100 primeiros clientes da tabela dimCustomer 
--(selecione todas as colunas). 
--b A Contoso decidiu presentear os primeiros 20% de clientes da hist�ria com um vale compras de R$ 2.000. 
--Utilize um comando em SQL para retornar 10% das linhas da sua tabela dimCustomer (selecione todas as colunas). 
--c Adapte o c�digo do item a) para retornar apenas as 100 primeiras linhas, mas apenas as colunas FirstName, EmailAddress, BirthDate. 
--d. Renomeie as colunas anteriores para nomes em portugu�s

--a)
SELECT TOP(100) *
FROM DimCustomer
WHERE DateFirstPurchase >= '2000-01-01'
ORDER BY DateFirstPurchase ASC

--3 b)
SELECT TOP(20) PERCENT *
FROM DimCustomer
WHERE DateFirstPurchase >= '2000-01-01'
ORDER BY DateFirstPurchase ASC

--3 c)
SELECT TOP(100) PERCENT FirstName, EmailAddress, BirthDate
FROM DimCustomer
WHERE DateFirstPurchase >= '2000-01-01'
ORDER BY DateFirstPurchase ASC

--3 d)
SELECT 
FirstName AS PrimeiroNome, 
EmailAddress AS EmailCliente, 
BirthDate AS DataDeNascCliente
FROM DimCustomer

--4) A empresa Contoso precisa fazer contato com os fornecedores de produtos para repor o estoque.
--Voc� � da �rea de compras e precisa descobrir quem s�o esses fornecedores. Utilize um comando em SQL 
--para retornar apenas os nomes dos fornecedores na tabela dimProduct e renomeie essa nova coluna da tabela.

SELECT DISTINCT Manufacturer AS Fornecedor
FROM DimProduct

--5) O seu trabalho de investiga��o n�o para. Voc� precisa descobrir se existe algum produto 
--registrado na base de produtos que ainda n�o tenha sido vendido. Tente chegar nessa informa��o. 
--Obs: caso tenha algum produto que ainda n�o tenha sido vendido, voc� n�o precisa descobrir qual �,
--� suficiente saber se teve ou n�o algum produto que ainda n�o foi vendido.

SELECT DISTINCT ProductKey
FROM FactSales
SELECT DISTINCT ProductKey
FROM DimProduct

--EXERCICIOS 2

--1) Voc� � o gerente da �rea de compras e precisa criar um relat�rio com as
--TOP 100 vendas, de acordo com a quantidade vendida. Voc� precisa
--fazer isso em 10min pois o diretor de compras solicitou essa
--informa��o para apresentar em uma reuni�o.
--Utilize seu conhecimento em SQL para buscar essas TOP 100 vendas, de
--acordo com o total vendido (SalesAmount).


SELECT TOP(100) SalesAmount
FROM FactSales
ORDER BY SalesAmount DESC

--2) Os TOP 10 produtos com maior UnitPrice possuem exatamente o
--mesmo pre�o. Por�m, a empresa quer diferenciar esses pre�os de acordo
--com o peso (Weight) de cada um.
--O que voc� precisar� fazer � ordenar esses top 10 produtos, de acordo
--com a coluna de UnitPrice e, al�m disso, estabelecer um crit�rio de
--desempate, para que seja mostrado na ordem, do maior para o menor.
--Caso ainda assim haja um empate entre 2 ou mais produtos, pense em
--uma forma de criar um segundo crit�rio de desempate (al�m do peso).

SELECT TOP (10) UnitPrice, Weight
FROM DimProduct
ORDER BY UnitPrice DESC, Weight DESC, AvailableForSaleDate ASC

--3) Voc� � respons�vel pelo setor de log�stica da empresa Contoso e precisa
--dimensionar o transporte de todos os produtos em categorias, de acordo
--com o peso.
--Os produtos da categoria A, com peso acima de 100kg, dever�o ser
--transportados na primeira leva.
--Fa�a uma consulta no banco de dados para descobrir quais s�o estes
--produtos que est�o na categoria A.

--a.Voc� dever� retornar apenas 2 colunas nessa consulta: Nome do
--Produto e Peso.

--b.Renomeie essas colunas com nomes mais intuitivos.

--c.Ordene esses produtos do mais pesado para o mais leve.

SELECT ProductName AS 'Nome do Produto', Weight AS 'Peso (Libras)'
FROM DimProduct
WHERE Weight >= 220
ORDER BY Weight DESC

--4) Voc� foi alocado para criar um relat�rio das lojas registradas
--atualmente na Contoso.

--a.Descubra quantas lojas a empresa tem no total. Na consulta que voc�
--dever� fazer � tabela DimStore, retorne as seguintes informa��es:
--StoreName, OpenDate, EmployeeCount.

--b.Renomeeie as colunas anteriores para deixar a sua consulta mais
--intuitiva.

--c.Dessas lojas, descubra quantas (e quais) lojas ainda est�o ativas.

SELECT 
	StoreName AS 'Nome da Loja', 
	OpenDate AS 'Data de Abertura', 
	EmployeeCount AS 'Quantidade de funcion�rios'
FROM 
	DimStore
WHERE StoreType = 'Store' AND Status = 'On'
--306 lojas no total e 294 ativas

--5) O gerente da �rea de controle de qualidade notificou � Contoso que
--todos os produtos Home Theater da marca Litware, disponibilizados
--para venda no dia 15 de mar�o de 2009, foram identificados com
--defeitos de f�brica.
--O que voc� dever� fazer � identificar os ID�s desses produtos e repassar ao gerente para que ele possa notificar as lojas e
--consequentemente solicitar a suspens�o das vendas desses produtos.

SELECT ProductKey, ProductName, AvailableForSaleDate
FROM DimProduct
WHERE ProductName LIKE '%Home Theater%' 
AND AvailableForSaleDate = '15-03-2009'

--6) Imagine que voc� precise extrair um relat�rio da tabela DimStore, com
--informa��es de lojas. Mas voc� precisa apenas das lojas que n�o est�o
--mais funcionando atualmente.

--a.Utilize a coluna de Status para filtrar a tabela e trazer apenas as lojas
--que n�o est�o mais funcionando.

--b.Agora imagine que essa coluna de Status n�o existe na sua tabela.

--Qual seria a outra forma que voc� teria de descobrir quais s�o as
--lojas que n�o est�o mais funcionando.

SELECT *
FROM DimStore
WHERE CloseDate IS NOT NULL

--b)
SELECT *
FROM DimStore
WHERE Status = 'Off'

--7) De acordo com a quantidade de funcion�rios, cada loja receber� uma
--determinada quantidade de m�quinas de caf�. As lojas ser�o
--divididas em 3 categorias:

--CATEGORIA 1: De 1 a 20 funcion�rios -> 1 m�quina de caf�
--CATEGORIA 2: De 21 a 50 funcion�rios -> 2 m�quinas de caf�
--CATEGORIA 3: Acima de 51 funcion�rios -> 3 m�quinas de caf�

--Identifique, para cada caso, quais s�o as lojas de cada uma das 3
--categorias acima (basta fazer uma verifica��o).


SELECT StoreName, EmployeeCount
FROM DimStore
WHERE EmployeeCount BETWEEN 1 AND 20
----1 m�quina de caf�

SELECT StoreName, EmployeeCount
FROM DimStore
WHERE EmployeeCount BETWEEN 20 AND 50
----2 m�quinas de caf�

SELECT StoreName, EmployeeCount
FROM DimStore
WHERE EmployeeCount >= 51
----3 m�quinas de caf�

--8) A empresa decidiu que todos os produtos LCD receber�o um super
--desconto no pr�ximo m�s. O seu trabalho � fazer uma consulta � tabela
--DimProduct e retornar os ID�s, Nomes e Pre�os de todos os produtos
--LCD existentes.

SELECT *
FROM dimProduct
WHERE ProductDescription LIKE '%LCD%'

--9) Fa�a uma lista com todos os produtos das cores: Green, Orange, Black,
--Silver e Pink. Estes produtos devem ser exclusivamente das marcas:
--Contoso, Litware e Fabrikam.

SELECT *
FROM dimProduct
WHERE ColorName IN ('Green', 'Orange', 'Black', 'Silver', 'Pink') AND BrandName IN ('Contoso', 'Litware', 'Fabrikam')

--10) A empresa possui 16 produtos da marca Contoso, da cor Silver e com
--um UnitPrice entre 10 e 30. Descubra quais s�o esses produtos e
--ordene o resultado em ordem decrescente de acordo com o pre�o
--(UnitPrice).

SELECT *
FROM DimProduct
WHERE ColorName IN ('Silver') AND BrandName IN ('Contoso') AND UnitPrice BETWEEN 10 AND 30
ORDER BY UnitPrice Desc


--Exerc�cios 3

--1) O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e 
--Quantidade Devolvida para o canal de venda mais importante da
--empresa: Store.
--Utilize uma fun��o SQL para fazer essas consultas no seu banco de dados.
--Obs: Fa�a essa an�lise considerando a tabela FactSales.

SELECT 
	SUM(SalesQuantity) AS 'Qtd. Vendas', 
	SUM(ReturnQuantity) AS 'Qtd. Devolvida' 
FROM
	FactSales
WHERE channelKey = 1
 
--2) Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial
--de todos os clientes da empresa, mas apenas de ocupa��o Professional.
--Utilize um comando SQL para atingir esse resultado.

SELECT 
	AVG(YearlyIncome) AS 'M�dia Sal�rial'
FROM dimCustomer
	WHERE Occupation = 'Professional'

--3) Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas
--registradas na empresa. O seu gerente te pediu os seguintes n�meros e
--informa��es:

--a.Quantos funcion�rios tem a loja com mais funcion�rios?
--b.Qual � o nome dessa loja?

SELECT TOP(1) StoreName, EmployeeCount
FROM dimStore
ORDER BY EmployeeCount DESC
	
--c.Quantos funcion�rios tem a loja com menos funcion�rios?
--d.Qual � o nome dessa loja?
SELECT TOP(1) StoreName, EmployeeCount
FROM dimStore
WHERE EmployeeCount IS NOT NULL
ORDER BY EmployeeCount ASC

--4) A �rea de RH est� com uma nova a��o para a empresa, e para isso
--precisa saber a quantidade total de funcion�rios do sexo Masculino e do
--sexo Feminino.
--a.Descubra essas duas informa��es utilizando o SQL.
--b.O funcion�rio e a funcion�ria mais antigos receber�o uma
--homenagem. Descubra as seguintes informa��es de cada um deles:
--Nome, E-mail, Data de Contrata��o.

SELECT
	COUNT(EmployeeKey) AS 'Qtd. Mulheres'
FROM DimEmployee
	WHERE Gender = 'F' 
----87 Funcion�rias

SELECT
	COUNT(EmployeeKey) AS 'Qtd. Homem'
FROM DimEmployee
	WHERE Gender = 'M' 
----206 Funcion�rios

--b)
SELECT TOP(1)
	FirstName, 
	LastName, 
	EmailAddress, 
	HireDate
FROM DimEmployee
	WHERE Gender = 'M'
	ORDER BY HireDate ASC

SELECT TOP(1)
	FirstName, 
	LastName, 
	EmailAddress, 
	HireDate
FROM DimEmployee
	WHERE Gender = 'F'
	ORDER BY HireDate ASC

--5) Agora voc� precisa fazer uma an�lise dos produtos. Ser� necess�rio
--descobrir as seguintes informa��es:

--a. Quantidade distinta de cores de produtos.
--b.Quantidade distinta de marcas.
--c.Quantidade distinta de classes de produto

--Para simplificar, voc� pode fazer isso em uma mesma
--consulta.

SELECT 
	COUNT(DISTINCT ColorName) AS 'Qtd. Cores', 
	COUNT(DISTINCT BrandName) AS 'Qtd. Marcas', 
	COUNT(DISTINCT ClassName) AS 'Qtd. Classes'
FROM DimProduct

--Exercicios 4

--1) Fa�a um resumo da quantidade vendida (Sales Quantity) de acordo com o canal de vendas (channelkey).
--b Fa�a um agrupamento mostrando a quantidade total vendida (Sales Quantity) e quantidade total devolvida
--(Return Quantity) de acordo com o ID das lojas (StoreKey). 
--c Fa�a um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas para o ano de 2007

--a)
SELECT 
	channelKey,
	SUM(SalesQuantity) AS 'Vendas'
FROM FactSales
GROUP BY channelKey

--b)
SELECT 
	StoreKey,
	SUM(SalesQuantity) AS 'Total de vendas',
	SUM(ReturnQuantity) AS 'Total devolvido'
FROM FactSales
GROUP BY StoreKey
ORDER BY StoreKey ASC

--c)
SELECT 
	channelKey,
	SUM(SalesQuantity) AS 'Total de vendas'
FROM FactSales
WHERE DateKey BETWEEN '01/01/2007' AND '31/12/2007'
GROUP BY channelKey

--2) Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor 
--total vendido (SalesAmount) por produto (ProductKey).
--a.A tabela final dever� estar ordenada de 
--acordo com a quantidade vendida e, al�m disso, mostrar apenas os produtos que tiveram um resultado 
--final de vendas maior do que $5.000.000.
--b.Fa�a uma adapta��o no exerc�cio anterior e mostre os Top
--10 produtoscom mais vendas. Desconsidere o filtro de $5.000.000 aplicado.

--a)
SELECT
	ProductKey,
	SUM(SalesAmount) AS 'Total de vendas'
FROM
	FactSales
GROUP BY ProductKey
HAVING SUM(SalesAmount) >= 5000000
ORDER BY SUM(SalesAmount) DESC

--b)
SELECT TOP (10)
	ProductKey,
	SUM(SalesAmount) AS 'Total de vendas'
FROM
	FactSales
GROUP BY ProductKey
ORDER BY SUM(SalesAmount) DESC

--3) a. Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir. qual � o ID (CustomerKey)
--do cliente que mais realizou compras online (de acordo com a coluna Sales Quantity). 
--b. Feito isso, fa�a um agrupamento de total vendido (Sales Quantity) por ID do produto e descubra quais foram os 
--top 3 produtos mais comprados pelo cliente da letra a).

--a)
SELECT TOP (1)
	CustomerKey, 
	COUNT(SalesQuantity) AS 'Qtd. Vendas'
FROM FactOnlineSales
GROUP BY CustomerKey
ORDER BY COUNT(SalesQuantity) DESC

--b)
SELECT TOP (3)
	CustomerKey, 
	ProductKey,
	COUNT(SalesQuantity) AS 'Qtd. Vendas'
FROM FactOnlineSales
GROUP BY CustomerKey, ProductKey
HAVING CustomerKey = 19037
ORDER BY COUNT(SalesQuantity) DESC

--4) a. Fa�a um agrupamento e descubra a quantidade total de produtos por marca. 
--b Determine a m�dia do pre�o unit�rio (UnitPrice) para cada ClassName. 
--c. Fa�a um agrupamento de cores e descubra o peso total que cada cor de produto possui.

--a)
SELECT 
	BrandName AS 'Marca',
	COUNT(BrandName) AS 'Qtd. Produtos da marca'
FROM dimProduct
GROUP BY BrandName

--b)
SELECT
	ClassName,
	AVG(UnitPrice) AS 'M�dia Pre�o unit�rio'
FROM DimProduct
GROUP BY ClassName

--c)

SELECT
	ColorName,
	SUM(Weight) AS 'Peso total'
FROM dimProduct
GROUP BY ColorName

--5) Voc� dever� descobrir o peso total para cada tipo de produto (Stock TypeName). 
--A tabela final deve considerar apenas a marca 'Contoso' e ter os seus valores classificados em ordem decrescente,

SELECT 
	BrandName,
	StockTypeName,
	SUM(Weight) AS 'Peso total'
FROM dimProduct
WHERE BrandName = 'Contoso'
GROUP BY  BrandName, StockTypeName

--6) Voc� seria capaz de confirmar se todas as marcas dos produtos possuem � disposi��o todas as 16 op��es de cores?

SELECT 
	BrandName,
	COUNT(DISTINCT ColorName) AS 'Qtd. Cores'
FROM dimProduct
GROUP BY BrandName

--7) Fa�a um agrupamento para saber o total de clientes de acordo com o Sexo e tamb�m a m�dia salarial
--de acordo com o Sexo. Corrija qualquer resultado "inesperado" com os seus conhecimentos em SOL

SELECT 
	Gender,
	COUNT(CustomerKey) AS 'Qtd. Cliente',
	AVG(YearlyIncome) AS 'M�dia sal�rial'
FROM DimCustomer
WHERE Gender IS NOT NULL
GROUP BY Gender 

--8) Fa�a um agrupamento para descobrir a quantidade total de clientes e a m�dia salarial 
--de acordo com o seu nivel escolar. Utilize a coluna Education da tabela DimCustomer para 
--fazer esse agrupamento.

SELECT 
	Education,
	COUNT(CustomerKey) AS 'Qtd. Cliente',
	AVG(YearlyIncome) AS 'M�dia sal�rial'
FROM DimCustomer
WHERE Education IS NOT NULL
GROUP BY Education

--9)Fa�a uma tabela resumo mostrando a quantidade total de funcion�rios de acordo com o 
--Departamento (DepartmentName). Importante: Voc� dever� considerar apenas os funcion�rios ativos.

SELECT 
	DepartmentName,
	COUNT(EmployeeKey) AS 'Qtd. Cliente'
FROM DimEmployee
WHERE Status = 'Current'
GROUP BY DepartmentName

--10) Fa�a uma tabela resumo mostrando o total de Vacation Hours para cada cargo (Title). 
--Voc� deve considerar apenas as mulheres, dos departamentos de Production, Marketing, Engineering 
--e Finance, para os funcion�rios contratados entre os anos de 1999 e 2000.

SELECT 
	Title,
	SUM(VacationHours) AS 'F�rias'
FROM dimEmployee
WHERE HireDate BETWEEN '1999/01/01' AND '2000/12/31' AND Gender = 'F' AND DepartmentName IN ('Production', 'Marketing', 'Engineering', 'Finance')
GROUP BY Title


--Exercicios 5

--1)
SELECT 
    ProductSubcategoryName,
	ProductKey,
	ProductName
FROM 
    DimProduct
INNER JOIN 
    DimProductSubcategory
ON 
    DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey

--2)
SELECT 
    ProductSubcategoryName,
	ProductCategoryName,
	DimProductSubcategory.ProductCategoryKey
FROM 
    DimProductCategory
INNER JOIN 
    DimProductSubcategory
ON 
    DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

--3)
SELECT 
	StoreKey,
	StoreName,
	EmployeeCount,
	ContinentName,
	RegionCountryName
FROM 
	DimStore
LEFT JOIN
	DimGeography
ON 
	DimStore.GeographyKey = DimGeography.GeographyKey

--4) 
--SELECT 
--	ProductName,
--	BrandName,
--	ColorName,
--	UnitPrice,
--	ProductCategoryDescription
--FROM 
--	DimProduct
--LEFT JOIN
--	DimProductCategory
--ON 
--	DimProduct. = DimProductCategory.ProductCategoryDescription

--5)
SELECT TOP(100)
	StrategyPlanKey,
	Datekey,
	AccountName,
	Amount
FROM 
	FactStrategyPlan
INNER JOIN
	DimAccount
ON 
	FactStrategyPlan.AccountKey = DimAccount.AccountKey

--6)
SELECT TOP(100)
	StrategyPlanKey,
	Datekey,
	ScenarioName,
	Amount
FROM
	FactStrategyPlan
INNER JOIN 
	DimScenario
ON 
	FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey

--7)
SELECT
	ProductSubcategoryName 
FROM
	DimProduct
RIGHT JOIN 
	DimProductSubcategory
ON 
	DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE 
	ProductName IS NULL

--8)
SELECT DISTINCT
	BrandName,
	ChannelName
FROM
	DimProduct CROSS JOIN DimChannel
WHERE 
	BrandName IN ('Contoso', 'Fabrikam', 'Litware')

--9)
SELECT TOP (100)
	OnlineSalesKey,
	DateKey,
	PromotionName,
	SalesAmount
FROM
	FactOnlineSales
INNER JOIN 
	DimPromotion
ON 
	FactOnlineSales.PromotionKey = DimPromotion.PromotionKey
WHERE
	PromotionName <> 'No Discount'
ORDER BY
	DateKey ASC

--10)










SELECT 
    DimProductSubcategory.ProductSubcategoryKey,
    COUNT(DimProduct.ProductSubcategoryKey) AS 'Qtd. Produtos'
FROM 
    DimProductSubcategory
FULL JOIN 
    DimProduct
ON 
    DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey
GROUP BY 
    DimProductSubcategory.ProductSubcategoryKey