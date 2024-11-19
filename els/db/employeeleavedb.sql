-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 16 فبراير 2022 الساعة 17:03
-- إصدار الخادم: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employeeleavedb`
--

-- --------------------------------------------------------

--
-- بنية الجدول `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(55) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `fullname`, `email`, `updationDate`) VALUES
(1, 'admin', 'd00f5d5217896fb7fd601412cb890830', 'Liam Moore', 'admin@mail.com', '2022-02-09 15:15:46');

-- --------------------------------------------------------

--
-- بنية الجدول `tbldepartments`
--

CREATE TABLE `tbldepartments` (
  `id` int(11) NOT NULL,
  `DepartmentName` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `DepartmentShortName` varchar(100) CHARACTER SET utf8 NOT NULL,
  `DepartmentCode` varchar(50) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `tbldepartments`
--

INSERT INTO `tbldepartments` (`id`, `DepartmentName`, `DepartmentShortName`, `DepartmentCode`, `CreationDate`) VALUES
(13, 'القسم التجاري', 'التجارة', '1', '2022-02-16 15:14:37'),
(14, 'قسم الموارد البشرية', 'الموارد البشرية', '2', '2022-02-16 15:14:50'),
(15, 'إدارة شؤون الموظفين', 'شؤون الموظفين', '4', '2022-02-16 15:15:12'),
(16, 'قسم المالية', 'المالية', '5', '2022-02-16 15:15:28'),
(17, 'القسم الإداري', 'الادارة', '6', '2022-02-16 15:15:43'),
(18, 'قسم التسويق', 'التسويق', '7', '2022-02-16 15:15:56'),
(19, 'قسم تقنية', 'التقنية', '9', '2022-02-16 15:16:11');

-- --------------------------------------------------------

--
-- بنية الجدول `tblemployees`
--

CREATE TABLE `tblemployees` (
  `id` int(11) NOT NULL,
  `EmpId` varchar(100) CHARACTER SET utf8 NOT NULL,
  `FirstName` varchar(150) CHARACTER SET utf8 NOT NULL,
  `LastName` varchar(150) CHARACTER SET utf8 NOT NULL,
  `EmailId` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Password` varchar(180) CHARACTER SET utf8 NOT NULL,
  `Gender` varchar(100) CHARACTER SET utf8 NOT NULL,
  `Dob` varchar(100) CHARACTER SET utf8 NOT NULL,
  `Department` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `City` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Country` varchar(150) CHARACTER SET utf8 NOT NULL,
  `Phonenumber` char(11) CHARACTER SET utf8 NOT NULL,
  `Status` int(1) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `tblemployees`
--

INSERT INTO `tblemployees` (`id`, `EmpId`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `City`, `Country`, `Phonenumber`, `Status`, `RegDate`) VALUES
(10, '17', 'علي', 'سعيد', 'admin1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Male', '2020-05-01', 'القسم التجاري', 'حي القاهرة', 'بغداد', 'العراق', '8228250888', 1, '2022-02-16 15:17:55');

-- --------------------------------------------------------

--
-- بنية الجدول `tblleaves`
--

CREATE TABLE `tblleaves` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(110) CHARACTER SET utf8 NOT NULL,
  `ToDate` varchar(120) CHARACTER SET utf8 NOT NULL,
  `FromDate` varchar(120) CHARACTER SET utf8 NOT NULL,
  `Description` mediumtext CHARACTER SET utf8 NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext CHARACTER SET utf8 DEFAULT NULL,
  `AdminRemarkDate` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `IsRead` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `tblleaves`
--

INSERT INTO `tblleaves` (`id`, `LeaveType`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `AdminRemark`, `AdminRemarkDate`, `Status`, `IsRead`, `empid`) VALUES
(25, 'إجازة طبية', '2022-02-16', '2022-02-24', 'مرحبا احتاج الى اجازة لاسباب صحية', '2022-02-16 15:45:04', NULL, NULL, 0, 1, 10);

-- --------------------------------------------------------

--
-- بنية الجدول `tblleavetype`
--

CREATE TABLE `tblleavetype` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8 DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `tblleavetype`
--

INSERT INTO `tblleavetype` (`id`, `LeaveType`, `Description`, `CreationDate`) VALUES
(1, 'مغادرة عادية', 'يتم توفيرها للموظفين في الأمور العاجلة أو غير المتوقعة.', '2020-11-01 12:07:56'),
(2, 'إجازة طبية', 'المتعلقة بالمشاكل الصحية للموظف', '2020-11-06 13:16:09'),
(3, 'عطلة ', 'عطلة اختيارية مخصومة الاجر', '2020-11-06 13:16:38'),
(5, 'إجازة الولادة', 'لرعاية الأطفال حديثي الولادة', '2021-03-03 10:46:31'),
(6, 'إجازة الحزن', 'تحزن على فقدان أحبائهم', '2021-03-03 10:47:48'),
(7, 'إجازة تعويضية', 'للعاملين في العمل الإضافي', '2021-03-03 10:48:37'),
(9, 'إجازات دينية', 'على أساس الدين المتبع للموظف', '2021-03-03 10:51:26'),
(12, 'إجازة الحجر الصحي', 'المتعلقة بقضايا COVID-19', '2021-03-03 13:19:48'),
(13, 'إجازة شخصية', 'لإدارة بعض الأمور الخاصة', '2021-03-03 13:21:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblemployees`
--
ALTER TABLE `tblemployees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblleaves`
--
ALTER TABLE `tblleaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserEmail` (`empid`);

--
-- Indexes for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tblemployees`
--
ALTER TABLE `tblemployees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblleaves`
--
ALTER TABLE `tblleaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
