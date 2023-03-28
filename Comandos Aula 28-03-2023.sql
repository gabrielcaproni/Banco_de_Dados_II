#mostrar BDs instalados 
SHOW DATABASES;

#Indicar qual BD será usado
USE agencia3si2023;

#Mostrar as tabelas(entidades) do BD em uso
SHOW TABLES;

#Descrever a estrutura de uma tabela especifica
DESC cliente;

#Inserir um cliente por vez (comando)
#preenchendo apenas campos obrigatórios 
INSERT INTO cliente(idCliente, nome, cpf, dataNascimento) 
VALUES (NULL, "Amanda CArvalho", "036.036.036-66", "1980-06-23");

INSERT INTO cliente(idCliente, nome, cpf, dataNascimento) 
VALUES (NULL, "Pedro Augusto Telles", "123.015.023-02", "1990-02-25");

#Inserir varios clientes por vez (comando)
#preenchendo apenas campos obrigatórios
INSERT INTO cliente(idCliente, nome, cpf, dataNascimento) 
VALUES (NULL, "Rosália Alves", "123.014.258-20", "1990-03-10"),
(NULL, "Lúcia Silviano", "125.017.258-00", "1974-02-06");

#Relatório dos clientes em ordem alfabética decrescente 
SELECT * FROM cliente ORDER BY nome DESC;

#Comandos aulas 08/03/2023
DESC conta;
INSERT INTO conta VALUES (NULL, "Salário", 800.50, "abc123");
SELECT * FROM conta; 
INSERT INTO conta VALUES (NULL, "Poupança", 1250.00, "abc123");
INSERT INTO conta VALUES (NULL, "Poupança", 3000.00, "abc123");
INSERT INTO conta VALUES (NULL, "Corrente", 125.10, "abc123");

#Mostrar o valor financeiro em poder de agência
SELECT FORMAT(SUM(saldo),2) AS Total FROM conta;

#Mostrar o menor saldo 
SELECT MIN(saldo) AS "Menor saldo" FROM conta;

#Mostrar o maior saldo
SELECT MAX(saldo) AS "Maior saldo" FROM conta;

#Mostrar a média dos saldos 
SELECT FORMAT(AVG(saldo),2) AS "Maior saldo" FROM conta;

#Mostrar os dados da conta com maior saldo
SELECT * FROM conta ORDER BY saldo DESC LIMIT 1;

#Descrever a tabela de contas vinculadas e iserir dados
DESC contavinculada;
INSERT INTO contavinculada VALUES(1, 1, "2022-12-20");
INSERT INTO contavinculada VALUES(2, 3, "2023-01-10");
INSERT INTO contavinculada VALUES(3, 2, "2023-01-20");
INSERT INTO contavinculada VALUES(4, 4, "2023-03-02");
SELECT * FROM contavinculada;

/*Criar um relatório que mostre o nome de cada cliente,
o identificador de sua conta com respectivo saldo e a
data de abertura da mesma(no formato brasileiro dia/mês/ano)*/


SELECT CL.nome AS "Nome",
	   CP.tipo AS "Tipo da Conta",
	   CP.saldo AS "Saldo",
	   date_format(COV.dataAbertura, "%d/%m/%Y") AS "Data de Abetura"
	   FROM cliente AS CL
	   INNER JOIN conta AS CP
	   INNER JOIN contavinculada AS COV
	   ON COV.CLIENTE_idCLIENTE = CL.idCliente
	   AND COV.CONTA_idCONTA = CP.idCONTA;
	   
	   #     *** PARTE DE SUBCONSULTA *** 

#Inserir um telefone para um determinado cliente
UPDATE cliente SET telefone = "(35)3295-9700" WHERE idCliente = 1;
SELECT * FROM cliente;

#Inserir subconsulta para mostrar contas vinculadas de cliente co telefone 
SELECT * FROM contavinculada AS cv WHERE cv.CLIENTE_idCLIENTE IN (SELECT cli.idCLIENTE FROM cliente AS cli WHERE cli.telefone IS NOT NULL);

#Mostrar as contas desde que os saldos sejam iguais ou maiores que a média dos saldos 
SELECT * FROM conta;
SELECT SUM(saldo) FROM conta;
SELECT FORMAT(SUM(saldo),2) FROM conta;
SELECT COUNT(*) FROM conta;
SELECT FORMAT(SUM(saldo) / COUNT(*), 2) FROM conta;
SELECT AVG(saldo) FROM conta;

SELECT * FROM conta WHERE saldo >= (SELECT AVG(saldo) FROM conta);

#Mostrar as contas vinculadas aos clientes com idade superior a 45 anos
SELECT * FROM cliente;
SELECT * FROM contavinculada HAVING CLIENTE_idCliente IN 
(SELECT idCliente FROM cliente WHERE FLOOR(DATEDIFF(CURDATE(), dataNascimento) / 365) > 45);

#Relatório de clientes com mais de 45 anos e com contas vinculadas 
SELECT * FROM contavinculada HAVING contavinculada.CLIENTE_idCLIENTE IN 
(SELECT idCliente FROM cliente WHERE FLOOR(DATEDIFF(CURDATE(), dataNascimento) / 365) > 45);

#Relatório com agrupamentos dos saldos pelo tipo de conta
SELECT tipo, SUM(saldo) AS somaSaldo 
FROM conta GROUP BY tipo;

#Relatório das contas mostrando o tipo e a soma maior que a média 
SELECT tipo, SUM(saldo) AS somaSaldo 
FROM conta GROUP BY tipo 
HAVING somaSaldo > 
(SELECT AVG(saldo) FROM conta);

#Subconsultas 
#Aumentar em 5 reais o saldo dos clientes de MG
SHOW TABLES;

SELECT * FROM cliente;
UPDATE cliente SET rg = "MG 999.999-99" WHERE idCliente = 1;
SELECT * FROM contavinculada;

#codificaçaõ da Subconsulta
UPDATE conta SET saldo = saldo + 5 
WHERE idConta IN (SELECT CONTA_idConta 
FROM contavinculada WHERE CLIENTE_idCliente 
IN (SELECT idCliente FROM cliente WHERE RG LIKE "MG%")); 

#Excluir as contas viculadas aos cliente sem RG

#Entendimento do Situação-Problema 
SELECT * FROM contavinculada;
SELECT * FROM cliente;

#Subconsulta
DELETE FROM contavinculada WHERE CLIENTE_idCliente IN (SELECT idCliente FROM cliente WHERE rg IS NULL);


# Aula 28/03/2023

SELECT * FROM cliente;
DESC cliente;

INSERT INTO cliente(idCliente, nome, cpf, datanascimento)
VALUES(NULL, "Fabiana Silva", "999.999.999-99", "1970-12-02"); 

INSERT INTO cliente(idCliente, nome, cpf, datanascimento)
VALUES(NULL, "Guilherme Souza", "265.012.025-98", "1980-12-10"); 

INSERT INTO cliente(idCliente, nome, cpf, datanascimento)
VALUES(NULL, "Ryan Mendes", "125.145.897-98", "2000-09-02"); 

INSERT INTO cliente(idCliente, nome, cpf, datanascimento)
VALUES(NULL, "Luiz Henrique", "451.897.475-98", "1960-05-02"); 

INSERT INTO cliente(idCliente, nome, cpf, datanascimento)
VALUES(NULL, "Gabriel Pegoraro", "123.034.496-89", "1984-02-10"); 

INSERT INTO cliente(idCliente, nome, cpf, datanascimento)
VALUES(NULL, "Athos Telini", "987.154.789-36", "2003-11-01"); 

# Ciação de uma tabela virtual - VIEW para ordenar os clientes em ordem alfabética crescente

CREATE VIEW v_ClientesOrdemCrescente AS (SELECT nome, cpf FROM cliente ORDER BY nome);

SHOW TABLES;

# Listagem dos dados de uma view

SELECT * FROM v_clientesordemcrescente;