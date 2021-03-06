USE [master]
GO
/****** Object:  Database [DVDLibrary]    Script Date: 12/11/2015 9:56:21 AM ******/
CREATE DATABASE [DVDLibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DVDLibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\DVDLibrary.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DVDLibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\DVDLibrary_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DVDLibrary] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DVDLibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DVDLibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DVDLibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DVDLibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DVDLibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DVDLibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [DVDLibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DVDLibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DVDLibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DVDLibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DVDLibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DVDLibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DVDLibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DVDLibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DVDLibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DVDLibrary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DVDLibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DVDLibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DVDLibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DVDLibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DVDLibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DVDLibrary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DVDLibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DVDLibrary] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DVDLibrary] SET  MULTI_USER 
GO
ALTER DATABASE [DVDLibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DVDLibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DVDLibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DVDLibrary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DVDLibrary] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DVDLibrary]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 12/11/2015 9:56:21 AM ******/
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
/****** Object:  Table [dbo].[Borrowers]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Borrowers](
	[BorrowerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BorrowerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Directors](
	[DirectorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DirectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MovieActors]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieActors](
	[ActorID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
 CONSTRAINT [PK_MovieActors] PRIMARY KEY CLUSTERED 
(
	[ActorID] ASC,
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MovieBorrower]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MovieBorrower](
	[MovieID] [int] NOT NULL,
	[BorrowerID] [int] NOT NULL,
	[DateBorrowed] [date] NULL,
	[DateReturned] [date] NULL,
	[UserRating] [int] NULL,
	[UserNotes] [varchar](1000) NULL,
 CONSTRAINT [PK_MovieBorrower] PRIMARY KEY CLUSTERED 
(
	[BorrowerID] ASC,
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[MovieTitle] [varchar](50) NOT NULL,
	[MPAARatingID] [int] NOT NULL,
	[DirectorID] [int] NOT NULL,
	[StudioID] [int] NOT NULL,
	[ReleaseDate] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MPAARatings]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MPAARatings](
	[MPAARatingID] [int] IDENTITY(1,1) NOT NULL,
	[FilmRating] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MPAARatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Studios]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Studios](
	[StudioID] [int] IDENTITY(1,1) NOT NULL,
	[StudioName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Actors] ON 

INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName]) VALUES (1, N'Patrick', N'Tighe')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName]) VALUES (2, N'Lara', N'Caves')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName]) VALUES (3, N'Koshin', N'Abdi')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName]) VALUES (4, N'Timothy', N'Lin')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName]) VALUES (5, N'Victor', N'Kim')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName]) VALUES (6, N'Will', N'Smith')
SET IDENTITY_INSERT [dbo].[Actors] OFF
SET IDENTITY_INSERT [dbo].[Borrowers] ON 

INSERT [dbo].[Borrowers] ([BorrowerID], [FirstName], [LastName]) VALUES (1, N'Jim', N'Shaw')
INSERT [dbo].[Borrowers] ([BorrowerID], [FirstName], [LastName]) VALUES (2, N'Chary', N'Gurney')
INSERT [dbo].[Borrowers] ([BorrowerID], [FirstName], [LastName]) VALUES (3, N'Andrew', N'Tang')
INSERT [dbo].[Borrowers] ([BorrowerID], [FirstName], [LastName]) VALUES (4, N'Eric', N'Wise')
INSERT [dbo].[Borrowers] ([BorrowerID], [FirstName], [LastName]) VALUES (5, N'Victor', N'Pudelski')
SET IDENTITY_INSERT [dbo].[Borrowers] OFF
SET IDENTITY_INSERT [dbo].[Directors] ON 

INSERT [dbo].[Directors] ([DirectorID], [FirstName], [LastName]) VALUES (1, N'Stephen', N'Spielberg')
INSERT [dbo].[Directors] ([DirectorID], [FirstName], [LastName]) VALUES (2, N'Ron', N'Howard')
INSERT [dbo].[Directors] ([DirectorID], [FirstName], [LastName]) VALUES (3, N'Christopher', N'Nolan')
INSERT [dbo].[Directors] ([DirectorID], [FirstName], [LastName]) VALUES (4, N'Alexander', N'McQueen')
INSERT [dbo].[Directors] ([DirectorID], [FirstName], [LastName]) VALUES (5, N'Geroge', N'Lucas')
INSERT [dbo].[Directors] ([DirectorID], [FirstName], [LastName]) VALUES (6, N'Zack                          ', N'Snyder                        ')
INSERT [dbo].[Directors] ([DirectorID], [FirstName], [LastName]) VALUES (12, N'JJ                            ', N'Abrams                        ')
INSERT [dbo].[Directors] ([DirectorID], [FirstName], [LastName]) VALUES (13, N'Oliver                        ', N'Queen                         ')
SET IDENTITY_INSERT [dbo].[Directors] OFF
INSERT [dbo].[MovieActors] ([ActorID], [MovieID]) VALUES (2, 2)
INSERT [dbo].[MovieActors] ([ActorID], [MovieID]) VALUES (2, 3)
INSERT [dbo].[MovieActors] ([ActorID], [MovieID]) VALUES (3, 1)
INSERT [dbo].[MovieActors] ([ActorID], [MovieID]) VALUES (5, 3)
INSERT [dbo].[MovieActors] ([ActorID], [MovieID]) VALUES (5, 4)
INSERT [dbo].[MovieBorrower] ([MovieID], [BorrowerID], [DateBorrowed], [DateReturned], [UserRating], [UserNotes]) VALUES (2, 1, CAST(N'2015-02-01' AS Date), CAST(N'2015-03-30' AS Date), 5, N'good movie')
INSERT [dbo].[MovieBorrower] ([MovieID], [BorrowerID], [DateBorrowed], [DateReturned], [UserRating], [UserNotes]) VALUES (3, 2, CAST(N'2015-06-20' AS Date), CAST(N'2015-08-01' AS Date), 3, N'very average movie')
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MPAARatingID], [DirectorID], [StudioID], [ReleaseDate]) VALUES (1, N'Good Burger', 1, 1, 1, 2009)
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MPAARatingID], [DirectorID], [StudioID], [ReleaseDate]) VALUES (2, N'Brave Heart', 2, 2, 2, 2014)
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MPAARatingID], [DirectorID], [StudioID], [ReleaseDate]) VALUES (3, N'Dot Not September', 3, 3, 3, 2016)
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MPAARatingID], [DirectorID], [StudioID], [ReleaseDate]) VALUES (4, N'Star Wars', 4, 4, 4, 2015)
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MPAARatingID], [DirectorID], [StudioID], [ReleaseDate]) VALUES (7, N'Star Trek', 5, 4, 1, 2013)
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MPAARatingID], [DirectorID], [StudioID], [ReleaseDate]) VALUES (10, N'WatchMen', 6, 12, 9, 2008)
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[MPAARatings] ON 

INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (1, N'G')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (2, N'PG')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (3, N'PG-13')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (4, N'R')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (5, N'NC-17')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (6, N'X    ')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (7, N'PG-13')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (8, N'PG-13')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (9, N'PG-13')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (10, N'PG-13')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (11, N'PG-13')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (12, N'PG-13')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (13, N'PG-13')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (14, N'PG-13')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (15, N'PG-13')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (16, N'PG-13')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [FilmRating]) VALUES (17, N'PG-13')
SET IDENTITY_INSERT [dbo].[MPAARatings] OFF
SET IDENTITY_INSERT [dbo].[Studios] ON 

INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (1, N'Warner Bros.')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (2, N'Universal')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (3, N'Fox')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (4, N'Sony')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (5, N'Legendary')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (6, N'Lionsgate')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (7, N'DC Comics                                         ')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (9, N'DC Comics                                         ')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (10, N'Robot                                             ')
SET IDENTITY_INSERT [dbo].[Studios] OFF
ALTER TABLE [dbo].[MovieActors]  WITH CHECK ADD  CONSTRAINT [FK_MovieActors_Actors] FOREIGN KEY([ActorID])
REFERENCES [dbo].[Actors] ([ActorID])
GO
ALTER TABLE [dbo].[MovieActors] CHECK CONSTRAINT [FK_MovieActors_Actors]
GO
ALTER TABLE [dbo].[MovieActors]  WITH CHECK ADD  CONSTRAINT [FK_MovieActors_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[MovieActors] CHECK CONSTRAINT [FK_MovieActors_Movies]
GO
ALTER TABLE [dbo].[MovieBorrower]  WITH CHECK ADD  CONSTRAINT [FK_MovieBorrower_Borrowers] FOREIGN KEY([BorrowerID])
REFERENCES [dbo].[Borrowers] ([BorrowerID])
GO
ALTER TABLE [dbo].[MovieBorrower] CHECK CONSTRAINT [FK_MovieBorrower_Borrowers]
GO
ALTER TABLE [dbo].[MovieBorrower]  WITH CHECK ADD  CONSTRAINT [FK_MovieBorrower_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[MovieBorrower] CHECK CONSTRAINT [FK_MovieBorrower_Movies]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Directors] FOREIGN KEY([DirectorID])
REFERENCES [dbo].[Directors] ([DirectorID])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Directors]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_MPAARatings] FOREIGN KEY([MPAARatingID])
REFERENCES [dbo].[MPAARatings] ([MPAARatingID])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_MPAARatings]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Studios] FOREIGN KEY([StudioID])
REFERENCES [dbo].[Studios] ([StudioID])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Studios]
GO
/****** Object:  StoredProcedure [dbo].[CheckInDVD]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CheckInDVD] as

Begin
	select m.MovieID, b.BorrowerID, mb.DateBorrowed, mb.DateReturned, mb.UserRating, mb.UserNotes, m.MovieTitle, m.ReleaseDate,
	b.FirstName, b.LastName, mpaa.FilmRating, d.FirstName, d.LastName, s.StudioName
		from MovieBorrower mb
		inner join Movies m
		on mb.MovieID = m.MovieID
		inner join Borrowers b
		on mb.BorrowerID = b.BorrowerID
		inner join MPAARatings mpaa
		on mpaa.MPAARatingID = m.MPAARatingID
		inner join Directors d
		on d.DirectorID = m.DirectorID
		inner join Studios s
		on s.StudioID = m.StudioID
		where mb.DateReturned is null and mb.DateBorrowed is not null

end


GO
/****** Object:  StoredProcedure [dbo].[CheckOutDVD]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CheckOutDVD] as

Begin
	select m.MovieID, b.BorrowerID, mb.DateBorrowed, mb.DateReturned, mb.UserRating, mb.UserNotes, m.MovieTitle, m.ReleaseDate,
	b.FirstName, b.LastName, mpaa.FilmRating, d.FirstName, d.LastName, s.StudioName
		from MovieBorrower mb
		inner join Movies m
		on mb.MovieID = m.MovieID
		inner join Borrowers b
		on mb.BorrowerID = b.BorrowerID
		inner join MPAARatings mpaa
		on mpaa.MPAARatingID = m.MPAARatingID
		inner join Directors d
		on d.DirectorID = m.DirectorID
		inner join Studios s
		on s.StudioID = m.StudioID
		where mb.DateReturned is not null or mb.DateBorrowed is null

end


GO
/****** Object:  StoredProcedure [dbo].[GetActorsByMovieID]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetActorsByMovieID] (
@MovieID int
)
as
begin
select m.MovieID, m.MovieTitle, a.ActorID, a.FirstName, a.LastName
	from MovieActors ma
	inner join Actors a
	on ma.ActorID = a.ActorID
	inner join Movies m
	on ma.MovieID = m.MovieID
	where ma.MovieID = @MovieID
end


GO
/****** Object:  StoredProcedure [dbo].[InsertActor]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[InsertActor] (
@FirstName varchar(50),
@LastName varchar(50),
@ActorID int output
)
as
begin
insert into Actors(FirstName, LastName)
values (@FirstName, @LastName)

set @ActorID = SCOPE_IDENTITY();
end


GO
/****** Object:  StoredProcedure [dbo].[InsertDirector]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InsertDirector](
@FirstName nchar(50),
@LastName nchar (50),
@DirectorID int output
) as
begin
insert into Directors(FirstName, LastName)
values (@FirstName, @LastName)

set @DirectorID = SCOPE_IDENTITY();

End

GO
/****** Object:  StoredProcedure [dbo].[InsertMovieActors]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[InsertMovieActors] (
@ActorID int,
@MovieID int
)
as
begin
insert into MovieActors(ActorID, MovieID)
values (@ActorID, @MovieID)
end

GO
/****** Object:  StoredProcedure [dbo].[InsertMovies]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[InsertMovies](
@MovieTitle varchar(50),
@MPAARatingID int,
@DirectorID int,
@StudioID int,
@ReleaseDate int,
@MovieID int output
) as
begin

insert into Movies(MovieTitle, MPAARatingID, DirectorID, StudioID, ReleaseDate )
values (@MovieTitle, @MPAARatingID, @DirectorID, @StudioID, @ReleaseDate)

set @MovieID = SCOPE_IDENTITY();

End

GO
/****** Object:  StoredProcedure [dbo].[InsertMPAARatings]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[InsertMPAARatings](
@FilmRating nchar(50),
@MPAARatingID int output
) as
begin

insert into MPAARatings(FilmRating)
values (@FilmRating)

set @MPAARatingID = SCOPE_IDENTITY();

End

GO
/****** Object:  StoredProcedure [dbo].[InsertStudio]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[InsertStudio](
@StudioName nchar(50),
@StudioID int output
) as
begin

insert into Studios(StudioName)
values (@StudioName)

set @StudioID = SCOPE_IDENTITY();

End

GO
/****** Object:  StoredProcedure [dbo].[TrackAllDVD]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[TrackAllDVD] as

Begin
	select m.MovieID, b.BorrowerID, mb.DateBorrowed, mb.DateReturned, mb.UserRating, mb.UserNotes, m.MovieTitle, m.ReleaseDate,
	b.FirstName, b.LastName, mpaa.FilmRating, d.FirstName, d.LastName, s.StudioName
		from MovieBorrower mb
		inner join Movies m
		on mb.MovieID = m.MovieID
		inner join Borrowers b
		on mb.BorrowerID = b.BorrowerID
		inner join MPAARatings mpaa
		on mpaa.MPAARatingID = m.MPAARatingID
		inner join Directors d
		on d.DirectorID = m.DirectorID
		inner join Studios s
		on s.StudioID = m.StudioID

end


GO
/****** Object:  StoredProcedure [dbo].[TrackDVDByMovieID]    Script Date: 12/11/2015 9:56:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[TrackDVDByMovieID] (
	@MovieID int 
)
as

Begin
	select m.MovieID, b.BorrowerID, b.FirstName as bFirstName, b.LastName as bLastName, mb.DateBorrowed,
	mb.DateReturned, mb.UserRating, mb.UserNotes, m.MovieTitle, m.ReleaseDate,
	mpaa.FilmRating, d.DirectorID, d.FirstName as dFirstName, d.LastName as dLastName, s.StudioID, s.StudioName
		from MovieBorrower mb
		inner join Movies m
		on mb.MovieID = m.MovieID
		inner join Borrowers b
		on mb.BorrowerID = b.BorrowerID
		inner join MPAARatings mpaa
		on mpaa.MPAARatingID = m.MPAARatingID
		inner join Directors d
		on d.DirectorID = m.DirectorID
		inner join Studios s
		on s.StudioID = m.StudioID
		where m.MovieID = @MovieID

end



GO
USE [master]
GO
ALTER DATABASE [DVDLibrary] SET  READ_WRITE 
GO
