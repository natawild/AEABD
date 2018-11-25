-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema livro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema livro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `livro` DEFAULT CHARACTER SET utf8 ;
USE `livro` ;

-- -----------------------------------------------------
-- Table `livro`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livro`.`Livro` (
  `idLivro` INT NOT NULL,
  `Titulo` VARCHAR(75) NOT NULL,
  `DataPublicacao` DATE NULL,
  `Notas` TEXT NULL,
  PRIMARY KEY (`idLivro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livro`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livro`.`Autor` (
  `idAutor` INT NOT NULL,
  `Nome` VARCHAR(75) NOT NULL,
  `eMail` VARCHAR(100) NOT NULL,
  `Nacionalidade` VARCHAR(50) NOT NULL,
  `Observacoes` TEXT NULL,
  PRIMARY KEY (`idAutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livro`.`LivroAutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livro`.`LivroAutor` (
  `Livro` INT NOT NULL,
  `Autor` INT NOT NULL,
  PRIMARY KEY (`Livro`, `Autor`),
  INDEX `fk_LivroAutor_Autor1_idx` (`Autor` ASC) VISIBLE,
  CONSTRAINT `fk_LivroAutor_Livro`
    FOREIGN KEY (`Livro`)
    REFERENCES `livro`.`Livro` (`idLivro`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_LivroAutor_Autor1`
    FOREIGN KEY (`Autor`)
    REFERENCES `livro`.`Autor` (`idAutor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
