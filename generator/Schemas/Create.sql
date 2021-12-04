CREATE DATABASE BoldSystem /* exams */
GO

USE BoldSystem
GO

CREATE TABLE LiniaLotnicza
(
    ID INTEGER IDENTITY(1,1) PRIMARY KEY,
	Nazwa varchar(30),
)
GO

CREATE TABLE Koordynatorzy
(
	ID INTEGER IDENTITY(1,1) PRIMARY KEY,
	Nazwisko varchar(15),
	LataDoswiadczenia INTEGER,
)
GO

CREATE TABLE Samoloty
(
	ID INTEGER IDENTITY(1,1) PRIMARY KEY,
	ModelSamolotu varchar(60),
	RokProdukcji SMALLINT,
	LiniaLotnicza INTEGER FOREIGN KEY REFERENCES LiniaLotnicza,
)
GO

CREATE TABLE PrzegladySamolotow
(
	ID INTEGER IDENTITY(1,1) PRIMARY KEY,
	IdentyfikatorZespolu INTEGER,
	CzasTrwaniaPrzegladu TIME,
	Samolot INTEGER FOREIGN KEY REFERENCES Samoloty,
	Koordynator INTEGER FOREIGN KEY REFERENCES Koordynatorzy,
	CzyBylaAwaria BIT, 
	StartPrzegladu DATETIME,
)