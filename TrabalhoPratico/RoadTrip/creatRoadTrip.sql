-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema roadTrip
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `roadTrip` ;

-- -----------------------------------------------------
-- Schema roadTrip
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `roadTrip` DEFAULT CHARACTER SET utf8 ;
USE `roadTrip` ;

-- -----------------------------------------------------
-- Table `roadTrip`.`Pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `roadTrip`.`Pais` ;

CREATE TABLE IF NOT EXISTS `roadTrip`.`Pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT,
  `designacao` TEXT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roadTrip`.`Cidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `roadTrip`.`Cidade` ;

CREATE TABLE IF NOT EXISTS `roadTrip`.`Cidade` (
  `idCidade` INT NOT NULL AUTO_INCREMENT,
  `designacao` TEXT NULL,
  `pais` INT NULL,
  PRIMARY KEY (`idCidade`),
  CONSTRAINT `fk_Cidade_Pais1`
    FOREIGN KEY (`pais`)
    REFERENCES `roadTrip`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Cidade_Pais1_idx` ON `roadTrip`.`Cidade` (`pais` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `roadTrip`.`Funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `roadTrip`.`Funcionario` ;

CREATE TABLE IF NOT EXISTS `roadTrip`.`Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `data_contrato` DATE NOT NULL,
  `salario` DECIMAL(8,2) NOT NULL CHECK (salario>=500),
  `telemovel` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `FuncionarioSuperior` INT NULL,
  `cidade` INT NOT NULL,
  `pais` INT NOT NULL,
  `rua` VARCHAR(75) NULL,
  `dataNascimento` DATE NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  CONSTRAINT `fk_FuncionarioSuperior`
    FOREIGN KEY (`FuncionarioSuperior`)
    REFERENCES `roadTrip`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_Cidade1`
    FOREIGN KEY (`cidade`)
    REFERENCES `roadTrip`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_Pais1`
    FOREIGN KEY (`pais`)
    REFERENCES `roadTrip`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FuncionarioSuperior_idx` ON `roadTrip`.`Funcionario` (`FuncionarioSuperior` ASC) VISIBLE;

CREATE INDEX `fk_Funcionario_Cidade1_idx` ON `roadTrip`.`Funcionario` (`cidade` ASC) VISIBLE;

CREATE INDEX `fk_Funcionario_Pais1_idx` ON `roadTrip`.`Funcionario` (`pais` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `roadTrip`.`Veiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `roadTrip`.`Veiculo` ;

CREATE TABLE IF NOT EXISTS `roadTrip`.`Veiculo` (
  `idVeiculo` INT NOT NULL AUTO_INCREMENT,
  `matricula` VARCHAR(20) NOT NULL,
  `precoEmNovo` DECIMAL(8,2) NULL CHECK (precoEmNovo>=0),
  `marca` VARCHAR(50) NULL,
  `modelo` VARCHAR(50) NULL,
  `nr_Kms` DECIMAL(8,2) NULL,
  `anoCompra` DATE NULL,
  `taxaDesvalorizacao` DECIMAL(8,3) NULL,
  PRIMARY KEY (`idVeiculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roadTrip`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `roadTrip`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `roadTrip`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NULL,
  `nif` INT(5) NULL,
  `dataNascimento` DATE NOT NULL,
  `pais` INT NOT NULL,
  `cidade` INT NULL,
  `rua` VARCHAR(100) NULL,
  `cartaConducao` TINYINT NOT NULL,
  `email` VARCHAR(45) NULL,
  `telemovel` INT(9) NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `fk_Cliente_Pais1`
    FOREIGN KEY (`pais`)
    REFERENCES `roadTrip`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Cidade1`
    FOREIGN KEY (`cidade`)
    REFERENCES `roadTrip`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Cliente_Pais1_idx` ON `roadTrip`.`Cliente` (`pais` ASC) VISIBLE;

CREATE INDEX `fk_Cliente_Cidade1_idx` ON `roadTrip`.`Cliente` (`cidade` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `roadTrip`.`Seguro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `roadTrip`.`Seguro` ;

CREATE TABLE IF NOT EXISTS `roadTrip`.`Seguro` (
  `idSeguro` INT NOT NULL AUTO_INCREMENT,
  `dataValidade` DATE NULL,
  `precoSeguro` DECIMAL(8,2) NULL CHECK (precoSeguro>=0),
   `descricao` VARCHAR(100) NULL,
  PRIMARY KEY (`idSeguro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roadTrip`.`Aluguer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `roadTrip`.`Aluguer` ;

CREATE TABLE IF NOT EXISTS `roadTrip`.`Aluguer` (
  `idAluguer` INT NOT NULL AUTO_INCREMENT,
  `dataAluguer` DATE NOT NULL,
  `dataPrevistaLevantamento` DATE NOT NULL,
  `dataPrevistaEntrega` DATE NOT NULL,
  `dataRealEntrega` DATE NULL,
  `Cliente` INT NOT NULL,
  `Veiculo` INT NOT NULL,
  `precoAluguer` DECIMAL(8,2)  NOT NULL ,
  `kmsPercorrido` DECIMAL(8,2) NOT NULL,
  `Seguro` INT NOT NULL,
  `Funcionario` INT NOT NULL,
  `caucao` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`idAluguer`),
  CONSTRAINT `fk_Aluguer_Veiculo1`
    FOREIGN KEY (`Veiculo`)
    REFERENCES `roadTrip`.`Veiculo` (`idVeiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluguer_Seguro1`
    FOREIGN KEY (`Seguro`)
    REFERENCES `roadTrip`.`Seguro` (`idSeguro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluguer_Cliente1`
    FOREIGN KEY (`Cliente`)
    REFERENCES `roadTrip`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluguer_Funcionario1`
    FOREIGN KEY (`Funcionario`)
    REFERENCES `roadTrip`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Aluguer_Veiculo1_idx` ON `roadTrip`.`Aluguer` (`Veiculo` ASC) VISIBLE;

CREATE INDEX `fk_Aluguer_Seguro1_idx` ON `roadTrip`.`Aluguer` (`Seguro` ASC) VISIBLE;

CREATE INDEX `fk_Aluguer_Cliente1_idx` ON `roadTrip`.`Aluguer` (`Cliente` ASC) VISIBLE;

CREATE INDEX `fk_Aluguer_Funcionario1_idx` ON `roadTrip`.`Aluguer` (`Funcionario` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
