USE [master]
GO

/****** Object:  Database [Product]    Script Date: 01/04/2011 14:43:04 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'Product')
DROP DATABASE [Product]
GO

USE [master]
GO

/****** Object:  Database [Product]    Script Date: 01/04/2011 14:43:04 ******/
CREATE DATABASE [Product] ON  PRIMARY 
( NAME = N'Product', FILENAME = N'D:\DBMS_Bacalavr\SQLDATA\Product.mdf' , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Product_log', FILENAME = N'D:\DBMS_Bacalavr\SQLDATA\Product_log.ldf' , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Product].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Product] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Product] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Product] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Product] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Product] SET ARITHABORT OFF 
GO

ALTER DATABASE [Product] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Product] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [Product] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Product] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Product] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Product] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Product] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Product] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Product] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Product] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Product] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Product] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Product] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Product] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Product] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Product] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Product] SET  READ_WRITE 
GO

ALTER DATABASE [Product] SET RECOVERY FULL 
GO

ALTER DATABASE [Product] SET  MULTI_USER 
GO

ALTER DATABASE [Product] SET PAGE_VERIFY CHECKSUM  
GO

USE [Product]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Laptop]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Laptop]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[PC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PC]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[product]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Product]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Printer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Printer]
GO

CREATE TABLE [dbo].[Laptop] (
	[code] [int] NOT NULL ,
	[model] [varchar] (4) NOT NULL ,
	[speed] [decimal](4, 0) NOT NULL ,
	[ram] [decimal](4, 0) NOT NULL ,
	[hd] [decimal](3, 0) NOT NULL ,
	[screen] [int] NOT NULL , 
	[price] [float] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PC] (
	[code] [int] NOT NULL ,
	[model] [varchar] (4) NOT NULL ,
	[speed] [decimal](4, 0) NOT NULL ,
	[ram] [decimal](4, 0) NOT NULL ,
	[hd] [decimal](3, 0) NOT NULL ,
	[cd] [varchar] (3) NOT NULL ,
	[price] [float] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Product] (
	[maker] [char] (1) NOT NULL ,
	[model] [varchar] (4) NOT NULL ,
	[type] [varchar] (7) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Printer] (
	[code] [int] NOT NULL ,
	[model] [varchar] (4) NOT NULL ,
	[color] [char] (1) NOT NULL ,
	[type] [varchar] (6) NOT NULL ,
	[price] [float] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Laptop] WITH NOCHECK ADD 
	CONSTRAINT [PK_Laptop] PRIMARY KEY  NONCLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PC] WITH NOCHECK ADD 
	CONSTRAINT [PK_PC] PRIMARY KEY  NONCLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Product] WITH NOCHECK ADD 
	CONSTRAINT [PK_Product] PRIMARY KEY  NONCLUSTERED 
	(
		[model]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Printer] WITH NOCHECK ADD 
	CONSTRAINT [PK_Printer] PRIMARY KEY  NONCLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Laptop] ADD 
	CONSTRAINT [FK_Laptop_Product] FOREIGN KEY 
	(
		[model]
	) REFERENCES [dbo].[Product] (
		[model]
	)
GO

ALTER TABLE [dbo].[PC] ADD 
	CONSTRAINT [FK_PC_Product] FOREIGN KEY 
	(
		[model]
	) REFERENCES [dbo].[Product] (
		[model]
	)
GO

ALTER TABLE [dbo].[Printer] ADD 
	CONSTRAINT [FK_Printer_Product] FOREIGN KEY 
	(
		[model]
	) REFERENCES [dbo].[Product] (
		[model]
	)
GO
----Product------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Product values('A','1001','PC')
insert into Product values('A','1002','PC')
insert into Product values('A','1003','PC')
insert into Product values('A','2004','laptop')
insert into Product values('A','2005','laptop')
insert into Product values('A','2006','laptop')
insert into Product values('B','1004','PC')
insert into Product values('B','1005','PC')
insert into Product values('B','1006','PC')
insert into Product values('B','2001','laptop')
insert into Product values('B','2002','laptop')
insert into Product values('B','2003','laptop')
insert into Product values('C','1007','PC')
insert into Product values('C','1008','PC')
insert into Product values('C','2008','Laptop')
insert into Product values('C','2009','Laptop')
insert into Product values('C','3002','Printer')
insert into Product values('C','3003','Printer')
insert into Product values('C','3006','Printer')
insert into Product values('D','1009','PC')
insert into Product values('D','1010','PC')
insert into Product values('D','1011','PC')
insert into Product values('D','2007','Laptop')
insert into Product values('E','1012','PC')
insert into Product values('E','1013','PC')
insert into Product values('E','2010','laptop')
insert into Product values('F','3001','Printer')
insert into Product values('F','3004','Printer')
insert into Product values('G','3005','Printer')
insert into Product values('H','3007','Printer')
go

                                                                                                                                                                                                                                                                 
----PC------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into PC values(1,'1001',700,64,5,'12x',600)
insert into PC values(2,'1002',1500,128,14,'40x',1800)
insert into PC values(3,'1003',866,64,5,'12x',950)
insert into PC values(4,'1004',866,128,14,'40x',966)
insert into PC values(5,'1005',1000,128,20,'40x',850)
insert into PC values(6,'1005',1000,128,20,'50x',950)
insert into PC values(7,'1006',1400,64,20,'50x',2100)
insert into PC values(8,'1007',700,64,8,'24x',600)
insert into PC values(9,'1007',733,64,10,'24x',610)
insert into PC values(10,'1008',700,32,10,'12x',600)
insert into PC values(11,'1009',1200,128,40,'40x',980)
insert into PC values(12,'1010',750,128,40,'40x',980)
insert into PC values(13,'1011',1100,128,40,'40x',980)
insert into PC values(14,'1012',350,128,20,'40x',390)
insert into PC values(15,'1012',350,128,40,'40x',400)
insert into PC values(16,'1013',733,128,40,'40x',800)

go

                                                                                                                                                                                                                                                                 
----Laptop------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Laptop values(1,'2001',700,64,5,12.1,1448)
insert into Laptop values(2,'2002',800,96,10,15.1,2584)
insert into Laptop values(3,'2003',850,64,10,15.1,2738)
insert into Laptop values(4,'2002',800,96,10,15.1,2584)
insert into Laptop values(5,'2003',850,64,10,15.1,2738)
insert into Laptop values(6,'2004',550,32,5,12.1,999)
insert into Laptop values(7,'2005',600,64,6,12.1,2399)
insert into Laptop values(8,'2006',800,96,20,15.7,2999)
insert into Laptop values(9,'2007',850,128,20,15.0,3099)
insert into Laptop values(10,'2008',650,64,10,12.1,1249)
insert into Laptop values(11,'2009',750,256,20,15.1,2599)
insert into Laptop values(12,'2010',366,64,10,12.1,1499)

go

                                                                                                                                                                                                                                                                 
----Printer------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Printer values(1,'3001','y','Jet',400)
insert into Printer values(2,'3002','y','Jet',270)
insert into Printer values(3,'3003','n','Laser',290)
insert into Printer values(4,'3004','y','Jet',150)
insert into Printer values(5,'3005','y','Matrix',150)
insert into Printer values(6,'3006','y','Laser',270)
insert into Printer values(7,'3006','Y','Laser',150)
insert into Printer values(8,'3007','n','Laser',400)

go