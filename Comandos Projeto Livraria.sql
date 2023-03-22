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
