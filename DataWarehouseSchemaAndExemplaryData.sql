USE [master]
GO
/****** Object:  Database [BoldSystemDW]    Script Date: 04-12-2021 15:29:49 ******/
CREATE DATABASE [BoldSystemDW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BoldSystemDW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BoldSystemDW.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BoldSystemDW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BoldSystemDW_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BoldSystemDW] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BoldSystemDW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BoldSystemDW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BoldSystemDW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BoldSystemDW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BoldSystemDW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BoldSystemDW] SET ARITHABORT OFF 
GO
ALTER DATABASE [BoldSystemDW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BoldSystemDW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BoldSystemDW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BoldSystemDW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BoldSystemDW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BoldSystemDW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BoldSystemDW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BoldSystemDW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BoldSystemDW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BoldSystemDW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BoldSystemDW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BoldSystemDW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BoldSystemDW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BoldSystemDW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BoldSystemDW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BoldSystemDW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BoldSystemDW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BoldSystemDW] SET RECOVERY FULL 
GO
ALTER DATABASE [BoldSystemDW] SET  MULTI_USER 
GO
ALTER DATABASE [BoldSystemDW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BoldSystemDW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BoldSystemDW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BoldSystemDW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BoldSystemDW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BoldSystemDW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BoldSystemDW', N'ON'
GO
ALTER DATABASE [BoldSystemDW] SET QUERY_STORE = OFF
GO
USE [BoldSystemDW]
GO
/****** Object:  Table [dbo].[Awarie]    Script Date: 04-12-2021 15:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Awarie](
	[ID_Awarii] [int] IDENTITY(1,1) NOT NULL,
	[Krytycznosc] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Awarii] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Czas]    Script Date: 04-12-2021 15:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Czas](
	[ID_Czasu] [int] IDENTITY(1,1) NOT NULL,
	[Godzina] [int] NULL,
	[Minuta] [int] NULL,
	[Pora_dnia] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Czasu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Data_przegladu]    Script Date: 04-12-2021 15:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data_przegladu](
	[ID_Datt] [int] IDENTITY(1,1) NOT NULL,
	[Dzien] [varchar](2) NULL,
	[Miesiac] [varchar](15) NULL,
	[Rok] [varchar](4) NULL,
	[Pora_roku] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Datt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Koordynatorzy]    Script Date: 04-12-2021 15:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Koordynatorzy](
	[ID_Koordynatora] [int] IDENTITY(1,1) NOT NULL,
	[Numer_paszportu] [varchar](44) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Koordynatora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LiniaLotnicza]    Script Date: 04-12-2021 15:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiniaLotnicza](
	[ID_Linii_Lotniczej] [int] IDENTITY(1,1) NOT NULL,
	[Kod_Linii_IATA] [varchar](4) NULL,
	[Nazwa] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Linii_Lotniczej] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrzegladySamolotow]    Script Date: 04-12-2021 15:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrzegladySamolotow](
	[Data_Rozpoczecia_Przegladu] [int] NULL,
	[Czas_Rozpoczecia_Przegladu] [int] NULL,
	[ID_Awarii] [int] NULL,
	[ID_Samolotu] [int] NULL,
	[ID_Zespolu] [int] NULL,
	[ID_Warunkow_Pogodowych] [int] NULL,
	[ID_Koordynatora] [int] NULL,
	[CzasTrwaniaPrzegladu] [int] NULL,
	[Opoznienie] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Samoloty]    Script Date: 04-12-2021 15:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Samoloty](
	[ID_Samolotu] [int] IDENTITY(1,1) NOT NULL,
	[Model] [varchar](60) NULL,
	[Wiek] [varchar](30) NULL,
	[ID_Linii_Lotniczej] [int] NULL,
	[Rodzaj_Samolotu] [varchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Samolotu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warunki_Pogodowe]    Script Date: 04-12-2021 15:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warunki_Pogodowe](
	[ID_Warunkow_Pogodowych] [int] IDENTITY(1,1) NOT NULL,
	[Temperatura] [varchar](50) NULL,
	[Predkosc_Wiatru] [varchar](50) NULL,
	[Czy_Opady] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Warunkow_Pogodowych] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zespoly]    Script Date: 04-12-2021 15:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zespoly](
	[ID_Zespolu] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa_Zespolu] [varchar](100) NULL,
	[Ilosc_Czlonkow] [varchar](50) NULL,
	[Ilosc_Stazystow] [varchar](100) NULL,
	[Data_Wstawienia] [date] NULL,
	[Data_Aktualizacji] [date] NULL,
	[Aktualnosc] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Zespolu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Awarie] ON 

INSERT [dbo].[Awarie] ([ID_Awarii], [Krytycznosc]) VALUES (1, N'Brak Awarii')
INSERT [dbo].[Awarie] ([ID_Awarii], [Krytycznosc]) VALUES (2, N'Mała Awaria')
INSERT [dbo].[Awarie] ([ID_Awarii], [Krytycznosc]) VALUES (3, N'Średnia Awaria')
INSERT [dbo].[Awarie] ([ID_Awarii], [Krytycznosc]) VALUES (4, N'Duża Awaria')
SET IDENTITY_INSERT [dbo].[Awarie] OFF
GO
SET IDENTITY_INSERT [dbo].[Czas] ON 

INSERT [dbo].[Czas] ([ID_Czasu], [Godzina], [Minuta], [Pora_dnia]) VALUES (1, 10, 10, N'Pomiędzy 8 a 12')
INSERT [dbo].[Czas] ([ID_Czasu], [Godzina], [Minuta], [Pora_dnia]) VALUES (2, 12, 35, N'Pomiędzy 12 a 16')
INSERT [dbo].[Czas] ([ID_Czasu], [Godzina], [Minuta], [Pora_dnia]) VALUES (3, 20, 41, N'Pomiędzy 20 a 24')
SET IDENTITY_INSERT [dbo].[Czas] OFF
GO
SET IDENTITY_INSERT [dbo].[Data_przegladu] ON 

INSERT [dbo].[Data_przegladu] ([ID_Datt], [Dzien], [Miesiac], [Rok], [Pora_roku]) VALUES (1, N'10', N'1', N'2021', N'Zima')
INSERT [dbo].[Data_przegladu] ([ID_Datt], [Dzien], [Miesiac], [Rok], [Pora_roku]) VALUES (2, N'11', N'1', N'2021', N'Zima')
INSERT [dbo].[Data_przegladu] ([ID_Datt], [Dzien], [Miesiac], [Rok], [Pora_roku]) VALUES (3, N'12', N'1', N'2021', N'Zima')
SET IDENTITY_INSERT [dbo].[Data_przegladu] OFF
GO
SET IDENTITY_INSERT [dbo].[Koordynatorzy] ON 

INSERT [dbo].[Koordynatorzy] ([ID_Koordynatora], [Numer_paszportu]) VALUES (1, N'NumerPaszportu1')
INSERT [dbo].[Koordynatorzy] ([ID_Koordynatora], [Numer_paszportu]) VALUES (2, N'NumerPaszportu2')
INSERT [dbo].[Koordynatorzy] ([ID_Koordynatora], [Numer_paszportu]) VALUES (3, N'NumerPaszportu3')
SET IDENTITY_INSERT [dbo].[Koordynatorzy] OFF
GO
SET IDENTITY_INSERT [dbo].[LiniaLotnicza] ON 

INSERT [dbo].[LiniaLotnicza] ([ID_Linii_Lotniczej], [Kod_Linii_IATA], [Nazwa]) VALUES (1, N'AAAA', N'NazwaLinii1')
INSERT [dbo].[LiniaLotnicza] ([ID_Linii_Lotniczej], [Kod_Linii_IATA], [Nazwa]) VALUES (2, N'AAAB', N'NazwaLinii2')
INSERT [dbo].[LiniaLotnicza] ([ID_Linii_Lotniczej], [Kod_Linii_IATA], [Nazwa]) VALUES (3, N'AAAC', N'NazwaLinii3')
SET IDENTITY_INSERT [dbo].[LiniaLotnicza] OFF
GO
INSERT [dbo].[PrzegladySamolotow] ([Data_Rozpoczecia_Przegladu], [Czas_Rozpoczecia_Przegladu], [ID_Awarii], [ID_Samolotu], [ID_Zespolu], [ID_Warunkow_Pogodowych], [ID_Koordynatora], [CzasTrwaniaPrzegladu], [Opoznienie]) VALUES (1, 1, 3, 2, 1, 3, 2, 200, 10)
INSERT [dbo].[PrzegladySamolotow] ([Data_Rozpoczecia_Przegladu], [Czas_Rozpoczecia_Przegladu], [ID_Awarii], [ID_Samolotu], [ID_Zespolu], [ID_Warunkow_Pogodowych], [ID_Koordynatora], [CzasTrwaniaPrzegladu], [Opoznienie]) VALUES (3, 2, 1, 3, 2, 1, 1, 400, 50)
INSERT [dbo].[PrzegladySamolotow] ([Data_Rozpoczecia_Przegladu], [Czas_Rozpoczecia_Przegladu], [ID_Awarii], [ID_Samolotu], [ID_Zespolu], [ID_Warunkow_Pogodowych], [ID_Koordynatora], [CzasTrwaniaPrzegladu], [Opoznienie]) VALUES (1, 1, 2, 3, 3, 2, 2, 100, 0)
GO
SET IDENTITY_INSERT [dbo].[Samoloty] ON 

INSERT [dbo].[Samoloty] ([ID_Samolotu], [Model], [Wiek], [ID_Linii_Lotniczej], [Rodzaj_Samolotu]) VALUES (1, N'Airbus5000', N'Nowy samolot', 1, N'Pasażerski')
INSERT [dbo].[Samoloty] ([ID_Samolotu], [Model], [Wiek], [ID_Linii_Lotniczej], [Rodzaj_Samolotu]) VALUES (2, N'Airbus5001', N'Nowy samolot', 1, N'Transportowy')
INSERT [dbo].[Samoloty] ([ID_Samolotu], [Model], [Wiek], [ID_Linii_Lotniczej], [Rodzaj_Samolotu]) VALUES (3, N'Airbus5003', N'Stary samolot', 3, N'Transportowy')
SET IDENTITY_INSERT [dbo].[Samoloty] OFF
GO
SET IDENTITY_INSERT [dbo].[Warunki_Pogodowe] ON 

INSERT [dbo].[Warunki_Pogodowe] ([ID_Warunkow_Pogodowych], [Temperatura], [Predkosc_Wiatru], [Czy_Opady]) VALUES (1, N'Niska temperatura', N'Mała prędkość wiatru', N'Brak opadów')
INSERT [dbo].[Warunki_Pogodowe] ([ID_Warunkow_Pogodowych], [Temperatura], [Predkosc_Wiatru], [Czy_Opady]) VALUES (2, N'Wysoka temperatura', N'Mała prędkość wiatru', N'Brak opadów')
INSERT [dbo].[Warunki_Pogodowe] ([ID_Warunkow_Pogodowych], [Temperatura], [Predkosc_Wiatru], [Czy_Opady]) VALUES (3, N'Wysoka temperatura', N'Duża prędkość wiatru', N'Opady wystąpiły')
SET IDENTITY_INSERT [dbo].[Warunki_Pogodowe] OFF
GO
SET IDENTITY_INSERT [dbo].[Zespoly] ON 

INSERT [dbo].[Zespoly] ([ID_Zespolu], [Nazwa_Zespolu], [Ilosc_Czlonkow], [Ilosc_Stazystow], [Data_Wstawienia], [Data_Aktualizacji], [Aktualnosc]) VALUES (1, N'NazwaZespolu1', N'Mniej niż 5 członków zespołu', N'Pomiędzy 5 a 10 stażystów w zespole', CAST(N'2021-01-01' AS Date), CAST(N'2021-01-01' AS Date), 1)
INSERT [dbo].[Zespoly] ([ID_Zespolu], [Nazwa_Zespolu], [Ilosc_Czlonkow], [Ilosc_Stazystow], [Data_Wstawienia], [Data_Aktualizacji], [Aktualnosc]) VALUES (2, N'NazwaZespolu2', N'Więcej niż 10 członków zespołu', N'Pomiędzy 5 a 10 stażystów w zespole', CAST(N'2021-01-02' AS Date), CAST(N'2021-01-03' AS Date), 0)
INSERT [dbo].[Zespoly] ([ID_Zespolu], [Nazwa_Zespolu], [Ilosc_Czlonkow], [Ilosc_Stazystow], [Data_Wstawienia], [Data_Aktualizacji], [Aktualnosc]) VALUES (3, N'NazwaZespolu2', N'Więcej niż 10 członków zespołu', N'Więcej niż 10 stażystów w zespole', CAST(N'2021-01-03' AS Date), CAST(N'2021-01-03' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Zespoly] OFF
GO
ALTER TABLE [dbo].[PrzegladySamolotow]  WITH CHECK ADD FOREIGN KEY([Czas_Rozpoczecia_Przegladu])
REFERENCES [dbo].[Czas] ([ID_Czasu])
GO
ALTER TABLE [dbo].[PrzegladySamolotow]  WITH CHECK ADD FOREIGN KEY([Data_Rozpoczecia_Przegladu])
REFERENCES [dbo].[Data_przegladu] ([ID_Datt])
GO
ALTER TABLE [dbo].[PrzegladySamolotow]  WITH CHECK ADD FOREIGN KEY([ID_Awarii])
REFERENCES [dbo].[Awarie] ([ID_Awarii])
GO
ALTER TABLE [dbo].[PrzegladySamolotow]  WITH CHECK ADD FOREIGN KEY([ID_Koordynatora])
REFERENCES [dbo].[Koordynatorzy] ([ID_Koordynatora])
GO
ALTER TABLE [dbo].[PrzegladySamolotow]  WITH CHECK ADD FOREIGN KEY([ID_Samolotu])
REFERENCES [dbo].[Samoloty] ([ID_Samolotu])
GO
ALTER TABLE [dbo].[PrzegladySamolotow]  WITH CHECK ADD FOREIGN KEY([ID_Warunkow_Pogodowych])
REFERENCES [dbo].[Warunki_Pogodowe] ([ID_Warunkow_Pogodowych])
GO
ALTER TABLE [dbo].[PrzegladySamolotow]  WITH CHECK ADD FOREIGN KEY([ID_Zespolu])
REFERENCES [dbo].[Zespoly] ([ID_Zespolu])
GO
ALTER TABLE [dbo].[Samoloty]  WITH CHECK ADD FOREIGN KEY([ID_Linii_Lotniczej])
REFERENCES [dbo].[LiniaLotnicza] ([ID_Linii_Lotniczej])
GO
USE [master]
GO
ALTER DATABASE [BoldSystemDW] SET  READ_WRITE 
GO
