user-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema teachar
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema teachar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `teachar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `names` VARCHAR(100) NOT NULL,
  `last_names` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `state` INT(1) NOT NULL DEFAULT 0,
  `roles_id` INT NOT NULL,
  `created_at` DATE NULL,
  `updated_at` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_roles_idx` (`roles_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_roles`
    FOREIGN KEY (`roles_id`)
    REFERENCES `mydb`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`taxonomy_bird`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`taxonomy_bird` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order` VARCHAR(50) NOT NULL,
  `family` VARCHAR(50) NOT NULL,
  `species` VARCHAR(50) NOT NULL,
  `created_at` DATE NULL,
  `updated_at` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`genetic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genetic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `genbank_code` VARCHAR(100) NOT NULL,
  `molecular_marker` VARCHAR(100) NOT NULL,
  `created_at` DATE NULL,
  `updated_at` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`parasite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`parasite` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `gender` VARCHAR(100) NOT NULL,
  `created_at` DATE NULL,
  `updated_at` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`countrie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`countrie` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`geographic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`geographic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `latitude` FLOAT NOT NULL,
  `longitude` FLOAT NOT NULL,
  `location` VARCHAR(100) NOT NULL,
  `elevation` FLOAT NOT NULL,
  `countrie_id` INT NOT NULL,
  `created_at` DATE NULL,
  `updated_at` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_geographic_countrie1_idx` (`countrie_id` ASC) VISIBLE,
  CONSTRAINT `fk_geographic_countrie1`
    FOREIGN KEY (`countrie_id`)
    REFERENCES `mydb`.`countrie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`biological_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`biological_data` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bibliographic_ref` VARCHAR(100) NULL,
  `users_id` INT NOT NULL,
  `geographic_id` INT NOT NULL,
  `taxonomy_birds_id` INT NOT NULL,
  `genetic_id` INT NOT NULL,
  `parasite_id` INT NOT NULL,
  `created_at` DATE NULL,
  `updated_at` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_biological_data_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_biological_data_taxonomy_birds1_idx` (`taxonomy_birds_id` ASC) VISIBLE,
  INDEX `fk_biological_data_genetic1_idx` (`genetic_id` ASC) VISIBLE,
  INDEX `fk_biological_data_parasite1_idx` (`parasite_id` ASC) VISIBLE,
  INDEX `fk_biological_data_geographic1_idx` (`geographic_id` ASC) VISIBLE,
  CONSTRAINT `fk_biological_data_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_biological_data_taxonomy_birds1`
    FOREIGN KEY (`taxonomy_birds_id`)
    REFERENCES `mydb`.`taxonomy_bird` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_biological_data_genetic1`
    FOREIGN KEY (`genetic_id`)
    REFERENCES `mydb`.`genetic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_biological_data_parasite1`
    FOREIGN KEY (`parasite_id`)
    REFERENCES `mydb`.`parasite` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_biological_data_geographic1`
    FOREIGN KEY (`geographic_id`)
    REFERENCES `mydb`.`geographic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`support`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`support` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_user` INT NOT NULL,
  `decription` MEDIUMTEXT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `identification` VARCHAR(100) NOT NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_user_UNIQUE` (`id_user` ASC) VISIBLE)
ENGINE = InnoDB;

USE `teachar` ;

-- -----------------------------------------------------
-- Table `teachar`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teachar`.`users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `identification` INT NOT NULL,
  `name` VARCHAR(191) NOT NULL,
  `last_name` VARCHAR(191) NOT NULL,
  `username` VARCHAR(191) NOT NULL,
  `email` VARCHAR(191) NOT NULL,
  `password` VARCHAR(191) NOT NULL,
  `state` ENUM('Activo', 'Inactivo') NOT NULL DEFAULT 'Activo',
  `remember_token` VARCHAR(100) NULL DEFAULT NULL,
  `last_login_at` TIMESTAMP NULL DEFAULT NULL,
  `last_login_ip` VARCHAR(191) NULL DEFAULT NULL,
  `session_id` TEXT NULL DEFAULT NULL COMMENT 'Almacena el id de la sesión del usuario',
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `current_sign_in_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `users_identification_unique` (`identification` ASC) VISIBLE,
  UNIQUE INDEX `users_username_unique` (`username` ASC) VISIBLE,
  UNIQUE INDEX `users_email_unique` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `teachar`.`bd_modulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teachar`.`bd_modulos` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(191) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `foto` VARCHAR(191) NULL DEFAULT NULL,
  `estado` ENUM('Activo', 'Inactivo') NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `slug` VARCHAR(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `bd_modulos_nombre_unique` (`nombre` ASC) VISIBLE,
  UNIQUE INDEX `bd_modulos_slug_unique` (`slug` ASC) VISIBLE,
  INDEX `bd_modulos_user_id_foreign` (`user_id` ASC) VISIBLE,
  CONSTRAINT `bd_modulos_user_id_foreign`
    FOREIGN KEY (`user_id`)
    REFERENCES `teachar`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `teachar`.`bd_temas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teachar`.`bd_temas` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(191) NOT NULL,
  `descripcion` VARCHAR(191) NOT NULL,
  `video_url` VARCHAR(191) NOT NULL,
  `estado` ENUM('Activo', 'Inactivo') NOT NULL,
  `modulo_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `slug` VARCHAR(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `bd_temas_nombre_unique` (`nombre` ASC) VISIBLE,
  UNIQUE INDEX `bd_temas_slug_unique` (`slug` ASC) VISIBLE,
  INDEX `bd_temas_modulo_id_foreign` (`modulo_id` ASC) VISIBLE,
  CONSTRAINT `bd_temas_modulo_id_foreign`
    FOREIGN KEY (`modulo_id`)
    REFERENCES `teachar`.`bd_modulos` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `teachar`.`bd_objetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teachar`.`bd_objetos` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(191) NOT NULL,
  `nombre_modelo` VARCHAR(191) NOT NULL,
  `src` VARCHAR(191) NOT NULL,
  `material` VARCHAR(191) NOT NULL,
  `format` VARCHAR(191) NOT NULL,
  `scaleInc` DOUBLE(8,2) NOT NULL,
  `scale` VARCHAR(191) NOT NULL,
  `positionH` VARCHAR(191) NOT NULL,
  `rotationH` VARCHAR(191) NOT NULL,
  `positionV` VARCHAR(191) NOT NULL,
  `rotationV` VARCHAR(191) NOT NULL,
  `tema_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `bd_objetos_titulo_unique` (`titulo` ASC) VISIBLE,
  INDEX `bd_objetos_tema_id_foreign` (`tema_id` ASC) VISIBLE,
  CONSTRAINT `bd_objetos_tema_id_foreign`
    FOREIGN KEY (`tema_id`)
    REFERENCES `teachar`.`bd_temas` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `teachar`.`migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teachar`.`migrations` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(191) NOT NULL,
  `batch` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `teachar`.`password_resets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teachar`.`password_resets` (
  `email` VARCHAR(191) NOT NULL,
  `token` VARCHAR(191) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  INDEX `password_resets_email_index` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `teachar`.`role_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teachar`.`role_user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `teachar`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teachar`.`roles` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(191) NOT NULL,
  `description` VARCHAR(191) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;role


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
