SELECT * FROM cliente;

BEGIN;
	UPDATE cliente SET cpf = "125.589.265-22" WHERE codCliente =6;
	UPDATE cliente SET nome = UPPER(nome) WHERE cep IS NOT NULL;
	UPDATE cliente SET endereco = "Rua das Dores" WHERE codCliente =6;
ROLLBACK ;

SELECT * FROM cliente;