-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema clinicaVet
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `clinicaVet` ;

-- -----------------------------------------------------
-- Schema clinicaVet
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clinicaVet` DEFAULT CHARACTER SET utf8 ;
USE `clinicaVet` ;

-- -----------------------------------------------------
-- Table `clinicaVet`.`HistorialClinico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clinicaVet`.`HistorialClinico` ;

CREATE TABLE IF NOT EXISTS `clinicaVet`.`HistorialClinico` (
  `idHistorialClinico` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NULL,
  `anotacao` TEXT NULL,
  `animal` INT NULL,
  PRIMARY KEY (`idHistorialClinico`),
  INDEX `fk_HistorialClinico_Animal1_idx` (`animal` ASC) VISIBLE,
  CONSTRAINT `fk_HistorialClinico_Animal1`
    FOREIGN KEY (`animal`)
    REFERENCES `mydb`.`Animal` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinicaVet`.`Consulta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clinicaVet`.`Consulta` ;

CREATE TABLE IF NOT EXISTS `clinicaVet`.`Consulta` (
  `idConsulta` INT NOT NULL AUTO_INCREMENT, 
  `data` DATE NULL,
  `descricao` TEXT NULL,
  PRIMARY KEY (`idConsulta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinicaVet`.`Medico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clinicaVet`.`Medico` ;

CREATE TABLE IF NOT EXISTS `clinicaVet`.`Medico` (
  `idMedico` INT NOT NULL AUTO_INCREMENT, 
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinicaVet`.`Animal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clinicaVet`.`Animal` ;

CREATE TABLE IF NOT EXISTS `clinicaVet`.`Animal` (
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
    REFERENCES `mydb`.`Medico` (`idMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Animal_Proprietario1`
    FOREIGN KEY (`proprietario`)
    REFERENCES `mydb`.`Proprietario` (`idProprietario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Animal_HistorialClinico1_idx` ON `clinicaVet`.`Animal` (`historialClinico` ASC) VISIBLE;

CREATE INDEX `fk_Animal_Consulta1_idx` ON `clinicaVet`.`Animal` (`consulta` ASC) VISIBLE;

CREATE INDEX `fk_Animal_Medico1_idx` ON `clinicaVet`.`Animal` (`medico` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `clinicaVet`.`Proprietario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clinicaVet`.`Proprietario` ;
CREATE TABLE IF NOT EXISTS `clinicaVet`.`Proprietario` (
  `idProprietario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `telefone` INT NULL,
  `rua` VARCHAR(45) NULL,
  `localidade` VARCHAR(45) NULL,
  `codPostal` VARCHAR(45) NULL,
  PRIMARY KEY (`idProprietario`))
ENGINE = InnoDB;

CREATE INDEX `fk_Proprietario_Animal_idx` ON `clinicaVet`.`Proprietario` (`animal` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `clinicaVet`.`Vacina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clinicaVet`.`Vacina` ;

CREATE TABLE IF NOT EXISTS `clinicaVet`.`Vacina` (
  `idVacina` INT NOT NULL AUTO_INCREMENT, 
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idVacina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinicaVet`.`Medicamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clinicaVet`.`Medicamento` ;

CREATE TABLE IF NOT EXISTS `clinicaVet`.`Medicamento` (
  `idMedicamento` INT NOT NULL AUTO_INCREMENT, 
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinicaVet`.`AnimalVacina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clinicaVet`.`AnimalVacina` ;

CREATE TABLE IF NOT EXISTS `clinicaVet`.`AnimalVacina` (
  `animal` INT NOT NULL,
  `vacina` INT NOT NULL,
  `data` DATE NULL,
  `peso` DECIMAL(5,2) NULL CHECK (peso>=0),
  PRIMARY KEY (`animal`, `vacina`),
  CONSTRAINT `fk_AnimalVacina_Animal1`
    FOREIGN KEY (`animal`)
    REFERENCES `clinicaVet`.`Animal` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AnimalVacina_Vacina1`
    FOREIGN KEY (`vacina`)
    REFERENCES `clinicaVet`.`Vacina` (`idVacina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_AnimalVacina_Vacina1_idx` ON `clinicaVet`.`AnimalVacina` (`vacina` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `clinicaVet`.`AnimalMedicamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clinicaVet`.`AnimalMedicamento` ;

CREATE TABLE IF NOT EXISTS `clinicaVet`.`AnimalMedicamento` (
  `animal` INT NOT NULL,
  `medicamento` INT NOT NULL,
    `data` DATE NULL,
  `dosagem` DECIMAL(6,3) NULL CHECK (dosagem>=0),
  PRIMARY KEY (`animal`, `medicamento`),
  CONSTRAINT `fk_AnimalMedicamento_Medicamento1`
    FOREIGN KEY (`medicamento`)
    REFERENCES `clinicaVet`.`Medicamento` (`idMedicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AnimalMedicamento_Animal1`
    FOREIGN KEY (`animal`)
    REFERENCES `clinicaVet`.`Animal` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_AnimalMedicamento_Medicamento1_idx` ON `clinicaVet`.`AnimalMedicamento` (`medicamento` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
