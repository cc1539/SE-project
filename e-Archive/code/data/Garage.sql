-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2019-05-07 18:08:22
-- 服务器版本： 8.0.13-4
-- PHP 版本： 7.2.17-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `Vneao4rF2A`
--

-- --------------------------------------------------------

--
-- 表的结构 `accounttable`
--

CREATE TABLE `accounttable` (
  `AccountID` int(11) NOT NULL,
  `CreditCardNum` tinytext COLLATE utf8_unicode_ci,
  `EmailAddress` tinytext COLLATE utf8_unicode_ci,
  `FirstName` tinytext COLLATE utf8_unicode_ci,
  `LastName` tinytext COLLATE utf8_unicode_ci,
  `LicensePlateNum` tinytext COLLATE utf8_unicode_ci,
  `MiddleName` tinytext COLLATE utf8_unicode_ci,
  `Password` text COLLATE utf8_unicode_ci NOT NULL,
  `Username` text COLLATE utf8_unicode_ci NOT NULL,
  `AccountType` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `SessionID` text COLLATE utf8_unicode_ci,
  `ReservationBegin` datetime DEFAULT NULL,
  `ReservationEnd` datetime DEFAULT NULL,
  `HomeAddress` tinytext COLLATE utf8_unicode_ci,
  `ReservationLot` tinytext COLLATE utf8_unicode_ci,
  `LatestEnterTime` datetime DEFAULT NULL,
  `PayAmount` int(11) DEFAULT NULL,
  `ParkingLotName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `accounttable`
--

INSERT INTO `accounttable` (`AccountID`, `CreditCardNum`, `EmailAddress`, `FirstName`, `LastName`, `LicensePlateNum`, `MiddleName`, `Password`, `Username`, `AccountType`, `SessionID`, `ReservationBegin`, `ReservationEnd`, `HomeAddress`, `ReservationLot`, `LatestEnterTime`, `PayAmount`, `ParkingLotName`) VALUES
(1, '15570c400b160b4003180f0d5f59', 'remote server', 'i am info', 'more info', 'deletus', NULL, '5657560452015601560f57530c06', 'testaccount123', 'BASIC', 'yMJb0JOIvyKKvNOaI6dHFFsFoUnErIls3Xhy7ujA6yqbtPpLpQCuEUckq9JnpqkE', '2019-03-19 00:34:00', '2019-03-15 00:34:00', 'hello', 'Hypothetical Parking Lot 2B #39', '2019-04-22 20:29:04', 424, NULL),
(2, '', '', 'Ivan', 'Marsic', 'YOLO', NULL, '540651010706', 'ivanmarsic@gmail.com', 'BASIC', 'mp0pgEGsgyFWCsL65aZSA3q1IP6wYPKcom8dnwGh8wD8pcQd1Uh0BM31e02fs8VR', '1111-01-01 01:11:00', '2222-02-22 14:22:00', '123 Rutgers Lane', 'Hypothetical Parking Lot 2B #26', NULL, 0, ''),
(3, '570051075754550e5f0051550c020b0a550c5407535b', 'kr420@rutgers.edu', 'Kevin', 'Rogers', '42069', NULL, '5657560452015601560f57530c06', 'tester', 'BASIC', '8cKEc69pztUBaOzYxMukwWWS7Vv8vhMxesiJ1RHZDCHjeGs49dX91zxr4YEjIdcN', NULL, NULL, '123 Rutgers Road', NULL, '2019-04-23 02:52:54', 210413, NULL),
(4, '56035000565b54015f0b5e560e02', 'rutger@rutger.edu', 'i am the data', 'nope', '69420', NULL, '5657560452015601560f57530c06', 'testaccount321', 'BASIC', 'utqXLApnwz06gVD8cUXNa0IfMklgnnlFVPfddSz14MViIIqjAzTbWujuLRHtjjSh', NULL, NULL, 'hello rutgers', NULL, '2019-04-22 00:49:44', 9, ''),
(5, NULL, NULL, NULL, NULL, NULL, NULL, '08000907060251520900030c', 'newaccount', 'BASIC', 'MyjZzh9fb2RVfFmqzlKj4EriAezSRxyCzDCaUnaW3HM5Z588LcJ0gx8nQfOVQaib', NULL, NULL, NULL, NULL, NULL, 0, ''),
(6, NULL, NULL, NULL, NULL, NULL, NULL, '5657560452015601560f57530c06', 'jalal', 'BASIC', 'KA9NWleCgiT3V6j1Z93yydVMvgqJSuzeuMnA8OKvlchgVZMteBEkj78VP4Ss5fDc', NULL, NULL, NULL, NULL, NULL, 0, ''),
(7, NULL, NULL, NULL, NULL, NULL, NULL, '5657560452015601560f57530c06', 'newaccount123', 'BASIC', '2gqOKfKPeh5ArKRDTKbcfhE3SRWWHgF9R9BFI5znGMk37zCXWTOLcqywkyViweOn', NULL, NULL, NULL, NULL, NULL, 0, ''),
(8, '', '', 'Tingcong', 'Jiang', 'Z33JZR', NULL, '08000907060251520900030c', 'qwerty100987', 'BASIC', 'yRoDkCLXsHiglZnqAtZYHnuptWqJKehwPxNMXrAVqX7JGEr0luXNf9voUvXEocZc', NULL, NULL, '', NULL, '2019-04-23 17:07:14', 3202, NULL),
(9, '', '', 'Tingcong', 'Jiang', 'BKS9130', NULL, '08000907060251520900030c', 'qwerty1009876', 'BASIC', 'qoQyoAplX4cTPuK6Hyp1twmMWaoICnNFgNt87oAyCKoLBjF7jIlOLM181CtpAlQe', NULL, NULL, '', NULL, '2019-04-23 17:32:16', 3481, 'Hypothetical Parking Lot 2B'),
(10, NULL, NULL, NULL, NULL, NULL, NULL, '0d5c515c09030355', 'test', 'BASIC', 'xiMGgdnw7E26EUSeEFAi8nOucKoxIh8fYRa1rLhlquEQD0NE1mTccEJw1OU8OnqH', NULL, NULL, NULL, NULL, NULL, 0, NULL),
(13, '', 'BcomedianC@gmail.com', 'Buyuan', 'Lin', 'N21HTR', NULL, '57560900005454030452025053080750020f5401080105510003', 'BcomedianC', 'BASIC', 'CXkM8BSGmSNb0FKvmHq53mfBlXiF2nyDzd8o3ncHxMD93jF8byNakt9TmG1SUCfg', NULL, NULL, '', NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `car`
--

CREATE TABLE `car` (
  `ID` int(11) NOT NULL,
  `Car_make` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Car_model` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Car_color` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CarPlate` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_begin` int(11) DEFAULT NULL,
  `time_end` int(11) DEFAULT NULL,
  `SPOT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `car`
--

INSERT INTO `car` (`ID`, `Car_make`, `Car_model`, `Car_color`, `CarPlate`, `time_begin`, `time_end`, `SPOT`) VALUES
(1, 'volkswagen', 'volkswagen_golf', 'red', 'Z33JZR', 122959, 0, -1),
(2, '213123', '213123', '123', '12', 120518, 0, -1),
(3, '123', '123', '123', '123', 120536, 0, -1),
(4, 'volkswagen', 'volkswagen_golf', 'red', 'Z33JZR', 123257, 0, -1),
(5, 'volkswagen', 'volkswagen_golf', 'red', 'Z33JZR', 124049, 0, -1),
(6, 'volkswagen', 'volkswagen_golf', 'red', 'Z33JZR', 124112, 0, -1),
(7, 'volkswagen', 'volkswagen_golf', 'red', 'Z33JZR', 124201, 124828, 0),
(9, 'volkswagen', 'volkswagen_golf', 'red', 'Z33JZR', 125434, 0, -1),
(10, 'volkswagen', 'volkswagen_golf', 'red', 'Z33JZR', 125753, 0, 0),
(11, 'volkswagen', 'volkswagen_golf', 'red', 'Z33JZR', 131538, 132714, -1);

-- --------------------------------------------------------

--
-- 表的结构 `carjson`
--

CREATE TABLE `carjson` (
  `id` int(11) NOT NULL,
  `json` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `carjson`
--

INSERT INTO `carjson` (`id`, `json`) VALUES
(0, '0'),
(1, '{\"uuid\": \"\", \"data_type\": \"alpr_results\", \"epoch_time\": 1556036998747, \"processing_time\": {\"total\": 989.1239999997197, \"plates\": 234.34359741210938, \"vehicles\": 729.3410000020231}, \"img_height\": 1920, \"img_width\": 1080, \"results\": [{\"plate\": \"Z33JZR\", \"confidence\": 94.93269348144531, \"region_confidence\": 99, \"vehicle_region\": {\"y\": 253, \"x\": 1, \"height\": 1079, \"width\": 1079}, \"region\": \"nj\", \"plate_index\": 0, \"processing_time_ms\": 70.7198715209961, \"candidates\": [{\"matches_template\": 1, \"plate\": \"Z33JZR\", \"confidence\": 94.93269348144531}], \"coordinates\": [{\"y\": 932, \"x\": 412}, {\"y\": 934, \"x\": 651}, {\"y\": 1054, \"x\": 648}, {\"y\": 1051, \"x\": 409}], \"vehicle\": {\"orientation\": [{\"confidence\": 99.98904418945312, \"name\": \"0\"}], \"color\": [{\"confidence\": 99.94513702392578, \"name\": \"red\"}], \"make\": [{\"confidence\": 99.99990844726562, \"name\": \"volkswagen\"}], \"body_type\": [{\"confidence\": 99.99258422851562, \"name\": \"sedan-compact\"}], \"year\": [{\"confidence\": 59.17855453491211, \"name\": \"2010-2014\"}], \"make_model\": [{\"confidence\": 47.69483184814453, \"name\": \"volkswagen_golf\"}]}, \"matches_template\": 1, \"requested_topn\": 1}], \"credits_monthly_used\": 858, \"version\": 2, \"credits_monthly_total\": 2000, \"error\": false, \"regions_of_interest\": [{\"y\": 0, \"x\": 0, \"height\": 1920, \"width\": 1080}], \"credit_cost\": 2}'),
(2, '{\"uuid\": \"\", \"data_type\": \"alpr_results\", \"epoch_time\": 1556037139944, \"processing_time\": {\"total\": 675.680000000284, \"plates\": 183.62730407714844, \"vehicles\": 466.4459999985411}, \"img_height\": 1920, \"img_width\": 1080, \"results\": [{\"plate\": \"Z33JZR\", \"confidence\": 94.8537368774414, \"region_confidence\": 99, \"vehicle_region\": {\"y\": 335, \"x\": 55, \"height\": 976, \"width\": 976}, \"region\": \"nj\", \"plate_index\": 0, \"processing_time_ms\": 36.872596740722656, \"candidates\": [{\"matches_template\": 1, \"plate\": \"Z33JZR\", \"confidence\": 94.8537368774414}], \"coordinates\": [{\"y\": 937, \"x\": 426}, {\"y\": 937, \"x\": 659}, {\"y\": 1035, \"x\": 659}, {\"y\": 1035, \"x\": 426}], \"vehicle\": {\"orientation\": [{\"confidence\": 99.99413299560547, \"name\": \"0\"}], \"color\": [{\"confidence\": 99.84379577636719, \"name\": \"red\"}], \"make\": [{\"confidence\": 99.99947357177734, \"name\": \"volkswagen\"}], \"body_type\": [{\"confidence\": 99.84938049316406, \"name\": \"sedan-compact\"}], \"year\": [{\"confidence\": 55.4180908203125, \"name\": \"2010-2014\"}], \"make_model\": [{\"confidence\": 49.187255859375, \"name\": \"volkswagen_golf\"}]}, \"matches_template\": 1, \"requested_topn\": 1}], \"credits_monthly_used\": 864, \"version\": 2, \"credits_monthly_total\": 2000, \"error\": false, \"regions_of_interest\": [{\"y\": 0, \"x\": 0, \"height\": 1920, \"width\": 1080}], \"credit_cost\": 2}'),
(3, '{\"uuid\": \"\", \"data_type\": \"alpr_results\", \"epoch_time\": 1556037155534, \"processing_time\": {\"total\": 657.5460000021849, \"plates\": 175.04490661621094, \"vehicles\": 455.4280000156723}, \"img_height\": 1920, \"img_width\": 1080, \"results\": [{\"plate\": \"Z33JZR\", \"confidence\": 94.810546875, \"region_confidence\": 99, \"vehicle_region\": {\"y\": 335, \"x\": 55, \"height\": 976, \"width\": 976}, \"region\": \"nj\", \"plate_index\": 0, \"processing_time_ms\": 36.07661056518555, \"candidates\": [{\"matches_template\": 1, \"plate\": \"Z33JZR\", \"confidence\": 94.810546875}], \"coordinates\": [{\"y\": 939, \"x\": 426}, {\"y\": 936, \"x\": 659}, {\"y\": 1033, \"x\": 659}, {\"y\": 1036, \"x\": 426}], \"vehicle\": {\"orientation\": [{\"confidence\": 99.98685455322266, \"name\": \"0\"}], \"color\": [{\"confidence\": 99.34276580810547, \"name\": \"red\"}], \"make\": [{\"confidence\": 99.99974060058594, \"name\": \"volkswagen\"}], \"body_type\": [{\"confidence\": 99.91805267333984, \"name\": \"sedan-compact\"}], \"year\": [{\"confidence\": 62.66268539428711, \"name\": \"2010-2014\"}], \"make_model\": [{\"confidence\": 40.50710678100586, \"name\": \"volkswagen_golf\"}]}, \"matches_template\": 1, \"requested_topn\": 1}], \"credits_monthly_used\": 866, \"version\": 2, \"credits_monthly_total\": 2000, \"error\": false, \"regions_of_interest\": [{\"y\": 0, \"x\": 0, \"height\": 1920, \"width\": 1080}], \"credit_cost\": 2}'),
(4, '{\"uuid\": \"\", \"data_type\": \"alpr_results\", \"epoch_time\": 1556037176911, \"processing_time\": {\"total\": 675.5509999929927, \"plates\": 176.42849731445312, \"vehicles\": 472.4329999880865}, \"img_height\": 1920, \"img_width\": 1080, \"results\": [{\"plate\": \"Z33JZR\", \"confidence\": 94.92613220214844, \"region_confidence\": 99, \"vehicle_region\": {\"y\": 257, \"x\": 1, \"height\": 1079, \"width\": 1079}, \"region\": \"nj\", \"plate_index\": 0, \"processing_time_ms\": 36.65375518798828, \"candidates\": [{\"matches_template\": 1, \"plate\": \"Z33JZR\", \"confidence\": 94.92613220214844}], \"coordinates\": [{\"y\": 939, \"x\": 411}, {\"y\": 936, \"x\": 643}, {\"y\": 1057, \"x\": 643}, {\"y\": 1060, \"x\": 411}], \"vehicle\": {\"orientation\": [{\"confidence\": 99.95077514648438, \"name\": \"0\"}], \"color\": [{\"confidence\": 99.47791290283203, \"name\": \"red\"}], \"make\": [{\"confidence\": 99.99991607666016, \"name\": \"volkswagen\"}], \"body_type\": [{\"confidence\": 99.98896026611328, \"name\": \"sedan-compact\"}], \"year\": [{\"confidence\": 65.05563354492188, \"name\": \"2010-2014\"}], \"make_model\": [{\"confidence\": 48.13899612426758, \"name\": \"volkswagen_golf\"}]}, \"matches_template\": 1, \"requested_topn\": 1}], \"credits_monthly_used\": 868, \"version\": 2, \"credits_monthly_total\": 2000, \"error\": false, \"regions_of_interest\": [{\"y\": 0, \"x\": 0, \"height\": 1920, \"width\": 1080}], \"credit_cost\": 2}'),
(5, '{\"uuid\": \"\", \"data_type\": \"alpr_results\", \"epoch_time\": 1556037648555, \"processing_time\": {\"total\": 650.275000021793, \"plates\": 182.7590789794922, \"vehicles\": 440.5549999792129}, \"img_height\": 1920, \"img_width\": 1080, \"results\": [{\"plate\": \"Z33JZR\", \"confidence\": 94.88065338134766, \"region_confidence\": 98, \"vehicle_region\": {\"y\": 418, \"x\": 114, \"height\": 854, \"width\": 854}, \"region\": \"nj\", \"plate_index\": 0, \"processing_time_ms\": 41.22911834716797, \"candidates\": [{\"matches_template\": 1, \"plate\": \"Z33JZR\", \"confidence\": 94.88065338134766}], \"coordinates\": [{\"y\": 944, \"x\": 422}, {\"y\": 944, \"x\": 660}, {\"y\": 1029, \"x\": 660}, {\"y\": 1029, \"x\": 422}], \"vehicle\": {\"orientation\": [{\"confidence\": 98.36975860595703, \"name\": \"0\"}], \"color\": [{\"confidence\": 99.8641586303711, \"name\": \"red\"}], \"make\": [{\"confidence\": 99.9998779296875, \"name\": \"volkswagen\"}], \"body_type\": [{\"confidence\": 99.94645690917969, \"name\": \"sedan-compact\"}], \"year\": [{\"confidence\": 65.06883239746094, \"name\": \"2010-2014\"}], \"make_model\": [{\"confidence\": 53.9794807434082, \"name\": \"volkswagen_golf\"}]}, \"matches_template\": 1, \"requested_topn\": 1}], \"credits_monthly_used\": 878, \"version\": 2, \"credits_monthly_total\": 2000, \"error\": false, \"regions_of_interest\": [{\"y\": 0, \"x\": 0, \"height\": 1920, \"width\": 1080}], \"credit_cost\": 2}'),
(6, '{\"uuid\": \"\", \"data_type\": \"alpr_results\", \"epoch_time\": 1556037671494, \"processing_time\": {\"total\": 722.1400000271387, \"plates\": 242.7358856201172, \"vehicles\": 454.48999997461215}, \"img_height\": 1920, \"img_width\": 1080, \"results\": [{\"plate\": \"Z33JZR\", \"confidence\": 94.92367553710938, \"region_confidence\": 97, \"vehicle_region\": {\"y\": 395, \"x\": 102, \"height\": 887, \"width\": 887}, \"region\": \"nj\", \"plate_index\": 0, \"processing_time_ms\": 75.13772583007812, \"candidates\": [{\"matches_template\": 1, \"plate\": \"Z33JZR\", \"confidence\": 94.92367553710938}], \"coordinates\": [{\"y\": 943, \"x\": 422}, {\"y\": 940, \"x\": 670}, {\"y\": 1029, \"x\": 670}, {\"y\": 1032, \"x\": 422}], \"vehicle\": {\"orientation\": [{\"confidence\": 99.92571258544922, \"name\": \"0\"}], \"color\": [{\"confidence\": 99.91656494140625, \"name\": \"red\"}], \"make\": [{\"confidence\": 99.99993896484375, \"name\": \"volkswagen\"}], \"body_type\": [{\"confidence\": 99.9921646118164, \"name\": \"sedan-compact\"}], \"year\": [{\"confidence\": 64.26282501220703, \"name\": \"2010-2014\"}], \"make_model\": [{\"confidence\": 42.55418014526367, \"name\": \"volkswagen_golf\"}]}, \"matches_template\": 1, \"requested_topn\": 1}], \"credits_monthly_used\": 880, \"version\": 2, \"credits_monthly_total\": 2000, \"error\": false, \"regions_of_interest\": [{\"y\": 0, \"x\": 0, \"height\": 1920, \"width\": 1080}], \"credit_cost\": 2}'),
(7, '{\"uuid\": \"\", \"data_type\": \"alpr_results\", \"epoch_time\": 1556037721147, \"processing_time\": {\"total\": 650.4009999916889, \"plates\": 181.7254638671875, \"vehicles\": 443.84000002173707}, \"img_height\": 1920, \"img_width\": 1080, \"results\": [{\"plate\": \"Z33JZR\", \"confidence\": 94.92056274414062, \"region_confidence\": 96, \"vehicle_region\": {\"y\": 395, \"x\": 102, \"height\": 887, \"width\": 887}, \"region\": \"nj\", \"plate_index\": 0, \"processing_time_ms\": 38.26708221435547, \"candidates\": [{\"matches_template\": 1, \"plate\": \"Z33JZR\", \"confidence\": 94.92056274414062}], \"coordinates\": [{\"y\": 943, \"x\": 422}, {\"y\": 940, \"x\": 670}, {\"y\": 1029, \"x\": 670}, {\"y\": 1032, \"x\": 422}], \"vehicle\": {\"orientation\": [{\"confidence\": 99.9667739868164, \"name\": \"0\"}], \"color\": [{\"confidence\": 99.93775177001953, \"name\": \"red\"}], \"make\": [{\"confidence\": 99.99991607666016, \"name\": \"volkswagen\"}], \"body_type\": [{\"confidence\": 99.98464965820312, \"name\": \"sedan-compact\"}], \"year\": [{\"confidence\": 60.21586608886719, \"name\": \"2010-2014\"}], \"make_model\": [{\"confidence\": 42.78758239746094, \"name\": \"volkswagen_golf\"}]}, \"matches_template\": 1, \"requested_topn\": 1}], \"credits_monthly_used\": 882, \"version\": 2, \"credits_monthly_total\": 2000, \"error\": false, \"regions_of_interest\": [{\"y\": 0, \"x\": 0, \"height\": 1920, \"width\": 1080}], \"credit_cost\": 2}'),
(8, '{\"uuid\": \"\", \"data_type\": \"alpr_results\", \"epoch_time\": 1556038165134, \"processing_time\": {\"total\": 676.634000003105, \"plates\": 182.55323791503906, \"vehicles\": 468.617999998969}, \"img_height\": 1920, \"img_width\": 1080, \"results\": [{\"plate\": \"Z33JZR\", \"confidence\": 94.9291763305664, \"region_confidence\": 99, \"vehicle_region\": {\"y\": 281, \"x\": 0, \"height\": 1067, \"width\": 1067}, \"region\": \"nj\", \"plate_index\": 0, \"processing_time_ms\": 38.23776626586914, \"candidates\": [{\"matches_template\": 1, \"plate\": \"Z33JZR\", \"confidence\": 94.9291763305664}], \"coordinates\": [{\"y\": 937, \"x\": 414}, {\"y\": 940, \"x\": 654}, {\"y\": 1046, \"x\": 654}, {\"y\": 1043, \"x\": 414}], \"vehicle\": {\"orientation\": [{\"confidence\": 99.98931884765625, \"name\": \"0\"}], \"color\": [{\"confidence\": 99.89457702636719, \"name\": \"red\"}], \"make\": [{\"confidence\": 99.99955749511719, \"name\": \"volkswagen\"}], \"body_type\": [{\"confidence\": 99.94068145751953, \"name\": \"sedan-compact\"}], \"year\": [{\"confidence\": 57.39476013183594, \"name\": \"2010-2014\"}], \"make_model\": [{\"confidence\": 50.00945281982422, \"name\": \"volkswagen_golf\"}]}, \"matches_template\": 1, \"requested_topn\": 1}], \"credits_monthly_used\": 892, \"version\": 2, \"credits_monthly_total\": 2000, \"error\": false, \"regions_of_interest\": [{\"y\": 0, \"x\": 0, \"height\": 1920, \"width\": 1080}], \"credit_cost\": 2}'),
(9, '{\"uuid\": \"\", \"data_type\": \"alpr_results\", \"epoch_time\": 1556038473919, \"processing_time\": {\"total\": 649.0590000030352, \"plates\": 178.48178100585938, \"vehicles\": 444.9289999975008}, \"img_height\": 1920, \"img_width\": 1080, \"results\": [{\"plate\": \"Z33JZR\", \"confidence\": 94.92388153076172, \"region_confidence\": 99, \"vehicle_region\": {\"y\": 257, \"x\": 0, \"height\": 1079, \"width\": 1079}, \"region\": \"nj\", \"plate_index\": 0, \"processing_time_ms\": 36.48162078857422, \"candidates\": [{\"matches_template\": 1, \"plate\": \"Z33JZR\", \"confidence\": 94.92388153076172}], \"coordinates\": [{\"y\": 933, \"x\": 396}, {\"y\": 935, \"x\": 629}, {\"y\": 1052, \"x\": 629}, {\"y\": 1049, \"x\": 396}], \"vehicle\": {\"orientation\": [{\"confidence\": 99.98957824707031, \"name\": \"0\"}], \"color\": [{\"confidence\": 99.97167205810547, \"name\": \"red\"}], \"make\": [{\"confidence\": 99.99993133544922, \"name\": \"volkswagen\"}], \"body_type\": [{\"confidence\": 99.98486328125, \"name\": \"sedan-compact\"}], \"year\": [{\"confidence\": 57.11066818237305, \"name\": \"2010-2014\"}], \"make_model\": [{\"confidence\": 55.23210906982422, \"name\": \"volkswagen_golf\"}]}, \"matches_template\": 1, \"requested_topn\": 1}], \"credits_monthly_used\": 894, \"version\": 2, \"credits_monthly_total\": 2000, \"error\": false, \"regions_of_interest\": [{\"y\": 0, \"x\": 0, \"height\": 1920, \"width\": 1080}], \"credit_cost\": 2}'),
(10, '{\"uuid\": \"\", \"data_type\": \"alpr_results\", \"epoch_time\": 1556038670473, \"processing_time\": {\"total\": 662.7399999997579, \"plates\": 180.64999389648438, \"vehicles\": 455.6509999965783}, \"img_height\": 1920, \"img_width\": 1080, \"results\": [{\"plate\": \"Z33JZR\", \"confidence\": 94.9354248046875, \"region_confidence\": 99, \"vehicle_region\": {\"y\": 249, \"x\": 0, \"height\": 1080, \"width\": 1080}, \"region\": \"nj\", \"plate_index\": 0, \"processing_time_ms\": 38.11945724487305, \"candidates\": [{\"matches_template\": 1, \"plate\": \"Z33JZR\", \"confidence\": 94.9354248046875}], \"coordinates\": [{\"y\": 932, \"x\": 398}, {\"y\": 935, \"x\": 636}, {\"y\": 1057, \"x\": 633}, {\"y\": 1054, \"x\": 395}], \"vehicle\": {\"orientation\": [{\"confidence\": 99.99749755859375, \"name\": \"0\"}], \"color\": [{\"confidence\": 99.98690032958984, \"name\": \"red\"}], \"make\": [{\"confidence\": 99.99993896484375, \"name\": \"volkswagen\"}], \"body_type\": [{\"confidence\": 99.98487091064453, \"name\": \"sedan-compact\"}], \"year\": [{\"confidence\": 58.548866271972656, \"name\": \"2010-2014\"}], \"make_model\": [{\"confidence\": 53.291404724121094, \"name\": \"volkswagen_golf\"}]}, \"matches_template\": 1, \"requested_topn\": 1}], \"credits_monthly_used\": 896, \"version\": 2, \"credits_monthly_total\": 2000, \"error\": false, \"regions_of_interest\": [{\"y\": 0, \"x\": 0, \"height\": 1920, \"width\": 1080}], \"credit_cost\": 2}'),
(11, '{\"uuid\": \"\", \"data_type\": \"alpr_results\", \"epoch_time\": 1556039736715, \"processing_time\": {\"total\": 1209.908999997424, \"plates\": 290.900146484375, \"vehicles\": 554.4270000100369}, \"img_height\": 1920, \"img_width\": 1080, \"results\": [{\"plate\": \"Z33JZR\", \"confidence\": 94.9209976196289, \"region_confidence\": 99, \"vehicle_region\": {\"y\": 284, \"x\": 0, \"height\": 1079, \"width\": 1079}, \"region\": \"nj\", \"plate_index\": 0, \"processing_time_ms\": 67.70059204101562, \"candidates\": [{\"matches_template\": 1, \"plate\": \"Z33JZR\", \"confidence\": 94.9209976196289}], \"coordinates\": [{\"y\": 953, \"x\": 402}, {\"y\": 958, \"x\": 642}, {\"y\": 1071, \"x\": 639}, {\"y\": 1065, \"x\": 399}], \"vehicle\": {\"orientation\": [{\"confidence\": 99.9674301147461, \"name\": \"0\"}], \"color\": [{\"confidence\": 94.17975616455078, \"name\": \"red\"}], \"make\": [{\"confidence\": 99.99977111816406, \"name\": \"volkswagen\"}], \"body_type\": [{\"confidence\": 99.94281005859375, \"name\": \"sedan-compact\"}], \"year\": [{\"confidence\": 56.714515686035156, \"name\": \"2010-2014\"}], \"make_model\": [{\"confidence\": 42.659751892089844, \"name\": \"volkswagen_golf\"}]}, \"matches_template\": 1, \"requested_topn\": 1}], \"credits_monthly_used\": 904, \"version\": 2, \"credits_monthly_total\": 2000, \"error\": false, \"regions_of_interest\": [{\"y\": 0, \"x\": 0, \"height\": 1920, \"width\": 1080}], \"credit_cost\": 2}'),
(12, '{\"uuid\": \"\", \"data_type\": \"alpr_results\", \"epoch_time\": 1556040535109, \"processing_time\": {\"total\": 721.8250000005355, \"plates\": 183.47361755371094, \"vehicles\": 514.2000000050757}, \"img_height\": 1920, \"img_width\": 1080, \"results\": [{\"plate\": \"BKS9130\", \"confidence\": 94.78642272949219, \"region_confidence\": 99, \"vehicle_region\": {\"y\": 88, \"x\": 0, \"height\": 1080, \"width\": 1080}, \"region\": \"wa\", \"plate_index\": 0, \"processing_time_ms\": 39.64567184448242, \"candidates\": [{\"matches_template\": 1, \"plate\": \"BKS9130\", \"confidence\": 94.78642272949219}], \"coordinates\": [{\"y\": 691, \"x\": 391}, {\"y\": 666, \"x\": 749}, {\"y\": 816, \"x\": 757}, {\"y\": 841, \"x\": 399}], \"vehicle\": {\"orientation\": [{\"confidence\": 99.98897552490234, \"name\": \"180\"}], \"color\": [{\"confidence\": 71.6961669921875, \"name\": \"silver-gray\"}], \"make\": [{\"confidence\": 99.99991607666016, \"name\": \"bmw\"}], \"body_type\": [{\"confidence\": 49.59983444213867, \"name\": \"suv-crossover\"}], \"year\": [{\"confidence\": 71.70807647705078, \"name\": \"2010-2014\"}], \"make_model\": [{\"confidence\": 41.676422119140625, \"name\": \"bmw_x5\"}]}, \"matches_template\": 1, \"requested_topn\": 1}], \"credits_monthly_used\": 916, \"version\": 2, \"credits_monthly_total\": 2000, \"error\": false, \"regions_of_interest\": [{\"y\": 0, \"x\": 0, \"height\": 1920, \"width\": 1080}], \"credit_cost\": 2}');

-- --------------------------------------------------------

--
-- 表的结构 `cars`
--

CREATE TABLE `cars` (
  `ID` int(11) DEFAULT NULL,
  `Car_make` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Car_model` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Car_color` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CarPlate` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_begin` int(11) NOT NULL,
  `time_end` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cars`
--

INSERT INTO `cars` (`ID`, `Car_make`, `Car_model`, `Car_color`, `CarPlate`, `time_begin`, `time_end`) VALUES
(1, 'volkswagen', 'golf', 'red', 'Z33JZR', 192106, 0);

-- --------------------------------------------------------

--
-- 表的结构 `parkinfo`
--

CREATE TABLE `parkinfo` (
  `ParkingLot` text COLLATE utf8_unicode_ci NOT NULL,
  `ParkingSpot` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `parkinfo`
--

INSERT INTO `parkinfo` (`ParkingLot`, `ParkingSpot`, `AccountID`) VALUES
('Hypothetical Parking Lot 2B', 0, 9);

-- --------------------------------------------------------

--
-- 表的结构 `parkinglots`
--

CREATE TABLE `parkinglots` (
  `ParkingLotName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `HourlyRate` decimal(10,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `parkinglots`
--

INSERT INTO `parkinglots` (`ParkingLotName`, `HourlyRate`) VALUES
('Hypothetical Parking Lot 2B', '1');

-- --------------------------------------------------------

--
-- 表的结构 `qrcode`
--

CREATE TABLE `qrcode` (
  `ParkingLot` text COLLATE utf8_unicode_ci NOT NULL,
  `LicensePlateNum` tinytext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转储表的索引
--

--
-- 表的索引 `accounttable`
--
ALTER TABLE `accounttable`
  ADD PRIMARY KEY (`AccountID`);

--
-- 表的索引 `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`ID`);

--
-- 表的索引 `carjson`
--
ALTER TABLE `carjson`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`time_begin`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `accounttable`
--
ALTER TABLE `accounttable`
  MODIFY `AccountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
