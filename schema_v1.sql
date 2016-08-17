SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Users` (
  `user_id` INT NOT NULL AUTO_INCREMENT ,
  `user_name` VARCHAR(45) NOT NULL ,
  `first_name` VARCHAR(45) NOT NULL ,
  `last_name` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `address` VARCHAR(45) NULL ,
  `zip_code` INT NOT NULL ,
  `country` VARCHAR(45) NOT NULL ,
  `join_date` DATETIME NULL ,
  PRIMARY KEY (`user_id`) ,
  UNIQUE INDEX `User Name_UNIQUE` (`user_name` ASC) ,
  UNIQUE INDEX `Email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Categories` (
  `category_id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `type` VARCHAR(45) NULL ,
  PRIMARY KEY (`category_id`) ,
  UNIQUE INDEX `Name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sub_Categories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Sub_Categories` (
  `sub_category_id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `category` INT NULL ,
  PRIMARY KEY (`sub_category_id`) ,
  UNIQUE INDEX `Name_UNIQUE` (`name` ASC) ,
  INDEX `category` (`category` ASC) ,
  CONSTRAINT `category`
    FOREIGN KEY (`category` )
    REFERENCES `mydb`.`Categories` (`category_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Locations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Locations` (
  `location_id` INT NOT NULL AUTO_INCREMENT ,
  `city` VARCHAR(45) NOT NULL ,
  `country` VARCHAR(45) NOT NULL ,
  `zip_code` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`location_id`) ,
  UNIQUE INDEX `zip_code_UNIQUE` (`zip_code` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Posts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Posts` (
  `post_id` INT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(45) NULL ,
  `sub_category` INT NULL ,
  `post_date` DATETIME NOT NULL ,
  `location` INT NULL ,
  `user` INT NULL ,
  PRIMARY KEY (`post_id`) ,
  INDEX `user` (`user` ASC) ,
  INDEX `sub_category` (`sub_category` ASC) ,
  INDEX `location` (`location` ASC) ,
  CONSTRAINT `user`
    FOREIGN KEY (`user` )
    REFERENCES `mydb`.`Users` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sub_category`
    FOREIGN KEY (`sub_category` )
    REFERENCES `mydb`.`Sub_Categories` (`sub_category_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `location`
    FOREIGN KEY (`location` )
    REFERENCES `mydb`.`Locations` (`location_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

