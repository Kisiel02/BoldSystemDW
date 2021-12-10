USE BoldSystem
GO

DELETE FROM Samoloty;
DELETE FROM LiniaLotnicza;
DELETE FROM PrzegladySamolotow;
DELETE FROM Koordynatorzy;

BULK INSERT dbo.LiniaLotnicza FROM 'C:\Users\barto\Desktop\BoldSystemDW\generator\LinieLotnicze.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.Koordynatorzy FROM 'C:\Users\barto\Desktop\BoldSystemDW\generator\Koordynatorzy.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.Samoloty FROM 'C:\Users\barto\Desktop\BoldSystemDW\generator\Samoloty.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.PrzegladySamolotow FROM 'C:\Users\barto\Desktop\BoldSystemDW\generator\Przeglady.bulk' WITH (FIELDTERMINATOR='|')

SELECT * FROM LiniaLotnicza
SELECT * FROM Koordynatorzy
SELECT * FROM Samoloty
SELECT * FROM PrzegladySamolotow