-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.20-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para livraria2si
DROP DATABASE IF EXISTS `livraria2si`;
CREATE DATABASE IF NOT EXISTS `livraria2si` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `livraria2si`;

-- Copiando estrutura para procedure livraria2si.altera_Cliente
DROP PROCEDURE IF EXISTS `altera_Cliente`;
DELIMITER //
CREATE PROCEDURE `altera_Cliente`(in novoNome varchar(200),novaData Varchar(100),novoCpf varchar(20), novoUf varchar(2),novoEnd varchar(100) , novoBairro varchar(100), novaCity varchar(45), novoCep varchar(20), novoEmail varchar(200), in codigo int)
BEGIN
	update cliente set nome = novoNome, dataNascimento = novaData , cpf = novoCpf, uf = novoUf, endereco = novoEnd, bairro = novoBairro, cidade = novaCity, cep = novoCep, email = novoEmail where codCliente = codigo; 
END//
DELIMITER ;

-- Copiando estrutura para tabela livraria2si.auditoria
DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE IF NOT EXISTS `auditoria` (
  `codAuditoria` int(11) NOT NULL AUTO_INCREMENT,
  `acao` varchar(400) DEFAULT NULL,
  `tabela` varchar(50) DEFAULT NULL,
  `dataHora` datetime DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codAuditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='Registra as princiais alterações neste BD.';

-- Copiando dados para a tabela livraria2si.auditoria: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` (`codAuditoria`, `acao`, `tabela`, `dataHora`, `usuario`) VALUES
	(24, 'Código do cliente: 7, NomeLuiz Henrique, Data de Nascimento: 1980-02-01, CPF: ', 'Cliente', '2023-05-02 10:02:49', 'root@localhost'),
	(25, 'Código do cliente: 8, NomeTeste, Data de Nascimento: 2000-02-25, CPF: 125.012.014-98', 'Cliente', '2023-05-02 10:05:01', 'root@localhost'),
	(26, 'Exclusão de conta do cliente: Teste', 'Cliente', '2023-05-02 10:10:53', 'root@localhost'),
	(27, 'Bairro do cliente: Luiz Henrique foi alterado para Santo Amaro', 'cliente', '2023-05-02 10:13:50', 'root@localhost'),
	(28, 'Código do cliente: 9, Nome: Jubileu Batata , Data de Nascimento: 2000-02-05, CPF: 123', 'Cliente', '2023-05-09 10:23:07', 'root@localhost'),
	(29, 'Inserção de cliente maior de idade: Jubileu Batata ', 'Cliente', '2023-05-09 10:23:07', 'root@localhost'),
	(30, 'Código do cliente: 10, Nome: PEDRO, Data de Nascimento: 2001-12-30, CPF: ', 'Cliente', '2023-05-09 10:42:53', 'root@localhost'),
	(31, 'Código do cliente: 11, Nome: GUSTAVO, Data de Nascimento: 2005-09-02, CPF: ', 'Cliente', '2023-05-09 10:43:24', 'root@localhost'),
	(32, 'Código do cliente: 12, Nome: GUI, Data de Nascimento: 2007-05-25, CPF: ', 'Cliente', '2023-05-09 10:49:05', 'root@localhost'),
	(33, 'Código do cliente: 13, Nome: VELHO, Data de Nascimento: 2000-02-12, CPF: ', 'Cliente', '2023-05-09 10:49:27', 'root@localhost'),
	(34, 'Código do cliente: 14, Nome: Velho, Data de Nascimento: 2000-09-25, CPF: ', 'Cliente', '2023-05-09 10:51:57', 'root@localhost'),
	(35, 'Código da editora: 13, nome da editora: teste', 'editora', '2023-05-10 08:06:49', 'root@localhost');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;

-- Copiando estrutura para tabela livraria2si.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `codCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`codCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela livraria2si.categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`codCategoria`, `nome`) VALUES
	(1, 'Suspense');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela livraria2si.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `codCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `dataNascimento` varchar(100) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `uf` char(2) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `Coluna 11` int(11) DEFAULT NULL,
  PRIMARY KEY (`codCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela livraria2si.cliente: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`codCliente`, `nome`, `dataNascimento`, `cpf`, `uf`, `endereco`, `bairro`, `cidade`, `cep`, `email`, `Coluna 11`) VALUES
	(2, 'RYAN MENDES ', '2004-03-28', '258.698.569-87', 'MG', 'Rua da Fé ', 'Santo Amaro ', 'Machado ', '37550-000', 'RyanMendes@gmail.com', NULL),
	(3, 'GABRIEL PEGORARO', '2003-11-29', '123.034.496-93', 'MG', 'Rua das Posses', 'Peróbas', 'Carvalhópolis', '37760-000', 'Gabrielcaproni09@gmail.com', NULL),
	(6, 'GUILHERME HENRIQUE', '1994-03-09', '125.589.265-22', 'RJ', 'Rua das Dores', 'Bairro dos Biba', 'Guarujá', '78900-002', '', NULL),
	(7, 'Luiz Henrique', '1980-02-01', '521.145.789-96', 'MG', 'Rua dos Nobres', 'Santo Amaro', 'Machado', '37750-000', '', NULL),
	(9, 'Jubileu Batata ', '2000-02-05', '123', 'SP', 'Rua Tocantins', 'Achados e perdidos', 'São Paulo', '37780-000', 'teste@gmail.com', NULL),
	(10, 'PEDRO', '2001-12-30', '', '', '', '', '', '', '', NULL),
	(11, 'GUSTAVO', '2005-09-02', '', '', '', '', '', '', '', NULL),
	(12, 'GUI', '2007-05-25', '', '', '', '', '', '', '', NULL),
	(13, 'VELHO', '2000-02-12', '', '', '', '', '', '', '', NULL),
	(14, 'Velho', '2000-09-25', '', '', '', '', '', '', '', NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para procedure livraria2si.consultaLogin
DROP PROCEDURE IF EXISTS `consultaLogin`;
DELIMITER //
CREATE PROCEDURE `consultaLogin`(usuario varchar(100), senha varchar(100))
BEGIN
Select * from usuarios where usuarios.nome = usuario and usuarios.senha = senha;
END//
DELIMITER ;

-- Copiando estrutura para tabela livraria2si.editora
DROP TABLE IF EXISTS `editora`;
CREATE TABLE IF NOT EXISTS `editora` (
  `codEditora` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  PRIMARY KEY (`codEditora`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela livraria2si.editora: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` (`codEditora`, `nome`) VALUES
	(2, 'Loyola'),
	(4, 'Rocco'),
	(5, 'Aleph'),
	(6, 'Suma'),
	(10, 'Panini'),
	(11, 'Saraiva'),
	(12, 'Jesus Cop'),
	(13, 'teste');
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;

-- Copiando estrutura para procedure livraria2si.insere_cliente
DROP PROCEDURE IF EXISTS `insere_cliente`;
DELIMITER //
CREATE PROCEDURE `insere_cliente`(in nome varchar(200), dataNascimento varchar(100), cpf varchar(20), uf varchar(2), endereco varchar(100), bairro varchar(100), cidade varchar(45), cep varchar(20), email varchar(200))
BEGIN
	insert into cliente values (null,nome, dataNascimento, cpf, uf, endereco, bairro, cidade, cep, email);
END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.insere_editora
DROP PROCEDURE IF EXISTS `insere_editora`;
DELIMITER //
CREATE PROCEDURE `insere_editora`(in novoNome varchar(200))
BEGIN
	insert into editora(nome) values (novoNome);
END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.insere_produto
DROP PROCEDURE IF EXISTS `insere_produto`;
DELIMITER //
CREATE PROCEDURE `insere_produto`(in novoNome varchar(200),in precoVenda Varchar(100),in precoCusto varchar(100),in qtdestoque varchar(10),in dataLancamento varchar(10))
BEGIN
	insert into produto(
		novoNome, 
        precoVenda, 
        precoCusto, 
        quantidadeEstoque, 
        dataLancamento, 
        EDITORA_codEditora,
		VENDA_codVenda, 
        VENDA_CLIENTE_codCliente, 
        CATEGORIA_codCategoria)
        values(
            nome, 
            precoVenda, 
            precoCusto, 
            qtdEstoque, 
            dataLancamento, 
            codEditora,
			codvenda, 
            codCliente,
            codcategoria);
		
END//
DELIMITER ;

-- Copiando estrutura para tabela livraria2si.itemvenda
DROP TABLE IF EXISTS `itemvenda`;
CREATE TABLE IF NOT EXISTS `itemvenda` (
  `PRODUTO_codProduto` int(11) NOT NULL,
  `VENDA_codVenda` int(11) NOT NULL,
  `quantidadeLivros` int(11) NOT NULL,
  PRIMARY KEY (`PRODUTO_codProduto`,`VENDA_codVenda`),
  KEY `fk_PRODUTO_has_VENDA_VENDA1_idx` (`VENDA_codVenda`),
  KEY `fk_PRODUTO_has_VENDA_PRODUTO1_idx` (`PRODUTO_codProduto`),
  CONSTRAINT `fk_PRODUTO_has_VENDA_PRODUTO1` FOREIGN KEY (`PRODUTO_codProduto`) REFERENCES `produto` (`codProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUTO_has_VENDA_VENDA1` FOREIGN KEY (`VENDA_codVenda`) REFERENCES `venda` (`codVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela livraria2si.itemvenda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `itemvenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemvenda` ENABLE KEYS */;

-- Copiando estrutura para procedure livraria2si.lista_cliente
DROP PROCEDURE IF EXISTS `lista_cliente`;
DELIMITER //
CREATE PROCEDURE `lista_cliente`()
BEGIN
	SELECT 
    `cliente`.`codCliente`,
    `cliente`.`nome`,
    `cliente`.`dataNascimento`,
    `cliente`.`cpf`,
    `cliente`.`uf`,
    `cliente`.`endereco`,
    `cliente`.`bairro`,
    `cliente`.`cidade`,
    `cliente`.`cep`,
    `cliente`.`email`
FROM `livraria2si`.`cliente`;

END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.Lista_Editora
DROP PROCEDURE IF EXISTS `Lista_Editora`;
DELIMITER //
CREATE PROCEDURE `Lista_Editora`()
BEGIN
	select * from editora;
END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.Lista_Produto
DROP PROCEDURE IF EXISTS `Lista_Produto`;
DELIMITER //
CREATE PROCEDURE `Lista_Produto`()
BEGIN
SELECT `produto`.`codProduto`,
    `produto`.`nome`,
    `produto`.`precoVenda`,
    `produto`.`precoCusto`,
    `produto`.`quantidadeEstoque`,
    `produto`.`dataLancamento`,
    `produto`.`EDITORA_codEditora`,
    `produto`.`VENDA_codVenda`,
    `produto`.`VENDA_CLIENTE_codCliente`,
    `produto`.`CATEGORIA_codCategoria`
FROM `livraria2si`.`produto`;

END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.proc_alteraCategoria
DROP PROCEDURE IF EXISTS `proc_alteraCategoria`;
DELIMITER //
CREATE PROCEDURE `proc_alteraCategoria`(in codCate int, in novoNome varchar (100))
BEGIN
	update categoria set nome = novoNome where codCategoria = codCate;
END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.proc_alteraEditora
DROP PROCEDURE IF EXISTS `proc_alteraEditora`;
DELIMITER //
CREATE PROCEDURE `proc_alteraEditora`(in codigo int, in novoNome varchar(200), plataforma varchar(100))
BEGIN
	update editora set nome = novoNome, plataformaLancamento = plataforma where codEditora = codigo;
END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.proc_alteraProduto
DROP PROCEDURE IF EXISTS `proc_alteraProduto`;
DELIMITER //
CREATE PROCEDURE `proc_alteraProduto`(
	IN `codigoProduto` int,
	IN `novoNome` varchar(100),
	IN `precoProd` decimal(10,0),
	IN `precoCus` decimal(10,0),
	IN `quantidadeEst` int(11),
	IN `dataLanc` date,
	IN `codEditora` int,
	IN `codVenda` int,
	IN `codCliente` int,
	IN `codCategoria` int
)
BEGIN
	if (@contador = 0)
		then SELECT "Produto não encontrado" AS erro;
	else
	update produto set  nome = novoNome, 
        precoProd = precoVenda,
        precoCus = precoCusto,
        quantidadeEst = quantidadeEstoque,
        dataLanc = dataLancamento,
        codEditora = EDITORA_codEditora,
        cod_Venda = VENDA_codVenda,
        codCliente = VENDA_CLIENTE_codCliente,
        codCategoria = CATEGORIA_codCategoria 
        where 
        codigoProduto = codProduto;
	END if;
END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.proc_alteraVenda
DROP PROCEDURE IF EXISTS `proc_alteraVenda`;
DELIMITER //
CREATE PROCEDURE `proc_alteraVenda`(in codigoVenda int, in novaData date, desco decimal(4,2), tipo enum('À Vista', 'Cartão Débito', 'Cartão Crédito', 'PIX'), in codCliente int)
BEGIN
	update venda set novaData = dataHora,
    desco = desconto,
    tipo = tipovenda
    where
    codCliente = CLIENTE_codCliente;
END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.proc_deleteCategoria
DROP PROCEDURE IF EXISTS `proc_deleteCategoria`;
DELIMITER //
CREATE PROCEDURE `proc_deleteCategoria`(in codExcluir int)
BEGIN
	delete from categoria where codCategoria = codExcluir;
END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.proc_deleteCliente
DROP PROCEDURE IF EXISTS `proc_deleteCliente`;
DELIMITER //
CREATE PROCEDURE `proc_deleteCliente`(in codExcluir int)
BEGIN
	delete from cliente where codCliente = codExcluir;
END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.proc_deleteEditora
DROP PROCEDURE IF EXISTS `proc_deleteEditora`;
DELIMITER //
CREATE PROCEDURE `proc_deleteEditora`(
	IN `codExcluir` int
)
BEGIN 
	SELECT COUNT(*) INTO @contador FROM editora AS e
	WHERE e.codEditora = codExcluir;
	if (@contador = 0)
		then SELECT "Editora não encontrada" AS erro;
	ELSE 
		delete from editora where codEditora = codExcluir;
	END if;
END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.proc_deleteProduto
DROP PROCEDURE IF EXISTS `proc_deleteProduto`;
DELIMITER //
CREATE PROCEDURE `proc_deleteProduto`(
	IN `codExcluir` int
)
BEGIN

	delete from produto where codProduto = codExcluir;
	
END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.proc_deleteVenda
DROP PROCEDURE IF EXISTS `proc_deleteVenda`;
DELIMITER //
CREATE PROCEDURE `proc_deleteVenda`( in codExcluir int)
BEGIN
	delete from itemvenda where codVenda = codExcluir;
END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.proc_insereCategoria
DROP PROCEDURE IF EXISTS `proc_insereCategoria`;
DELIMITER //
CREATE PROCEDURE `proc_insereCategoria`(in novoNome varchar(100))
BEGIN
	insert into categoria(nome) values (novoNome);
END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.proc_insereEditora
DROP PROCEDURE IF EXISTS `proc_insereEditora`;
DELIMITER //
CREATE PROCEDURE `proc_insereEditora`(in novoNome varchar(200), Plataforma varchar(100) )
BEGIN
	insert into editora(nome,plataformaLancamento) values (novoNome,Plataforma);
END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.proc_insereVenda
DROP PROCEDURE IF EXISTS `proc_insereVenda`;
DELIMITER //
CREATE PROCEDURE `proc_insereVenda`(in novaData date, in desco decimal(4,2), in tipoVenda enum('À Vista', 'Cartão Débito', 'Cartão Crédito', 'PIX'), codCliente int)
BEGIN
	insert into venda(
    codVenda,
    dataHora,
    desconto,
    tipoVenda,
    CLIENTE_codCliente
    )
    values(
    null,
    novaData,
    desco,
    tipoVenda,
    codcliente
    );
END//
DELIMITER ;

-- Copiando estrutura para procedure livraria2si.proc_RelatorioDeVendas
DROP PROCEDURE IF EXISTS `proc_RelatorioDeVendas`;
DELIMITER //
CREATE PROCEDURE `proc_RelatorioDeVendas`(
	IN `codClientePesquisar` INT
)
BEGIN
	SELECT COUNT(*) INTO @contador FROM  venda AS v WHERE v.CLIENTE_codCliente = codClientePesquisar;
	if(@contador = 0)
		then SELECT "Não foi realizada nenhuma compra por esse cliente!" AS mensagem;
	ELSE 
		SELECT v.codVenda, DATE_FORMAT(v.dataHora ,"%d/%m/%Y %H:%i:%s") as dataHora, c.nome 
		from venda AS v 
		INNER JOIN cliente AS c
		ON v.CLIENTE_codCliente = c.codCliente WHERE v.CLIENTE_codCliente = codClientePesquisar 
		ORDER BY v.codVenda;
	END if;
END//
DELIMITER ;

-- Copiando estrutura para tabela livraria2si.produto
DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `codProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `precoVenda` decimal(10,0) NOT NULL,
  `precoCusto` decimal(10,0) NOT NULL,
  `quantidadeEstoque` int(11) NOT NULL,
  `dataLancamento` date NOT NULL,
  `EDITORA_codEditora` int(11) NOT NULL,
  `VENDA_codVenda` int(11) NOT NULL,
  `VENDA_CLIENTE_codCliente` int(11) NOT NULL,
  `CATEGORIA_codCategoria` int(11) NOT NULL,
  PRIMARY KEY (`codProduto`,`EDITORA_codEditora`,`VENDA_codVenda`,`VENDA_CLIENTE_codCliente`,`CATEGORIA_codCategoria`),
  KEY `fk_PRODUTO_EDITORA_idx` (`EDITORA_codEditora`),
  KEY `fk_PRODUTO_VENDA1_idx` (`VENDA_codVenda`,`VENDA_CLIENTE_codCliente`),
  KEY `fk_PRODUTO_CATEGORIA1_idx` (`CATEGORIA_codCategoria`),
  CONSTRAINT `fk_PRODUTO_CATEGORIA1` FOREIGN KEY (`CATEGORIA_codCategoria`) REFERENCES `categoria` (`codCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUTO_EDITORA` FOREIGN KEY (`EDITORA_codEditora`) REFERENCES `editora` (`codEditora`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUTO_VENDA1` FOREIGN KEY (`VENDA_codVenda`, `VENDA_CLIENTE_codCliente`) REFERENCES `venda` (`codVenda`, `CLIENTE_codCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela livraria2si.produto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`codProduto`, `nome`, `precoVenda`, `precoCusto`, `quantidadeEstoque`, `dataLancamento`, `EDITORA_codEditora`, `VENDA_codVenda`, `VENDA_CLIENTE_codCliente`, `CATEGORIA_codCategoria`) VALUES
	(1, 'Crônicas de Tandandan', 50, 30, 100, '1989-03-25', 2, 1, 2, 1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela livraria2si.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idusuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  PRIMARY KEY (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela livraria2si.usuarios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`idusuarios`, `nome`, `senha`) VALUES
	(4, 'adm', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Copiando estrutura para tabela livraria2si.venda
DROP TABLE IF EXISTS `venda`;
CREATE TABLE IF NOT EXISTS `venda` (
  `codVenda` int(11) NOT NULL AUTO_INCREMENT,
  `dataHora` date NOT NULL,
  `desconto` decimal(4,2) NOT NULL,
  `tipoVenda` enum('À vista','Cartão Débito','Cartão Crédito','PIX') NOT NULL,
  `CLIENTE_codCliente` int(11) NOT NULL,
  PRIMARY KEY (`codVenda`,`CLIENTE_codCliente`),
  KEY `fk_VENDA_CLIENTE1_idx` (`CLIENTE_codCliente`),
  CONSTRAINT `fk_VENDA_CLIENTE1` FOREIGN KEY (`CLIENTE_codCliente`) REFERENCES `cliente` (`codCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela livraria2si.venda: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` (`codVenda`, `dataHora`, `desconto`, `tipoVenda`, `CLIENTE_codCliente`) VALUES
	(1, '2022-08-28', 0.50, 'À vista', 2),
	(2, '2021-02-23', 0.50, 'Cartão Crédito', 3);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;

-- Copiando estrutura para view livraria2si.v_datanascimento
DROP VIEW IF EXISTS `v_datanascimento`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_datanascimento` (
	`nome` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`Data de Nascimento` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view livraria2si.v_editoras
DROP VIEW IF EXISTS `v_editoras`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_editoras` (
	`codEditora` INT(11) NOT NULL,
	`nome` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view livraria2si.v_ufcliente
DROP VIEW IF EXISTS `v_ufcliente`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_ufcliente` (
	`codCliente` INT(11) NOT NULL,
	`nome` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para trigger livraria2si.tri_FormataNomeCliente
DROP TRIGGER IF EXISTS `tri_FormataNomeCliente`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_FormataNomeCliente` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
SELECT FLOOR(DATEDIFF(CURDATE(), dataNascimento)/365) INTO @idade
		FROM cliente WHERE codCliente = NEW.codCliente;
			if(@idade < 18)
				then 
					SET NEW.nome = UPPER(NEW.nome);
			END if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger livraria2si.tri_LogAlteraBairro
DROP TRIGGER IF EXISTS `tri_LogAlteraBairro`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogAlteraBairro` AFTER UPDATE ON `cliente` FOR EACH ROW BEGIN
		SET @mensagem = CONCAT("Bairro do cliente: ", NEW.nome, " foi alterado para ", NEW.bairro);
	INSERT INTO auditoria VALUES(NULL, @mensagem, "cliente", NOW(), USER());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger livraria2si.tri_LogApagaCliente
DROP TRIGGER IF EXISTS `tri_LogApagaCliente`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogApagaCliente` AFTER DELETE ON `cliente` FOR EACH ROW BEGIN
	SELECT nome INTO @nomeCliente FROM cliente WHERE codCliente = OLD.codCliente;
	SET @mensagem = CONCAT("Exclusão de conta do cliente: ", @nomeCliente);

	INSERT INTO auditoria VALUES(NULL, @mensagem, "Cliente", NOW(), USER());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger livraria2si.tri_logFiscalizaCPF
DROP TRIGGER IF EXISTS `tri_logFiscalizaCPF`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_logFiscalizaCPF` AFTER UPDATE ON `cliente` FOR EACH ROW BEGIN
	SET @mensagem = CONCAT("CPF do cliente : ", NEW.nome, ", foi alterado para:  ", NEW.cpf);
	INSERT INTO auditoria VALUES(NULL, @mensagem, "cliente", NOW(), USER());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger livraria2si.tri_logFormataNomeEditora
DROP TRIGGER IF EXISTS `tri_logFormataNomeEditora`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_logFormataNomeEditora` BEFORE INSERT ON `editora` FOR EACH ROW BEGIN
	SET NEW.nome = UPPER(NEW.nome);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger livraria2si.tri_LogInsereCliente
DROP TRIGGER IF EXISTS `tri_LogInsereCliente`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogInsereCliente` AFTER INSERT ON `cliente` FOR EACH ROW BEGIN
		SET @mensagem = CONCAT("Código do cliente: ", NEW.codCliente, ", Nome: ", NEW.nome, ", Data de Nascimento: ", NEW.dataNascimento, ", CPF: ", NEW.cpf);

		INSERT INTO auditoria VALUES(NULL, @mensagem, "Cliente", NOW(), USER());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para view livraria2si.v_datanascimento
DROP VIEW IF EXISTS `v_datanascimento`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_datanascimento`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_datanascimento` AS (SELECT nome, date_format(dataNascimento, "%d/%m/%Y") AS "Data de Nascimento" FROM cliente) ;

-- Copiando estrutura para view livraria2si.v_editoras
DROP VIEW IF EXISTS `v_editoras`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_editoras`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_editoras` AS (
SELECT codEditora, nome from editora WHERE codEditora >= 4) ;

-- Copiando estrutura para view livraria2si.v_ufcliente
DROP VIEW IF EXISTS `v_ufcliente`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_ufcliente`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_ufcliente` AS (SELECT codCliente, nome FROM cliente WHERE uf LIKE "%MG%") ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
