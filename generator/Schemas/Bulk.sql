USE BoldSystem
GO

DELETE FROM PrzegladySamolotow;
DELETE FROM Samoloty;
DELETE FROM LiniaLotnicza;
DELETE FROM Koordynatorzy;



DBCC CHECKIDENT ('[Samoloty]', RESEED, 0);
GO
DBCC CHECKIDENT ('[LiniaLotnicza]', RESEED, 0);
GO
DBCC CHECKIDENT ('[PrzegladySamolotow]', RESEED, 0);
GO
DBCC CHECKIDENT ('[Koordynatorzy]', RESEED, 0);
GO

BULK INSERT dbo.LiniaLotnicza FROM 'E:\VisualProjekty\BoldSYstem\BoldSystemDW\generator\LinieLotnicze.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.Koordynatorzy FROM 'E:\VisualProjekty\BoldSYstem\BoldSystemDW\generator\Koordynatorzy.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.Samoloty FROM 'E:\VisualProjekty\BoldSYstem\BoldSystemDW\generator\Samoloty.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.PrzegladySamolotow FROM 'E:\VisualProjekty\BoldSYstem\BoldSystemDW\generator\Przeglady.bulk' WITH (FIELDTERMINATOR='|')

SELECT * FROM LiniaLotnicza
SELECT * FROM Koordynatorzy
SELECT * FROM Samoloty
SELECT * FROM PrzegladySamolotow

USE BoldSystemDW
GO

DELETE FROM PrzegladySamolotow;
DELETE FROM Samoloty;
DELETE FROM LiniaLotnicza;
DELETE FROM Koordynatorzy;
DELETE FROM Zespoly;
DELETE FROM Awarie;
DELETE FROM Warunki_Pogodowe;
DELETE FROM Czas;
DELETE FROM Data_przegladu;

