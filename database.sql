-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dbbiblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbbiblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbbiblioteca` DEFAULT CHARACTER SET utf8 ;
USE `dbbiblioteca` ;

-- -----------------------------------------------------
-- Table `dbbiblioteca`.`livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbbiblioteca`.`livro` (
  `n_livro` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `autor` VARCHAR(45) NOT NULL,
  `preco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`n_livro`),
  UNIQUE INDEX `n_livro_UNIQUE` (`n_livro` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `dbbiblioteca`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbbiblioteca`.`user` (
  `n_leitor` INT NOT NULL,
  `nome` VARCHAR(65) NOT NULL,
  `cpostal` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`n_leitor`),
  UNIQUE INDEX `n_leitor_UNIQUE` (`n_leitor` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `dbbiblioteca`.`requisicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbbiblioteca`.`requisicao` (
  `user_n_leitor` INT NOT NULL,
  `livro_n_livro` INT NOT NULL,
  `data_req` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_ent` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_n_leitor`, `livro_n_livro`, `data_req`),
  INDEX `fk_requisicao_livro1_idx` (`livro_n_livro` ASC) VISIBLE,
  CONSTRAINT `fk_requisicao_livro1`
    FOREIGN KEY (`livro_n_livro`)
    REFERENCES `dbbiblioteca`.`livro` (`n_livro`),
  CONSTRAINT `fk_requisicao_user`
    FOREIGN KEY (`user_n_leitor`)
    REFERENCES `dbbiblioteca`.`user` (`n_leitor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
