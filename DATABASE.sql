USE [master]
GO
/****** Object:  Database [DOUBLEVPARTNERS]    Script Date: 13/03/2023 4:26:56 ******/
CREATE DATABASE [DOUBLEVPARTNERS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DOUBLEVPARTNERS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DOUBLEVPARTNERS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DOUBLEVPARTNERS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DOUBLEVPARTNERS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DOUBLEVPARTNERS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET ARITHABORT OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET RECOVERY FULL 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET  MULTI_USER 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DOUBLEVPARTNERS', N'ON'
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET QUERY_STORE = ON
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DOUBLEVPARTNERS]
GO
/****** Object:  Table [dbo].[PERSONAS]    Script Date: 13/03/2023 4:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONAS](
	[IdPerson] [int] IDENTITY(1,1) NOT NULL,
	[Names] [varchar](100) NULL,
	[Lastnames] [varchar](100) NULL,
	[DNI] [int] NULL,
	[Email] [varchar](100) NULL,
	[DNIType] [varchar](100) NULL,
	[CreatedAt] [datetime] NULL,
	[FullDNI]  AS (([DNIType]+'-')+CONVERT([varchar](100),[DNI])),
	[FullName]  AS (([Names]+' ')+[Lastnames]),
PRIMARY KEY CLUSTERED 
(
	[IdPerson] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 13/03/2023 4:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[Pass] [varbinary](max) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PERSONAS] ON 
GO
INSERT [dbo].[PERSONAS] ([IdPerson], [Names], [Lastnames], [DNI], [Email], [DNIType], [CreatedAt]) VALUES (1, N'Astrid Carolina', N'Correa Rotavisky', 1107086797, N'caro.rotaw11@gmail.com', N'cc', CAST(N'2023-03-10T23:14:05.690' AS DateTime))
GO
INSERT [dbo].[PERSONAS] ([IdPerson], [Names], [Lastnames], [DNI], [Email], [DNIType], [CreatedAt]) VALUES (2, N'Luis Eduardo', N'Cortes Rodriguez', 1107091203, N'lucho951003@gmail.com', N'cc', CAST(N'2023-03-10T23:14:33.343' AS DateTime))
GO
INSERT [dbo].[PERSONAS] ([IdPerson], [Names], [Lastnames], [DNI], [Email], [DNIType], [CreatedAt]) VALUES (1003, N'David', N'Joaquibioy Castano', 12414515, N'david.castano@gmail.com', N'cc', CAST(N'2023-03-11T20:39:53.937' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PERSONAS] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 
GO
INSERT [dbo].[USUARIO] ([IdUser], [Username], [Pass], [CreatedAt]) VALUES (1002, N'lucho951003@gmail.com', 0x020000007C235039FEC43F4332F9ED3A7925B1B4D336477284C6D2DFB847B5E9ED81CB82, CAST(N'2023-03-11T14:05:08.183' AS DateTime))
GO
INSERT [dbo].[USUARIO] ([IdUser], [Username], [Pass], [CreatedAt]) VALUES (1003, N'nit', 0x02000000910D2D360F64A6C23AD8E1E613756772CE35DE6B0EFE1F7C62C325C53CCDC4BA, CAST(N'2023-03-11T15:31:54.707' AS DateTime))
GO
INSERT [dbo].[USUARIO] ([IdUser], [Username], [Pass], [CreatedAt]) VALUES (1006, N'caro.rotaw11@gmail.com', 0x020000001780CFE4D9E8991E238295FED6BE20DB102D6EE489DDA0F7B2A027DEFF744A10, CAST(N'2023-03-11T16:00:11.523' AS DateTime))
GO
INSERT [dbo].[USUARIO] ([IdUser], [Username], [Pass], [CreatedAt]) VALUES (1007, N'david.castano@gmail.com', 0x02000000168794ECE72CC091FDFF03EF263BE0B0DDFE73F2EACDB4D3489F30A86E4D0188, CAST(N'2023-03-11T20:40:40.327' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
/****** Object:  StoredProcedure [dbo].[spDeletePerson]    Script Date: 13/03/2023 4:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spDeletePerson](@IdPerson int)
AS
declare @OldEmail varchar(MAX)
Begin
	set @OldEmail=(SELECT Email FROM PERSONAS WHERE IdPerson = @IdPerson)
	DELETE FROM PERSONAS WHERE IdPerson = @IdPerson
	if exists(Select * FROM USUARIO WHERE Username = @OldEmail)
	BEGIN
		DELETE FROM USUARIO WHERE Username = @OldEmail
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteUser]    Script Date: 13/03/2023 4:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spDeleteUser](@IdUser int)
AS
Begin
	DELETE FROM USUARIO WHERE IdUser = @IdUser
END
GO
/****** Object:  StoredProcedure [dbo].[spEditPerson]    Script Date: 13/03/2023 4:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spEditPerson](@IdPerson int, @Names varchar(100), @Lastnames varchar(100), @DNI int, @Email varchar(100), @DNIType varchar(100))
AS
declare @OldEmail varchar(MAX)
Begin
	set @OldEmail=(SELECT Email FROM PERSONAS WHERE IdPerson = @IdPerson)
	UPDATE PERSONAS
	SET Names = @Names, Lastnames = @Lastnames, DNI = @DNI, Email = @Email, DNIType = @DNIType
	WHERE IdPerson = @IdPerson;
	if exists(Select * FROM USUARIO WHERE Username = @OldEmail)
	BEGIN
		UPDATE USUARIO
		SET Username = @Email
		WHERE Username = @OldEmail;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spEditUser]    Script Date: 13/03/2023 4:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEditUser](@IdUser int, @Password varchar(100))
AS
BEGIN
	UPDATE USUARIO
	SET Pass = ENCRYPTBYPASSPHRASE('password', @Password)
	WHERE IdUser = @IdUser
END
GO
/****** Object:  StoredProcedure [dbo].[spGetPeople]    Script Date: 13/03/2023 4:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetPeople]

AS 
	SET NOCOUNT ON;
	SELECT * 
	FROM DOUBLEVPARTNERS.dbo.PERSONAS
GO
/****** Object:  StoredProcedure [dbo].[spGetPeopleWithoutUser]    Script Date: 13/03/2023 4:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetPeopleWithoutUser]
AS 
BEGIN
	SELECT FullDNI, FullName, Email
	FROM PERSONAS AS p
	LEFT JOIN USUARIO AS u ON p.Email = u.Username
	WHERE u.Username IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[spGetPerson]    Script Date: 13/03/2023 4:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spGetPerson](@IdPerson int)
AS
BEGIN
	SELECT * FROM DOUBLEVPARTNERS.dbo.PERSONAS WHERE IdPerson = @IdPerson
END
GO
/****** Object:  StoredProcedure [dbo].[spGetUser]    Script Date: 13/03/2023 4:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetUser](@IdUser int)
AS 
BEGIN
	SELECT IdUser, Username, CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('password', Pass)) AS Pass, CreatedAt
	FROM USUARIO
	WHERE IdUser = @IdUser
END
GO
/****** Object:  StoredProcedure [dbo].[spGetUsers]    Script Date: 13/03/2023 4:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetUsers]
AS
Begin
	Select u.IdUser, u.Username, CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('password', u.Pass)) AS Pass, u.CreatedAt, p.FullName, p.FullDNI
	FROM DOUBLEVPARTNERS.dbo.USUARIO as u
	INNER JOIN DOUBLEVPARTNERS.dbo.PERSONAS as p ON u.Username = p.Email
END
GO
/****** Object:  StoredProcedure [dbo].[spSavePerson]    Script Date: 13/03/2023 4:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spSavePerson](@Names varchar(100), @Lastnames varchar(100), @DNI int, @Email varchar(100), @DNIType varchar(100))
AS
Begin
	INSERT into PERSONAS (Names, Lastnames, DNI, Email, DNIType, CreatedAt)
	VALUES(@Names, @Lastnames, @DNI, @Email, @DNIType, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[spSaveUser]    Script Date: 13/03/2023 4:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spSaveUser](@Username varchar(100), @Password varchar(100))
AS
Begin
	INSERT into usuario (Username, Pass, CreatedAt)
	VALUES(@Username, ENCRYPTBYPASSPHRASE('password', @Password), GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[spValidLogin]    Script Date: 13/03/2023 4:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spValidLogin](@Username varchar(100), @Pass varchar(100))
AS
declare @password varchar(MAX)
if exists(SELECT TOP 1 Username, Pass FROM DOUBLEVPARTNERS.dbo.USUARIO WHERE  Username = @Username)
BEGIN
	SET @password=(SELECT CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('password', Pass)) FROM DOUBLEVPARTNERS.dbo.USUARIO WHERE  Username = @Username)
	if(@Pass = @password)
	BEGIN 
		SELECT 1 AS access
	END
	else 
		SELECT 0 AS access
END
else 
	SELECT 0 AS access
GO
USE [master]
GO
ALTER DATABASE [DOUBLEVPARTNERS] SET  READ_WRITE 
GO
