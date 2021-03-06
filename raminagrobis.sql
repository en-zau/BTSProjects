USE [master]
GO
/****** Object:  Database [raminagrobis]    Script Date: 06/02/2022 23:55:02 ******/
CREATE DATABASE [raminagrobis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'raminagrobis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\raminagrobis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'raminagrobis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\raminagrobis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [raminagrobis] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [raminagrobis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [raminagrobis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [raminagrobis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [raminagrobis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [raminagrobis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [raminagrobis] SET ARITHABORT OFF 
GO
ALTER DATABASE [raminagrobis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [raminagrobis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [raminagrobis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [raminagrobis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [raminagrobis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [raminagrobis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [raminagrobis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [raminagrobis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [raminagrobis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [raminagrobis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [raminagrobis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [raminagrobis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [raminagrobis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [raminagrobis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [raminagrobis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [raminagrobis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [raminagrobis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [raminagrobis] SET RECOVERY FULL 
GO
ALTER DATABASE [raminagrobis] SET  MULTI_USER 
GO
ALTER DATABASE [raminagrobis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [raminagrobis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [raminagrobis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [raminagrobis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [raminagrobis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [raminagrobis] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'raminagrobis', N'ON'
GO
ALTER DATABASE [raminagrobis] SET QUERY_STORE = OFF
GO
USE [raminagrobis]
GO
/****** Object:  Table [dbo].[adherents]    Script Date: 06/02/2022 23:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adherents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[societe] [nvarchar](50) NOT NULL,
	[nom] [nvarchar](50) NOT NULL,
	[prenom] [nvarchar](50) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[addresse] [nvarchar](255) NOT NULL,
	[status] [bit] NULL,
	[dateadhesion] [date] NOT NULL,
 CONSTRAINT [PK_adherents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fournisseurs]    Script Date: 06/02/2022 23:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fournisseurs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[societe] [nvarchar](50) NOT NULL,
	[nom] [nvarchar](50) NOT NULL,
	[prenom] [nvarchar](50) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[status] [bit] NULL,
	[addresse] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_fournisseurs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fournisseurs_references]    Script Date: 06/02/2022 23:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fournisseurs_references](
	[id_fournisseurs] [int] NOT NULL,
	[id_references] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[panier_adherent_detail]    Script Date: 06/02/2022 23:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[panier_adherent_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantite] [int] NOT NULL,
	[id_references] [int] NOT NULL,
	[id_panier_adherents] [int] NOT NULL,
 CONSTRAINT [PK_panier_adherent_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[panier_adherents]    Script Date: 06/02/2022 23:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[panier_adherents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_adherent] [int] NOT NULL,
	[id_panier_global] [int] NOT NULL,
 CONSTRAINT [PK_panier_adherents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[panier_fournisseurs]    Script Date: 06/02/2022 23:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[panier_fournisseurs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[puht] [float] NULL,
	[id_panier_global_detail] [int] NOT NULL,
	[id_fournisseurs] [int] NOT NULL,
 CONSTRAINT [PK_panier_fournisseurs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[panier_global]    Script Date: 06/02/2022 23:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[panier_global](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[semaine] [int] NOT NULL,
 CONSTRAINT [PK_panier_global] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[panier_global_detail]    Script Date: 06/02/2022 23:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[panier_global_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_reference] [int] NOT NULL,
	[quantite] [int] NOT NULL,
	[id_panier_global] [int] NOT NULL,
 CONSTRAINT [PK_panier_global_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[references]    Script Date: 06/02/2022 23:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[references](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reference] [nvarchar](50) NOT NULL,
	[libelle] [nvarchar](50) NOT NULL,
	[marque] [nvarchar](50) NOT NULL,
	[id_fournisseurs] [int] NOT NULL,
	[desactive] [bit] NULL,
 CONSTRAINT [PK_references] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[fournisseurs_references]  WITH CHECK ADD  CONSTRAINT [FK_fournisseurs_references_fournisseurs] FOREIGN KEY([id_fournisseurs])
REFERENCES [dbo].[fournisseurs] ([id])
GO
ALTER TABLE [dbo].[fournisseurs_references] CHECK CONSTRAINT [FK_fournisseurs_references_fournisseurs]
GO
ALTER TABLE [dbo].[fournisseurs_references]  WITH CHECK ADD  CONSTRAINT [FK_fournisseurs_references_references] FOREIGN KEY([id_references])
REFERENCES [dbo].[references] ([id])
GO
ALTER TABLE [dbo].[fournisseurs_references] CHECK CONSTRAINT [FK_fournisseurs_references_references]
GO
ALTER TABLE [dbo].[panier_adherent_detail]  WITH CHECK ADD  CONSTRAINT [FK_panier_adherent_detail_panier_adherents1] FOREIGN KEY([id_panier_adherents])
REFERENCES [dbo].[panier_adherents] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[panier_adherent_detail] CHECK CONSTRAINT [FK_panier_adherent_detail_panier_adherents1]
GO
ALTER TABLE [dbo].[panier_adherent_detail]  WITH CHECK ADD  CONSTRAINT [FK_panier_adherent_detail_references] FOREIGN KEY([id_references])
REFERENCES [dbo].[references] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[panier_adherent_detail] CHECK CONSTRAINT [FK_panier_adherent_detail_references]
GO
ALTER TABLE [dbo].[panier_adherents]  WITH CHECK ADD  CONSTRAINT [FK_panier_adherents_adherents] FOREIGN KEY([id_adherent])
REFERENCES [dbo].[adherents] ([id])
GO
ALTER TABLE [dbo].[panier_adherents] CHECK CONSTRAINT [FK_panier_adherents_adherents]
GO
ALTER TABLE [dbo].[panier_adherents]  WITH CHECK ADD  CONSTRAINT [FK_panier_adherents_panier_global] FOREIGN KEY([id_panier_global])
REFERENCES [dbo].[panier_global] ([id])
GO
ALTER TABLE [dbo].[panier_adherents] CHECK CONSTRAINT [FK_panier_adherents_panier_global]
GO
ALTER TABLE [dbo].[panier_fournisseurs]  WITH CHECK ADD  CONSTRAINT [FK_panier_fournisseurs_fournisseurs] FOREIGN KEY([id_fournisseurs])
REFERENCES [dbo].[fournisseurs] ([id])
GO
ALTER TABLE [dbo].[panier_fournisseurs] CHECK CONSTRAINT [FK_panier_fournisseurs_fournisseurs]
GO
ALTER TABLE [dbo].[panier_fournisseurs]  WITH CHECK ADD  CONSTRAINT [FK_panier_fournisseurs_panier_global_detail1] FOREIGN KEY([id_panier_global_detail])
REFERENCES [dbo].[panier_global_detail] ([id])
GO
ALTER TABLE [dbo].[panier_fournisseurs] CHECK CONSTRAINT [FK_panier_fournisseurs_panier_global_detail1]
GO
ALTER TABLE [dbo].[panier_global_detail]  WITH CHECK ADD  CONSTRAINT [FK_panier_global_detail_panier_global] FOREIGN KEY([id_panier_global])
REFERENCES [dbo].[panier_global] ([id])
GO
ALTER TABLE [dbo].[panier_global_detail] CHECK CONSTRAINT [FK_panier_global_detail_panier_global]
GO
ALTER TABLE [dbo].[panier_global_detail]  WITH CHECK ADD  CONSTRAINT [FK_panier_global_detail_references] FOREIGN KEY([id_reference])
REFERENCES [dbo].[references] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[panier_global_detail] CHECK CONSTRAINT [FK_panier_global_detail_references]
GO
USE [master]
GO
ALTER DATABASE [raminagrobis] SET  READ_WRITE 
GO
