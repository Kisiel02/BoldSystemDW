USE BoldSystemDW
GO

DELETE FROM dbo.Awarie;

INSERT INTO dbo.Awarie
SELECT a
FROM
	(VALUES 
		('Brak awarii'),
		('Mala awaria'),
		('Srednia awaria'),
		('Duza awaria'),
		('GIGA AWARIA')) AS Krytycznosc(a);
