-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema livroReceitas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema livroReceitas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `livroReceitas` DEFAULT CHARACTER SET utf8 ;
USE `livroReceitas` ;

-- -----------------------------------------------------
-- Table `livroReceitas`.`Receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livroReceitas`.`Receita` (
  `idReceita` INT NOT NULL,
  `Designacao` VARCHAR(50) NULL,
  `Custo` DECIMAL(8,2) NULL,
  `Calorias` DECIMAL(9,2) NULL,
  `Dose` DECIMAL(8,2) NULL,
  `Grau de Dificuldade` VARCHAR(45) NULL,
  `Observacoes` VARCHAR(45) NULL,
  `Tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idReceita`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livroReceitas`.`Ingrediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livroReceitas`.`Ingrediente` (
  `idIngrediente` INT NOT NULL,
  `Designacao` VARCHAR(50) NULL,
  `CustoUnitario` DECIMAL(8,2) NULL,
  PRIMARY KEY (`idIngrediente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livroReceitas`.`Equipamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livroReceitas`.`Equipamento` (
  `idEquipamento` INT NOT NULL,
  `Designacao` VARCHAR(45) NULL,
  PRIMARY KEY (`idEquipamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livroReceitas`.`Tarefa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livroReceitas`.`Tarefa` (
  `idTarefa` INT NOT NULL,
  `designacao` VARCHAR(100) NULL,
  PRIMARY KEY (`idTarefa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livroReceitas`.`ReceitaIngredienteEquipamentoTarefas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livroReceitas`.`ReceitaIngredienteEquipamentoTarefas` (
  `Receita` INT NOT NULL,
  `Ingrediente` INT NOT NULL,
  `Opcional` TINYINT NULL,
  `Quantidae` DECIMAL(8,2) NULL,
  `Equipamento` INT NOT NULL,
  `Tarefa` INT NOT NULL,
  `tempo` DECIMAL(6,2) NULL,
  `OrdemDasTarefas` INT NULL,
  PRIMARY KEY (`Receita`, `Ingrediente`, `Equipamento`, `Tarefa`),
  INDEX `fk_ReceitaIngredienteEquipamentoTarefas_Ingrediente1_idx` (`Ingrediente` ASC) VISIBLE,
  INDEX `fk_ReceitaIngredienteEquipamentoTarefas_Equipamento1_idx` (`Equipamento` ASC) VISIBLE,
  INDEX `fk_ReceitaIngredienteEquipamentoTarefas_Tarefa1_idx` (`Tarefa` ASC) VISIBLE,
  CONSTRAINT `fk_ReceitaIngredienteEquipamentoTarefas_Receita`
    FOREIGN KEY (`Receita`)
    REFERENCES `livroReceitas`.`Receita` (`idReceita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReceitaIngredienteEquipamentoTarefas_Ingrediente1`
    FOREIGN KEY (`Ingrediente`)
    REFERENCES `livroReceitas`.`Ingrediente` (`idIngrediente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReceitaIngredienteEquipamentoTarefas_Equipamento1`
    FOREIGN KEY (`Equipamento`)
    REFERENCES `livroReceitas`.`Equipamento` (`idEquipamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReceitaIngredienteEquipamentoTarefas_Tarefa1`
    FOREIGN KEY (`Tarefa`)
    REFERENCES `livroReceitas`.`Tarefa` (`idTarefa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
