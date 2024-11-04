1)


DECLARE @valor3 INT
SET @valor3 = 34
DECLARE @valor4 INT
SET @valor4 = 7

SELECT @valor1 AS 'Teste'

a)
DECLARE @valor1 INT
SET @valor1 = 10
DECLARE @valor2 INT
SET @valor2 = 5
DECLARE @soma INT
SET @soma = (@valor1 + @valor2)
SELECT @soma

b)
DECLARE @valor3 INT
SET @valor3 = 34
DECLARE @valor4 INT
SET @valor4 = 7
DECLARE @subtracao INT
SET @subtracao = (@valor3 - @valor4)
SELECT @subtracao

c)
DECLARE @valor1 INT
SET @valor1 = 10
DECLARE @valor4 INT
SET @valor4 = 7
DECLARE @multuplicacao INT
SET @multuplicacao = (@valor1 * @valor4)
SELECT @multuplicacao

d)

DECLARE @valor3 FLOAT
SET @valor3 = 34
DECLARE @valor4 FLOAT
SET @valor4 = 7
DECLARE @divisao FLOAT
SET @divisao = (@valor3 / @valor4)
SELECT ROUND(@divisao, 2, 1)

2)
DECLARE @produto VARCHAR(40)
SET @produto = 'Celular'

DECLARE @quantidade INT
SET @quantidade = 12

DECLARE @preco FLOAT
SET @preco = 9.99

DECLARE @faturamento FLOAT
SET @faturamento = (@quantidade * @preco)

SELECT @produto,
	@quantidade,
	@preco,
	@faturamento

--3)
DECLARE @nome VARCHAR(50)
SET @nome = 'André'
DECLARE @data_nascimento DATETIME
SET @data_nascimento = '10/02/1998'
DECLARE @num_pets  INT
SET @num_pets = 2
SELECT 'Meu nome é ' + @nome + ', nasci em ' + FORMAT (CAST(@data_nascimento AS DATETIME), 'dd/MM/yyyy' ) + ' e tenho ' + CAST(@num_pets AS VARCHAR(10)) + ' pets'

4)

DECLARE @NomeLojas VARCHAR(MAX) = ''
SELECT @NomeLojas = @NomeLojas + StoreName + ', ' + CHAR(10)
FROM DimStore
WHERE CloseDate BETWEEN '01/01/2008' AND '30/12/2008'

PRINT LEFT (@NomeLojas, DATALENGTH(@NomeLojas) - 3)

5)
DECLARE @Produtos VARCHAR(MAX) = ''

SELECT @Produtos = @Produtos + ProductName + ', ' + CHAR(10)
FROM DimProduct
INNER JOIN DimProductSubcategory
ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE ProductSubcategoryName = 'Lamps'

PRINT LEFT(@Produtos, DATALENGTH(@Produtos) - 3)