CREATE DATABASE BoldSystem
GO

USE BoldSystem
GO

DROP TABLE IF EXISTS PrzegladySamolotow;
DROP TABLE IF EXISTS Samoloty;
DROP TABLE IF EXISTS Koordynatorzy;
DROP TABLE IF EXISTS LiniaLotnicza;

CREATE TABLE LiniaLotnicza
(
    ID INTEGER IDENTITY(1,1) PRIMARY KEY,
	KodLiniiIATA varchar(4),
	Nazwa varchar(30),
)
GO

CREATE TABLE Koordynatorzy
(
	ID INTEGER IDENTITY(1,1) PRIMARY KEY,
	NumerPaszportu varchar(44),
)
GO

CREATE TABLE Samoloty
(
	ID INTEGER IDENTITY(1,1) PRIMARY KEY,
	ModelSamolotu varchar(60),
	RokProdukcji SMALLINT,
	RodzajSamolotu INTEGER,
	LiniaLotnicza INTEGER FOREIGN KEY REFERENCES LiniaLotnicza,
)
GO

CREATE TABLE PrzegladySamolotow
(
	ID INTEGER IDENTITY(1,1) PRIMARY KEY,
	CzasTrwaniaPrzegladu TIME,
	IdentyfikatorZespolu INTEGER,
	Opoznienie TIME,
	Samolot INTEGER FOREIGN KEY REFERENCES Samoloty,
	Awaria INTEGER,
	StartPrzegladu DATETIME,
	Koordynator INTEGER FOREIGN KEY REFERENCES Koordynatorzy,
	Temperatura INTEGER,
	CzyOpady BIT,
	Wiatr INTEGER,
)