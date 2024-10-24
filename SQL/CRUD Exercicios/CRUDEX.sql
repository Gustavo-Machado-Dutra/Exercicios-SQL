
--             EXERCICIO 1
--a) Crie um banco de dados chamado BD_Teste. 
--b)Exclua o banco de dados criado no item anterior. 
--c) Crie um banco de dados chamado Exercicios.

--a)
CREATE DATABASE BD_Teste;

--b)
DROP DATABASE BD_Teste;

--c)
CREATE DATABASE Exercicios;


 --                  EXERCICIO 2
 --No banco de dados criado no exercício anterior, crie 3 tabelas,
 --cada uma contendo as seguintes colunas. 
 --Tabela 1 (dCliente): ID_Cliente, Nome_Cliente, Data_de_Nascimento 
 --Tabela 2 (dGerente): ID_Gerente, Nome_Gerente, Data_de_Contratacao, Salario 
 --Tabela 3 (fContratos): ID_Contrato, Data_de_Assinatura, ID_Cliente, ID_Gerente, Valor_do_Contrato 
 --Lembre-se dos seguintes pontos: a) Garantir que o Banco de Dados Exercicios está selecionado. 
 --b) Definir qual será o tipo de dados mais adequado para cada coluna das tabelas.
 --Lembrando que os tipos de dados mais comuns são: INT, FLOAT, VARCHAR e DATETIME.
 --Por fim, faça um SELECT para visualizar cada tabela.

CREATE TABLE dCliente (
    ID_Cliente INT PRIMARY KEY,
    Nome_Cliente VARCHAR(100),
    Data_de_Nascimento DATE
);

CREATE TABLE dGerente (
    ID_Gerente INT PRIMARY KEY,
    Nome_Gerente VARCHAR(100),
    Data_de_Contratacao DATE,
    Salario FLOAT
);

CREATE TABLE fContratos (
    ID_Contrato INT PRIMARY KEY,
    Data_de_Assinatura DATE,
    ID_Cliente INT,
    ID_Gerente INT,
    Valor_do_Contrato FLOAT
);


SELECT 
	* 
FROM 
	dCliente;
SELECT 
	* 
FROM 
	dGerente;
SELECT 
	* 
FROM 
	fContratos;

--                 EXERCICIO 3


INSERT INTO dCliente (ID_Cliente, Nome_Cliente, Data_de_Nascimento)
VALUES 
	(1, 'André Martins', '1989-02-12 00:00:00.000'),
	(2, 'Bárbara Campos', '1992-05-07 00:00:00.000'),
	(3, 'Carol Freitas', '1985-04-23 00:00:00.000'),
	(4, 'Diego Cardoso', '1994-10-11 00:00:00.000'),
	(5, 'Eduardo Pereira', '1988-11-09 00:00:00.000'),
	(6, 'Fabiana Silva', '1989-09-02 00:00:00.000'),
	(7, 'Gustavo Barbosa', '1993-06-27 00:00:00.000'),
	(8, 'Helen Viana', '1990-02-11 00:00:00.000');

	
INSERT INTO dGerente(ID_Gerente, Nome_Gerente, Data_de_Contratacao, Salario)
VALUES 
	(1, 'Lucas Sampaio', '2015-03-21 00:00:00.000', 6700),
	(2, 'Mariana Padilha', '2011-01-10 00:00:00.000', 9900),
	(3, 'Nathália Santos', '2018-10-03 00:00:00.000', 7200),
	(4, 'Otávio Costa', '2017-04-18 00:00:00.000', 11000); 

INSERT INTO fContratos (ID_Contrato, Data_de_Assinatura, ID_Cliente, ID_Gerente, Valor_do_Contrato)
VALUES 
    (1, '2019-01-12 00:00:00.000', 8, 1, 23000),
    (2, '2019-02-10 00:00:00.000', 3, 2, 15500),
    (3, '2019-03-07 00:00:00.000', 7, 2, 6500),
    (4, '2019-03-15 00:00:00.000', 1, 3, 33000),
    (5, '2015-03-21 00:00:00.000', 5, 4, 11100),
    (6, '2019-03-23 00:00:00.000', 4, 2, 5500),
	(7, '2019-03-28 00:00:00.000', 9, 3, 55000),
    (8, '2019-04-04 00:00:00.000', 2, 1, 31000),
	(9, '2019-04-05 00:00:00.000', 10, 4, 3400),
    (10, '2019-04-05 00:00:00.000', 6, 2, 9200);

--                    EXERCICIO 4
--Novos dados deverão ser adicionados nas tabelas dCliente, dGerente e fContratos. 
--Fique livre para adicionar uma nova linha em cada tabela contendo, respectivamente, 
--(1) um novo cliente (id cliente, nome e data de nascimento) (2) um novo gerente 
--(id gerente, nome, data de contratação e salário) (3) um novo contrato 
--(id, data assinatura, id cliente, id gerente, valor do contrato)

INSERT INTO dCliente (ID_Cliente, Nome_Cliente, Data_de_Nascimento)
VALUES 
    (9, 'Isabela Rocha', '1991-08-19 00:00:00.000');

INSERT INTO dGerente (ID_Gerente, Nome_Gerente, Data_de_Contratacao, Salario)
VALUES 
    (5, 'Rogério Almeida', '2020-06-15 00:00:00.000', 8500);

INSERT INTO fContratos (ID_Contrato, Data_de_Assinatura, ID_Cliente, ID_Gerente, Valor_do_Contrato)
VALUES 
    (11, '2024-10-24 00:00:00.000', 9, 5, 27500);

--                         EXERCICIO 5
--O contrato de ID igual a 4 foi registrado com alguns erros na tabela fContratos.
--Faça uma alteração na tabela atualizando os seguintes valores: Data_de_Assinatura: 
--17/03/2019 ID_Gerente: 2 Valor_do_Contrato: 33500

UPDATE fContratos
SET 
	Data_de_Assinatura = '2019-03-17 00:00:00.000',
    ID_Gerente = 2,
    Valor_do_Contrato = 33500
WHERE 
	ID_Contrato = 4;

--                    EXERCICIO 6
--Delete a linha da tabela fContratos que você criou na questão 4.

DELETE FROM fContratos
WHERE ID_Contrato = 11;