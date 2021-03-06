-- MySQL Script generated by MySQL Workbench
-- Tue May 31 21:57:15 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ecomerce_n1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ecomerce_n1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecomerce_n1` DEFAULT CHARACTER SET utf8 ;
USE `ecomerce_n1` ;

-- -----------------------------------------------------
-- Table `ecomerce_n1`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecomerce_n1`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `codigopostal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecomerce_n1`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecomerce_n1`.`empleados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` VARCHAR(45) NOT NULL,
  `DNI` INT NOT NULL,
  `num_cedula` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecomerce_n1`.`ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecomerce_n1`.`ordenes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha_orden` VARCHAR(45) NOT NULL,
  `cliente_id` INT NOT NULL,
  `empleado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `cliente_id_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `empleado_id_idx` (`empleado_id` ASC) VISIBLE,
  CONSTRAINT `cliente_id`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `ecomerce_n1`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `empleado_id`
    FOREIGN KEY (`empleado_id`)
    REFERENCES `ecomerce_n1`.`empleados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecomerce_n1`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecomerce_n1`.`productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecomerce_n1`.`detalles_orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecomerce_n1`.`detalles_orden` (
  `id` INT NOT NULL,
  `orden_id` INT NOT NULL,
  `producto_id` INT NOT NULL,
  `precio_unid` INT NOT NULL,
  `precio_mayorista` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ordenes_has_productos_productos1_idx` (`producto_id` ASC) VISIBLE,
  INDEX `fk_ordenes_has_productos_ordenes1_idx` (`orden_id` ASC) VISIBLE,
  CONSTRAINT `fk_ordenes_has_productos_ordenes1`
    FOREIGN KEY (`orden_id`)
    REFERENCES `ecomerce_n1`.`ordenes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordenes_has_productos_productos1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `ecomerce_n1`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
