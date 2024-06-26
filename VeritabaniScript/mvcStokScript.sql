USE [master]
GO
/****** Object:  Database [MvcDbStok]    Script Date: 19.04.2024 08:51:03 ******/
CREATE DATABASE [MvcDbStok]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MvcDbStok', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MvcDbStok.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MvcDbStok_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MvcDbStok_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MvcDbStok] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MvcDbStok].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MvcDbStok] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MvcDbStok] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MvcDbStok] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MvcDbStok] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MvcDbStok] SET ARITHABORT OFF 
GO
ALTER DATABASE [MvcDbStok] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MvcDbStok] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MvcDbStok] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MvcDbStok] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MvcDbStok] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MvcDbStok] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MvcDbStok] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MvcDbStok] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MvcDbStok] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MvcDbStok] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MvcDbStok] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MvcDbStok] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MvcDbStok] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MvcDbStok] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MvcDbStok] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MvcDbStok] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MvcDbStok] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MvcDbStok] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MvcDbStok] SET  MULTI_USER 
GO
ALTER DATABASE [MvcDbStok] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MvcDbStok] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MvcDbStok] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MvcDbStok] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MvcDbStok] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MvcDbStok]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 19.04.2024 08:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAd] [varchar](50) NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 19.04.2024 08:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Musteriler](
	[MusteriId] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NULL,
	[Soyad] [varchar](50) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Satislar]    Script Date: 19.04.2024 08:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satislar](
	[SatisId] [int] IDENTITY(1,1) NOT NULL,
	[UrunId] [int] NULL,
	[MusteriId] [int] NULL,
	[Adet] [tinyint] NULL,
	[Fiyat] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Satislar] PRIMARY KEY CLUSTERED 
(
	[SatisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 19.04.2024 08:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Urunler](
	[UrunId] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NULL,
	[Marka] [varchar](50) NULL,
	[KategoriId] [int] NULL,
	[Fiyat] [decimal](18, 2) NULL,
	[Stok] [tinyint] NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAd]) VALUES (1, N'Beyaz Eşya')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAd]) VALUES (2, N'Küçük Ev Aletleri')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAd]) VALUES (4, N'Mobilya')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAd]) VALUES (6, N'Elektronik')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAd]) VALUES (8, N'Mobilya')
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
SET IDENTITY_INSERT [dbo].[Musteriler] ON 

INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Durum]) VALUES (1, N'Tuğba', N'Çiftçi', 1)
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Durum]) VALUES (2, N'Helin', N'Demir', 1)
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Durum]) VALUES (3, N'Adil', N'Altıntaş', 1)
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Durum]) VALUES (4, N'Ahmet', N'Altıntaş', 1)
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Durum]) VALUES (5, N'Serra', N'Demirbaga', 1)
SET IDENTITY_INSERT [dbo].[Musteriler] OFF
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([UrunId], [Ad], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (1, N'Çamaşır Makinesi', N'Beko', 1, CAST(20000.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[Urunler] ([UrunId], [Ad], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (2, N'Ütü', N'Phlips', 2, CAST(1000.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Urunler] ([UrunId], [Ad], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (3, N'Masa', N'Bellona', 4, CAST(1500.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Urunler] ([UrunId], [Ad], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (4, N'Buzdolabı', N'Arçelik', 1, CAST(35000.00 AS Decimal(18, 2)), 15)
SET IDENTITY_INSERT [dbo].[Urunler] OFF
ALTER TABLE [dbo].[Satislar]  WITH CHECK ADD  CONSTRAINT [FK_Satislar_Musteriler] FOREIGN KEY([MusteriId])
REFERENCES [dbo].[Musteriler] ([MusteriId])
GO
ALTER TABLE [dbo].[Satislar] CHECK CONSTRAINT [FK_Satislar_Musteriler]
GO
ALTER TABLE [dbo].[Satislar]  WITH CHECK ADD  CONSTRAINT [FK_Satislar_Urunler] FOREIGN KEY([UrunId])
REFERENCES [dbo].[Urunler] ([UrunId])
GO
ALTER TABLE [dbo].[Satislar] CHECK CONSTRAINT [FK_Satislar_Urunler]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Kategoriler] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategoriler] ([KategoriId])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Kategoriler]
GO
USE [master]
GO
ALTER DATABASE [MvcDbStok] SET  READ_WRITE 
GO
