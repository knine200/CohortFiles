USE [master]
GO
/****** Object:  Database [MovieCatalogue]    Script Date: 12/11/2015 9:59:21 AM ******/
CREATE DATABASE [MovieCatalogue]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieCatalogue', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\MovieCatalogue.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MovieCatalogue_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\MovieCatalogue_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MovieCatalogue] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieCatalogue].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieCatalogue] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieCatalogue] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieCatalogue] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieCatalogue] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieCatalogue] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieCatalogue] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MovieCatalogue] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieCatalogue] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieCatalogue] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieCatalogue] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieCatalogue] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieCatalogue] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieCatalogue] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieCatalogue] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieCatalogue] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MovieCatalogue] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieCatalogue] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieCatalogue] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieCatalogue] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieCatalogue] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieCatalogue] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieCatalogue] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieCatalogue] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieCatalogue] SET  MULTI_USER 
GO
ALTER DATABASE [MovieCatalogue] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieCatalogue] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieCatalogue] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieCatalogue] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MovieCatalogue] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MovieCatalogue]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 12/11/2015 9:59:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Actors](
	[ActorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 12/11/2015 9:59:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movie](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](30) NOT NULL,
	[Runtime] [int] NULL,
	[Rating] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MovieActors]    Script Date: 12/11/2015 9:59:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieActors](
	[MovieID] [int] NOT NULL,
	[ActorID] [int] NOT NULL,
 CONSTRAINT [PK_MovieActors] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Actors] ON 

INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName]) VALUES (1, N'Sam', N'Smith')
SET IDENTITY_INSERT [dbo].[Actors] OFF
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([MovieID], [Title], [Runtime], [Rating]) VALUES (1, N'A-List Explorers', 96, N'PG-13')
INSERT [dbo].[Movie] ([MovieID], [Title], [Runtime], [Rating]) VALUES (2, N'Bonker Bonzo', 75, N'G')
INSERT [dbo].[Movie] ([MovieID], [Title], [Runtime], [Rating]) VALUES (3, N'Chumps to Champs', 75, N'PG-13')
INSERT [dbo].[Movie] ([MovieID], [Title], [Runtime], [Rating]) VALUES (4, N'Dare or Die', 110, N'R')
INSERT [dbo].[Movie] ([MovieID], [Title], [Runtime], [Rating]) VALUES (5, N'EeeeGhads', 88, N'G')
SET IDENTITY_INSERT [dbo].[Movie] OFF
ALTER TABLE [dbo].[MovieActors]  WITH CHECK ADD  CONSTRAINT [FK_MovieActors_Actors] FOREIGN KEY([ActorID])
REFERENCES [dbo].[Actors] ([ActorID])
GO
ALTER TABLE [dbo].[MovieActors] CHECK CONSTRAINT [FK_MovieActors_Actors]
GO
ALTER TABLE [dbo].[MovieActors]  WITH CHECK ADD  CONSTRAINT [FK_MovieActors_Movie] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([MovieID])
GO
ALTER TABLE [dbo].[MovieActors] CHECK CONSTRAINT [FK_MovieActors_Movie]
GO
USE [master]
GO
ALTER DATABASE [MovieCatalogue] SET  READ_WRITE 
GO
