-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 20-Abr-2020 às 00:25
-- Versão do servidor: 5.6.13
-- versão do PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `asiloemfoco`
--
CREATE DATABASE IF NOT EXISTS `asiloemfoco` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `asiloemfoco`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

CREATE TABLE IF NOT EXISTS `agenda` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `prontuarioId` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prontuarioId` (`prontuarioId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `asilo`
--

CREATE TABLE IF NOT EXISTS `asilo` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `razaoSocial` varchar(50) NOT NULL,
  `contatoId` int(9) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `enderecoId` int(8) NOT NULL,
  `responsavelId` int(8) NOT NULL,
  `loginId` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contatoId` (`contatoId`),
  KEY `enderecoId` (`enderecoId`),
  KEY `responsavelId` (`responsavelId`),
  KEY `loginId` (`loginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

CREATE TABLE IF NOT EXISTS `avaliacao` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(200) DEFAULT NULL,
  `nota` int(1) NOT NULL,
  `asiloId` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `asiloId` (`asiloId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE IF NOT EXISTS `contato` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(15) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE IF NOT EXISTS `endereco` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `cidade` varchar(28) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `numero` int(5) NOT NULL,
  `cep` int(9) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `estadoId` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estadoId` (`estadoId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(2) NOT NULL,
  `nome` varchar(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `formacaofuncionario`
--

CREATE TABLE IF NOT EXISTS `formacaofuncionario` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `tipoFormacao` varchar(50) NOT NULL,
  `coren` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dataNasc` datetime NOT NULL,
  `contatoId` int(8) NOT NULL,
  `asiloId` int(8) NOT NULL,
  `enderecoId` int(8) NOT NULL,
  `formacaoId` int(8) NOT NULL,
  `loginId` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `asiloId` (`asiloId`),
  KEY `contatoId` (`contatoId`),
  KEY `enderecoId` (`enderecoId`),
  KEY `formacaoId` (`formacaoId`),
  KEY `loginId` (`loginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `idoso`
--

CREATE TABLE IF NOT EXISTS `idoso` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `dataNasc` datetime NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `responsavelId` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `responsavelId` (`responsavelId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `confirmPassword` varchar(30) NOT NULL,
  `perfil` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prontuario`
--

CREATE TABLE IF NOT EXISTS `prontuario` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) NOT NULL,
  `idosoId` int(8) NOT NULL,
  `agendaId` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agendaId` (`agendaId`),
  KEY `idosoId` (`idosoId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `responsavel`
--

CREATE TABLE IF NOT EXISTS `responsavel` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dataNasc` datetime NOT NULL,
  `contatoId` int(8) NOT NULL,
  `idosoId` int(8) NOT NULL,
  `enderecoId` int(8) NOT NULL,
  `asiloId` int(8) NOT NULL,
  `loginId` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contatoId` (`contatoId`),
  KEY `idosoId` (`idosoId`),
  KEY `enderecoId` (`enderecoId`),
  KEY `asiloId` (`asiloId`),
  KEY `loginId` (`loginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`prontuarioId`) REFERENCES `prontuario` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `asilo`
--
ALTER TABLE `asilo`
  ADD CONSTRAINT `asilo_ibfk_1` FOREIGN KEY (`contatoId`) REFERENCES `contato` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `asilo_ibfk_2` FOREIGN KEY (`enderecoId`) REFERENCES `endereco` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `asilo_ibfk_3` FOREIGN KEY (`responsavelId`) REFERENCES `responsavel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `asilo_ibfk_4` FOREIGN KEY (`loginId`) REFERENCES `login` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`asiloId`) REFERENCES `asilo` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`estadoId`) REFERENCES `estado` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`asiloId`) REFERENCES `asilo` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`contatoId`) REFERENCES `contato` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `funcionario_ibfk_3` FOREIGN KEY (`enderecoId`) REFERENCES `endereco` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `funcionario_ibfk_4` FOREIGN KEY (`formacaoId`) REFERENCES `formacaofuncionario` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `funcionario_ibfk_5` FOREIGN KEY (`loginId`) REFERENCES `login` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `idoso`
--
ALTER TABLE `idoso`
  ADD CONSTRAINT `idoso_ibfk_1` FOREIGN KEY (`responsavelId`) REFERENCES `responsavel` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `prontuario`
--
ALTER TABLE `prontuario`
  ADD CONSTRAINT `prontuario_ibfk_1` FOREIGN KEY (`agendaId`) REFERENCES `agenda` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prontuario_ibfk_2` FOREIGN KEY (`idosoId`) REFERENCES `idoso` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `responsavel`
--
ALTER TABLE `responsavel`
  ADD CONSTRAINT `responsavel_ibfk_1` FOREIGN KEY (`contatoId`) REFERENCES `contato` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `responsavel_ibfk_2` FOREIGN KEY (`idosoId`) REFERENCES `idoso` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `responsavel_ibfk_3` FOREIGN KEY (`enderecoId`) REFERENCES `endereco` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `responsavel_ibfk_4` FOREIGN KEY (`asiloId`) REFERENCES `asilo` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `responsavel_ibfk_5` FOREIGN KEY (`loginId`) REFERENCES `login` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
