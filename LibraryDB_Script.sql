-- LibraryDatabase.sql
-- SQL Server script for creating and populating a sample library management database.
-- Author: Amogelang Seipone
-- Date: March 2025


USE [master]
GO
/****** Object:  Database [LibraryDatabase]    Script Date: 2025/03/17 18:16:00 ******/
CREATE DATABASE [LibraryDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryDatabase', FILENAME = 'LibraryDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryDatabase_log', FILENAME = 'LibraryDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LibraryDatabase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LibraryDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [LibraryDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LibraryDatabase]
GO
/****** Object:  Table [dbo].[Assistant]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assistant](
	[LStf_ID] [int] NOT NULL,
	[Ass_Hour] [varchar](200) NULL,
	[Ass_HireDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LStf_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boardgame]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boardgame](
	[Item_ID] [int] NOT NULL,
	[Boardgame_PlayTime] [time](7) NULL,
	[Boardgame_MinPlayers] [int] NULL,
	[Boardgame_MaxPlayers] [int] NULL,
	[Boardgame_Title] [varchar](200) NULL,
	[Boardgame_Author] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Item_ID] [int] NOT NULL,
	[Book_Title] [varchar](200) NOT NULL,
	[Book_Author] [varchar](200) NOT NULL,
	[Book_PageCount] [int] NOT NULL,
	[Book_Copy] [int] NOT NULL,
	[DBook_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking_Patron]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking_Patron](
	[BP_ID] [int] NOT NULL,
	[Patron_ID] [int] NULL,
	[VBook_ID] [int] NULL,
	[BP_StartDateTime] [datetime] NULL,
	[BP_EndDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[Card_ID] [int] NOT NULL,
	[Card_Number] [varchar](200) NULL,
	[Card_ValidDate] [date] NULL,
	[Card_IsStudent] [bit] NULL,
	[Card_IsStaff] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Card_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Digital_Book]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Digital_Book](
	[DBook_ID] [int] NOT NULL,
	[DBook_License] [varchar](200) NULL,
	[DBook_URL_Link] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[DBook_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[Equipment_ID] [int] NOT NULL,
	[Equip_Value] [varchar](200) NULL,
	[Equip_Desc] [varchar](200) NULL,
	[Venue_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Equipment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Item_ID] [int] NOT NULL,
	[Item_DDC_Code] [varchar](200) NULL,
	[Item_Shelf] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Librarian]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Librarian](
	[LStf_ID] [int] NOT NULL,
	[Lib_Section] [varchar](200) NOT NULL,
	[LibDegree] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LStf_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Library_Staff]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Library_Staff](
	[LStf_ID] [int] NOT NULL,
	[LStf_FName] [varchar](200) NOT NULL,
	[LStf_LName] [varchar](200) NOT NULL,
	[LStf_IDNumber] [varchar](200) NOT NULL,
	[LStf_Emp_Number] [varchar](200) NOT NULL,
	[LStf_YearsOfService] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LStf_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loan](
	[Loan_ID] [int] NOT NULL,
	[Item_ID] [int] NULL,
	[Patron_ID] [int] NULL,
	[Loan_Status_ID] [int] NULL,
	[LStf_ID] [int] NULL,
	[Loan_StartDateTime] [datetime] NULL,
	[Loan_EndDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Loan_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loan_Status]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loan_Status](
	[Loan_Status_ID] [int] NOT NULL,
	[Loan_Status] [varchar](200) NULL,
	[Loan_Status_Desc] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Loan_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[Item_ID] [int] NOT NULL,
	[Movie_Title] [varchar](200) NULL,
	[Movie_PlayTime] [time](7) NULL,
	[Movie_AgeRestriction] [char](3) NULL,
	[Movie_Genre] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patron]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patron](
	[Patron_ID] [int] NOT NULL,
	[Card_ID] [int] NULL,
	[Patron_FName] [varchar](100) NOT NULL,
	[Patron_LName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Patron_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venue]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venue](
	[Venue_ID] [int] NOT NULL,
	[Venue_LocationGPS] [varchar](200) NULL,
	[Venue_Room] [varchar](200) NULL,
	[Venue_Level] [varchar](200) NULL,
	[Venue_Building] [varchar](200) NULL,
	[Venue_Campus] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Venue_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venue_Booking]    Script Date: 2025/03/17 18:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venue_Booking](
	[VBook_ID] [int] NOT NULL,
	[Venue_ID] [int] NULL,
	[Patron_ID] [int] NULL,
	[LStf_ID] [int] NULL,
	[VBook_Reason] [varchar](200) NULL,
	[VBook_StartDateTime] [date] NULL,
	[VBook_EndDateTime] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VBook_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Assistant] ([LStf_ID], [Ass_Hour], [Ass_HireDate]) VALUES (1, N'9:00 AM - 5:00 PM', CAST(N'2012-06-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Assistant] ([LStf_ID], [Ass_Hour], [Ass_HireDate]) VALUES (2, N'8:00 AM - 4:00 PM', CAST(N'2016-07-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Assistant] ([LStf_ID], [Ass_Hour], [Ass_HireDate]) VALUES (3, N'10:00 AM - 6:00 PM', CAST(N'2014-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Assistant] ([LStf_ID], [Ass_Hour], [Ass_HireDate]) VALUES (4, N'9:30 AM - 5:30 PM', CAST(N'2020-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Assistant] ([LStf_ID], [Ass_Hour], [Ass_HireDate]) VALUES (5, N'8:30 AM - 4:30 PM', CAST(N'2021-03-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Boardgame] ([Item_ID], [Boardgame_PlayTime], [Boardgame_MinPlayers], [Boardgame_MaxPlayers], [Boardgame_Title], [Boardgame_Author]) VALUES (1, CAST(N'00:45:00' AS Time), 2, 4, N'Catan', N'Klaus Teuber')
INSERT [dbo].[Boardgame] ([Item_ID], [Boardgame_PlayTime], [Boardgame_MinPlayers], [Boardgame_MaxPlayers], [Boardgame_Title], [Boardgame_Author]) VALUES (2, CAST(N'01:30:00' AS Time), 2, 6, N'Monopoly', N'Charles Darrow')
INSERT [dbo].[Boardgame] ([Item_ID], [Boardgame_PlayTime], [Boardgame_MinPlayers], [Boardgame_MaxPlayers], [Boardgame_Title], [Boardgame_Author]) VALUES (3, CAST(N'02:00:00' AS Time), 3, 8, N'Risk', N'Albert Lamorisse')
INSERT [dbo].[Boardgame] ([Item_ID], [Boardgame_PlayTime], [Boardgame_MinPlayers], [Boardgame_MaxPlayers], [Boardgame_Title], [Boardgame_Author]) VALUES (4, CAST(N'00:30:00' AS Time), 2, 4, N'Clue', N'Anthony E. Pratt')
INSERT [dbo].[Boardgame] ([Item_ID], [Boardgame_PlayTime], [Boardgame_MinPlayers], [Boardgame_MaxPlayers], [Boardgame_Title], [Boardgame_Author]) VALUES (5, CAST(N'01:00:00' AS Time), 2, 5, N'Ticket to Ride', N'Alan R. Moon')
GO
INSERT [dbo].[Book] ([Item_ID], [Book_Title], [Book_Author], [Book_PageCount], [Book_Copy], [DBook_ID]) VALUES (1, N'The Great Gatsby', N'F. Scott Fitzgerald', 180, 3, 1)
INSERT [dbo].[Book] ([Item_ID], [Book_Title], [Book_Author], [Book_PageCount], [Book_Copy], [DBook_ID]) VALUES (2, N'1984', N'George Orwell', 328, 5, 2)
INSERT [dbo].[Book] ([Item_ID], [Book_Title], [Book_Author], [Book_PageCount], [Book_Copy], [DBook_ID]) VALUES (3, N'To Kill a Mockingbird', N'Harper Lee', 281, 4, 3)
INSERT [dbo].[Book] ([Item_ID], [Book_Title], [Book_Author], [Book_PageCount], [Book_Copy], [DBook_ID]) VALUES (4, N'Moby Dick', N'Herman Melville', 635, 2, 4)
INSERT [dbo].[Book] ([Item_ID], [Book_Title], [Book_Author], [Book_PageCount], [Book_Copy], [DBook_ID]) VALUES (5, N'Pride and Prejudice', N'Jane Austen', 279, 6, 5)
GO
INSERT [dbo].[Booking_Patron] ([BP_ID], [Patron_ID], [VBook_ID], [BP_StartDateTime], [BP_EndDateTime]) VALUES (1, 1, 1, CAST(N'2025-03-01T14:00:00.000' AS DateTime), CAST(N'2025-03-01T15:00:00.000' AS DateTime))
INSERT [dbo].[Booking_Patron] ([BP_ID], [Patron_ID], [VBook_ID], [BP_StartDateTime], [BP_EndDateTime]) VALUES (2, 2, 2, CAST(N'2025-03-02T15:00:00.000' AS DateTime), CAST(N'2025-03-02T16:00:00.000' AS DateTime))
INSERT [dbo].[Booking_Patron] ([BP_ID], [Patron_ID], [VBook_ID], [BP_StartDateTime], [BP_EndDateTime]) VALUES (3, 3, 3, CAST(N'2025-03-03T16:00:00.000' AS DateTime), CAST(N'2025-03-03T17:00:00.000' AS DateTime))
INSERT [dbo].[Booking_Patron] ([BP_ID], [Patron_ID], [VBook_ID], [BP_StartDateTime], [BP_EndDateTime]) VALUES (4, 4, 4, CAST(N'2025-03-04T17:00:00.000' AS DateTime), CAST(N'2025-03-04T18:00:00.000' AS DateTime))
INSERT [dbo].[Booking_Patron] ([BP_ID], [Patron_ID], [VBook_ID], [BP_StartDateTime], [BP_EndDateTime]) VALUES (5, 5, 5, CAST(N'2025-03-05T18:00:00.000' AS DateTime), CAST(N'2025-03-05T19:00:00.000' AS DateTime))
GO
INSERT [dbo].[Card] ([Card_ID], [Card_Number], [Card_ValidDate], [Card_IsStudent], [Card_IsStaff]) VALUES (1, N'C12345', CAST(N'2026-12-31' AS Date), 1, 0)
INSERT [dbo].[Card] ([Card_ID], [Card_Number], [Card_ValidDate], [Card_IsStudent], [Card_IsStaff]) VALUES (2, N'C67890', CAST(N'2025-08-31' AS Date), 0, 1)
INSERT [dbo].[Card] ([Card_ID], [Card_Number], [Card_ValidDate], [Card_IsStudent], [Card_IsStaff]) VALUES (3, N'C11223', CAST(N'2026-06-30' AS Date), 1, 0)
INSERT [dbo].[Card] ([Card_ID], [Card_Number], [Card_ValidDate], [Card_IsStudent], [Card_IsStaff]) VALUES (4, N'C44556', CAST(N'2027-05-15' AS Date), 0, 1)
INSERT [dbo].[Card] ([Card_ID], [Card_Number], [Card_ValidDate], [Card_IsStudent], [Card_IsStaff]) VALUES (5, N'C78901', CAST(N'2024-12-25' AS Date), 1, 0)
GO
INSERT [dbo].[Digital_Book] ([DBook_ID], [DBook_License], [DBook_URL_Link]) VALUES (1, N'License001', N'http://example.com/dbook1')
INSERT [dbo].[Digital_Book] ([DBook_ID], [DBook_License], [DBook_URL_Link]) VALUES (2, N'License002', N'http://example.com/dbook2')
INSERT [dbo].[Digital_Book] ([DBook_ID], [DBook_License], [DBook_URL_Link]) VALUES (3, N'License003', N'http://example.com/dbook3')
INSERT [dbo].[Digital_Book] ([DBook_ID], [DBook_License], [DBook_URL_Link]) VALUES (4, N'License004', N'http://example.com/dbook4')
INSERT [dbo].[Digital_Book] ([DBook_ID], [DBook_License], [DBook_URL_Link]) VALUES (5, N'License005', N'http://example.com/dbook5')
GO
INSERT [dbo].[Equipment] ([Equipment_ID], [Equip_Value], [Equip_Desc], [Venue_ID]) VALUES (1, N'5000', N'Projector for presentations', 1)
INSERT [dbo].[Equipment] ([Equipment_ID], [Equip_Value], [Equip_Desc], [Venue_ID]) VALUES (2, N'1500', N'Microphone for speeches', 2)
INSERT [dbo].[Equipment] ([Equipment_ID], [Equip_Value], [Equip_Desc], [Venue_ID]) VALUES (3, N'3000', N'Speaker system for events', 3)
INSERT [dbo].[Equipment] ([Equipment_ID], [Equip_Value], [Equip_Desc], [Venue_ID]) VALUES (4, N'800', N'Whiteboard for meetings', 4)
INSERT [dbo].[Equipment] ([Equipment_ID], [Equip_Value], [Equip_Desc], [Venue_ID]) VALUES (5, N'1200', N'Podium for lectures', 5)
GO
INSERT [dbo].[Item] ([Item_ID], [Item_DDC_Code], [Item_Shelf]) VALUES (1, N'823', 1)
INSERT [dbo].[Item] ([Item_ID], [Item_DDC_Code], [Item_Shelf]) VALUES (2, N'900', 2)
INSERT [dbo].[Item] ([Item_ID], [Item_DDC_Code], [Item_Shelf]) VALUES (3, N'305', 1)
INSERT [dbo].[Item] ([Item_ID], [Item_DDC_Code], [Item_Shelf]) VALUES (4, N'300', 3)
INSERT [dbo].[Item] ([Item_ID], [Item_DDC_Code], [Item_Shelf]) VALUES (5, N'599', 4)
GO
INSERT [dbo].[Librarian] ([LStf_ID], [Lib_Section], [LibDegree]) VALUES (1, N'Fiction', 1)
INSERT [dbo].[Librarian] ([LStf_ID], [Lib_Section], [LibDegree]) VALUES (2, N'Non-fiction', 2)
INSERT [dbo].[Librarian] ([LStf_ID], [Lib_Section], [LibDegree]) VALUES (3, N'Children', 1)
INSERT [dbo].[Librarian] ([LStf_ID], [Lib_Section], [LibDegree]) VALUES (4, N'Art', 3)
INSERT [dbo].[Librarian] ([LStf_ID], [Lib_Section], [LibDegree]) VALUES (5, N'History', 2)
GO
INSERT [dbo].[Library_Staff] ([LStf_ID], [LStf_FName], [LStf_LName], [LStf_IDNumber], [LStf_Emp_Number], [LStf_YearsOfService]) VALUES (1, N'Michael', N'Scott', N'ID123', N'E1234', 10)
INSERT [dbo].[Library_Staff] ([LStf_ID], [LStf_FName], [LStf_LName], [LStf_IDNumber], [LStf_Emp_Number], [LStf_YearsOfService]) VALUES (2, N'Dwight', N'Schrute', N'ID124', N'E1235', 5)
INSERT [dbo].[Library_Staff] ([LStf_ID], [LStf_FName], [LStf_LName], [LStf_IDNumber], [LStf_Emp_Number], [LStf_YearsOfService]) VALUES (3, N'Jim', N'Halpert', N'ID125', N'E1236', 8)
INSERT [dbo].[Library_Staff] ([LStf_ID], [LStf_FName], [LStf_LName], [LStf_IDNumber], [LStf_Emp_Number], [LStf_YearsOfService]) VALUES (4, N'Pam', N'Beesly', N'ID126', N'E1237', 3)
INSERT [dbo].[Library_Staff] ([LStf_ID], [LStf_FName], [LStf_LName], [LStf_IDNumber], [LStf_Emp_Number], [LStf_YearsOfService]) VALUES (5, N'Ryan', N'Howard', N'ID127', N'E1238', 2)
GO
INSERT [dbo].[Loan] ([Loan_ID], [Item_ID], [Patron_ID], [Loan_Status_ID], [LStf_ID], [Loan_StartDateTime], [Loan_EndDateTime]) VALUES (1, 1, 1, 1, 1, CAST(N'2025-03-01T09:00:00.000' AS DateTime), CAST(N'2025-03-15T09:00:00.000' AS DateTime))
INSERT [dbo].[Loan] ([Loan_ID], [Item_ID], [Patron_ID], [Loan_Status_ID], [LStf_ID], [Loan_StartDateTime], [Loan_EndDateTime]) VALUES (2, 2, 2, 1, 2, CAST(N'2025-03-02T10:00:00.000' AS DateTime), CAST(N'2025-03-16T10:00:00.000' AS DateTime))
INSERT [dbo].[Loan] ([Loan_ID], [Item_ID], [Patron_ID], [Loan_Status_ID], [LStf_ID], [Loan_StartDateTime], [Loan_EndDateTime]) VALUES (3, 3, 3, 2, 3, CAST(N'2025-03-03T11:00:00.000' AS DateTime), CAST(N'2025-03-17T11:00:00.000' AS DateTime))
INSERT [dbo].[Loan] ([Loan_ID], [Item_ID], [Patron_ID], [Loan_Status_ID], [LStf_ID], [Loan_StartDateTime], [Loan_EndDateTime]) VALUES (4, 4, 4, 3, 4, CAST(N'2025-03-04T12:00:00.000' AS DateTime), CAST(N'2025-03-18T12:00:00.000' AS DateTime))
INSERT [dbo].[Loan] ([Loan_ID], [Item_ID], [Patron_ID], [Loan_Status_ID], [LStf_ID], [Loan_StartDateTime], [Loan_EndDateTime]) VALUES (5, 5, 5, 4, 5, CAST(N'2025-03-05T13:00:00.000' AS DateTime), CAST(N'2025-03-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Loan_Status] ([Loan_Status_ID], [Loan_Status], [Loan_Status_Desc]) VALUES (1, N'Checked Out', N'Item has been checked out by a patron')
INSERT [dbo].[Loan_Status] ([Loan_Status_ID], [Loan_Status], [Loan_Status_Desc]) VALUES (2, N'Available', N'Item is available for loan')
INSERT [dbo].[Loan_Status] ([Loan_Status_ID], [Loan_Status], [Loan_Status_Desc]) VALUES (3, N'Reserved', N'Item has been reserved by a patron')
INSERT [dbo].[Loan_Status] ([Loan_Status_ID], [Loan_Status], [Loan_Status_Desc]) VALUES (4, N'Lost', N'Item has been reported as lost')
INSERT [dbo].[Loan_Status] ([Loan_Status_ID], [Loan_Status], [Loan_Status_Desc]) VALUES (5, N'Damaged', N'Item is damaged and cannot be loaned')
GO
INSERT [dbo].[Patron] ([Patron_ID], [Card_ID], [Patron_FName], [Patron_LName]) VALUES (1, 1, N'John', N'Doe')
INSERT [dbo].[Patron] ([Patron_ID], [Card_ID], [Patron_FName], [Patron_LName]) VALUES (2, 2, N'Jane', N'Smith')
INSERT [dbo].[Patron] ([Patron_ID], [Card_ID], [Patron_FName], [Patron_LName]) VALUES (3, 3, N'Alice', N'Johnson')
INSERT [dbo].[Patron] ([Patron_ID], [Card_ID], [Patron_FName], [Patron_LName]) VALUES (4, 4, N'Bob', N'Williams')
INSERT [dbo].[Patron] ([Patron_ID], [Card_ID], [Patron_FName], [Patron_LName]) VALUES (5, 5, N'Charlie', N'Brown')
GO
INSERT [dbo].[Venue] ([Venue_ID], [Venue_LocationGPS], [Venue_Room], [Venue_Level], [Venue_Building], [Venue_Campus]) VALUES (1, N'40.712776,-74.005974', N'Room 101', N'Level 1', N'Main Building', N'Central Campus')
INSERT [dbo].[Venue] ([Venue_ID], [Venue_LocationGPS], [Venue_Room], [Venue_Level], [Venue_Building], [Venue_Campus]) VALUES (2, N'34.052235,-118.243683', N'Room 202', N'Level 2', N'Science Building', N'North Campus')
INSERT [dbo].[Venue] ([Venue_ID], [Venue_LocationGPS], [Venue_Room], [Venue_Level], [Venue_Building], [Venue_Campus]) VALUES (3, N'41.878113,-87.629799', N'Room 303', N'Level 3', N'Library', N'East Campus')
INSERT [dbo].[Venue] ([Venue_ID], [Venue_LocationGPS], [Venue_Room], [Venue_Level], [Venue_Building], [Venue_Campus]) VALUES (4, N'51.507351,-0.127758', N'Room 404', N'Level 4', N'Auditorium', N'West Campus')
INSERT [dbo].[Venue] ([Venue_ID], [Venue_LocationGPS], [Venue_Room], [Venue_Level], [Venue_Building], [Venue_Campus]) VALUES (5, N'48.856613,2.352222', N'Room 505', N'Level 5', N'Conference Center', N'South Campus')
GO
INSERT [dbo].[Venue_Booking] ([VBook_ID], [Venue_ID], [Patron_ID], [LStf_ID], [VBook_Reason], [VBook_StartDateTime], [VBook_EndDateTime]) VALUES (1, 1, 1, 1, N'Study Session', CAST(N'2025-03-01' AS Date), CAST(N'15:00:00' AS Time))
INSERT [dbo].[Venue_Booking] ([VBook_ID], [Venue_ID], [Patron_ID], [LStf_ID], [VBook_Reason], [VBook_StartDateTime], [VBook_EndDateTime]) VALUES (2, 2, 2, 2, N'Group Meeting', CAST(N'2025-03-02' AS Date), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Venue_Booking] ([VBook_ID], [Venue_ID], [Patron_ID], [LStf_ID], [VBook_Reason], [VBook_StartDateTime], [VBook_EndDateTime]) VALUES (3, 3, 3, 3, N'Seminar', CAST(N'2025-03-03' AS Date), CAST(N'17:00:00' AS Time))
INSERT [dbo].[Venue_Booking] ([VBook_ID], [Venue_ID], [Patron_ID], [LStf_ID], [VBook_Reason], [VBook_StartDateTime], [VBook_EndDateTime]) VALUES (4, 4, 4, 4, N'Workshop', CAST(N'2025-03-04' AS Date), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Venue_Booking] ([VBook_ID], [Venue_ID], [Patron_ID], [LStf_ID], [VBook_Reason], [VBook_StartDateTime], [VBook_EndDateTime]) VALUES (5, 5, 5, 5, N'Conference', CAST(N'2025-03-05' AS Date), CAST(N'19:00:00' AS Time))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Card__CD2FF78653608DCB]    Script Date: 2025/03/17 18:16:00 ******/
ALTER TABLE [dbo].[Card] ADD UNIQUE NONCLUSTERED 
(
	[Card_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assistant]  WITH CHECK ADD FOREIGN KEY([LStf_ID])
REFERENCES [dbo].[Library_Staff] ([LStf_ID])
GO
ALTER TABLE [dbo].[Boardgame]  WITH CHECK ADD FOREIGN KEY([Item_ID])
REFERENCES [dbo].[Item] ([Item_ID])
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([DBook_ID])
REFERENCES [dbo].[Digital_Book] ([DBook_ID])
GO
ALTER TABLE [dbo].[Booking_Patron]  WITH CHECK ADD FOREIGN KEY([Patron_ID])
REFERENCES [dbo].[Patron] ([Patron_ID])
GO
ALTER TABLE [dbo].[Booking_Patron]  WITH CHECK ADD FOREIGN KEY([VBook_ID])
REFERENCES [dbo].[Venue_Booking] ([VBook_ID])
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD FOREIGN KEY([Venue_ID])
REFERENCES [dbo].[Venue] ([Venue_ID])
GO
ALTER TABLE [dbo].[Librarian]  WITH CHECK ADD FOREIGN KEY([LStf_ID])
REFERENCES [dbo].[Library_Staff] ([LStf_ID])
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD FOREIGN KEY([Item_ID])
REFERENCES [dbo].[Item] ([Item_ID])
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD FOREIGN KEY([Loan_Status_ID])
REFERENCES [dbo].[Loan_Status] ([Loan_Status_ID])
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD FOREIGN KEY([LStf_ID])
REFERENCES [dbo].[Library_Staff] ([LStf_ID])
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD FOREIGN KEY([Patron_ID])
REFERENCES [dbo].[Patron] ([Patron_ID])
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD FOREIGN KEY([Item_ID])
REFERENCES [dbo].[Item] ([Item_ID])
GO
ALTER TABLE [dbo].[Patron]  WITH CHECK ADD FOREIGN KEY([Card_ID])
REFERENCES [dbo].[Card] ([Card_ID])
GO
ALTER TABLE [dbo].[Venue_Booking]  WITH CHECK ADD FOREIGN KEY([LStf_ID])
REFERENCES [dbo].[Library_Staff] ([LStf_ID])
GO
ALTER TABLE [dbo].[Venue_Booking]  WITH CHECK ADD FOREIGN KEY([Patron_ID])
REFERENCES [dbo].[Patron] ([Patron_ID])
GO
ALTER TABLE [dbo].[Venue_Booking]  WITH CHECK ADD FOREIGN KEY([Venue_ID])
REFERENCES [dbo].[Venue] ([Venue_ID])
GO
USE [master]
GO
ALTER DATABASE [LibraryDatabase] SET  READ_WRITE 
GO
 