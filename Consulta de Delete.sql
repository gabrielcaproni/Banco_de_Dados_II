SELECT * FROM cliente;

BEGIN;
	DELETE FROM cliente WHERE codCliente = 1;
	DELETE FROM cliente WHERE codCliente = 4;
	DELETE FROM cliente WHERE codCliente = 5;
COMMIT;

SELECT * FROM cliente;