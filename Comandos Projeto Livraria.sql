USE livraria2si;
SELECT * FROM venda;
SELECT * FROM cliente;

UPDATE venda SET desconto = 0.5 
WHERE codVenda IN (SELECT codVenda 
FROM venda WHERE CLIENTE_codCliente 
IN (SELECT codCliente FROM cliente WHERE uf LIKE "MG%"));

SELECT * FROM venda HAVING venda.CLIENTE_codCliente IN 
(SELECT codCliente FROM cliente WHERE FLOOR(DATEDIFF(CURDATE(), dataNascimento) / 365) > 10);

SELECT * FROM venda HAVING CLIENTE_codCliente IN (SELECT codCliente FROM cliente WHERE tipoVenda = "À vista");

# Aula 04/04/2023

SELECT codCliente, nome FROM cliente WHERE uf LIKE "%MG%";

CREATE VIEW v_UFcliente AS(SELECT codCliente, nome FROM cliente WHERE uf LIKE "%MG%");

SELECT * FROM v_ufcliente;

SELECT nome, date_format(dataNascimento, "%d/%m/%Y") AS "Data de Nascimento" FROM cliente;

CREATE VIEW v_DataNascimento AS(SELECT nome, date_format(dataNascimento, "%d/%m/%Y") AS "Data de Nascimento" FROM cliente);

SELECT * FROM v_datanascimento; 

SELECT codEditora, nome FROM editora;

CREATE VIEW v_Editoras AS(
SELECT codEditora, nome from editora WHERE codEditora >= 4);

SELECT * FROM v_Editoras;