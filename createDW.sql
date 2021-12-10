CREATE DATABASE BoldSystemDW
GO

USE BoldSystemDW
GO

DROP TABLE IF EXISTS PrzegladySamolotow;
DROP TABLE IF EXISTS Samoloty;
DROP TABLE IF EXISTS Koordynatorzy;
DROP TABLE IF EXISTS LiniaLotnicza;
DROP TABLE IF EXISTS Data_przegladu;
DROP TABLE IF EXISTS Czas;
DROP TABLE IF EXISTS Awarie;
DROP TABLE IF EXISTS Warunki_Pogodowe;
DROP TABLE IF EXISTS Zespoly;


CREATE TABLE Zespoly
(
	ID_Zespolu INTEGER IDENTITY(1,1) PRIMARY KEY,
	Nazwa_Zespolu Varchar(100),
	Ilosc_Czlonkow Varchar(50),
	Ilosc_Stazystow Varchar(100),
	Aktualnosc BIT,
)
GO

CREATE TABLE Warunki_Pogodowe
(
	ID_Warunkow_Pogodowych INTEGER IDENTITY(1,1) PRIMARY KEY,
	Temperatura Varchar(50),
	Predkosc_Wiatru Varchar(50),
	Czy_Opady Varchar(20),
)
GO

CREATE TABLE Awarie
(
	ID_Awarii INTEGER IDENTITY(1,1) PRIMARY KEY,
	Krytycznosc VARCHAR(15),
)
GO

CREATE TABLE Czas
(
	ID_Czasu INTEGER IDENTITY(1,1) PRIMARY KEY,
	Godzina INTEGER,
	Minuta INTEGER,
	Pora_dnia VARCHAR(20),
)
GO

CREATE TABLE Data_przegladu
(
	ID_Daty INTEGER IDENTITY(1,1) PRIMARY KEY,
	Dzien VARCHAR(2),
	Miesiac VARCHAR(15),
	Rok VARCHAR(4),
	Pora_roku VARCHAR(6),
)
GO


CREATE TABLE LiniaLotnicza
(
    ID_Linii_Lotniczej INTEGER IDENTITY(1,1) PRIMARY KEY,
	Kod_Linii_IATA VARCHAR(4),
	Nazwa varchar(50),
)
GO

CREATE TABLE Koordynatorzy
(
	ID_Koordynatora INTEGER IDENTITY(1,1) PRIMARY KEY,
	Numer_paszportu VARCHAR(44),
)
GO

CREATE TABLE Samoloty
(
	ID_Samolotu INTEGER IDENTITY(1,1) PRIMARY KEY,
	Model VARCHAR(60),
	Wiek VARCHAR(30),
	ID_Linii_Lotniczej INTEGER FOREIGN KEY REFERENCES LiniaLotnicza,
	Rodzaj_Samolotu VARCHAR(12)
)
GO

CREATE TABLE PrzegladySamolotow
(
	Data_Rozpoczecia_Przegladu INTEGER FOREIGN KEY REFERENCES Data_przegladu,
	Czas_Rozpoczecia_Przegladu INTEGER FOREIGN KEY REFERENCES Czas,
	ID_Awarii INTEGER FOREIGN KEY REFERENCES Awarie,
	ID_Samolotu INTEGER FOREIGN KEY REFERENCES Samoloty,
	ID_Zespolu INTEGER FOREIGN KEY REFERENCES Zespoly,
	ID_Warunkow_Pogodowych INTEGER FOREIGN KEY REFERENCES Warunki_Pogodowe,
	ID_Koordynatora INTEGER FOREIGN KEY REFERENCES Koordynatorzy,
	CzasTrwaniaPrzegladu INTEGER,
	Opoznienie INTEGER,
)