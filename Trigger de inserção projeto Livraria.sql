BEGIN
		SET @mensagem = CONCAT("Código do cliente: ", NEW.codCliente, ", Nome: ", NEW.nome, ", Data de Nascimento: ", NEW.dataNascimento, ", CPF: ", NEW.cpf);

		INSERT INTO auditoria VALUES(NULL, @mensagem, "Cliente", NOW(), USER());
END