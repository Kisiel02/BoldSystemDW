BULK INSERT dbo.LiniaLotnicza FROM 'E:\PythonProjekty\LinieLotnicze.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.Koordynatorzy FROM 'E:\PythonProjekty\Koordynatorzy.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.Samoloty FROM 'E:\PythonProjekty\Samoloty.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.PrzegladySamolotow FROM 'E:\PythonProjekty\Przeglady.bulk' WITH (FIELDTERMINATOR='|')

SELECT * FROM LiniaLotnicza
SELECT * FROM Koordynatorzy
SELECT * FROM Samoloty
SELECT * FROM PrzegladySamolotow


