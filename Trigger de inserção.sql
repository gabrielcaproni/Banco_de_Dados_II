BEGIN
  	# Formata o nome do novo cliente para latras maiúsculas
  	SET NEW.nome = UPPER(NEW.nome);
END