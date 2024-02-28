CREATE DATABASE  IF NOT EXISTS `greenspotdatabase` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `greenspotdatabase`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: greenspotdatabase
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `idCustomers` int NOT NULL AUTO_INCREMENT,
  `address` varchar(45) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCustomers`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'123 Main Street','John','Doe','john.doe@example.com'),(2,'456 Oak Avenue','Jane','Smith','jane.smith@example.com'),(3,'789 Pine Road','Bob','Johnson','bob.johnson@example.com'),(4,'101 Maple Lane','Alice','Williams','alice.williams@example.com'),(5,'202 Cedar Street','Charlie','Brown','charlie.brown@example.com'),(6,'303 Elm Drive','Eva','Davis','eva.davis@example.com'),(7,'404 Birch Road','Frank','Miller','frank.miller@example.com'),(8,'505 Spruce Avenue','Grace','Taylor','grace.taylor@example.com'),(9,'606 Oak Lane','Henry','Jones','henry.jones@example.com'),(10,'707 Pine Street','Ivy','Martin','ivy.martin@example.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `iditems` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `QuantityOnHand` int DEFAULT NULL,
  `Cost` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `DateSold` date DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `itemType` varchar(45) DEFAULT NULL,
  `vendoraddress` varchar(45) DEFAULT NULL,
  `vendors_idvendors` int NOT NULL,
  PRIMARY KEY (`iditems`,`vendors_idvendors`),
  KEY `fk_items_vendors1_idx` (`vendors_idvendors`),
  CONSTRAINT `fk_items_vendors1` FOREIGN KEY (`vendors_idvendors`) REFERENCES `vendors` (`idvendors`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Laptop',20,800.00,1200.00,NULL,'Warehouse A','pcs','Electronics','123 Main Street',1),(2,'Printer',15,300.00,500.00,NULL,'Warehouse B','pcs','Electronics','456 Oak Avenue',2),(3,'Office Chair',30,100.00,150.00,NULL,'Warehouse C','pcs','Furniture','789 Pine Road',3),(4,'Desk',25,200.00,300.00,NULL,'Warehouse A','pcs','Furniture','101 Maple Lane',4),(5,'Smartphone',50,500.00,800.00,NULL,'Warehouse B','pcs','Electronics','202 Cedar Street',5),(6,'Tablet',40,300.00,500.00,NULL,'Warehouse C','pcs','Electronics','303 Elm Drive',6),(7,'Coffee Maker',10,50.00,80.00,NULL,'Warehouse A','pcs','Appliance','404 Birch Road',7),(8,'Microwave',12,80.00,120.00,NULL,'Warehouse B','pcs','Appliance','505 Spruce Avenue',8),(9,'Backpack',60,20.00,40.00,NULL,'Warehouse C','pcs','Apparel','606 Oak Lane',9),(10,'Headphones',30,40.00,80.00,NULL,'Warehouse A','pcs','Electronics','707 Pine Street',10);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `idorderItems` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `items_iditems` int NOT NULL,
  PRIMARY KEY (`idorderItems`,`items_iditems`),
  KEY `fk_orderItems_items1_idx` (`items_iditems`),
  CONSTRAINT `fk_orderItems_items1` FOREIGN KEY (`items_iditems`) REFERENCES `items` (`iditems`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (1,5,1),(2,10,2),(3,3,3),(4,8,4),(5,15,5),(6,2,6),(7,7,7),(8,12,8),(9,4,9),(10,18,10);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `orderDate` date DEFAULT NULL,
  `Customers_idCustomers` int NOT NULL,
  `orderItems_idorderItems` int NOT NULL,
  `orderItems_items_iditems` int NOT NULL,
  PRIMARY KEY (`orderid`,`Customers_idCustomers`,`orderItems_idorderItems`,`orderItems_items_iditems`),
  KEY `fk_Orders_Customers1_idx` (`Customers_idCustomers`),
  KEY `fk_Orders_orderItems1_idx` (`orderItems_idorderItems`,`orderItems_items_iditems`),
  CONSTRAINT `fk_Orders_Customers1` FOREIGN KEY (`Customers_idCustomers`) REFERENCES `customers` (`idCustomers`),
  CONSTRAINT `fk_Orders_orderItems1` FOREIGN KEY (`orderItems_idorderItems`, `orderItems_items_iditems`) REFERENCES `orderitems` (`idorderItems`, `items_iditems`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-02-28',1,1,1),(2,'2024-02-28',2,2,2),(3,'2024-02-28',3,3,3),(4,'2024-02-28',4,4,4),(5,'2024-02-28',5,5,5),(6,'2024-02-28',6,6,6),(7,'2024-02-28',7,7,7),(8,'2024-02-28',8,8,8),(9,'2024-02-28',9,9,9),(10,'2024-02-28',10,10,10);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `idvendors` int NOT NULL AUTO_INCREMENT,
  `vendorName` varchar(45) DEFAULT NULL,
  `vendorAddress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idvendors`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1,'ABC Electronics','123 Main Street'),(2,'XYZ Supplies','456 Oak Avenue'),(3,'LMN Technologies','789 Pine Road'),(4,'PQR Manufacturing','101 Maple Lane'),(5,'UVW Distributors','202 Cedar Street'),(6,'RST Solutions','303 Elm Drive'),(7,'EFG Merchants','404 Birch Road'),(8,'HIJ Importers','505 Spruce Avenue'),(9,'KLM Enterprises','606 Oak Lane'),(10,'NOP Retail','707 Pine Street');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-29  0:01:19
