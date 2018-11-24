-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema onRoad
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `onRoad` ;

-- -----------------------------------------------------
-- Schema onRoad
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `onRoad` DEFAULT CHARACTER SET utf8 ;
USE `onRoad` ;

-- -----------------------------------------------------
-- Table `onRoad`.`Pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onRoad`.`Pais` ;

CREATE TABLE IF NOT EXISTS `onRoad`.`Pais` (
  `idPais` INT NOT NULL,
  `descricao` TEXT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onRoad`.`Cidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onRoad`.`Cidade` ;

CREATE TABLE IF NOT EXISTS `onRoad`.`Cidade` (
  `idCidade` INT NOT NULL,
  `descricao` TEXT NULL,
  `pais` INT NULL,
  PRIMARY KEY (`idCidade`),
  CONSTRAINT `fk_Cidade_Pais1`
    FOREIGN KEY (`pais`)
    REFERENCES `onRoad`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Cidade_Pais1_idx` ON `onRoad`.`Cidade` (`pais` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `onRoad`.`Funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onRoad`.`Funcionario` ;

CREATE TABLE IF NOT EXISTS `onRoad`.`Funcionario` (
  `idFuncionario` INT NOT NULL,
  `data_contrato` DATE NOT NULL,
  `salario` DECIMAL(8,2) NOT NULL,
  `telemovel` INT NULL,
  `email` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  `FuncionarioSuperior` INT NULL,
  `cidade` INT NULL,
  `pais` INT NULL,
  `rua` VARCHAR(75) NULL,
  PRIMARY KEY (`idFuncionario`),
  CONSTRAINT `fk_FuncionarioSuperior`
    FOREIGN KEY (`FuncionarioSuperior`)
    REFERENCES `onRoad`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_Cidade1`
    FOREIGN KEY (`cidade`)
    REFERENCES `onRoad`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_Pais1`
    FOREIGN KEY (`pais`)
    REFERENCES `onRoad`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FuncionarioSuperior_idx` ON `onRoad`.`Funcionario` (`FuncionarioSuperior` ASC) VISIBLE;

CREATE INDEX `fk_Funcionario_Cidade1_idx` ON `onRoad`.`Funcionario` (`cidade` ASC) VISIBLE;

CREATE INDEX `fk_Funcionario_Pais1_idx` ON `onRoad`.`Funcionario` (`pais` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `onRoad`.`Veiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onRoad`.`Veiculo` ;

CREATE TABLE IF NOT EXISTS `onRoad`.`Veiculo` (
  `idVeiculo` INT NOT NULL,
  `matricula` VARCHAR(45) NOT NULL,
  `precoEmNovo` DECIMAL(8,2) NULL,
  `marca` VARCHAR(50) NULL,
  `modelo` VARCHAR(75) NULL,
  `nr_Kms` DECIMAL(8,2) NULL,
  `anoCompra` DATE NULL,
  `taxaDesvalorizacao` DECIMAL(8,3) NULL,
  PRIMARY KEY (`idVeiculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onRoad`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onRoad`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `onRoad`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(75) NULL,
  `nif` INT NULL,
  `dataNascimento` DATE NULL,
  `pais` INT NULL,
  `cidade` INT NULL,
  `rua` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `fk_Cliente_Pais1`
    FOREIGN KEY (`pais`)
    REFERENCES `onRoad`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Cidade1`
    FOREIGN KEY (`cidade`)
    REFERENCES `onRoad`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Cliente_Pais1_idx` ON `onRoad`.`Cliente` (`pais` ASC) VISIBLE;

CREATE INDEX `fk_Cliente_Cidade1_idx` ON `onRoad`.`Cliente` (`cidade` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `onRoad`.`Seguro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onRoad`.`Seguro` ;

CREATE TABLE IF NOT EXISTS `onRoad`.`Seguro` (
  `idSeguro` INT NOT NULL,
  `dataValidade` DATE NULL,
  `precoSeguro` DECIMAL(8,2) NULL,
  PRIMARY KEY (`idSeguro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onRoad`.`Aluguer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `onRoad`.`Aluguer` ;

CREATE TABLE IF NOT EXISTS `onRoad`.`Aluguer` (
  `idAluguer` INT NOT NULL,
  `dataAluguer` DATE NULL,
  `dataPrevistaLevantamento` DATE NULL,
  `dataPrevistaEntrega` DATE NULL,
  `dataRealEntrega` DATE NULL,
  `Cliente` INT NOT NULL,
  `Veiculo` INT NOT NULL,
  `precoAluguer` DECIMAL(8,2) NULL,
  `kmsPercorrido` DECIMAL(8,2) NULL,
  `Seguro` INT NOT NULL,
  `campanhaDesconto` FLOAT NULL,
  `Funcionario` INT NOT NULL,
  `caucao` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`idAluguer`),
  CONSTRAINT `fk_Aluguer_Veiculo1`
    FOREIGN KEY (`Veiculo`)
    REFERENCES `onRoad`.`Veiculo` (`idVeiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluguer_Seguro1`
    FOREIGN KEY (`Seguro`)
    REFERENCES `onRoad`.`Seguro` (`idSeguro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluguer_Cliente1`
    FOREIGN KEY (`Cliente`)
    REFERENCES `onRoad`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluguer_Funcionario1`
    FOREIGN KEY (`Funcionario`)
    REFERENCES `onRoad`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Aluguer_Veiculo1_idx` ON `onRoad`.`Aluguer` (`Veiculo` ASC) VISIBLE;

CREATE INDEX `fk_Aluguer_Seguro1_idx` ON `onRoad`.`Aluguer` (`Seguro` ASC) VISIBLE;

CREATE INDEX `fk_Aluguer_Cliente1_idx` ON `onRoad`.`Aluguer` (`Cliente` ASC) VISIBLE;

CREATE INDEX `fk_Aluguer_Funcionario1_idx` ON `onRoad`.`Aluguer` (`Funcionario` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
