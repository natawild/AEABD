-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vendas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vendas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vendas` DEFAULT CHARACTER SET utf8 ;
USE `vendas` ;

-- -----------------------------------------------------
-- Table `vendas`.`Profissao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`Profissao` (
  `id` INT NOT NULL,
  `Designacao` VARCHAR(75) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`Cliente` (
  `nome` VARCHAR(45) NULL,
  `profissao` INT NOT NULL,
  `total` VARCHAR(45) NULL,
  `id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Cliente_Profissao1_idx` (`profissao` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Profissao1`
    FOREIGN KEY (`profissao`)
    REFERENCES `vendas`.`Profissao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`Venda` (
  `nr` INT NOT NULL,
  `data` DATE NULL,
  `total` DECIMAL(8,2) NULL,
  `Cliente` INT NOT NULL,
  PRIMARY KEY (`nr`),
  INDEX `fk_Venda_Cliente1_idx` (`Cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_Cliente1`
    FOREIGN KEY (`Cliente`)
    REFERENCES `vendas`.`Cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`Categoria` (
  `Designacao` VARCHAR(75) NULL,
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`Produto` (
  `id` INT NOT NULL,
  `designacao` TEXT NULL,
  `categoria` INT NOT NULL,
  `preco` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Produto_Categoria1_idx` (`categoria` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_Categoria1`
    FOREIGN KEY (`categoria`)
    REFERENCES `vendas`.`Categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`VendaProduto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`VendaProduto` (
  `Venda` INT NOT NULL,
  `Produto` INT NOT NULL,
  `Quantidade` DECIMAL(8,2) NULL,
  `Preco` DECIMAL(8,2) NULL,
  `Valor` DECIMAL(8,2) NULL,
  PRIMARY KEY (`Venda`, `Produto`),
  INDEX `fk_VendaProduto_Produto1_idx` (`Produto` ASC) VISIBLE,
  CONSTRAINT `fk_VendaProduto_Venda`
    FOREIGN KEY (`Venda`)
    REFERENCES `vendas`.`Venda` (`nr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VendaProduto_Produto1`
    FOREIGN KEY (`Produto`)
    REFERENCES `vendas`.`Produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
