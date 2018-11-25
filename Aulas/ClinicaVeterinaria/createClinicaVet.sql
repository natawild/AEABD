-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema clinica
-- -----------------------------------------------------
-- DROP SCHEMA IF EXISTS `clinica` ;
-- -----------------------------------------------------
-- Schema clinica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clinica` DEFAULT CHARACTER SET utf8 ;
USE `clinica` ;

-- -----------------------------------------------------
-- Table `clinica`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`Medico` (
  `idMedico` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinica`.`Proprietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`Proprietario` (
  `idProprietario` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `telefone` INT NULL,
  `rua` VARCHAR(45) NULL,
  `localidade` VARCHAR(45) NULL,
  `codPostal` VARCHAR(45) NULL,
  PRIMARY KEY (`idProprietario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinica`.`Animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`Animal` (
  `idAnimal` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `raca` VARCHAR(45) NULL,
  `nascimento` DATE NULL,
  `medico` INT NULL,
  `observacoes` TEXT NULL,
  `proprietario` INT NULL,
  PRIMARY KEY (`idAnimal`),
  INDEX `fk_Animal_Medico1_idx` (`medico` ASC) VISIBLE,
  INDEX `fk_Animal_Proprietario1_idx` (`proprietario` ASC) VISIBLE,
  CONSTRAINT `fk_Animal_Medico1`
    FOREIGN KEY (`medico`)
    REFERENCES `clinica`.`Medico` (`idMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Animal_Proprietario1`
    FOREIGN KEY (`proprietario`)
    REFERENCES `clinica`.`Proprietario` (`idProprietario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinica`.`Vacina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`Vacina` (
  `idVacina` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idVacina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinica`.`Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`Medicamento` (
  `idMedicamento` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinica`.`HistorialClinico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`HistorialClinico` (
  `idHistorialClinico` INT NOT NULL,
  `data` DATE NULL,
  `anotacao` TEXT NULL,
  `animal` INT NULL,
  PRIMARY KEY (`idHistorialClinico`),
  INDEX `fk_HistorialClinico_Animal1_idx` (`animal` ASC) VISIBLE,
  CONSTRAINT `fk_HistorialClinico_Animal1`
    FOREIGN KEY (`animal`)
    REFERENCES `clinica`.`Animal` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinica`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`Consulta` (
  `idConsulta` INT NOT NULL,
  `data` DATE NULL,
  `descricao` TEXT NULL,
  `animal` INT NULL,
  PRIMARY KEY (`idConsulta`),
  INDEX `fk_Consulta_Animal1_idx` (`animal` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Animal1`
    FOREIGN KEY (`animal`)
    REFERENCES `clinica`.`Animal` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinica`.`AnimalVacina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`AnimalVacina` (
  `animal` INT NOT NULL,
  `vacina` INT NOT NULL,
  `data` DATE NULL,
  `peso` DECIMAL(5,2) NULL,
  PRIMARY KEY (`animal`, `vacina`),
  INDEX `fk_AnimalVacina_Vacina1_idx` (`vacina` ASC) VISIBLE,
  CONSTRAINT `fk_AnimalVacina_Animal1`
    FOREIGN KEY (`animal`)
    REFERENCES `clinica`.`Animal` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AnimalVacina_Vacina1`
    FOREIGN KEY (`vacina`)
    REFERENCES `clinica`.`Vacina` (`idVacina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinica`.`AnimalMedicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`AnimalMedicamento` (
  `animal` INT NOT NULL,
  `medicamento` INT NOT NULL,
  `data` DATE NULL,
  `dosagem` DECIMAL(6,3) NULL,
  PRIMARY KEY (`animal`, `medicamento`),
  INDEX `fk_AnimalMedicamento_Medicamento1_idx` (`medicamento` ASC) VISIBLE,
  CONSTRAINT `fk_AnimalMedicamento_Medicamento1`
    FOREIGN KEY (`medicamento`)
    REFERENCES `clinica`.`Medicamento` (`idMedicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AnimalMedicamento_Animal1`
    FOREIGN KEY (`animal`)
    REFERENCES `clinica`.`Animal` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
