USE [master]
GO
/****** Object:  Database [SWCCorp]    Script Date: 12/11/2015 10:00:25 AM ******/
CREATE DATABASE [SWCCorp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWCCorp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\SWCCorp.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SWCCorp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\SWCCorp_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SWCCorp] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWCCorp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWCCorp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWCCorp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWCCorp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWCCorp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWCCorp] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWCCorp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWCCorp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWCCorp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWCCorp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWCCorp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWCCorp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWCCorp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWCCorp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWCCorp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWCCorp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWCCorp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWCCorp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWCCorp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWCCorp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWCCorp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWCCorp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWCCorp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWCCorp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWCCorp] SET  MULTI_USER 
GO
ALTER DATABASE [SWCCorp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWCCorp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWCCorp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWCCorp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SWCCorp] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SWCCorp]
GO
/****** Object:  Table [dbo].[CurrentProducts]    Script Date: 12/11/2015 10:00:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CurrentProducts](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[RetailPrice] [money] NULL,
	[OriginationDate] [datetime] NULL,
	[ToBeDeleted] [bit] NULL,
	[Category] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/11/2015 10:00:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpID] [int] NOT NULL,
	[LastName] [varchar](30) NULL,
	[FirstName] [varchar](20) NULL,
	[HireDate] [datetime] NULL,
	[LocationID] [int] NULL,
	[ManagerID] [int] NULL,
	[Status] [char](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grant]    Script Date: 12/11/2015 10:00:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grant](
	[GrantID] [char](3) NOT NULL,
	[GrantName] [nvarchar](50) NOT NULL,
	[EmpID] [int] NULL,
	[Amount] [smallmoney] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Location]    Script Date: 12/11/2015 10:00:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] NOT NULL,
	[Street] [varchar](30) NULL,
	[City] [varchar](20) NULL,
	[State] [char](2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MgmtTraining]    Script Date: 12/11/2015 10:00:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MgmtTraining](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[ClassDurationHours] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PayRates]    Script Date: 12/11/2015 10:00:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayRates](
	[EmpID] [int] NOT NULL,
	[YearlySalary] [smallmoney] NULL,
	[MonthlySalary] [smallmoney] NULL,
	[HourlyRate] [smallmoney] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CurrentProducts] ON 

INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (1, N'Underwater Tour 1 Day West Coast', 61.4830, CAST(N'2009-05-07 13:33:09.957' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (2, N'Underwater Tour 2 Days West Coast', 110.6694, CAST(N'2010-06-29 23:43:22.813' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (3, N'Underwater Tour 3 Days West Coast', 184.4490, CAST(N'2012-02-03 16:07:49.900' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (4, N'Underwater Tour 5 Days West Coast', 245.9320, CAST(N'2008-11-28 04:59:06.600' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (5, N'Underwater Tour 1 Week West Coast', 307.4150, CAST(N'2004-04-13 19:20:11.400' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (6, N'Underwater Tour 2 Weeks West Coast', 553.3470, CAST(N'2011-03-27 20:40:38.760' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (7, N'Underwater Tour 1 Day East Coast', 80.8590, CAST(N'2010-01-01 08:25:43.233' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (8, N'Underwater Tour 2 Days East Coast', 145.5462, CAST(N'2008-03-07 09:52:12.910' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (9, N'Underwater Tour 3 Days East Coast', 242.5770, CAST(N'2005-12-26 04:59:05.850' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (10, N'Underwater Tour 5 Days East Coast', 323.4360, CAST(N'2008-01-08 04:34:35.027' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (11, N'Underwater Tour 1 Week East Coast', 404.2950, CAST(N'2007-06-06 13:15:33.183' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (12, N'Underwater Tour 2 Weeks East Coast', 727.7310, CAST(N'2011-08-22 19:59:47.407' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (13, N'Underwater Tour 1 Day Mexico', 105.0590, CAST(N'2004-11-27 01:42:22.747' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (14, N'Underwater Tour 2 Days Mexico', 189.1062, CAST(N'2010-11-18 23:42:31.903' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (15, N'Underwater Tour 3 Days Mexico', 315.1770, CAST(N'2007-04-06 05:50:03.403' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (16, N'Underwater Tour 5 Days Mexico', 420.2360, CAST(N'2007-06-09 09:02:33.410' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (17, N'Underwater Tour 1 Week Mexico', 525.2950, CAST(N'2011-12-28 20:56:26.560' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (18, N'Underwater Tour 2 Weeks Mexico', 945.5310, CAST(N'2004-12-20 14:17:02.213' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (19, N'Underwater Tour 1 Day Canada', 85.5850, CAST(N'2007-01-13 16:12:07.293' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (20, N'Underwater Tour 2 Days Canada', 154.0530, CAST(N'2009-07-26 10:10:51.630' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (21, N'Underwater Tour 3 Days Canada', 256.7550, CAST(N'2008-07-10 21:07:11.843' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (22, N'Underwater Tour 5 Days Canada', 342.3400, CAST(N'2004-05-12 05:51:43.350' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (23, N'Underwater Tour 1 Week Canada', 427.9250, CAST(N'2006-12-05 07:21:53.690' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (24, N'Underwater Tour 2 Weeks Canada', 770.2650, CAST(N'2010-09-14 20:27:04.500' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (25, N'Underwater Tour 1 Day Scandinavia', 116.1180, CAST(N'2010-11-03 20:29:19.807' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (26, N'Underwater Tour 2 Days Scandinavia', 209.0124, CAST(N'2008-02-20 10:01:01.373' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (27, N'Underwater Tour 3 Days Scandinavia', 348.3540, CAST(N'2009-03-07 00:34:25.353' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (28, N'Underwater Tour 5 Days Scandinavia', 464.4720, CAST(N'2010-08-03 01:50:19.387' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (29, N'Underwater Tour 1 Week Scandinavia', 580.5900, CAST(N'2006-12-03 01:03:05.267' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (30, N'Underwater Tour 2 Weeks Scandinavia', 1045.0620, CAST(N'2011-12-24 14:10:22.090' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (31, N'History Tour 1 Day West Coast', 74.6220, CAST(N'2008-03-31 15:47:12.533' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (32, N'History Tour 2 Days West Coast', 134.3196, CAST(N'2012-01-02 14:38:30.100' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (33, N'History Tour 3 Days West Coast', 223.8660, CAST(N'2006-05-08 01:35:41.617' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (34, N'History Tour 5 Days West Coast', 298.4880, CAST(N'2006-04-16 23:13:51.173' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (35, N'History Tour 1 Week West Coast', 373.1100, CAST(N'2005-11-03 22:51:16.123' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (36, N'History Tour 2 Weeks West Coast', 671.5980, CAST(N'2005-09-08 09:10:33.740' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (37, N'History Tour 1 Day East Coast', 107.1590, CAST(N'2004-10-17 17:39:47.343' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (38, N'History Tour 2 Days East Coast', 192.8862, CAST(N'2008-03-31 06:15:19.480' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (39, N'History Tour 3 Days East Coast', 321.4770, CAST(N'2008-01-14 00:51:58.423' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (40, N'History Tour 5 Days East Coast', 428.6360, CAST(N'2007-02-18 07:23:21.257' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (41, N'History Tour 1 Week East Coast', 535.7950, CAST(N'2012-05-06 09:18:28.820' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (42, N'History Tour 2 Weeks East Coast', 964.4310, CAST(N'2010-05-17 23:20:28.873' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (43, N'History Tour 1 Day Mexico', 71.1420, CAST(N'2006-04-06 17:06:36.750' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (44, N'History Tour 2 Days Mexico', 128.0556, CAST(N'2010-01-07 15:13:52.513' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (45, N'History Tour 3 Days Mexico', 213.4260, CAST(N'2009-04-23 06:38:48.673' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (46, N'History Tour 5 Days Mexico', 284.5680, CAST(N'2010-05-02 17:04:22.860' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (47, N'History Tour 1 Week Mexico', 355.7100, CAST(N'2009-05-26 01:33:52.920' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (48, N'History Tour 2 Weeks Mexico', 640.2780, CAST(N'2010-10-13 01:38:31.447' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (49, N'History Tour 1 Day Canada', 113.2870, CAST(N'2010-01-04 19:36:14.467' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (50, N'History Tour 2 Days Canada', 203.9166, CAST(N'2009-03-09 01:47:12.853' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (51, N'History Tour 3 Days Canada', 339.8610, CAST(N'2005-12-01 01:55:06.267' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (52, N'History Tour 5 Days Canada', 453.1480, CAST(N'2008-11-08 09:36:44.487' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (53, N'History Tour 1 Week Canada', 566.4350, CAST(N'2009-11-22 04:09:35.807' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (54, N'History Tour 2 Weeks Canada', 1019.5830, CAST(N'2004-10-08 21:31:21.890' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (55, N'History Tour 1 Day Scandinavia', 111.7350, CAST(N'2006-03-21 17:33:34.927' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (56, N'History Tour 2 Days Scandinavia', 201.1230, CAST(N'2006-11-18 07:37:52.607' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (57, N'History Tour 3 Days Scandinavia', 335.2050, CAST(N'2010-03-03 15:59:51.810' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (58, N'History Tour 5 Days Scandinavia', 446.9400, CAST(N'2008-09-14 10:33:18.217' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (59, N'History Tour 1 Week Scandinavia', 558.6750, CAST(N'2005-08-09 04:56:16.810' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (60, N'History Tour 2 Weeks Scandinavia', 1005.6150, CAST(N'2004-12-02 20:46:04.163' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (61, N'Ocean Cruise Tour 1 Day West Coast', 122.4410, CAST(N'2007-04-13 17:16:57.157' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (62, N'Ocean Cruise Tour 2 Days West Coast', 220.3938, CAST(N'2009-08-15 13:56:26.517' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (63, N'Ocean Cruise Tour 3 Days West Coast', 367.3230, CAST(N'2011-11-07 11:23:22.360' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (64, N'Ocean Cruise Tour 5 Days West Coast', 489.7640, CAST(N'2009-07-31 15:45:13.350' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (65, N'Ocean Cruise Tour 1 Week West Coast', 612.2050, CAST(N'2006-09-02 22:54:33.533' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (66, N'Ocean Cruise Tour 2 Weeks West Coast', 1101.9690, CAST(N'2009-05-04 07:48:04.043' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (67, N'Ocean Cruise Tour 1 Day East Coast', 61.8600, CAST(N'2006-12-02 19:39:21.190' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (68, N'Ocean Cruise Tour 2 Days East Coast', 111.3480, CAST(N'2011-06-18 21:07:09.723' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (69, N'Ocean Cruise Tour 3 Days East Coast', 185.5800, CAST(N'2011-11-15 07:19:19.320' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (70, N'Ocean Cruise Tour 5 Days East Coast', 247.4400, CAST(N'2007-10-03 07:44:12.623' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (71, N'Ocean Cruise Tour 1 Week East Coast', 309.3000, CAST(N'2010-06-16 11:18:43.850' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (72, N'Ocean Cruise Tour 2 Weeks East Coast', 556.7400, CAST(N'2008-08-30 21:28:44.060' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (73, N'Ocean Cruise Tour 1 Day Mexico', 32.6010, CAST(N'2010-01-01 06:01:01.907' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (74, N'Ocean Cruise Tour 2 Days Mexico', 58.6818, CAST(N'2008-10-15 03:10:17.813' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (75, N'Ocean Cruise Tour 3 Days Mexico', 97.8030, CAST(N'2011-12-03 09:23:16.953' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (76, N'Ocean Cruise Tour 5 Days Mexico', 130.4040, CAST(N'2005-10-28 21:41:55.147' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (77, N'Ocean Cruise Tour 1 Week Mexico', 163.0050, CAST(N'2012-06-11 23:10:43.670' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (78, N'Ocean Cruise Tour 2 Weeks Mexico', 293.4090, CAST(N'2004-12-18 10:48:19.740' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (79, N'Ocean Cruise Tour 1 Day Canada', 62.5440, CAST(N'2008-10-14 14:35:24.857' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (80, N'Ocean Cruise Tour 2 Days Canada', 112.5792, CAST(N'2008-10-11 10:39:59.820' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (81, N'Ocean Cruise Tour 3 Days Canada', 187.6320, CAST(N'2009-05-18 02:56:11.150' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (82, N'Ocean Cruise Tour 5 Days Canada', 250.1760, CAST(N'2009-06-19 04:15:35.160' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (83, N'Ocean Cruise Tour 1 Week Canada', 312.7200, CAST(N'2011-09-04 07:01:51.520' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (84, N'Ocean Cruise Tour 2 Weeks Canada', 562.8960, CAST(N'2010-08-09 13:56:57.833' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (85, N'Ocean Cruise Tour 1 Day Scandinavia', 107.1750, CAST(N'2006-03-01 14:50:59.993' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (86, N'Ocean Cruise Tour 2 Days Scandinavia', 192.9150, CAST(N'2005-05-30 13:09:51.850' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (87, N'Ocean Cruise Tour 3 Days Scandinavia', 321.5250, CAST(N'2006-06-13 01:15:14.163' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (88, N'Ocean Cruise Tour 5 Days Scandinavia', 428.7000, CAST(N'2012-04-24 03:18:37.650' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (89, N'Ocean Cruise Tour 1 Week Scandinavia', 535.8750, CAST(N'2005-08-04 12:29:02.653' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (90, N'Ocean Cruise Tour 2 Weeks Scandinavia', 964.5750, CAST(N'2008-03-29 19:25:18.263' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (91, N'Fruit Tasting Tour 1 Day West Coast', 85.9330, CAST(N'2008-12-07 06:11:30.770' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (92, N'Fruit Tasting Tour 2 Days West Coast', 154.6794, CAST(N'2007-07-06 01:24:45.163' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (93, N'Fruit Tasting Tour 3 Days West Coast', 257.7990, CAST(N'2009-10-02 19:39:22.860' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (94, N'Fruit Tasting Tour 5 Days West Coast', 343.7320, CAST(N'2005-01-12 09:29:14.667' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (95, N'Fruit Tasting Tour 1 Week West Coast', 429.6650, CAST(N'2012-06-15 20:56:04.023' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (96, N'Fruit Tasting Tour 2 Weeks West Coast', 773.3970, CAST(N'2004-04-19 10:21:12.047' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (97, N'Fruit Tasting Tour 1 Day East Coast', 69.9920, CAST(N'2004-11-23 10:31:22.707' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (98, N'Fruit Tasting Tour 2 Days East Coast', 125.9856, CAST(N'2008-05-23 01:17:03.407' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (99, N'Fruit Tasting Tour 3 Days East Coast', 209.9760, CAST(N'2010-01-01 16:36:32.460' AS DateTime), 0, N'Medium-Stay')
GO
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (100, N'Fruit Tasting Tour 5 Days East Coast', 279.9680, CAST(N'2012-03-06 12:26:21.767' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (101, N'Fruit Tasting Tour 1 Week East Coast', 349.9600, CAST(N'2005-11-12 19:10:53.443' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (102, N'Fruit Tasting Tour 2 Weeks East Coast', 629.9280, CAST(N'2009-01-29 15:12:34.373' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (103, N'Fruit Tasting Tour 1 Day Mexico', 79.5970, CAST(N'2010-07-09 22:09:37.930' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (104, N'Fruit Tasting Tour 2 Days Mexico', 143.2746, CAST(N'2010-02-03 08:21:49.353' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (105, N'Fruit Tasting Tour 3 Days Mexico', 238.7910, CAST(N'2010-04-06 17:01:35.057' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (106, N'Fruit Tasting Tour 5 Days Mexico', 318.3880, CAST(N'2007-09-09 20:52:40.460' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (107, N'Fruit Tasting Tour 1 Week Mexico', 397.9850, CAST(N'2007-05-03 19:36:34.823' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (108, N'Fruit Tasting Tour 2 Weeks Mexico', 716.3730, CAST(N'2007-05-10 06:07:18.740' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (109, N'Fruit Tasting Tour 1 Day Canada', 47.7930, CAST(N'2009-01-27 05:03:32.990' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (110, N'Fruit Tasting Tour 2 Days Canada', 86.0274, CAST(N'2009-04-09 13:13:34.560' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (111, N'Fruit Tasting Tour 3 Days Canada', 143.3790, CAST(N'2012-04-06 19:46:31.960' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (112, N'Fruit Tasting Tour 5 Days Canada', 191.1720, CAST(N'2009-05-21 03:23:05.803' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (113, N'Fruit Tasting Tour 1 Week Canada', 238.9650, CAST(N'2011-07-10 00:37:05.693' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (114, N'Fruit Tasting Tour 2 Weeks Canada', 430.1370, CAST(N'2005-08-06 18:47:21.547' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (115, N'Fruit Tasting Tour 1 Day Scandinavia', 109.3820, CAST(N'2011-11-18 12:47:51.163' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (116, N'Fruit Tasting Tour 2 Days Scandinavia', 196.8876, CAST(N'2006-07-28 07:22:49.733' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (117, N'Fruit Tasting Tour 3 Days Scandinavia', 328.1460, CAST(N'2009-02-22 04:42:20.073' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (118, N'Fruit Tasting Tour 5 Days Scandinavia', 437.5280, CAST(N'2011-06-18 11:19:14.613' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (119, N'Fruit Tasting Tour 1 Week Scandinavia', 546.9100, CAST(N'2010-04-23 12:05:25.020' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (120, N'Fruit Tasting Tour 2 Weeks Scandinavia', 984.4380, CAST(N'2009-11-07 15:00:38.513' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (121, N'Mountain Lodge 1 Day West Coast', 89.5010, CAST(N'2006-01-29 03:34:01.013' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (122, N'Mountain Lodge 2 Days West Coast', 161.1018, CAST(N'2004-05-30 15:07:17.133' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (123, N'Mountain Lodge 3 Days West Coast', 268.5030, CAST(N'2005-01-26 04:28:57.177' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (124, N'Mountain Lodge 5 Days West Coast', 358.0040, CAST(N'2007-07-20 17:23:06.897' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (125, N'Mountain Lodge 1 Week West Coast', 447.5050, CAST(N'2011-07-30 08:51:04.347' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (126, N'Mountain Lodge 2 Weeks West Coast', 805.5090, CAST(N'2011-01-13 14:36:48.327' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (127, N'Mountain Lodge 1 Day East Coast', 52.6810, CAST(N'2011-05-10 11:28:55.860' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (128, N'Mountain Lodge 2 Days East Coast', 94.8258, CAST(N'2009-05-30 14:58:46.753' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (129, N'Mountain Lodge 3 Days East Coast', 158.0430, CAST(N'2010-02-08 20:07:14.233' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (130, N'Mountain Lodge 5 Days East Coast', 210.7240, CAST(N'2010-09-09 06:30:26.740' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (131, N'Mountain Lodge 1 Week East Coast', 263.4050, CAST(N'2006-10-12 17:15:19.740' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (132, N'Mountain Lodge 2 Weeks East Coast', 474.1290, CAST(N'2008-09-18 11:27:16.900' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (133, N'Mountain Lodge 1 Day Mexico', 87.4360, CAST(N'2012-02-29 13:16:29.050' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (134, N'Mountain Lodge 2 Days Mexico', 157.3848, CAST(N'2010-01-10 22:30:39.013' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (135, N'Mountain Lodge 3 Days Mexico', 262.3080, CAST(N'2011-08-23 22:52:11.600' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (136, N'Mountain Lodge 5 Days Mexico', 349.7440, CAST(N'2006-04-22 13:41:23.183' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (137, N'Mountain Lodge 1 Week Mexico', 437.1800, CAST(N'2006-05-29 14:50:50.670' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (138, N'Mountain Lodge 2 Weeks Mexico', 786.9240, CAST(N'2007-07-31 20:50:58.687' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (139, N'Mountain Lodge 1 Day Canada', 73.6980, CAST(N'2007-08-10 05:17:43.603' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (140, N'Mountain Lodge 2 Days Canada', 132.6564, CAST(N'2011-01-06 16:17:06.413' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (141, N'Mountain Lodge 3 Days Canada', 221.0940, CAST(N'2012-02-03 19:42:45.940' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (142, N'Mountain Lodge 5 Days Canada', 294.7920, CAST(N'2011-04-09 21:01:53.807' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (143, N'Mountain Lodge 1 Week Canada', 368.4900, CAST(N'2010-08-28 05:45:26.000' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (144, N'Mountain Lodge 2 Weeks Canada', 663.2820, CAST(N'2006-02-18 13:51:19.217' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (145, N'Mountain Lodge 1 Day Scandinavia', 32.5740, CAST(N'2012-01-04 05:55:45.417' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (146, N'Mountain Lodge 2 Days Scandinavia', 58.6332, CAST(N'2005-10-08 22:13:34.480' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (147, N'Mountain Lodge 3 Days Scandinavia', 97.7220, CAST(N'2009-05-22 17:42:09.200' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (148, N'Mountain Lodge 5 Days Scandinavia', 130.2960, CAST(N'2006-09-12 13:57:13.160' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (149, N'Mountain Lodge 1 Week Scandinavia', 162.8700, CAST(N'2010-03-06 03:24:09.913' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (150, N'Mountain Lodge 2 Weeks Scandinavia', 293.1660, CAST(N'2004-10-19 03:41:00.587' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (151, N'Spa & Pleasure Getaway 1 Day West Coast', 80.3110, CAST(N'2010-12-29 15:28:12.547' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (152, N'Spa & Pleasure Getaway 2 Days West Coast', 144.5598, CAST(N'2007-05-30 12:43:23.130' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (153, N'Spa & Pleasure Getaway 3 Days West Coast', 240.9330, CAST(N'2012-05-26 14:20:25.447' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (154, N'Spa & Pleasure Getaway 5 Days West Coast', 321.2440, CAST(N'2011-03-25 08:34:55.663' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (155, N'Spa & Pleasure Getaway 1 Week West Coast', 401.5550, CAST(N'2006-06-01 15:34:50.587' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (156, N'Spa & Pleasure Getaway 2 Weeks West Coast', 722.7990, CAST(N'2010-10-18 23:56:47.173' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (157, N'Spa & Pleasure Getaway 1 Day East Coast', 86.4840, CAST(N'2007-01-30 13:03:10.153' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (158, N'Spa & Pleasure Getaway 2 Days East Coast', 155.6712, CAST(N'2005-07-11 07:31:00.890' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (159, N'Spa & Pleasure Getaway 3 Days East Coast', 259.4520, CAST(N'2005-12-21 00:05:37.813' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (160, N'Spa & Pleasure Getaway 5 Days East Coast', 345.9360, CAST(N'2007-12-09 09:22:11.370' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (161, N'Spa & Pleasure Getaway 1 Week East Coast', 432.4200, CAST(N'2010-02-01 22:32:50.720' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (162, N'Spa & Pleasure Getaway 2 Weeks East Coast', 778.3560, CAST(N'2009-12-07 16:51:00.603' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (163, N'Spa & Pleasure Getaway 1 Day Mexico', 98.5920, CAST(N'2011-08-31 17:44:13.070' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (164, N'Spa & Pleasure Getaway 2 Days Mexico', 177.4656, CAST(N'2011-01-07 01:11:27.417' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (165, N'Spa & Pleasure Getaway 3 Days Mexico', 295.7760, CAST(N'2009-09-03 02:45:47.557' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (166, N'Spa & Pleasure Getaway 5 Days Mexico', 394.3680, CAST(N'2006-08-30 10:14:20.790' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (167, N'Spa & Pleasure Getaway 1 Week Mexico', 492.9600, CAST(N'2007-10-30 22:49:53.993' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (168, N'Spa & Pleasure Getaway 2 Weeks Mexico', 887.3280, CAST(N'2006-01-17 13:11:56.973' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (169, N'Spa & Pleasure Getaway 1 Day Canada', 93.3770, CAST(N'2012-05-01 00:21:38.860' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (170, N'Spa & Pleasure Getaway 2 Days Canada', 168.0786, CAST(N'2009-07-26 10:46:48.597' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (171, N'Spa & Pleasure Getaway 3 Days Canada', 280.1310, CAST(N'2011-02-18 13:31:19.450' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (172, N'Spa & Pleasure Getaway 5 Days Canada', 373.5080, CAST(N'2012-05-11 11:18:31.230' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (173, N'Spa & Pleasure Getaway 1 Week Canada', 466.8850, CAST(N'2008-12-25 07:31:52.213' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (174, N'Spa & Pleasure Getaway 2 Weeks Canada', 840.3930, CAST(N'2005-11-16 03:23:21.510' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (175, N'Spa & Pleasure Getaway 1 Day Scandinavia', 97.7660, CAST(N'2009-10-16 00:23:24.603' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (176, N'Spa & Pleasure Getaway 2 Days Scandinavia', 175.9788, CAST(N'2012-05-11 03:56:46.753' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (177, N'Spa & Pleasure Getaway 3 Days Scandinavia', 293.2980, CAST(N'2012-04-18 18:09:32.963' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (178, N'Spa & Pleasure Getaway 5 Days Scandinavia', 391.0640, CAST(N'2009-05-30 07:42:24.733' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (179, N'Spa & Pleasure Getaway 1 Week Scandinavia', 488.8300, CAST(N'2009-11-19 08:53:09.973' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (180, N'Spa & Pleasure Getaway 2 Weeks Scandinavia', 879.8940, CAST(N'2009-09-24 15:40:43.627' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (181, N'Horseback Tour 1 Day West Coast', 74.4510, CAST(N'2008-04-20 01:13:35.060' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (182, N'Horseback Tour 2 Days West Coast', 134.0118, CAST(N'2008-03-27 03:17:13.360' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (183, N'Horseback Tour 3 Days West Coast', 223.3530, CAST(N'2011-10-31 22:33:06.547' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (184, N'Horseback Tour 5 Days West Coast', 297.8040, CAST(N'2009-09-29 13:06:42.637' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (185, N'Horseback Tour 1 Week West Coast', 372.2550, CAST(N'2006-01-25 23:25:43.953' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (186, N'Horseback Tour 2 Weeks West Coast', 670.0590, CAST(N'2005-09-10 23:08:57.657' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (187, N'Horseback Tour 1 Day East Coast', 41.9790, CAST(N'2008-11-24 03:44:36.443' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (188, N'Horseback Tour 2 Days East Coast', 75.5622, CAST(N'2006-03-27 11:49:14.037' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (189, N'Horseback Tour 3 Days East Coast', 125.9370, CAST(N'2004-06-18 11:25:03.087' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (190, N'Horseback Tour 5 Days East Coast', 167.9160, CAST(N'2012-03-31 01:58:23.650' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (191, N'Horseback Tour 1 Week East Coast', 209.8950, CAST(N'2004-10-22 16:15:45.550' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (192, N'Horseback Tour 2 Weeks East Coast', 377.8110, CAST(N'2011-04-04 19:56:20.753' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (193, N'Horseback Tour 1 Day Mexico', 98.3310, CAST(N'2005-05-15 20:36:46.160' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (194, N'Horseback Tour 2 Days Mexico', 176.9958, CAST(N'2006-04-23 19:17:34.590' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (195, N'Horseback Tour 3 Days Mexico', 294.9930, CAST(N'2010-03-15 07:03:38.850' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (196, N'Horseback Tour 5 Days Mexico', 393.3240, CAST(N'2004-05-21 16:50:02.287' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (197, N'Horseback Tour 1 Week Mexico', 491.6550, CAST(N'2012-02-26 15:59:20.503' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (198, N'Horseback Tour 2 Weeks Mexico', 884.9790, CAST(N'2010-09-01 20:05:46.043' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (199, N'Horseback Tour 1 Day Canada', 45.7950, CAST(N'2009-11-18 17:27:08.150' AS DateTime), 1, N'No-Stay')
GO
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (200, N'Horseback Tour 2 Days Canada', 82.4310, CAST(N'2006-04-27 19:16:05.823' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (201, N'Horseback Tour 3 Days Canada', 137.3850, CAST(N'2009-05-01 11:05:44.240' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (202, N'Horseback Tour 5 Days Canada', 183.1800, CAST(N'2011-04-25 16:38:48.783' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (203, N'Horseback Tour 1 Week Canada', 228.9750, CAST(N'2008-03-20 07:30:24.033' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (204, N'Horseback Tour 2 Weeks Canada', 412.1550, CAST(N'2012-03-11 20:24:32.400' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (205, N'Horseback Tour 1 Day Scandinavia', 113.7140, CAST(N'2012-03-28 05:38:51.743' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (206, N'Horseback Tour 2 Days Scandinavia', 204.6852, CAST(N'2009-10-22 19:09:42.283' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (207, N'Horseback Tour 3 Days Scandinavia', 341.1420, CAST(N'2005-02-28 11:18:59.967' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (208, N'Horseback Tour 5 Days Scandinavia', 454.8560, CAST(N'2005-02-16 13:09:41.150' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (209, N'Horseback Tour 1 Week Scandinavia', 568.5700, CAST(N'2005-08-24 14:16:04.533' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (210, N'Horseback Tour 2 Weeks Scandinavia', 1023.4260, CAST(N'2007-04-01 08:32:59.657' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (211, N'Tiger Watching Tour 1 Day West Coast', 50.0410, CAST(N'2008-08-07 19:03:56.987' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (212, N'Tiger Watching Tour 2 Days West Coast', 90.0738, CAST(N'2005-10-07 15:54:07.667' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (213, N'Tiger Watching Tour 3 Days West Coast', 150.1230, CAST(N'2008-10-24 20:32:47.510' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (214, N'Tiger Watching Tour 5 Days West Coast', 200.1640, CAST(N'2008-05-03 23:51:58.850' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (215, N'Tiger Watching Tour 1 Week West Coast', 250.2050, CAST(N'2012-01-13 15:31:01.873' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (216, N'Tiger Watching Tour 2 Weeks West Coast', 450.3690, CAST(N'2010-05-10 14:09:58.610' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (217, N'Tiger Watching Tour 1 Day East Coast', 86.7470, CAST(N'2008-11-14 00:46:25.707' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (218, N'Tiger Watching Tour 2 Days East Coast', 156.1446, CAST(N'2010-01-09 17:44:13.930' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (219, N'Tiger Watching Tour 3 Days East Coast', 260.2410, CAST(N'2008-07-14 17:58:23.450' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (220, N'Tiger Watching Tour 5 Days East Coast', 346.9880, CAST(N'2008-11-22 14:30:47.183' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (221, N'Tiger Watching Tour 1 Week East Coast', 433.7350, CAST(N'2006-01-03 08:30:24.930' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (222, N'Tiger Watching Tour 2 Weeks East Coast', 780.7230, CAST(N'2005-05-04 11:02:03.103' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (223, N'Tiger Watching Tour 1 Day Mexico', 105.1210, CAST(N'2007-12-20 18:31:35.670' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (224, N'Tiger Watching Tour 2 Days Mexico', 189.2178, CAST(N'2009-05-17 17:33:09.463' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (225, N'Tiger Watching Tour 3 Days Mexico', 315.3630, CAST(N'2006-05-24 14:55:45.827' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (226, N'Tiger Watching Tour 5 Days Mexico', 420.4840, CAST(N'2009-05-05 19:30:49.443' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (227, N'Tiger Watching Tour 1 Week Mexico', 525.6050, CAST(N'2008-03-26 03:33:57.727' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (228, N'Tiger Watching Tour 2 Weeks Mexico', 946.0890, CAST(N'2005-08-20 01:59:51.337' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (229, N'Tiger Watching Tour 1 Day Canada', 77.5420, CAST(N'2009-08-17 03:34:00.293' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (230, N'Tiger Watching Tour 2 Days Canada', 139.5756, CAST(N'2007-03-19 01:50:06.807' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (231, N'Tiger Watching Tour 3 Days Canada', 232.6260, CAST(N'2005-02-15 19:19:34.560' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (232, N'Tiger Watching Tour 5 Days Canada', 310.1680, CAST(N'2011-07-21 08:33:57.067' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (233, N'Tiger Watching Tour 1 Week Canada', 387.7100, CAST(N'2010-04-26 20:15:35.177' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (234, N'Tiger Watching Tour 2 Weeks Canada', 697.8780, CAST(N'2008-02-13 20:55:05.163' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (235, N'Tiger Watching Tour 1 Day Scandinavia', 68.2670, CAST(N'2009-03-15 03:25:45.790' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (236, N'Tiger Watching Tour 2 Days Scandinavia', 122.8806, CAST(N'2006-04-25 22:46:05.257' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (237, N'Tiger Watching Tour 3 Days Scandinavia', 204.8010, CAST(N'2005-07-26 04:46:38.513' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (238, N'Tiger Watching Tour 5 Days Scandinavia', 273.0680, CAST(N'2007-05-28 09:10:03.047' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (239, N'Tiger Watching Tour 1 Week Scandinavia', 341.3350, CAST(N'2005-01-10 02:44:52.873' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (240, N'Tiger Watching Tour 2 Weeks Scandinavia', 614.4030, CAST(N'2008-03-26 10:43:12.313' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (241, N'Winter Tour 1 Day West Coast', 45.3420, CAST(N'2011-04-25 15:32:18.227' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (242, N'Winter Tour 2 Days West Coast', 81.6156, CAST(N'2009-03-25 04:42:40.197' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (243, N'Winter Tour 3 Days West Coast', 136.0260, CAST(N'2010-09-16 16:15:09.140' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (244, N'Winter Tour 5 Days West Coast', 181.3680, CAST(N'2004-10-22 04:41:56.337' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (245, N'Winter Tour 1 Week West Coast', 226.7100, CAST(N'2008-01-23 21:47:17.740' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (246, N'Winter Tour 2 Weeks West Coast', 408.0780, CAST(N'2010-02-17 08:27:37.960' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (247, N'Winter Tour 1 Day East Coast', 78.9480, CAST(N'2011-09-02 21:10:04.853' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (248, N'Winter Tour 2 Days East Coast', 142.1064, CAST(N'2012-01-03 01:22:38.457' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (249, N'Winter Tour 3 Days East Coast', 236.8440, CAST(N'2007-05-29 23:47:11.293' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (250, N'Winter Tour 5 Days East Coast', 315.7920, CAST(N'2010-02-02 18:22:47.647' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (251, N'Winter Tour 1 Week East Coast', 394.7400, CAST(N'2006-10-25 04:44:19.540' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (252, N'Winter Tour 2 Weeks East Coast', 710.5320, CAST(N'2008-09-11 06:33:57.907' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (253, N'Winter Tour 1 Day Mexico', 86.5930, CAST(N'2012-06-14 02:29:43.450' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (254, N'Winter Tour 2 Days Mexico', 155.8674, CAST(N'2011-05-30 20:36:57.050' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (255, N'Winter Tour 3 Days Mexico', 259.7790, CAST(N'2011-12-14 10:12:30.683' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (256, N'Winter Tour 5 Days Mexico', 346.3720, CAST(N'2012-02-14 07:26:42.387' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (257, N'Winter Tour 1 Week Mexico', 432.9650, CAST(N'2008-10-22 13:39:42.747' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (258, N'Winter Tour 2 Weeks Mexico', 779.3370, CAST(N'2007-03-28 05:39:35.503' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (259, N'Winter Tour 1 Day Canada', 90.6950, CAST(N'2007-03-18 21:38:05.783' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (260, N'Winter Tour 2 Days Canada', 163.2510, CAST(N'2011-09-02 07:54:05.040' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (261, N'Winter Tour 3 Days Canada', 272.0850, CAST(N'2005-07-07 21:09:50.173' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (262, N'Winter Tour 5 Days Canada', 362.7800, CAST(N'2004-08-06 01:02:07.930' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (263, N'Winter Tour 1 Week Canada', 453.4750, CAST(N'2007-05-21 07:26:48.700' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (264, N'Winter Tour 2 Weeks Canada', 816.2550, CAST(N'2005-07-23 03:27:34.523' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (265, N'Winter Tour 1 Day Scandinavia', 34.5060, CAST(N'2011-03-06 16:07:52.060' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (266, N'Winter Tour 2 Days Scandinavia', 62.1108, CAST(N'2011-01-06 20:08:03.043' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (267, N'Winter Tour 3 Days Scandinavia', 103.5180, CAST(N'2011-11-02 11:41:15.273' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (268, N'Winter Tour 5 Days Scandinavia', 138.0240, CAST(N'2005-04-20 00:34:09.120' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (269, N'Winter Tour 1 Week Scandinavia', 172.5300, CAST(N'2006-03-28 22:29:05.713' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (270, N'Winter Tour 2 Weeks Scandinavia', 310.5540, CAST(N'2005-06-21 19:10:03.027' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (271, N'Acting Lessons Tour 1 Day West Coast', 111.3660, CAST(N'2005-08-21 23:18:38.613' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (272, N'Acting Lessons Tour 2 Days West Coast', 200.4588, CAST(N'2004-06-01 19:47:09.413' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (273, N'Acting Lessons Tour 3 Days West Coast', 334.0980, CAST(N'2006-10-01 16:00:41.223' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (274, N'Acting Lessons Tour 5 Days West Coast', 445.4640, CAST(N'2005-10-27 20:21:37.450' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (275, N'Acting Lessons Tour 1 Week West Coast', 556.8300, CAST(N'2011-08-28 06:23:43.763' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (276, N'Acting Lessons Tour 2 Weeks West Coast', 1002.2940, CAST(N'2008-09-29 09:47:37.023' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (277, N'Acting Lessons Tour 1 Day East Coast', 52.6700, CAST(N'2011-04-16 20:55:56.943' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (278, N'Acting Lessons Tour 2 Days East Coast', 94.8060, CAST(N'2011-11-15 06:40:15.900' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (279, N'Acting Lessons Tour 3 Days East Coast', 158.0100, CAST(N'2011-09-09 21:35:50.463' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (280, N'Acting Lessons Tour 5 Days East Coast', 210.6800, CAST(N'2011-06-03 20:24:59.187' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (281, N'Acting Lessons Tour 1 Week East Coast', 263.3500, CAST(N'2009-10-01 03:01:55.500' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (282, N'Acting Lessons Tour 2 Weeks East Coast', 474.0300, CAST(N'2010-02-21 11:30:06.017' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (283, N'Acting Lessons Tour 1 Day Mexico', 101.0680, CAST(N'2005-12-06 05:24:17.020' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (284, N'Acting Lessons Tour 2 Days Mexico', 181.9224, CAST(N'2011-08-15 17:51:27.203' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (285, N'Acting Lessons Tour 3 Days Mexico', 303.2040, CAST(N'2012-04-08 05:15:21.250' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (286, N'Acting Lessons Tour 5 Days Mexico', 404.2720, CAST(N'2008-02-01 03:18:57.983' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (287, N'Acting Lessons Tour 1 Week Mexico', 505.3400, CAST(N'2012-01-07 15:07:35.297' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (288, N'Acting Lessons Tour 2 Weeks Mexico', 909.6120, CAST(N'2007-04-27 18:19:07.007' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (289, N'Acting Lessons Tour 1 Day Canada', 78.9500, CAST(N'2012-05-25 01:45:29.600' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (290, N'Acting Lessons Tour 2 Days Canada', 142.1100, CAST(N'2004-09-22 21:26:04.547' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (291, N'Acting Lessons Tour 3 Days Canada', 236.8500, CAST(N'2010-10-30 20:30:09.063' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (292, N'Acting Lessons Tour 5 Days Canada', 315.8000, CAST(N'2004-04-01 12:01:26.260' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (293, N'Acting Lessons Tour 1 Week Canada', 394.7500, CAST(N'2010-06-30 10:58:17.560' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (294, N'Acting Lessons Tour 2 Weeks Canada', 710.5500, CAST(N'2010-09-24 17:46:31.833' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (295, N'Acting Lessons Tour 1 Day Scandinavia', 66.8970, CAST(N'2008-06-29 00:27:45.787' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (296, N'Acting Lessons Tour 2 Days Scandinavia', 120.4146, CAST(N'2009-11-27 05:56:06.670' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (297, N'Acting Lessons Tour 3 Days Scandinavia', 200.6910, CAST(N'2006-11-06 05:41:29.767' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (298, N'Acting Lessons Tour 5 Days Scandinavia', 267.5880, CAST(N'2009-04-07 04:18:45.617' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (299, N'Acting Lessons Tour 1 Week Scandinavia', 334.4850, CAST(N'2005-04-29 06:50:04.463' AS DateTime), 0, N'LongTerm-Stay')
GO
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (300, N'Acting Lessons Tour 2 Weeks Scandinavia', 602.0730, CAST(N'2012-03-12 03:51:14.263' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (301, N'Cherry Festival Tour 1 Day West Coast', 68.5520, CAST(N'2012-02-14 15:58:41.720' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (302, N'Cherry Festival Tour 2 Days West Coast', 123.3936, CAST(N'2009-05-24 01:57:02.160' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (303, N'Cherry Festival Tour 3 Days West Coast', 205.6560, CAST(N'2004-07-30 10:04:03.573' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (304, N'Cherry Festival Tour 5 Days West Coast', 274.2080, CAST(N'2006-08-17 15:55:33.740' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (305, N'Cherry Festival Tour 1 Week West Coast', 342.7600, CAST(N'2009-04-26 18:16:29.133' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (306, N'Cherry Festival Tour 2 Weeks West Coast', 616.9680, CAST(N'2005-01-06 05:18:47.940' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (307, N'Cherry Festival Tour 1 Day East Coast', 108.5520, CAST(N'2012-05-15 09:31:10.213' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (308, N'Cherry Festival Tour 2 Days East Coast', 195.3936, CAST(N'2010-05-14 11:35:40.057' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (309, N'Cherry Festival Tour 3 Days East Coast', 325.6560, CAST(N'2008-06-14 14:09:25.803' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (310, N'Cherry Festival Tour 5 Days East Coast', 434.2080, CAST(N'2009-11-06 08:03:00.433' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (311, N'Cherry Festival Tour 1 Week East Coast', 542.7600, CAST(N'2011-05-09 13:10:36.303' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (312, N'Cherry Festival Tour 2 Weeks East Coast', 976.9680, CAST(N'2008-12-09 21:45:41.527' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (313, N'Cherry Festival Tour 1 Day Mexico', 31.9090, CAST(N'2007-04-11 07:44:34.653' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (314, N'Cherry Festival Tour 2 Days Mexico', 57.4362, CAST(N'2008-04-09 03:44:21.560' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (315, N'Cherry Festival Tour 3 Days Mexico', 95.7270, CAST(N'2005-04-19 02:27:45.133' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (316, N'Cherry Festival Tour 5 Days Mexico', 127.6360, CAST(N'2010-09-25 02:39:51.150' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (317, N'Cherry Festival Tour 1 Week Mexico', 159.5450, CAST(N'2006-12-28 14:28:09.667' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (318, N'Cherry Festival Tour 2 Weeks Mexico', 287.1810, CAST(N'2008-04-22 03:37:28.997' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (319, N'Cherry Festival Tour 1 Day Canada', 34.9440, CAST(N'2009-07-02 04:27:57.853' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (320, N'Cherry Festival Tour 2 Days Canada', 62.8992, CAST(N'2010-05-10 16:32:51.220' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (321, N'Cherry Festival Tour 3 Days Canada', 104.8320, CAST(N'2004-04-25 18:04:07.520' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (322, N'Cherry Festival Tour 5 Days Canada', 139.7760, CAST(N'2006-09-06 03:41:52.493' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (323, N'Cherry Festival Tour 1 Week Canada', 174.7200, CAST(N'2009-12-19 23:26:58.943' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (324, N'Cherry Festival Tour 2 Weeks Canada', 314.4960, CAST(N'2010-01-17 13:46:40.710' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (325, N'Cherry Festival Tour 1 Day Scandinavia', 80.6480, CAST(N'2008-05-28 05:07:47.300' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (326, N'Cherry Festival Tour 2 Days Scandinavia', 145.1664, CAST(N'2005-04-11 14:07:43.163' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (327, N'Cherry Festival Tour 3 Days Scandinavia', 241.9440, CAST(N'2005-03-14 03:55:34.903' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (328, N'Cherry Festival Tour 5 Days Scandinavia', 322.5920, CAST(N'2007-06-07 15:57:31.537' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (329, N'Cherry Festival Tour 1 Week Scandinavia', 403.2400, CAST(N'2010-12-27 17:44:43.327' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (330, N'Cherry Festival Tour 2 Weeks Scandinavia', 725.8320, CAST(N'2012-06-04 12:28:59.910' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (331, N'Lakes Tour 1 Day West Coast', 129.0110, CAST(N'2006-08-08 05:52:57.837' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (332, N'Lakes Tour 2 Days West Coast', 232.2198, CAST(N'2006-08-14 02:36:45.380' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (333, N'Lakes Tour 3 Days West Coast', 387.0330, CAST(N'2012-04-27 11:55:26.810' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (334, N'Lakes Tour 5 Days West Coast', 516.0440, CAST(N'2011-10-01 15:56:19.027' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (335, N'Lakes Tour 1 Week West Coast', 645.0550, CAST(N'2011-01-31 11:16:43.800' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (336, N'Lakes Tour 2 Weeks West Coast', 1161.0990, CAST(N'2011-09-29 18:15:51.907' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (337, N'Lakes Tour 1 Day East Coast', 127.5540, CAST(N'2009-10-23 15:25:34.103' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (338, N'Lakes Tour 2 Days East Coast', 229.5972, CAST(N'2011-05-17 12:39:47.263' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (339, N'Lakes Tour 3 Days East Coast', 382.6620, CAST(N'2006-10-30 22:36:50.643' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (340, N'Lakes Tour 5 Days East Coast', 510.2160, CAST(N'2008-03-19 05:17:43.423' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (341, N'Lakes Tour 1 Week East Coast', 637.7700, CAST(N'2012-02-19 15:52:06.277' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (342, N'Lakes Tour 2 Weeks East Coast', 1147.9860, CAST(N'2008-08-31 13:21:02.883' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (343, N'Lakes Tour 1 Day Mexico', 67.3910, CAST(N'2005-11-28 06:34:30.720' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (344, N'Lakes Tour 2 Days Mexico', 121.3038, CAST(N'2005-04-17 08:41:39.673' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (345, N'Lakes Tour 3 Days Mexico', 202.1730, CAST(N'2004-05-05 11:18:43.940' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (346, N'Lakes Tour 5 Days Mexico', 269.5640, CAST(N'2006-03-19 21:47:29.567' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (347, N'Lakes Tour 1 Week Mexico', 336.9550, CAST(N'2005-12-04 05:20:49.200' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (348, N'Lakes Tour 2 Weeks Mexico', 606.5190, CAST(N'2011-11-10 11:25:17.547' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (349, N'Lakes Tour 1 Day Canada', 77.9090, CAST(N'2010-09-12 02:08:19.263' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (350, N'Lakes Tour 2 Days Canada', 140.2362, CAST(N'2008-11-11 13:08:38.363' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (351, N'Lakes Tour 3 Days Canada', 233.7270, CAST(N'2011-01-04 09:00:32.957' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (352, N'Lakes Tour 5 Days Canada', 311.6360, CAST(N'2004-05-02 11:28:26.137' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (353, N'Lakes Tour 1 Week Canada', 389.5450, CAST(N'2008-07-18 00:36:27.610' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (354, N'Lakes Tour 2 Weeks Canada', 701.1810, CAST(N'2007-10-17 12:23:10.693' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (355, N'Lakes Tour 1 Day Scandinavia', 113.3540, CAST(N'2010-10-16 23:03:45.930' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (356, N'Lakes Tour 2 Days Scandinavia', 204.0372, CAST(N'2008-08-05 16:38:49.607' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (357, N'Lakes Tour 3 Days Scandinavia', 340.0620, CAST(N'2010-03-09 23:45:37.633' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (358, N'Lakes Tour 5 Days Scandinavia', 453.4160, CAST(N'2009-03-20 03:43:43.890' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (359, N'Lakes Tour 1 Week Scandinavia', 566.7700, CAST(N'2005-07-15 17:05:45.057' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (360, N'Lakes Tour 2 Weeks Scandinavia', 1020.1860, CAST(N'2004-11-05 01:20:30.970' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (361, N'Rain Forest Tour 1 Day West Coast', 46.7280, CAST(N'2006-03-06 00:44:30.780' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (362, N'Rain Forest Tour 2 Days West Coast', 84.1104, CAST(N'2005-09-06 06:35:38.700' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (363, N'Rain Forest Tour 3 Days West Coast', 140.1840, CAST(N'2011-06-16 03:29:56.753' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (364, N'Rain Forest Tour 5 Days West Coast', 186.9120, CAST(N'2008-04-25 09:00:02.373' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (365, N'Rain Forest Tour 1 Week West Coast', 233.6400, CAST(N'2010-05-17 14:06:44.850' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (366, N'Rain Forest Tour 2 Weeks West Coast', 420.5520, CAST(N'2005-06-04 03:31:22.220' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (367, N'Rain Forest Tour 1 Day East Coast', 127.1970, CAST(N'2007-03-01 02:06:11.083' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (368, N'Rain Forest Tour 2 Days East Coast', 228.9546, CAST(N'2008-03-22 01:36:39.273' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (369, N'Rain Forest Tour 3 Days East Coast', 381.5910, CAST(N'2012-03-17 16:58:57.823' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (370, N'Rain Forest Tour 5 Days East Coast', 508.7880, CAST(N'2005-02-12 02:33:48.240' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (371, N'Rain Forest Tour 1 Week East Coast', 635.9850, CAST(N'2008-02-06 04:21:43.127' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (372, N'Rain Forest Tour 2 Weeks East Coast', 1144.7730, CAST(N'2007-04-21 16:51:51.403' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (373, N'Rain Forest Tour 1 Day Mexico', 51.0580, CAST(N'2006-02-16 18:05:32.517' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (374, N'Rain Forest Tour 2 Days Mexico', 91.9044, CAST(N'2007-08-20 07:25:06.720' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (375, N'Rain Forest Tour 3 Days Mexico', 153.1740, CAST(N'2008-05-01 05:31:34.410' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (376, N'Rain Forest Tour 5 Days Mexico', 204.2320, CAST(N'2007-11-20 05:29:40.313' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (377, N'Rain Forest Tour 1 Week Mexico', 255.2900, CAST(N'2009-05-25 20:04:59.693' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (378, N'Rain Forest Tour 2 Weeks Mexico', 459.5220, CAST(N'2004-06-02 06:14:18.963' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (379, N'Rain Forest Tour 1 Day Canada', 92.9820, CAST(N'2012-04-03 04:37:06.090' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (380, N'Rain Forest Tour 2 Days Canada', 167.3676, CAST(N'2010-11-19 20:38:05.730' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (381, N'Rain Forest Tour 3 Days Canada', 278.9460, CAST(N'2007-05-01 07:34:21.160' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (382, N'Rain Forest Tour 5 Days Canada', 371.9280, CAST(N'2011-03-15 23:39:39.567' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (383, N'Rain Forest Tour 1 Week Canada', 464.9100, CAST(N'2004-12-23 23:37:24.093' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (384, N'Rain Forest Tour 2 Weeks Canada', 836.8380, CAST(N'2008-07-25 22:57:08.080' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (385, N'Rain Forest Tour 1 Day Scandinavia', 93.8120, CAST(N'2010-11-23 09:44:51.427' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (386, N'Rain Forest Tour 2 Days Scandinavia', 168.8616, CAST(N'2007-02-06 05:31:06.770' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (387, N'Rain Forest Tour 3 Days Scandinavia', 281.4360, CAST(N'2011-02-22 19:01:19.093' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (388, N'Rain Forest Tour 5 Days Scandinavia', 375.2480, CAST(N'2011-04-16 21:41:04.533' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (389, N'Rain Forest Tour 1 Week Scandinavia', 469.0600, CAST(N'2008-09-30 16:36:28.200' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (390, N'Rain Forest Tour 2 Weeks Scandinavia', 844.3080, CAST(N'2004-08-07 14:21:21.500' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (391, N'River Rapids Tour 1 Day West Coast', 75.3870, CAST(N'2011-10-14 04:34:20.343' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (392, N'River Rapids Tour 2 Days West Coast', 135.6966, CAST(N'2009-12-01 19:42:38.440' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (393, N'River Rapids Tour 3 Days West Coast', 226.1610, CAST(N'2011-06-20 11:37:32.177' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (394, N'River Rapids Tour 5 Days West Coast', 301.5480, CAST(N'2006-07-07 19:06:25.063' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (395, N'River Rapids Tour 1 Week West Coast', 376.9350, CAST(N'2008-01-27 00:41:38.967' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (396, N'River Rapids Tour 2 Weeks West Coast', 678.4830, CAST(N'2012-01-09 06:26:36.290' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (397, N'River Rapids Tour 1 Day East Coast', 124.0120, CAST(N'2012-03-12 12:06:09.000' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (398, N'River Rapids Tour 2 Days East Coast', 223.2216, CAST(N'2007-07-28 13:31:39.823' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (399, N'River Rapids Tour 3 Days East Coast', 372.0360, CAST(N'2005-08-01 05:52:25.033' AS DateTime), 0, N'Medium-Stay')
GO
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (400, N'River Rapids Tour 5 Days East Coast', 496.0480, CAST(N'2011-09-17 06:37:56.647' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (401, N'River Rapids Tour 1 Week East Coast', 620.0600, CAST(N'2011-10-11 11:49:26.597' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (402, N'River Rapids Tour 2 Weeks East Coast', 1116.1080, CAST(N'2009-10-23 09:28:35.167' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (403, N'River Rapids Tour 1 Day Mexico', 41.8370, CAST(N'2005-10-29 15:10:00.777' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (404, N'River Rapids Tour 2 Days Mexico', 75.3066, CAST(N'2006-09-11 16:14:22.037' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (405, N'River Rapids Tour 3 Days Mexico', 125.5110, CAST(N'2010-05-31 18:56:52.077' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (406, N'River Rapids Tour 5 Days Mexico', 167.3480, CAST(N'2008-05-13 00:02:18.577' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (407, N'River Rapids Tour 1 Week Mexico', 209.1850, CAST(N'2011-10-08 05:10:07.277' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (408, N'River Rapids Tour 2 Weeks Mexico', 376.5330, CAST(N'2006-11-29 10:03:16.223' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (409, N'River Rapids Tour 1 Day Canada', 108.7620, CAST(N'2011-06-09 17:32:39.407' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (410, N'River Rapids Tour 2 Days Canada', 195.7716, CAST(N'2006-06-02 12:59:09.217' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (411, N'River Rapids Tour 3 Days Canada', 326.2860, CAST(N'2011-09-05 16:55:04.167' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (412, N'River Rapids Tour 5 Days Canada', 435.0480, CAST(N'2010-01-04 15:29:02.673' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (413, N'River Rapids Tour 1 Week Canada', 543.8100, CAST(N'2009-09-03 12:46:11.487' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (414, N'River Rapids Tour 2 Weeks Canada', 978.8580, CAST(N'2004-08-06 18:21:42.790' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (415, N'River Rapids Tour 1 Day Scandinavia', 36.0420, CAST(N'2004-09-15 20:30:48.670' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (416, N'River Rapids Tour 2 Days Scandinavia', 64.8756, CAST(N'2005-08-01 21:43:22.807' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (417, N'River Rapids Tour 3 Days Scandinavia', 108.1260, CAST(N'2009-12-31 08:55:51.830' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (418, N'River Rapids Tour 5 Days Scandinavia', 144.1680, CAST(N'2012-03-08 19:26:11.397' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (419, N'River Rapids Tour 1 Week Scandinavia', 180.2100, CAST(N'2007-01-19 01:32:38.910' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (420, N'River Rapids Tour 2 Weeks Scandinavia', 324.3780, CAST(N'2008-10-31 05:49:24.020' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (421, N'Snow Ski Tour 1 Day West Coast', 35.3080, CAST(N'2008-11-18 16:07:46.590' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (422, N'Snow Ski Tour 2 Days West Coast', 63.5544, CAST(N'2011-01-24 00:27:54.710' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (423, N'Snow Ski Tour 3 Days West Coast', 105.9240, CAST(N'2006-07-07 02:07:39.583' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (424, N'Snow Ski Tour 5 Days West Coast', 141.2320, CAST(N'2008-02-11 12:41:18.093' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (425, N'Snow Ski Tour 1 Week West Coast', 176.5400, CAST(N'2006-12-11 01:49:02.357' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (426, N'Snow Ski Tour 2 Weeks West Coast', 317.7720, CAST(N'2008-04-15 07:57:06.600' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (427, N'Snow Ski Tour 1 Day East Coast', 85.5510, CAST(N'2010-02-17 21:26:55.063' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (428, N'Snow Ski Tour 2 Days East Coast', 153.9918, CAST(N'2010-01-11 00:07:22.930' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (429, N'Snow Ski Tour 3 Days East Coast', 256.6530, CAST(N'2012-05-12 21:14:52.913' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (430, N'Snow Ski Tour 5 Days East Coast', 342.2040, CAST(N'2007-03-20 09:25:51.940' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (431, N'Snow Ski Tour 1 Week East Coast', 427.7550, CAST(N'2006-04-23 16:59:06.347' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (432, N'Snow Ski Tour 2 Weeks East Coast', 769.9590, CAST(N'2004-05-15 16:05:51.527' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (433, N'Snow Ski Tour 1 Day Mexico', 72.7920, CAST(N'2006-02-16 12:10:33.127' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (434, N'Snow Ski Tour 2 Days Mexico', 131.0256, CAST(N'2010-01-03 18:17:14.363' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (435, N'Snow Ski Tour 3 Days Mexico', 218.3760, CAST(N'2010-06-14 10:14:49.680' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (436, N'Snow Ski Tour 5 Days Mexico', 291.1680, CAST(N'2007-12-21 10:34:02.143' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (437, N'Snow Ski Tour 1 Week Mexico', 363.9600, CAST(N'2006-11-29 01:11:27.207' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (438, N'Snow Ski Tour 2 Weeks Mexico', 655.1280, CAST(N'2005-04-25 22:42:21.923' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (439, N'Snow Ski Tour 1 Day Canada', 48.3510, CAST(N'2011-07-09 19:26:17.903' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (440, N'Snow Ski Tour 2 Days Canada', 87.0318, CAST(N'2008-02-11 17:29:01.237' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (441, N'Snow Ski Tour 3 Days Canada', 145.0530, CAST(N'2004-07-30 00:38:18.723' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (442, N'Snow Ski Tour 5 Days Canada', 193.4040, CAST(N'2005-11-17 17:59:51.023' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (443, N'Snow Ski Tour 1 Week Canada', 241.7550, CAST(N'2008-10-06 00:03:18.383' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (444, N'Snow Ski Tour 2 Weeks Canada', 435.1590, CAST(N'2004-09-22 00:01:04.260' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (445, N'Snow Ski Tour 1 Day Scandinavia', 42.0010, CAST(N'2008-08-05 16:16:10.997' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (446, N'Snow Ski Tour 2 Days Scandinavia', 75.6018, CAST(N'2007-03-25 07:37:15.077' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (447, N'Snow Ski Tour 3 Days Scandinavia', 126.0030, CAST(N'2007-09-10 13:42:35.933' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (448, N'Snow Ski Tour 5 Days Scandinavia', 168.0040, CAST(N'2005-12-09 05:23:35.443' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (449, N'Snow Ski Tour 1 Week Scandinavia', 210.0050, CAST(N'2010-01-31 03:28:28.810' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (450, N'Snow Ski Tour 2 Weeks Scandinavia', 378.0090, CAST(N'2004-05-09 06:33:52.220' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (451, N'Wine Tasting Tour 1 Day West Coast', 120.1980, CAST(N'2004-03-31 01:27:43.453' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (452, N'Wine Tasting Tour 2 Days West Coast', 216.3564, CAST(N'2010-08-16 00:09:23.977' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (453, N'Wine Tasting Tour 3 Days West Coast', 360.5940, CAST(N'2009-06-01 03:02:59.120' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (454, N'Wine Tasting Tour 5 Days West Coast', 480.7920, CAST(N'2009-08-07 16:26:09.697' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (455, N'Wine Tasting Tour 1 Week West Coast', 600.9900, CAST(N'2006-01-22 15:31:54.427' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (456, N'Wine Tasting Tour 2 Weeks West Coast', 1101.9690, CAST(N'2011-09-09 11:30:06.323' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (457, N'Wine Tasting Tour 1 Day East Coast', 64.1330, CAST(N'2010-03-03 11:14:17.253' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (458, N'Wine Tasting Tour 2 Days East Coast', 115.4394, CAST(N'2005-11-28 04:46:08.453' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (459, N'Wine Tasting Tour 3 Days East Coast', 192.3990, CAST(N'2010-09-22 19:18:32.117' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (460, N'Wine Tasting Tour 5 Days East Coast', 256.5320, CAST(N'2010-04-17 11:27:53.497' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (461, N'Wine Tasting Tour 1 Week East Coast', 320.6650, CAST(N'2005-02-05 22:58:01.230' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (462, N'Wine Tasting Tour 2 Weeks East Coast', 577.1970, CAST(N'2011-01-26 03:33:55.310' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (463, N'Wine Tasting Tour 1 Day Mexico', 77.3080, CAST(N'2005-09-17 13:39:14.653' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (464, N'Wine Tasting Tour 2 Days Mexico', 139.1544, CAST(N'2010-10-10 09:54:15.120' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (465, N'Wine Tasting Tour 3 Days Mexico', 231.9240, CAST(N'2007-03-25 16:37:33.320' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (466, N'Wine Tasting Tour 5 Days Mexico', 309.2320, CAST(N'2009-01-09 07:42:57.123' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (467, N'Wine Tasting Tour 1 Week Mexico', 386.5400, CAST(N'2008-07-06 06:57:58.937' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (468, N'Wine Tasting Tour 2 Weeks Mexico', 695.7720, CAST(N'2004-11-28 12:09:24.107' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (469, N'Wine Tasting Tour 1 Day Canada', 44.2650, CAST(N'2011-01-13 11:04:00.473' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (470, N'Wine Tasting Tour 2 Days Canada', 79.6770, CAST(N'2005-04-24 06:52:23.240' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (471, N'Wine Tasting Tour 3 Days Canada', 132.7950, CAST(N'2011-09-05 09:20:13.180' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (472, N'Wine Tasting Tour 5 Days Canada', 177.0600, CAST(N'2008-08-29 16:08:02.493' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (473, N'Wine Tasting Tour 1 Week Canada', 221.3250, CAST(N'2007-06-28 05:22:01.457' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (474, N'Wine Tasting Tour 2 Weeks Canada', 398.3850, CAST(N'2004-04-18 06:32:39.980' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (475, N'Wine Tasting Tour 1 Day Scandinavia', 40.5640, CAST(N'2007-09-08 07:00:27.480' AS DateTime), 1, N'No-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (476, N'Wine Tasting Tour 2 Days Scandinavia', 73.0152, CAST(N'2010-08-01 11:26:21.703' AS DateTime), 0, N'Overnight-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (477, N'Wine Tasting Tour 3 Days Scandinavia', 121.6920, CAST(N'2007-02-05 02:32:57.397' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (478, N'Wine Tasting Tour 5 Days Scandinavia', 162.2560, CAST(N'2008-07-17 06:36:31.183' AS DateTime), 0, N'Medium-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (479, N'Wine Tasting Tour 1 Week Scandinavia', 202.8200, CAST(N'2007-08-30 21:27:24.520' AS DateTime), 0, N'LongTerm-Stay')
INSERT [dbo].[CurrentProducts] ([ProductID], [ProductName], [RetailPrice], [OriginationDate], [ToBeDeleted], [Category]) VALUES (480, N'Wine Tasting Tour 2 Weeks Scandinavia', 365.0760, CAST(N'2005-02-23 19:33:03.767' AS DateTime), 0, N'LongTerm-Stay')
SET IDENTITY_INSERT [dbo].[CurrentProducts] OFF
INSERT [dbo].[Employee] ([EmpID], [LastName], [FirstName], [HireDate], [LocationID], [ManagerID], [Status]) VALUES (1, N'Adams', N'Alex', CAST(N'2001-01-01 00:00:00.000' AS DateTime), 1, 11, NULL)
INSERT [dbo].[Employee] ([EmpID], [LastName], [FirstName], [HireDate], [LocationID], [ManagerID], [Status]) VALUES (2, N'Brown', N'Barry', CAST(N'2002-08-12 00:00:00.000' AS DateTime), 1, 11, NULL)
INSERT [dbo].[Employee] ([EmpID], [LastName], [FirstName], [HireDate], [LocationID], [ManagerID], [Status]) VALUES (3, N'Osako', N'Lee', CAST(N'1999-09-01 00:00:00.000' AS DateTime), 2, 11, NULL)
INSERT [dbo].[Employee] ([EmpID], [LastName], [FirstName], [HireDate], [LocationID], [ManagerID], [Status]) VALUES (4, N'Kennson', N'David', CAST(N'1996-03-16 00:00:00.000' AS DateTime), 1, 11, N'Has Tenure  ')
INSERT [dbo].[Employee] ([EmpID], [LastName], [FirstName], [HireDate], [LocationID], [ManagerID], [Status]) VALUES (5, N'Bender', N'Eric', CAST(N'2007-05-17 00:00:00.000' AS DateTime), 1, 11, NULL)
INSERT [dbo].[Employee] ([EmpID], [LastName], [FirstName], [HireDate], [LocationID], [ManagerID], [Status]) VALUES (6, N'Kendall', N'Lisa', CAST(N'2001-11-15 00:00:00.000' AS DateTime), 4, 4, NULL)
INSERT [dbo].[Employee] ([EmpID], [LastName], [FirstName], [HireDate], [LocationID], [ManagerID], [Status]) VALUES (7, N'Lonning', N'David', CAST(N'2000-01-01 00:00:00.000' AS DateTime), 1, 11, N'On Leave    ')
INSERT [dbo].[Employee] ([EmpID], [LastName], [FirstName], [HireDate], [LocationID], [ManagerID], [Status]) VALUES (8, N'Marshbank', N'John', CAST(N'2001-11-15 00:00:00.000' AS DateTime), NULL, 4, NULL)
INSERT [dbo].[Employee] ([EmpID], [LastName], [FirstName], [HireDate], [LocationID], [ManagerID], [Status]) VALUES (9, N'Newton', N'James', CAST(N'2003-09-30 00:00:00.000' AS DateTime), 2, 3, NULL)
INSERT [dbo].[Employee] ([EmpID], [LastName], [FirstName], [HireDate], [LocationID], [ManagerID], [Status]) VALUES (10, N'O''Haire', N'Terry', CAST(N'2004-10-04 00:00:00.000' AS DateTime), 2, 3, NULL)
INSERT [dbo].[Employee] ([EmpID], [LastName], [FirstName], [HireDate], [LocationID], [ManagerID], [Status]) VALUES (11, N'Smith', N'Sally', CAST(N'1989-04-01 00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Employee] ([EmpID], [LastName], [FirstName], [HireDate], [LocationID], [ManagerID], [Status]) VALUES (12, N'O''Neil', N'Barbara', CAST(N'1995-05-26 00:00:00.000' AS DateTime), 4, 4, N'Has Tenure  ')
INSERT [dbo].[Grant] ([GrantID], [GrantName], [EmpID], [Amount]) VALUES (N'001', N'92 Purr_Scents %% team', 7, 4750.0000)
INSERT [dbo].[Grant] ([GrantID], [GrantName], [EmpID], [Amount]) VALUES (N'002', N'K_Land fund trust', 2, 15750.0000)
INSERT [dbo].[Grant] ([GrantID], [GrantName], [EmpID], [Amount]) VALUES (N'003', N'Robert@BigStarBank.com', 7, 18100.0000)
INSERT [dbo].[Grant] ([GrantID], [GrantName], [EmpID], [Amount]) VALUES (N'004', N'Norman''s Outreach', NULL, 21000.0000)
INSERT [dbo].[Grant] ([GrantID], [GrantName], [EmpID], [Amount]) VALUES (N'005', N'BIG 6''s Foundation%', 4, 21000.0000)
INSERT [dbo].[Grant] ([GrantID], [GrantName], [EmpID], [Amount]) VALUES (N'006', N'TALTA_Kishan International', 3, 18100.0000)
INSERT [dbo].[Grant] ([GrantID], [GrantName], [EmpID], [Amount]) VALUES (N'007', N'Ben@MoreTechnology.com', 10, 41000.0000)
INSERT [dbo].[Grant] ([GrantID], [GrantName], [EmpID], [Amount]) VALUES (N'008', N'@Last-U-Can-Help', 7, 25000.0000)
INSERT [dbo].[Grant] ([GrantID], [GrantName], [EmpID], [Amount]) VALUES (N'009', N'Thank you @.com', 11, 21500.0000)
INSERT [dbo].[Grant] ([GrantID], [GrantName], [EmpID], [Amount]) VALUES (N'010', N'Call Mom @Com', 5, 7500.0000)
INSERT [dbo].[Location] ([LocationID], [Street], [City], [State]) VALUES (1, N'111 First ST', N'Seattle', N'WA')
INSERT [dbo].[Location] ([LocationID], [Street], [City], [State]) VALUES (2, N'222 Second AVE', N'Boston', N'MA')
INSERT [dbo].[Location] ([LocationID], [Street], [City], [State]) VALUES (3, N'333 Third PL', N'Chicago', N'IL')
INSERT [dbo].[Location] ([LocationID], [Street], [City], [State]) VALUES (4, N'444 Ruby ST', N'Spokane', N'WA')
SET IDENTITY_INSERT [dbo].[MgmtTraining] ON 

INSERT [dbo].[MgmtTraining] ([ClassID], [ClassName], [ClassDurationHours]) VALUES (1, N'Embracing Diversity', 12)
INSERT [dbo].[MgmtTraining] ([ClassID], [ClassName], [ClassDurationHours]) VALUES (2, N'Interviewing', 6)
INSERT [dbo].[MgmtTraining] ([ClassID], [ClassName], [ClassDurationHours]) VALUES (3, N'Difficult Negotiations', 30)
SET IDENTITY_INSERT [dbo].[MgmtTraining] OFF
INSERT [dbo].[PayRates] ([EmpID], [YearlySalary], [MonthlySalary], [HourlyRate]) VALUES (1, 75000.0000, NULL, NULL)
INSERT [dbo].[PayRates] ([EmpID], [YearlySalary], [MonthlySalary], [HourlyRate]) VALUES (2, 78000.0000, NULL, NULL)
INSERT [dbo].[PayRates] ([EmpID], [YearlySalary], [MonthlySalary], [HourlyRate]) VALUES (3, NULL, NULL, 45.0000)
INSERT [dbo].[PayRates] ([EmpID], [YearlySalary], [MonthlySalary], [HourlyRate]) VALUES (4, NULL, 6500.0000, NULL)
INSERT [dbo].[PayRates] ([EmpID], [YearlySalary], [MonthlySalary], [HourlyRate]) VALUES (5, NULL, 5800.0000, NULL)
INSERT [dbo].[PayRates] ([EmpID], [YearlySalary], [MonthlySalary], [HourlyRate]) VALUES (6, 52000.0000, NULL, NULL)
INSERT [dbo].[PayRates] ([EmpID], [YearlySalary], [MonthlySalary], [HourlyRate]) VALUES (7, NULL, 6100.0000, NULL)
INSERT [dbo].[PayRates] ([EmpID], [YearlySalary], [MonthlySalary], [HourlyRate]) VALUES (8, NULL, NULL, 32.0000)
INSERT [dbo].[PayRates] ([EmpID], [YearlySalary], [MonthlySalary], [HourlyRate]) VALUES (9, NULL, NULL, 18.0000)
INSERT [dbo].[PayRates] ([EmpID], [YearlySalary], [MonthlySalary], [HourlyRate]) VALUES (10, NULL, NULL, 17.0000)
INSERT [dbo].[PayRates] ([EmpID], [YearlySalary], [MonthlySalary], [HourlyRate]) VALUES (11, 115000.0000, NULL, NULL)
INSERT [dbo].[PayRates] ([EmpID], [YearlySalary], [MonthlySalary], [HourlyRate]) VALUES (12, NULL, NULL, 21.0000)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Grant__E5621B9ACE33EB88]    Script Date: 12/11/2015 10:00:25 AM ******/
ALTER TABLE [dbo].[Grant] ADD UNIQUE NONCLUSTERED 
(
	[GrantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Location__E7FEA4769FC5A271]    Script Date: 12/11/2015 10:00:25 AM ******/
ALTER TABLE [dbo].[Location] ADD UNIQUE NONCLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeLastAndState]    Script Date: 12/11/2015 10:00:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spGetEmployeeLastAndState]
@eid char(3)
as
select e.Lastname, a.state
from Employee as e inner join Location as a
on e.LocationID = a.LocationID
where e.LocationID = @eid

GO
USE [master]
GO
ALTER DATABASE [SWCCorp] SET  READ_WRITE 
GO
