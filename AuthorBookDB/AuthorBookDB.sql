USE [master]
GO
/****** Object:  Database [AuthorBook]    Script Date: 10/3/2022 1:36:46 AM ******/
CREATE DATABASE [AuthorBook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AuthorBook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AuthorBook.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AuthorBook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AuthorBook_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AuthorBook] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AuthorBook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AuthorBook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AuthorBook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AuthorBook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AuthorBook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AuthorBook] SET ARITHABORT OFF 
GO
ALTER DATABASE [AuthorBook] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AuthorBook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AuthorBook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AuthorBook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AuthorBook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AuthorBook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AuthorBook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AuthorBook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AuthorBook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AuthorBook] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AuthorBook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AuthorBook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AuthorBook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AuthorBook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AuthorBook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AuthorBook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AuthorBook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AuthorBook] SET RECOVERY FULL 
GO
ALTER DATABASE [AuthorBook] SET  MULTI_USER 
GO
ALTER DATABASE [AuthorBook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AuthorBook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AuthorBook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AuthorBook] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AuthorBook] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AuthorBook', N'ON'
GO
USE [AuthorBook]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 10/3/2022 1:36:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](256) NULL,
	[BookID] [int] NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Book]    Script Date: 10/3/2022 1:36:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [nvarchar](256) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Author]  WITH CHECK ADD  CONSTRAINT [FK_Author_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Author] CHECK CONSTRAINT [FK_Author_Book]
GO
/****** Object:  StoredProcedure [dbo].[AddAuthorBook]    Script Date: 10/3/2022 1:36:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddAuthorBook]
	-- Add the parameters for the stored procedure here
	@AuthorName nvarchar(256),
	@BookID nvarchar(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    insert into Author values 
	(@AuthorName, @BookID)
END

GO
/****** Object:  StoredProcedure [dbo].[AddBook]    Script Date: 10/3/2022 1:36:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddBook]
	-- Add the parameters for the stored procedure here
	@BookName nvarchar(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     insert into Book values 
	( @BookName)
END

GO
/****** Object:  StoredProcedure [dbo].[GetAuthorBooks]    Script Date: 10/3/2022 1:36:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAuthorBooks]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT AuthorName, B.BookName from dbo.Author A
	inner join book B on B.BookID = A.BookID 
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetBookData]    Script Date: 10/3/2022 1:36:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBookData]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select BookID, BookName from Book 

END

GO
USE [master]
GO
ALTER DATABASE [AuthorBook] SET  READ_WRITE 
GO
