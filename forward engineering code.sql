-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema stanpe4963informudb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `stanpe4963informudb` ;

-- -----------------------------------------------------
-- Schema stanpe4963informudb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `stanpe4963informudb` DEFAULT CHARACTER SET utf8 ;
USE `stanpe4963informudb` ;

-- -----------------------------------------------------
-- Table `stanpe4963informudb`.`supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stanpe4963informudb`.`supplier` ;

CREATE TABLE IF NOT EXISTS `stanpe4963informudb`.`supplier` (
  `supplierID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplierName` VARCHAR(1000) NOT NULL,
  `contactName` VARCHAR(45) NULL DEFAULT NULL,
  `phoneNumber` VARCHAR(20) NOT NULL,
  `addressLine1` VARCHAR(200) NOT NULL,
  `addressLine2` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zipcode` INT(5) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`supplierID`),
  UNIQUE INDEX `customerID_UNIQUE` (`supplierID` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1001
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stanpe4963informudb`.`components`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stanpe4963informudb`.`components` ;

CREATE TABLE IF NOT EXISTS `stanpe4963informudb`.`components` (
  `ComponentID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ComponentName` VARCHAR(1000) NOT NULL,
  `SupplierID` INT(10) UNSIGNED NOT NULL,
  `Inventory` INT(11) NOT NULL,
  `price` varchar(10) NOT NULL,
  PRIMARY KEY (`ComponentID`),
  UNIQUE INDEX `ComponentID_UNIQUE` (`ComponentID` ASC),
  INDEX `fk_Component_supplier1_idx` (`SupplierID` ASC),
  CONSTRAINT `fk_Component_supplier1`
    FOREIGN KEY (`SupplierID`)
    REFERENCES `stanpe4963informudb`.`supplier` (`supplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stanpe4963informudb`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stanpe4963informudb`.`customer` ;

CREATE TABLE IF NOT EXISTS `stanpe4963informudb`.`customer` (
  `customerID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customerName` VARCHAR(1000) NOT NULL,
  `contactName` VARCHAR(1000) not NULL ,
  `phoneNumber` VARCHAR(20) NOT NULL,
  `addressLine1` VARCHAR(45) NOT NULL,
  `addressLine2` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zipcode` INT(5) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE INDEX `customerID_UNIQUE` (`customerID` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 501
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stanpe4963informudb`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stanpe4963informudb`.`employee` ;

CREATE TABLE IF NOT EXISTS `stanpe4963informudb`.`employee` (
  `employeeID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastName` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `reportsToID` INT(10) UNSIGNED NULL DEFAULT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phoneNumber` VARCHAR(20) NOT NULL,
  `Jobtitle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employeeID`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stanpe4963informudb`.`orderstatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stanpe4963informudb`.`orderstatus` ;

CREATE TABLE IF NOT EXISTS `stanpe4963informudb`.`orderstatus` (
  `orderstatusid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`orderstatusid`),
  UNIQUE INDEX `paymentypeid_UNIQUE` (`orderstatusid` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stanpe4963informudb`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stanpe4963informudb`.`orders` ;

CREATE TABLE IF NOT EXISTS `stanpe4963informudb`.`orders` (
  `orderID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customerID` INT(10) UNSIGNED NOT NULL,
  `orderDate` DATETIME NOT NULL,
  `shippedDate` DATETIME NOT NULL,
  `deliveryDate` DATETIME NOT NULL,
  `orderstatusID` INT(10) UNSIGNED NOT NULL,
  `comments` VARCHAR(100) NULL DEFAULT NULL,
  `employeeID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `fk_order_employee1_idx` (`employeeID` ASC),
  INDEX `fk_order_customer1_idx` (`customerID` ASC),
  INDEX `fk_order_ordertype1_idx` (`orderstatusID` ASC),
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customerID`)
    REFERENCES `stanpe4963informudb`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_employee1`
    FOREIGN KEY (`employeeID`)
    REFERENCES `stanpe4963informudb`.`employee` (`employeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_ordertype1`
    FOREIGN KEY (`orderstatusID`)
    REFERENCES `stanpe4963informudb`.`orderstatus` (`orderstatusid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1001
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stanpe4963informudb`.`producttype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stanpe4963informudb`.`producttype` ;

CREATE TABLE IF NOT EXISTS `stanpe4963informudb`.`producttype` (
  `productTypeID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `producttypename` VARCHAR(45) NOT NULL,
  `descrption` VARCHAR(248) NOT NULL,
  PRIMARY KEY (`productTypeID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stanpe4963informudb`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stanpe4963informudb`.`product` ;

CREATE TABLE IF NOT EXISTS `stanpe4963informudb`.`product` (
  `productid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `productTypeID` INT(10) UNSIGNED NOT NULL,
  `productname` VARCHAR(45) NOT NULL,
  `productCost` varchar(11) NOT NULL,
  `productMSRP` varchar(11) NOT NULL,
  `productDescription` VARCHAR(45) NOT NULL,
  `quantityInStock` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`productid`),
  UNIQUE INDEX `idproduct_UNIQUE` (`productid` ASC),
  INDEX `fk_product_productType1_idx` (`productTypeID` ASC),
  CONSTRAINT `fk_product_productType1`
    FOREIGN KEY (`productTypeID`)
    REFERENCES `stanpe4963informudb`.`producttype` (`productTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1001
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stanpe4963informudb`.`orderdetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stanpe4963informudb`.`orderdetails` ;

CREATE TABLE IF NOT EXISTS `stanpe4963informudb`.`orderdetails` (
  `DetailID` INT(10) UNSIGNED NOT NULL,
  `OrderID` INT(10) UNSIGNED NOT NULL,
  `ProductID` INT(10) UNSIGNED NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` INT(11) NOT NULL,
  PRIMARY KEY (`DetailID`),
  INDEX `fk_OrderDetails_order1_idx` (`OrderID` ASC),
  INDEX `fk_OrderDetails_product1_idx` (`ProductID` ASC),
  CONSTRAINT `fk_OrderDetails_order1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `stanpe4963informudb`.`orders` (`orderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDetails_product1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `stanpe4963informudb`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stanpe4963informudb`.`paymentstatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stanpe4963informudb`.`paymentstatus` ;

CREATE TABLE IF NOT EXISTS `stanpe4963informudb`.`paymentstatus` (
  `paymentstatusid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`paymentstatusid`),
  UNIQUE INDEX `paymentstatusid_UNIQUE` (`paymentstatusid` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stanpe4963informudb`.`paymenttype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stanpe4963informudb`.`paymenttype` ;

CREATE TABLE IF NOT EXISTS `stanpe4963informudb`.`paymenttype` (
  `paymenttypeid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`paymenttypeid`),
  UNIQUE INDEX `paymentypeid_UNIQUE` (`paymenttypeid` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stanpe4963informudb`.`payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stanpe4963informudb`.`payment` ;

CREATE TABLE IF NOT EXISTS `stanpe4963informudb`.`payment` (
  `PaymentID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Amount` varchar(11) NOT NULL,
  `customerID` INT(10) UNSIGNED NOT NULL,
  `PaymentTypeID` INT(10) UNSIGNED NOT NULL,
  `PaymentDate` DATETIME NOT NULL,
  `PaymentstatusID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`PaymentID`),
  UNIQUE INDEX `PaymentID_UNIQUE` (`PaymentID` ASC),
  INDEX `fk_Payment_customer1_idx` (`customerID` ASC),
  INDEX `fk_Payment_paymentype1_idx` (`PaymentTypeID` ASC),
  INDEX `fk_Payment_paymentstatus1_idx` (`PaymentstatusID` ASC),
  CONSTRAINT `fk_Payment_customer1`
    FOREIGN KEY (`customerID`)
    REFERENCES `stanpe4963informudb`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payment_paymentype1`
    FOREIGN KEY (`PaymentTypeID`)
    REFERENCES `stanpe4963informudb`.`paymenttype` (`paymenttypeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payment_paymentstatus1`
    FOREIGN KEY (`PaymentstatusID`)
    REFERENCES `stanpe4963informudb`.`paymentstatus` (`paymentstatusid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

ENGINE = InnoDB
AUTO_INCREMENT = 1001
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stanpe4963informudb`.`productrequirement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stanpe4963informudb`.`productrequirement` ;

CREATE TABLE IF NOT EXISTS `stanpe4963informudb`.`productrequirement` (
  `requirementID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `productID` INT(10) UNSIGNED NOT NULL,
  `componentID` INT(10) UNSIGNED NOT NULL,
  `quantity` INT(11) NOT NULL,
  PRIMARY KEY (`requirementID`),
  UNIQUE INDEX `ProductRequirementID_UNIQUE` (`requirementID` ASC),
  INDEX `fk_ProductRequirement_product1_idx` (`productID` ASC),
  INDEX `fk_ProductRequirement_Componant1_idx` (`componentID` ASC),
  CONSTRAINT `fk_ProductRequirement_Componant1`
    FOREIGN KEY (`componentID`)
    REFERENCES `stanpe4963informudb`.`components` (`ComponentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductRequirement_product1`
    FOREIGN KEY (`productID`)
    REFERENCES `stanpe4963informudb`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
