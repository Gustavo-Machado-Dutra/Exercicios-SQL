use ContosoRetailDW


--EXERCICIOS 1

--1 a)Você é responsável por controlar os dados de clientes e de produtos da
--sua empresa. O que você precisará fazer é confirmar se:

--a. Existem 2.517 produtos cadastrados na base e, se não tiver, você
--deverá reportar ao seu gestor para saber se existe alguma
--defasagem no controle dos produtos.

SELECT ProductName
FROM DimProduct

--1 b)Até o mês passado, a empresa tinha um total de 19.500 clientes na
--base de controle. Verifique se esse número aumentou ou reduziu.

SELECT CustomerKey
FROM DimCustomer
--O número de clientes diminuiu

--2) Você trabalha no setor de marketing da empresa Contoso e acaba de ter
--uma ideia de oferecer descontos especiais para os clientes no dia de
--seus aniversários. Para isso, você vai precisar listar todos os clientes e as
--suas respectivas datas de nascimento, além de um contato.

--a. Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela dimCustomer.
--b. Renomeie as colunas dessa tabela usando o alias (comando AS).

SELECT 
CustomerKey AS CodCliente,
FirstName AS PrimeiroNome,
EmailAddress AS EmailCliente,
BirthDate AS DataDeNascCliente
FROM DimCustomer

--3 A Contoso está comemorando aniversário de inauguração de 10 anos e
--pretende fazer uma ação de premiação para os clientes. A empresa quer
--presentear os primeiros clientes desde a inauguração.
--Você foi alocado para levar adiante essa ação. Para isso, você terá que
--fazer o seguinte:

--a. A Contoso decidiu presentear os primeiros 100 clientes da história com um vale compras de R$ 10.000.
--Utilize um comando em SQL para retornar uma tabela com os primeiros 100 primeiros clientes da tabela dimCustomer 
--(selecione todas as colunas). 
--b A Contoso decidiu presentear os primeiros 20% de clientes da história com um vale compras de R$ 2.000. 
--Utilize um comando em SQL para retornar 10% das linhas da sua tabela dimCustomer (selecione todas as colunas). 
--c Adapte o código do item a) para retornar apenas as 100 primeiras linhas, mas apenas as colunas FirstName, EmailAddress, BirthDate. 
--d. Renomeie as colunas anteriores para nomes em português

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
--Você é da área de compras e precisa descobrir quem são esses fornecedores. Utilize um comando em SQL 
--para retornar apenas os nomes dos fornecedores na tabela dimProduct e renomeie essa nova coluna da tabela.

SELECT DISTINCT Manufacturer AS Fornecedor
FROM DimProduct

--5) O seu trabalho de investigação não para. Você precisa descobrir se existe algum produto 
--registrado na base de produtos que ainda não tenha sido vendido. Tente chegar nessa informação. 
--Obs: caso tenha algum produto que ainda não tenha sido vendido, você não precisa descobrir qual é,
--é suficiente saber se teve ou não algum produto que ainda não foi vendido.

SELECT DISTINCT ProductKey
FROM FactSales
SELECT DISTINCT ProductKey
FROM DimProduct

--EXERCICIOS 2

--1) Você é o gerente da área de compras e precisa criar um relatório com as
--TOP 100 vendas, de acordo com a quantidade vendida. Você precisa
--fazer isso em 10min pois o diretor de compras solicitou essa
--informação para apresentar em uma reunião.
--Utilize seu conhecimento em SQL para buscar essas TOP 100 vendas, de
--acordo com o total vendido (SalesAmount).


SELECT TOP(100) SalesAmount
FROM FactSales
ORDER BY SalesAmount DESC

--2) Os TOP 10 produtos com maior UnitPrice possuem exatamente o
--mesmo preço. Porém, a empresa quer diferenciar esses preços de acordo
--com o peso (Weight) de cada um.
--O que você precisará fazer é ordenar esses top 10 produtos, de acordo
--com a coluna de UnitPrice e, além disso, estabelecer um critério de
--desempate, para que seja mostrado na ordem, do maior para o menor.
--Caso ainda assim haja um empate entre 2 ou mais produtos, pense em
--uma forma de criar um segundo critério de desempate (além do peso).

SELECT TOP (10) UnitPrice, Weight
FROM DimProduct
ORDER BY UnitPrice DESC, Weight DESC, AvailableForSaleDate ASC

--3) Você é responsável pelo setor de logística da empresa Contoso e precisa
--dimensionar o transporte de todos os produtos em categorias, de acordo
--com o peso.
--Os produtos da categoria A, com peso acima de 100kg, deverão ser
--transportados na primeira leva.
--Faça uma consulta no banco de dados para descobrir quais são estes
--produtos que estão na categoria A.

--a.Você deverá retornar apenas 2 colunas nessa consulta: Nome do
--Produto e Peso.

--b.Renomeie essas colunas com nomes mais intuitivos.

--c.Ordene esses produtos do mais pesado para o mais leve.

SELECT ProductName AS 'Nome do Produto', Weight AS 'Peso (Libras)'
FROM DimProduct
WHERE Weight >= 220
ORDER BY Weight DESC

--4) Você foi alocado para criar um relatório das lojas registradas
--atualmente na Contoso.

--a.Descubra quantas lojas a empresa tem no total. Na consulta que você
--deverá fazer à tabela DimStore, retorne as seguintes informações:
--StoreName, OpenDate, EmployeeCount.

--b.Renomeeie as colunas anteriores para deixar a sua consulta mais
--intuitiva.

--c.Dessas lojas, descubra quantas (e quais) lojas ainda estão ativas.

SELECT 
	StoreName AS 'Nome da Loja', 
	OpenDate AS 'Data de Abertura', 
	EmployeeCount AS 'Quantidade de funcionários'
FROM 
	DimStore
WHERE StoreType = 'Store' AND Status = 'On'
--306 lojas no total e 294 ativas

--5) O gerente da área de controle de qualidade notificou à Contoso que
--todos os produtos Home Theater da marca Litware, disponibilizados
--para venda no dia 15 de março de 2009, foram identificados com
--defeitos de fábrica.
--O que você deverá fazer é identificar os ID’s desses produtos e repassar ao gerente para que ele possa notificar as lojas e
--consequentemente solicitar a suspensão das vendas desses produtos.

SELECT ProductKey, ProductName, AvailableForSaleDate
FROM DimProduct
WHERE ProductName LIKE '%Home Theater%' 
AND AvailableForSaleDate = '15-03-2009'

--6) Imagine que você precise extrair um relatório da tabela DimStore, com
--informações de lojas. Mas você precisa apenas das lojas que não estão
--mais funcionando atualmente.

--a.Utilize a coluna de Status para filtrar a tabela e trazer apenas as lojas
--que não estão mais funcionando.

--b.Agora imagine que essa coluna de Status não existe na sua tabela.

--Qual seria a outra forma que você teria de descobrir quais são as
--lojas que não estão mais funcionando.

SELECT *
FROM DimStore
WHERE CloseDate IS NOT NULL

--b)
SELECT *
FROM DimStore
WHERE Status = 'Off'

--7) De acordo com a quantidade de funcionários, cada loja receberá uma
--determinada quantidade de máquinas de café. As lojas serão
--divididas em 3 categorias:

--CATEGORIA 1: De 1 a 20 funcionários -> 1 máquina de café
--CATEGORIA 2: De 21 a 50 funcionários -> 2 máquinas de café
--CATEGORIA 3: Acima de 51 funcionários -> 3 máquinas de café

--Identifique, para cada caso, quais são as lojas de cada uma das 3
--categorias acima (basta fazer uma verificação).


SELECT StoreName, EmployeeCount
FROM DimStore
WHERE EmployeeCount BETWEEN 1 AND 20
----1 máquina de café

SELECT StoreName, EmployeeCount
FROM DimStore
WHERE EmployeeCount BETWEEN 20 AND 50
----2 máquinas de café

SELECT StoreName, EmployeeCount
FROM DimStore
WHERE EmployeeCount >= 51
----3 máquinas de café

--8) A empresa decidiu que todos os produtos LCD receberão um super
--desconto no próximo mês. O seu trabalho é fazer uma consulta à tabela
--DimProduct e retornar os ID’s, Nomes e Preços de todos os produtos
--LCD existentes.

SELECT *
FROM dimProduct
WHERE ProductDescription LIKE '%LCD%'

--9) Faça uma lista com todos os produtos das cores: Green, Orange, Black,
--Silver e Pink. Estes produtos devem ser exclusivamente das marcas:
--Contoso, Litware e Fabrikam.

SELECT *
FROM dimProduct
WHERE ColorName IN ('Green', 'Orange', 'Black', 'Silver', 'Pink') AND BrandName IN ('Contoso', 'Litware', 'Fabrikam')

--10) A empresa possui 16 produtos da marca Contoso, da cor Silver e com
--um UnitPrice entre 10 e 30. Descubra quais são esses produtos e
--ordene o resultado em ordem decrescente de acordo com o preço
--(UnitPrice).

SELECT *
FROM DimProduct
WHERE ColorName IN ('Silver') AND BrandName IN ('Contoso') AND UnitPrice BETWEEN 10 AND 30
ORDER BY UnitPrice Desc


--Exercícios 3

--1) O gerente comercial pediu a você uma análise da Quantidade Vendida e 
--Quantidade Devolvida para o canal de venda mais importante da
--empresa: Store.
--Utilize uma função SQL para fazer essas consultas no seu banco de dados.
--Obs: Faça essa análise considerando a tabela FactSales.

SELECT 
	SUM(SalesQuantity) AS 'Qtd. Vendas', 
	SUM(ReturnQuantity) AS 'Qtd. Devolvida' 
FROM
	FactSales
WHERE channelKey = 1
 
--2) Uma nova ação no setor de Marketing precisará avaliar a média salarial
--de todos os clientes da empresa, mas apenas de ocupação Professional.
--Utilize um comando SQL para atingir esse resultado.

SELECT 
	AVG(YearlyIncome) AS 'Média Salárial'
FROM dimCustomer
	WHERE Occupation = 'Professional'

--3) Você precisará fazer uma análise da quantidade de funcionários das lojas
--registradas na empresa. O seu gerente te pediu os seguintes números e
--informações:

--a.Quantos funcionários tem a loja com mais funcionários?
--b.Qual é o nome dessa loja?

SELECT TOP(1) StoreName, EmployeeCount
FROM dimStore
ORDER BY EmployeeCount DESC
	
--c.Quantos funcionários tem a loja com menos funcionários?
--d.Qual é o nome dessa loja?
SELECT TOP(1) StoreName, EmployeeCount
FROM dimStore
WHERE EmployeeCount IS NOT NULL
ORDER BY EmployeeCount ASC

--4) A área de RH está com uma nova ação para a empresa, e para isso
--precisa saber a quantidade total de funcionários do sexo Masculino e do
--sexo Feminino.
--a.Descubra essas duas informações utilizando o SQL.
--b.O funcionário e a funcionária mais antigos receberão uma
--homenagem. Descubra as seguintes informações de cada um deles:
--Nome, E-mail, Data de Contratação.

SELECT
	COUNT(EmployeeKey) AS 'Qtd. Mulheres'
FROM DimEmployee
	WHERE Gender = 'F' 
----87 Funcionárias

SELECT
	COUNT(EmployeeKey) AS 'Qtd. Homem'
FROM DimEmployee
	WHERE Gender = 'M' 
----206 Funcionários

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

--5) Agora você precisa fazer uma análise dos produtos. Será necessário
--descobrir as seguintes informações:

--a. Quantidade distinta de cores de produtos.
--b.Quantidade distinta de marcas.
--c.Quantidade distinta de classes de produto

--Para simplificar, você pode fazer isso em uma mesma
--consulta.

SELECT 
	COUNT(DISTINCT ColorName) AS 'Qtd. Cores', 
	COUNT(DISTINCT BrandName) AS 'Qtd. Marcas', 
	COUNT(DISTINCT ClassName) AS 'Qtd. Classes'
FROM DimProduct

--Exercicios 4

--1) Faça um resumo da quantidade vendida (Sales Quantity) de acordo com o canal de vendas (channelkey).
--b Faça um agrupamento mostrando a quantidade total vendida (Sales Quantity) e quantidade total devolvida
--(Return Quantity) de acordo com o ID das lojas (StoreKey). 
--c Faça um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas para o ano de 2007

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

--2) Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor 
--total vendido (SalesAmount) por produto (ProductKey).
--a.A tabela final deverá estar ordenada de 
--acordo com a quantidade vendida e, além disso, mostrar apenas os produtos que tiveram um resultado 
--final de vendas maior do que $5.000.000.
--b.Faça uma adaptação no exercício anterior e mostre os Top
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

--3) a. Você deve fazer uma consulta à tabela FactOnlineSales e descobrir. qual é o ID (CustomerKey)
--do cliente que mais realizou compras online (de acordo com a coluna Sales Quantity). 
--b. Feito isso, faça um agrupamento de total vendido (Sales Quantity) por ID do produto e descubra quais foram os 
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

--4) a. Faça um agrupamento e descubra a quantidade total de produtos por marca. 
--b Determine a média do preço unitário (UnitPrice) para cada ClassName. 
--c. Faça um agrupamento de cores e descubra o peso total que cada cor de produto possui.

--a)
SELECT 
	BrandName AS 'Marca',
	COUNT(BrandName) AS 'Qtd. Produtos da marca'
FROM dimProduct
GROUP BY BrandName

--b)
SELECT
	ClassName,
	AVG(UnitPrice) AS 'Média Preço unitário'
FROM DimProduct
GROUP BY ClassName

--c)

SELECT
	ColorName,
	SUM(Weight) AS 'Peso total'
FROM dimProduct
GROUP BY ColorName

--5) Você deverá descobrir o peso total para cada tipo de produto (Stock TypeName). 
--A tabela final deve considerar apenas a marca 'Contoso' e ter os seus valores classificados em ordem decrescente,

SELECT 
	BrandName,
	StockTypeName,
	SUM(Weight) AS 'Peso total'
FROM dimProduct
WHERE BrandName = 'Contoso'
GROUP BY  BrandName, StockTypeName

--6) Você seria capaz de confirmar se todas as marcas dos produtos possuem à disposição todas as 16 opções de cores?

SELECT 
	BrandName,
	COUNT(DISTINCT ColorName) AS 'Qtd. Cores'
FROM dimProduct
GROUP BY BrandName

--7) Faça um agrupamento para saber o total de clientes de acordo com o Sexo e também a média salarial
--de acordo com o Sexo. Corrija qualquer resultado "inesperado" com os seus conhecimentos em SOL

SELECT 
	Gender,
	COUNT(CustomerKey) AS 'Qtd. Cliente',
	AVG(YearlyIncome) AS 'Média salárial'
FROM DimCustomer
WHERE Gender IS NOT NULL
GROUP BY Gender 

--8) Faça um agrupamento para descobrir a quantidade total de clientes e a média salarial 
--de acordo com o seu nivel escolar. Utilize a coluna Education da tabela DimCustomer para 
--fazer esse agrupamento.

SELECT 
	Education,
	COUNT(CustomerKey) AS 'Qtd. Cliente',
	AVG(YearlyIncome) AS 'Média salárial'
FROM DimCustomer
WHERE Education IS NOT NULL
GROUP BY Education

--9)Faça uma tabela resumo mostrando a quantidade total de funcionários de acordo com o 
--Departamento (DepartmentName). Importante: Você deverá considerar apenas os funcionários ativos.

SELECT 
	DepartmentName,
	COUNT(EmployeeKey) AS 'Qtd. Cliente'
FROM DimEmployee
WHERE Status = 'Current'
GROUP BY DepartmentName

--10) Faça uma tabela resumo mostrando o total de Vacation Hours para cada cargo (Title). 
--Você deve considerar apenas as mulheres, dos departamentos de Production, Marketing, Engineering 
--e Finance, para os funcionários contratados entre os anos de 1999 e 2000.

SELECT 
	Title,
	SUM(VacationHours) AS 'Férias'
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