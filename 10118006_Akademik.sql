-- MariaDB dump 10.17  Distrib 10.4.10-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: akademik
-- ------------------------------------------------------
-- Server version	10.4.10-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `data_mahasiswa`
--

DROP TABLE IF EXISTS `data_mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_mahasiswa` (
  `nim` char(8) NOT NULL DEFAULT '',
  `nama` char(50) DEFAULT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') DEFAULT NULL,
  PRIMARY KEY (`nim`),
  KEY `nim` (`nim`,`nama`,`tanggal_lahir`,`alamat`,`jenis_kelamin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_mahasiswa`
--

LOCK TABLES `data_mahasiswa` WRITE;
/*!40000 ALTER TABLE `data_mahasiswa` DISABLE KEYS */;
INSERT INTO `data_mahasiswa` VALUES ('10118006','Alfarizi','2000-07-22','Dago','laki-laki'),('10118007','Syarif','2000-05-12','Cimahi','laki-laki'),('10118008','Annisa','2000-08-21','Cianjur','perempuan'),('10118009','Risya','2001-02-21','Padalarang','perempuan'),('10118010','Reza','2000-02-03','setiabudi','laki-laki');
/*!40000 ALTER TABLE `data_mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matkul`
--

DROP TABLE IF EXISTS `matkul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matkul` (
  `kode_mk` varchar(6) NOT NULL,
  `nama_matkul` varchar(25) NOT NULL,
  `sks` int(2) DEFAULT NULL,
  PRIMARY KEY (`kode_mk`),
  KEY `kode_mk` (`kode_mk`,`nama_matkul`,`sks`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matkul`
--

LOCK TABLES `matkul` WRITE;
/*!40000 ALTER TABLE `matkul` DISABLE KEYS */;
INSERT INTO `matkul` VALUES ('if1201','Sistem Informasi',2),('if1202','Sistem Operasi',3),('if1203','Basis Data',4),('if1204','Metode Numerik',3);
/*!40000 ALTER TABLE `matkul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perkuliahan`
--

DROP TABLE IF EXISTS `perkuliahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perkuliahan` (
  `nim` varchar(10) DEFAULT NULL,
  `kode_matkul` varchar(6) DEFAULT NULL,
  `nilai` char(2) NOT NULL,
  KEY `nim` (`nim`),
  KEY `kode_matkul` (`kode_matkul`),
  KEY `nim_2` (`nim`,`kode_matkul`,`nilai`),
  CONSTRAINT `perkuliahan_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `data_mahasiswa` (`nim`),
  CONSTRAINT `perkuliahan_ibfk_2` FOREIGN KEY (`kode_matkul`) REFERENCES `matkul` (`kode_mk`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perkuliahan`
--

LOCK TABLES `perkuliahan` WRITE;
/*!40000 ALTER TABLE `perkuliahan` DISABLE KEYS */;
INSERT INTO `perkuliahan` VALUES ('10118006','if1201','A'),('10118007','if1202','B'),('10118008','if1203','C'),('10118009','if1204','B'),('10118010','if1204','C');
/*!40000 ALTER TABLE `perkuliahan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-19 18:33:54
