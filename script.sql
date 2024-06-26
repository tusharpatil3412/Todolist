USE [master]
GO
/****** Object:  Database [TodoDB]    Script Date: 24-05-2024 11:11:09 ******/
CREATE DATABASE [TodoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TodoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TodoDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TodoDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TodoDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TodoDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TodoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TodoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TodoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TodoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TodoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TodoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TodoDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TodoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TodoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TodoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TodoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TodoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TodoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TodoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TodoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TodoDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TodoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TodoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TodoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TodoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TodoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TodoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TodoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TodoDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TodoDB] SET  MULTI_USER 
GO
ALTER DATABASE [TodoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TodoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TodoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TodoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TodoDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TodoDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TodoDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [TodoDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TodoDB]
GO
/****** Object:  Table [dbo].[Todo]    Script Date: 24-05-2024 11:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Todo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](20) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[status] [varchar](10) NULL,
	[userid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24-05-2024 11:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[mail] [varchar](30) NOT NULL,
	[password] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Todo] ON 

INSERT [dbo].[Todo] ([id], [title], [description], [status], [userid]) VALUES (1, N'first', N'dis', N'sta', 1)
INSERT [dbo].[Todo] ([id], [title], [description], [status], [userid]) VALUES (2, N'string', N'string', N'string', 4)
INSERT [dbo].[Todo] ([id], [title], [description], [status], [userid]) VALUES (3, N'withid', N'asfhbgakjshakjh', N'Open', 0)
INSERT [dbo].[Todo] ([id], [title], [description], [status], [userid]) VALUES (4, N'SXCZ', N'zxcvzx', N'Testing', 0)
INSERT [dbo].[Todo] ([id], [title], [description], [status], [userid]) VALUES (6, N'xvcz', N'zxcz', N'Progress', 0)
INSERT [dbo].[Todo] ([id], [title], [description], [status], [userid]) VALUES (20, N'no', N'fhbdxf', N'Open', 6)
INSERT [dbo].[Todo] ([id], [title], [description], [status], [userid]) VALUES (22, N'item1', N'', N'Done', 6)
INSERT [dbo].[Todo] ([id], [title], [description], [status], [userid]) VALUES (23, N'item2', N'akjehfdjg', N'Done', 6)
INSERT [dbo].[Todo] ([id], [title], [description], [status], [userid]) VALUES (24, N'kkkkkkkk', N'kkkkkkkk', N'Progress', 6)
INSERT [dbo].[Todo] ([id], [title], [description], [status], [userid]) VALUES (25, N'item1', N'', N'Open', 5)
INSERT [dbo].[Todo] ([id], [title], [description], [status], [userid]) VALUES (26, N'item2', N'tuhskjbnb kkuhsdfhakjbh idsufgkaejfbgk  uaukjfghbkaj   aurhf kjbk kjfghkjabvkbkgvhkjehgjkb asdfvbkrh', N'Open', 5)
INSERT [dbo].[Todo] ([id], [title], [description], [status], [userid]) VALUES (27, N'item3', N'dtfghfdjdf', N'Testing', 6)
INSERT [dbo].[Todo] ([id], [title], [description], [status], [userid]) VALUES (1025, N'cfgbnhc', N'xvbx', N'Progress', 6)
SET IDENTITY_INSERT [dbo].[Todo] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [name], [mail], [password]) VALUES (3, N'nasm', N'fsdgj', N'asdg')
INSERT [dbo].[Users] ([id], [name], [mail], [password]) VALUES (4, N'string', N'string', N'string')
INSERT [dbo].[Users] ([id], [name], [mail], [password]) VALUES (5, N'ias@patil', N'Tushar', N'Rbis')
INSERT [dbo].[Users] ([id], [name], [mail], [password]) VALUES (6, N'Tushar', N'rahul', N'Rbis')
INSERT [dbo].[Users] ([id], [name], [mail], [password]) VALUES (7, N'rahul', N'okkk', N'Rbis')
INSERT [dbo].[Users] ([id], [name], [mail], [password]) VALUES (8, N'imam', N'imams', N'imams')
INSERT [dbo].[Users] ([id], [name], [mail], [password]) VALUES (9, N'st', N's', N'pss')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__7A21290439D3BAC0]    Script Date: 24-05-2024 11:11:10 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AllUsers]    Script Date: 24-05-2024 11:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AllUsers]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Users
END
GO
/****** Object:  StoredProcedure [dbo].[checkcredential]    Script Date: 24-05-2024 11:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[checkcredential] 
	-- Add the parameters for the stored procedure here
	@Mail varchar(50) , 
	@Password varchar(50),
	@Result int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;
	SET @Result=0;
	IF EXISTS( SELECT * FROM Users WHERE mail=@Mail AND password=@Password)
	BEGIN
	SELECT id,name,mail FROM Users WHERE mail=@Mail AND password=@Password
	SET @Result=1;
	END
	RETURN @Result;
END
GO
/****** Object:  StoredProcedure [dbo].[createtodo]    Script Date: 24-05-2024 11:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[createtodo] 
	-- Add the parameters for the stored procedure here
	 @Title varchar(10),
	 @Discreiption varchar(100),
	 @Status varchar(10),
	 @UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into Todo (title,description,status,userid)
	values(@Title,@Discreiption,@Status,@UserId)
END
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 24-05-2024 11:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateUser] 
	@Name varchar(30),
	@Mail varchar(30),
	@Password varchar(30),
	@Result int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS( SELECT * FROM Users WHERE mail=@Mail AND password=@Password)
	BEGIN
		Insert into Users(name,mail,password) values(@Name,@Mail,@Password)
	SET @Result= SCOPE_IDENTITY();
	END
	ELSE
	BEGIN
    -- Statements to execute if the condition is false
	SET @Result=0;
	END
	RETURN @Result;
    -- Insert statements for procedure here
	
END
GO
/****** Object:  StoredProcedure [dbo].[deletebyid]    Script Date: 24-05-2024 11:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deletebyid]
@Id int,
@Result int OUTPUT
AS
BEGIN

delete from Todo
where id=@Id
 IF @@ROWCOUNT > 0
        SET @Result = 1; -- Update was successful
    ELSE
        SET @Result = 0; -- No row was updated
END
GO
/****** Object:  StoredProcedure [dbo].[filterbystatus]    Script Date: 24-05-2024 11:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[filterbystatus] 
	@Status varchar(10),
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Todo where status=@Status and userid=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[Todobyid]    Script Date: 24-05-2024 11:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Todobyid] 
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	

    -- Insert statements for procedure here
	SELECT * from Todo where id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[updatetodo]    Script Date: 24-05-2024 11:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updatetodo] 
	 @Title varchar(10),
	 @Discreiption varchar(100),
	 @Status varchar(10),
	 @UserId int,
	 @Id int,
	 @Result int OUTPUT
AS
BEGIN
 -- Update the Todo record
    UPDATE [dbo].[Todo]
       SET [title] = @Title,
           [description] = @Discreiption,
           [status] = @Status,
           [userid] = @UserId
     WHERE id = @Id;

    -- Check if any row was updated
    IF @@ROWCOUNT > 0
        SET @Result = 1; -- Update was successful
    ELSE
        SET @Result = 0; -- No row was updated

END

GO
/****** Object:  StoredProcedure [dbo].[usersallTodo]    Script Date: 24-05-2024 11:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usersallTodo]
	@UserId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if Exists(select * from Todo where userid=@UserId)
	begin
		select * from Todo where userid=@UserId;
	end

END
GO
USE [master]
GO
ALTER DATABASE [TodoDB] SET  READ_WRITE 
GO
