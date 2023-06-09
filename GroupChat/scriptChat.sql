USE [master]
GO
/****** Object:  Database [GroupChat]    Script Date: 11.03.2023 9:40:16 ******/
CREATE DATABASE [GroupChat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GroupChat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SERV1215\MSSQL\DATA\GroupChat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'GroupChat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SERV1215\MSSQL\DATA\GroupChat_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GroupChat] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GroupChat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GroupChat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GroupChat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GroupChat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GroupChat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GroupChat] SET ARITHABORT OFF 
GO
ALTER DATABASE [GroupChat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GroupChat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GroupChat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GroupChat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GroupChat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GroupChat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GroupChat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GroupChat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GroupChat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GroupChat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GroupChat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GroupChat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GroupChat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GroupChat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GroupChat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GroupChat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GroupChat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GroupChat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GroupChat] SET  MULTI_USER 
GO
ALTER DATABASE [GroupChat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GroupChat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GroupChat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GroupChat] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GroupChat] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GroupChat] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GroupChat', N'ON'
GO
ALTER DATABASE [GroupChat] SET QUERY_STORE = OFF
GO
USE [GroupChat]
GO
/****** Object:  User [user01]    Script Date: 11.03.2023 9:40:17 ******/
CREATE USER [user01] FOR LOGIN [user01] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ChatMessage]    Script Date: 11.03.2023 9:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatMessage](
	[Id_Chat] [int] IDENTITY(1,1) NOT NULL,
	[Sender_Id] [int] NOT NULL,
	[Chatroom_Id] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ChatMessage] PRIMARY KEY CLUSTERED 
(
	[Id_Chat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chatroom]    Script Date: 11.03.2023 9:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chatroom](
	[Id_Chatroom] [int] IDENTITY(1,1) NOT NULL,
	[Topic] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Chatroom] PRIMARY KEY CLUSTERED 
(
	[Id_Chatroom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11.03.2023 9:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id_Department] [int] IDENTITY(1,1) NOT NULL,
	[Name_Dapertment] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id_Department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11.03.2023 9:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id_Employee] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
	[Department_Id] [int] NOT NULL,
	[Username] [nvarchar](15) NOT NULL,
	[Password] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id_Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeChat]    Script Date: 11.03.2023 9:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeChat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Chatroom_Id] [int] NOT NULL,
	[Employee_Id] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeChat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChatMessage] ON 

INSERT [dbo].[ChatMessage] ([Id_Chat], [Sender_Id], [Chatroom_Id], [Date], [Message]) VALUES (23, 1, 1, CAST(N'2023-03-11T09:37:03.983' AS DateTime), N'Признавайтесь')
INSERT [dbo].[ChatMessage] ([Id_Chat], [Sender_Id], [Chatroom_Id], [Date], [Message]) VALUES (24, 1, 3, CAST(N'2023-03-11T09:38:16.163' AS DateTime), N'Вечеринка в воскресенье в 13:00, кто идет отпишите +')
INSERT [dbo].[ChatMessage] ([Id_Chat], [Sender_Id], [Chatroom_Id], [Date], [Message]) VALUES (25, 2, 1, CAST(N'2023-03-11T09:38:52.923' AS DateTime), N'Это не я!')
INSERT [dbo].[ChatMessage] ([Id_Chat], [Sender_Id], [Chatroom_Id], [Date], [Message]) VALUES (26, 2, 3, CAST(N'2023-03-11T09:38:59.717' AS DateTime), N'+')
SET IDENTITY_INSERT [dbo].[ChatMessage] OFF
GO
SET IDENTITY_INSERT [dbo].[Chatroom] ON 

INSERT [dbo].[Chatroom] ([Id_Chatroom], [Topic]) VALUES (1, N'Кто съел мои печеньки')
INSERT [dbo].[Chatroom] ([Id_Chatroom], [Topic]) VALUES (3, N'Кто идет на вечеринку в воскресенье')
SET IDENTITY_INSERT [dbo].[Chatroom] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id_Department], [Name_Dapertment]) VALUES (1, N'Admin')
INSERT [dbo].[Department] ([Id_Department], [Name_Dapertment]) VALUES (2, N'IT Helpdesk')
INSERT [dbo].[Department] ([Id_Department], [Name_Dapertment]) VALUES (3, N'Sales')
INSERT [dbo].[Department] ([Id_Department], [Name_Dapertment]) VALUES (4, N'Marketing')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id_Employee], [Name], [Department_Id], [Username], [Password]) VALUES (1, N'Alex', 1, N'Alex54', N'1')
INSERT [dbo].[Employee] ([Id_Employee], [Name], [Department_Id], [Username], [Password]) VALUES (2, N'Morgan', 2, N'Morginal', N'2')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeChat] ON 

INSERT [dbo].[EmployeeChat] ([Id], [Chatroom_Id], [Employee_Id]) VALUES (1, 1, 1)
INSERT [dbo].[EmployeeChat] ([Id], [Chatroom_Id], [Employee_Id]) VALUES (2, 1, 2)
INSERT [dbo].[EmployeeChat] ([Id], [Chatroom_Id], [Employee_Id]) VALUES (4, 3, 1)
INSERT [dbo].[EmployeeChat] ([Id], [Chatroom_Id], [Employee_Id]) VALUES (5, 1, 2)
INSERT [dbo].[EmployeeChat] ([Id], [Chatroom_Id], [Employee_Id]) VALUES (6, 3, 2)
SET IDENTITY_INSERT [dbo].[EmployeeChat] OFF
GO
ALTER TABLE [dbo].[ChatMessage]  WITH CHECK ADD  CONSTRAINT [FK_ChatMessage_Chatroom] FOREIGN KEY([Chatroom_Id])
REFERENCES [dbo].[Chatroom] ([Id_Chatroom])
GO
ALTER TABLE [dbo].[ChatMessage] CHECK CONSTRAINT [FK_ChatMessage_Chatroom]
GO
ALTER TABLE [dbo].[ChatMessage]  WITH CHECK ADD  CONSTRAINT [FK_ChatMessage_Employee] FOREIGN KEY([Sender_Id])
REFERENCES [dbo].[Employee] ([Id_Employee])
GO
ALTER TABLE [dbo].[ChatMessage] CHECK CONSTRAINT [FK_ChatMessage_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Id_Department])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[EmployeeChat]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeChat_Chatroom] FOREIGN KEY([Chatroom_Id])
REFERENCES [dbo].[Chatroom] ([Id_Chatroom])
GO
ALTER TABLE [dbo].[EmployeeChat] CHECK CONSTRAINT [FK_EmployeeChat_Chatroom]
GO
ALTER TABLE [dbo].[EmployeeChat]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeChat_Employee] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Id_Employee])
GO
ALTER TABLE [dbo].[EmployeeChat] CHECK CONSTRAINT [FK_EmployeeChat_Employee]
GO
USE [master]
GO
ALTER DATABASE [GroupChat] SET  READ_WRITE 
GO
