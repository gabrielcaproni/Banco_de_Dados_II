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


-- Copiando estrutura do banco de dados para computerevents3si
DROP DATABASE IF EXISTS `computerevents3si`;
CREATE DATABASE IF NOT EXISTS `computerevents3si` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `computerevents3si`;

-- Copiando estrutura para tabela computerevents3si.atividade
DROP TABLE IF EXISTS `atividade`;
CREATE TABLE IF NOT EXISTS `atividade` (
  `codATIVIDADE` int(11) NOT NULL AUTO_INCREMENT,
  `tema` varchar(200) NOT NULL,
  `dataHoraInicio` datetime NOT NULL,
  `dataHoraTermino` datetime NOT NULL,
  `numVagas` int(11) NOT NULL,
  `palestrantes` varchar(450) NOT NULL,
  `cpfPalestrantes` varchar(200) NOT NULL,
  `local` varchar(200) NOT NULL,
  `tipo` enum('Palestra presencial','Palestra on-line','Oficina','Minicurso','Roda de conversa') NOT NULL,
  `EVENTO_codEVENTO` int(11) NOT NULL,
  PRIMARY KEY (`codATIVIDADE`,`EVENTO_codEVENTO`),
  KEY `fk_ATIVIDADE_EVENTO1_idx` (`EVENTO_codEVENTO`),
  CONSTRAINT `fk_ATIVIDADE_EVENTO1` FOREIGN KEY (`EVENTO_codEVENTO`) REFERENCES `evento` (`codEVENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Copiando dados para a tabela computerevents3si.atividade: ~0 rows (aproximadamente)
INSERT INTO `atividade` (`codATIVIDADE`, `tema`, `dataHoraInicio`, `dataHoraTermino`, `numVagas`, `palestrantes`, `cpfPalestrantes`, `local`, `tipo`, `EVENTO_codEVENTO`) VALUES
	(1, 'Construção de Software até a precificação', '2023-06-13 09:00:00', '2023-06-13 11:00:00', 400, 'Matheus Alisson', '999.999.999-99', 'Auditório', 'Palestra presencial', 1),
	(2, 'criando um chatbox', '2023-06-13 13:15:00', '2023-06-13 17:00:00', 30, 'Wilian silvestre', '777.888.888-00', 'LAB 1', 'Minicurso', 1);

-- Copiando estrutura para tabela computerevents3si.evento
DROP TABLE IF EXISTS `evento`;
CREATE TABLE IF NOT EXISTS `evento` (
  `codEVENTO` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `dataInicio` date NOT NULL,
  `dataTermino` date NOT NULL,
  PRIMARY KEY (`codEVENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Copiando dados para a tabela computerevents3si.evento: ~0 rows (aproximadamente)
INSERT INTO `evento` (`codEVENTO`, `nome`, `dataInicio`, `dataTermino`) VALUES
	(1, 'VII Computer Day', '2023-06-13', '2023-06-13');

-- Copiando estrutura para tabela computerevents3si.inscricao
DROP TABLE IF EXISTS `inscricao`;
CREATE TABLE IF NOT EXISTS `inscricao` (
  `PARTICIPANTE_codPARTICIPANTE` int(11) NOT NULL,
  `ATIVIDADE_codATIVIDADE` int(11) NOT NULL,
  `checkin` datetime DEFAULT NULL,
  PRIMARY KEY (`PARTICIPANTE_codPARTICIPANTE`,`ATIVIDADE_codATIVIDADE`),
  KEY `fk_PARTICIPANTE_has_ATIVIDADE_ATIVIDADE1_idx` (`ATIVIDADE_codATIVIDADE`),
  KEY `fk_PARTICIPANTE_has_ATIVIDADE_PARTICIPANTE1_idx` (`PARTICIPANTE_codPARTICIPANTE`),
  CONSTRAINT `fk_PARTICIPANTE_has_ATIVIDADE_ATIVIDADE1` FOREIGN KEY (`ATIVIDADE_codATIVIDADE`) REFERENCES `atividade` (`codATIVIDADE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PARTICIPANTE_has_ATIVIDADE_PARTICIPANTE1` FOREIGN KEY (`PARTICIPANTE_codPARTICIPANTE`) REFERENCES `participante` (`codPARTICIPANTE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Copiando dados para a tabela computerevents3si.inscricao: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela computerevents3si.participante
DROP TABLE IF EXISTS `participante`;
CREATE TABLE IF NOT EXISTS `participante` (
  `codPARTICIPANTE` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `sobrenome` varchar(200) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `email` varchar(200) NOT NULL,
  `TURMA_codTURMA` int(11) NOT NULL,
  PRIMARY KEY (`codPARTICIPANTE`,`TURMA_codTURMA`),
  KEY `fk_PARTICIPANTE_TURMA_idx` (`TURMA_codTURMA`),
  CONSTRAINT `fk_PARTICIPANTE_TURMA` FOREIGN KEY (`TURMA_codTURMA`) REFERENCES `turma` (`codTURMA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Copiando dados para a tabela computerevents3si.participante: ~2 rows (aproximadamente)
INSERT INTO `participante` (`codPARTICIPANTE`, `nome`, `sobrenome`, `cpf`, `email`, `TURMA_codTURMA`) VALUES
	(1, 'Fabiano', 'Teixeira', '111.111.111-11', 'fteixeira@gmail.com', 3),
	(2, 'Rosália', 'Silva Telles', '222.222.222-22', 'rosaliast@hotmail.com', 7);

-- Copiando estrutura para tabela computerevents3si.turma
DROP TABLE IF EXISTS `turma`;
CREATE TABLE IF NOT EXISTS `turma` (
  `codTURMA` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(200) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codTURMA`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Copiando dados para a tabela computerevents3si.turma: ~11 rows (aproximadamente)
INSERT INTO `turma` (`codTURMA`, `sigla`, `descricao`) VALUES
	(1, '1SI', '1º Sistemas de Informação'),
	(2, '2SI', '2º Sistemas de Informação'),
	(3, '3SI', '3º Sistemas de Informação'),
	(4, '4SI', '4º Sistemas de Informação'),
	(5, '5SI', '5º Sistemas de Informação'),
	(6, '6SI', '6º Sistemas de Informação'),
	(7, '7SI', '7º Sistemas de Informação'),
	(8, '8SI', '8º Sistemas de Informação'),
	(9, '1INFO', '1º ano do Técnico em Informática integrado ao Ensino Médio'),
	(10, '2INFO', '2º ano do Técnico em Informática integrado ao Ensino Médio'),
	(11, '3INFO', '3º ano do Técnico em Informática integrado ao Ensino Médio');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
