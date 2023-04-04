# Mostrar nomes dos clientes e data de nascimento no formato brasileiro

SELECT nome, DATE_FORMAT(dataNascimento, "%d/%m/%Y") AS "Data de Nascimento" FROM cliente;

CREATE VIEW nascimentoClientes 
AS (SELECT nome, DATE_FORMAT(dataNascimento, "%d/%m/%Y") 
AS "Data de Nascimento" FROM cliente);

SELECT * FROM nascimentoClientes;