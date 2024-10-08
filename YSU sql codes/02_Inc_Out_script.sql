USE [master]
GO

/****** Object:  Database [IncOut]    Script Date: 01/04/2011 14:43:04 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'IncOut')
DROP DATABASE [IncOut]
GO

USE [master]
GO

/****** Object:  Database [IncOut]    Script Date: 01/04/2011 14:43:04 ******/
CREATE DATABASE [IncOut] ON  PRIMARY 
( NAME = N'IncOut', FILENAME = N'D:\DBMS_Bacalavr\SQLDATA\IncOut.mdf' , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IncOut_log', FILENAME = N'D:\DBMS_Bacalavr\SQLDATA\IncOut_log.ldf' , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IncOut].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [IncOut] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [IncOut] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [IncOut] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [IncOut] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [IncOut] SET ARITHABORT OFF 
GO

ALTER DATABASE [IncOut] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [IncOut] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [IncOut] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [IncOut] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [IncOut] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [IncOut] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [IncOut] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [IncOut] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [IncOut] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [IncOut] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [IncOut] SET  DISABLE_BROKER 
GO

ALTER DATABASE [IncOut] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [IncOut] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO


ALTER DATABASE [IncOut] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [IncOut] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [IncOut] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [IncOut] SET  READ_WRITE 
GO

ALTER DATABASE [IncOut] SET RECOVERY FULL 
GO

ALTER DATABASE [IncOut] SET  MULTI_USER 
GO

ALTER DATABASE [IncOut] SET PAGE_VERIFY CHECKSUM  
GO

USE [IncOut]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Income]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Income]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Outcome]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Outcome]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Income_o]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Income_o]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Outcome_o]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Outcome_o]
GO

CREATE TABLE [dbo].[Income] (
	[code] [int] NOT NULL ,
	[point] [tinyint] NOT NULL ,
	[date] [datetime] NOT NULL ,
	[inc] [smallmoney] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Outcome] (
	[code] [int] NOT NULL ,
	[point] [tinyint] NOT NULL ,
	[date] [datetime] NOT NULL ,
	[out] [smallmoney] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Income_o] (
	[point] [tinyint] NOT NULL ,
	[date] [datetime] NOT NULL ,
	[inc] [smallmoney] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Outcome_o] (
	[point] [tinyint] NOT NULL ,
	[date] [datetime] NOT NULL ,
	[out] [smallmoney] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Income] WITH NOCHECK ADD 
	CONSTRAINT [PK_Income] PRIMARY KEY  NONCLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Outcome] WITH NOCHECK ADD 
	CONSTRAINT [PK_Outcome] PRIMARY KEY  NONCLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Income_o] WITH NOCHECK ADD 
	CONSTRAINT [PK_Income_o] PRIMARY KEY  NONCLUSTERED 
	(
		[point],
		[date]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Outcome_o] WITH NOCHECK ADD 
	CONSTRAINT [PK_Outcome_o] PRIMARY KEY  NONCLUSTERED 
	(
		[point],
		[date]
	)  ON [PRIMARY] 
GO
                                                                                                                                                                                                                                                                 
----Income------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Income values(1,1,'2001-03-22 00:00:00.000',15000.00)
insert into Income values(2,1,'2001-03-23 00:00:00.000',15000.00)
insert into Income values(3,1,'2001-03-24 00:00:00.000',3600.00)
insert into Income values(4,2,'2001-03-22 00:00:00.000',10000.00)
insert into Income values(5,2,'2001-03-24 00:00:00.000',1500.00)
insert into Income values(6,1,'2001-04-13 00:00:00.000',5000.00)
insert into Income values(7,1,'2001-05-11 00:00:00.000',4500.00)
insert into Income values(8,1,'2001-03-22 00:00:00.000',15000.00)
insert into Income values(9,2,'2001-03-24 00:00:00.000',1500.00)
insert into Income values(10,1,'2001-04-13 00:00:00.000',5000.00)
insert into Income values(11,1,'2001-03-24 00:00:00.000',3400.00)
insert into Income values(12,3,'2001-09-13 00:00:00.000',1350.00)
insert into Income values(13,3,'2001-09-13 00:00:00.000',1750.00)

GO

                                                                                                                                                                                                                                                                 
----Outcome------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Outcome values(1,1,'2001-03-14 00:00:00.000',15348.00)
insert into Outcome values(2,1,'2001-03-24 00:00:00.000',3663.00)
insert into Outcome values(3,1,'2001-03-26 00:00:00.000',1221.00)
insert into Outcome values(4,1,'2001-03-28 00:00:00.000',2075.00)
insert into Outcome values(5,1,'2001-03-29 00:00:00.000',2004.00)
insert into Outcome values(6,1,'2001-04-11 00:00:00.000',3195.04)
insert into Outcome values(7,1,'2001-04-13 00:00:00.000',4490.00)
insert into Outcome values(8,1,'2001-04-27 00:00:00.000',3110.00)
insert into Outcome values(9,1,'2001-05-11 00:00:00.000',2530.00)
insert into Outcome values(10,2,'2001-03-22 00:00:00.000',1440.00)
insert into Outcome values(11,2,'2001-03-29 00:00:00.000',7848.00)
insert into Outcome values(12,2,'2001-04-02 00:00:00.000',2040.00)
insert into Outcome values(13,1,'2001-03-24 00:00:00.000',3500.00)
insert into Outcome values(14,2,'2001-03-22 00:00:00.000',1440.00)
insert into Outcome values(15,1,'2001-03-29 00:00:00.000',2006.00)
insert into Outcome values(16,3,'2001-09-13 00:00:00.000',1200.00)
insert into Outcome values(17,3,'2001-09-13 00:00:00.000',1500.00)
insert into Outcome values(18,3,'2001-09-14 00:00:00.000',1150.00)

GO

                                                                                                                                                                                                                                                                 
----Income_o------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Income_o values(1,'2001-03-22 00:00:00.000',15000.00)
insert into Income_o values(1,'2001-03-23 00:00:00.000',15000.00)
insert into Income_o values(1,'2001-03-24 00:00:00.000',3400.00)
insert into Income_o values(1,'2001-04-13 00:00:00.000',5000.00)
insert into Income_o values(1,'2001-05-11 00:00:00.000',4500.00)
insert into Income_o values(2,'2001-03-22 00:00:00.000',10000.00)
insert into Income_o values(2,'2001-03-24 00:00:00.000',1500.00)
insert into Income_o values(3,'2001-09-13 00:00:00.000',11500.00)
insert into Income_o values(3,'2001-10-02 00:00:00.000',18000.00)

GO

                                                                                                                                                                                                                                                                 
----Outcome_o------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Outcome_o values(1,'2001-03-14 00:00:00.000',15348.00)
insert into Outcome_o values(1,'2001-03-24 00:00:00.000',3663.00)
insert into Outcome_o values(1,'2001-03-26 00:00:00.000',1221.00)
insert into Outcome_o values(1,'2001-03-28 00:00:00.000',2075.00)
insert into Outcome_o values(1,'2001-03-29 00:00:00.000',2004.00)
insert into Outcome_o values(1,'2001-04-11 00:00:00.000',3195.04)
insert into Outcome_o values(1,'2001-04-13 00:00:00.000',4490.00)
insert into Outcome_o values(1,'2001-04-27 00:00:00.000',3110.00)
insert into Outcome_o values(1,'2001-05-11 00:00:00.000',2530.00)
insert into Outcome_o values(2,'2001-03-22 00:00:00.000',1440.00)
insert into Outcome_o values(2,'2001-03-29 00:00:00.000',7848.00)
insert into Outcome_o values(2,'2001-04-02 00:00:00.000',2040.00)
insert into Outcome_o values(3,'2001-09-13 00:00:00.000',1500.00)
insert into Outcome_o values(3,'2001-09-14 00:00:00.000',2300.00)
insert into Outcome_o values(3,'2002-09-16 00:00:00.000',2150.00)

GO

