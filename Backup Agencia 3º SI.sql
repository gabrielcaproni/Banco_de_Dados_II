-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.27-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para agencia3si
DROP DATABASE IF EXISTS `agencia3si`;
CREATE DATABASE IF NOT EXISTS `agencia3si` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `agencia3si`;

-- Copiando estrutura para tabela agencia3si.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `idCLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `dataNascimento` date NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Copiando dados para a tabela agencia3si.cliente: ~15 rows (aproximadamente)
INSERT INTO `cliente` (`idCLIENTE`, `nome`, `cpf`, `rg`, `dataNascimento`, `telefone`) VALUES
	(1, 'TELMA ALMEIDA', '123.456.789-10', 'MG 999.999-99', '1980-11-25', '(35)3295-9700'),
	(2, 'Roberto Silva', '035.888.888-24', 'MG 10.100.777', '1975-05-21', NULL),
	(3, 'Fabiana Silva', '999.999.999-99', NULL, '1970-12-02', NULL),
	(4, 'Guilherme Souza', '265.012.025-98', NULL, '1980-12-10', NULL),
	(5, 'Ryan Mendes', '125.145.897-98', NULL, '2000-09-02', NULL),
	(6, 'Luiz Henrique', '451.897.475-98', NULL, '1960-05-02', NULL),
	(9, 'Amanda CArvalho', '036.036.036-66', NULL, '1980-06-23', NULL),
	(10, 'Pedro Augusto Telles', '123.015.023-02', NULL, '1990-02-25', NULL),
	(11, 'Rosália Alves', '123.014.258-20', NULL, '1990-03-10', NULL),
	(12, 'Lúcia Silviano', '125.017.258-00', NULL, '1974-02-06', NULL),
	(17, 'Gabriel Pegoraro', '123.034.496-89', NULL, '1984-02-10', NULL),
	(18, 'Athos Telini', '987.154.789-36', NULL, '2003-11-01', NULL),
	(22, 'FERNANDO TELLES', '444', '444', '1975-05-12', '(35) 9 9999-8888'),
	(23, 'ALISSON FERNANDES', '555', '555', '1980-07-20', '(35) 9 1111-4444'),
	(24, 'MARCELA AUGUSTA', '666', '666', '1990-10-02', '(35) 9 2222-3333');

-- Copiando estrutura para tabela agencia3si.conta
DROP TABLE IF EXISTS `conta`;
CREATE TABLE IF NOT EXISTS `conta` (
  `idCONTA` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('Salário','Corrente','Poupança') NOT NULL,
  `saldo` float NOT NULL,
  `senha` char(8) NOT NULL,
  PRIMARY KEY (`idCONTA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Copiando dados para a tabela agencia3si.conta: ~3 rows (aproximadamente)
INSERT INTO `conta` (`idCONTA`, `tipo`, `saldo`, `senha`) VALUES
	(1, 'Salário', 805.5, 'abc123'),
	(2, 'Poupança', 1663.75, 'abc123'),
	(4, 'Corrente', 125.1, 'abc123');

-- Copiando estrutura para tabela agencia3si.contavinculada
DROP TABLE IF EXISTS `contavinculada`;
CREATE TABLE IF NOT EXISTS `contavinculada` (
  `CLIENTE_idCLIENTE` int(11) NOT NULL,
  `CONTA_idCONTA` int(11) NOT NULL,
  `dataAbertura` date NOT NULL,
  PRIMARY KEY (`CLIENTE_idCLIENTE`,`CONTA_idCONTA`),
  KEY `fk_CLIENTE_has_CONTA_CONTA1_idx` (`CONTA_idCONTA`),
  KEY `fk_CLIENTE_has_CONTA_CLIENTE_idx` (`CLIENTE_idCLIENTE`),
  CONSTRAINT `fk_CLIENTE_has_CONTA_CLIENTE` FOREIGN KEY (`CLIENTE_idCLIENTE`) REFERENCES `cliente` (`idCLIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENTE_has_CONTA_CONTA1` FOREIGN KEY (`CONTA_idCONTA`) REFERENCES `conta` (`idCONTA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Copiando dados para a tabela agencia3si.contavinculada: ~1 rows (aproximadamente)
INSERT INTO `contavinculada` (`CLIENTE_idCLIENTE`, `CONTA_idCONTA`, `dataAbertura`) VALUES
	(1, 1, '2022-12-20');

-- Copiando estrutura para view agencia3si.v_agenda1
DROP VIEW IF EXISTS `v_agenda1`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_agenda1` (
	`idCliente` INT(11) NOT NULL,
	`nome` VARCHAR(150) NOT NULL COLLATE 'utf8_general_ci',
	`telefone` VARCHAR(45) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view agencia3si.v_agenda2
DROP VIEW IF EXISTS `v_agenda2`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_agenda2` (
	`idCliente` INT(11) NOT NULL,
	`nome` VARCHAR(150) NOT NULL COLLATE 'utf8_general_ci',
	`telefone` VARCHAR(45) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view agencia3si.v_clientesordemcrescente
DROP VIEW IF EXISTS `v_clientesordemcrescente`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_clientesordemcrescente` (
	`idCLIENTE` INT(11) NOT NULL,
	`nome` VARCHAR(150) NOT NULL COLLATE 'utf8_general_ci',
	`cpf` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`rg` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`dataNascimento` DATE NOT NULL,
	`telefone` VARCHAR(45) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view agencia3si.v_contacliente
DROP VIEW IF EXISTS `v_contacliente`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_contacliente` (
	`nome` VARCHAR(150) NOT NULL COLLATE 'utf8_general_ci',
	`tipo` ENUM('Salário','Corrente','Poupança') NOT NULL COLLATE 'utf8_general_ci',
	`saldo` FLOAT NOT NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view agencia3si.v_totalfinanceiro
DROP VIEW IF EXISTS `v_totalfinanceiro`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_totalfinanceiro` (
	`SUM(saldo)` DOUBLE NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view agencia3si.v_agenda1
DROP VIEW IF EXISTS `v_agenda1`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_agenda1`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_agenda1` AS (SELECT idCliente, nome, telefone FROM cliente WHERE telefone IS NOT NULL) ;

-- Copiando estrutura para view agencia3si.v_agenda2
DROP VIEW IF EXISTS `v_agenda2`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_agenda2`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_agenda2` AS SELECT idCliente, nome, telefone FROM cliente 
WHERE telefone IS NOT NULL ;

-- Copiando estrutura para view agencia3si.v_clientesordemcrescente
DROP VIEW IF EXISTS `v_clientesordemcrescente`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_clientesordemcrescente`;
CREATE ALGORITHM=TEMPTABLE SQL SECURITY DEFINER VIEW `v_clientesordemcrescente` AS (SELECT * FROM cliente ORDER BY nome) ;

-- Copiando estrutura para view agencia3si.v_contacliente
DROP VIEW IF EXISTS `v_contacliente`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_contacliente`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_contacliente` AS SELECT cli.nome, con.tipo, con.saldo FROM cliente AS cli
INNER JOIN conta AS con
INNER JOIN contavinculada AS cv
ON cli.idCLIENTE = cv.CLIENTE_idCLIENTE
AND con.idCONTA = cv.CONTA_idCONTA ;

-- Copiando estrutura para view agencia3si.v_totalfinanceiro
DROP VIEW IF EXISTS `v_totalfinanceiro`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_totalfinanceiro`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_totalfinanceiro` AS (SELECT SUM(saldo) FROM conta) ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
