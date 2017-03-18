-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-12-16 07:32:38
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 7.0.13

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- SET time_zone = "+00:00";

--
-- Database: `dalian`
--

-- --------------------------------------------------------
CREATE TABLE `shangjia` (
  `sid` int(11) NOT NULL,
  `spd` varchar(64) NOT NULL COMMENT '商户密码',
  `sname` varchar(64) NOT NULL,
  `s-ico` varchar(254) NOT NULL COMMENT '商户头像',
  `s3` text NOT NULL COMMENT '店铺简介',
  `s4` int(11) NOT NULL COMMENT '星级',
  `s5` int(11) NOT NULL COMMENT '销量',
  `s6` int(11) NOT NULL COMMENT '起送价',
  `s7` int(11) NOT NULL COMMENT '配送费',
  `s11` tinyint(1) NOT NULL COMMENT '是否营业',
  `s12` int(11) NOT NULL COMMENT '商户类型',
  `s13` text NOT NULL COMMENT '用户对商家的评价',
  `s14` text NOT NULL COMMENT '菜单信息',
  `s15` text NOT NULL COMMENT '营业时间',
  `s16` text NOT NULL COMMENT '地址',
  `s17` varchar(14) NOT NULL COMMENT '联系电话',
  `s18` text NOT NULL COMMENT '举报与投诉'
);
