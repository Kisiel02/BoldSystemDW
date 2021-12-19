USE BoldSystemDW
GO

IF(NOT EXISTS(SELECT 1 FROM dbo.Awarie))
BEGIN

INSERT INTO dbo.Awarie
SELECT a
FROM
	(VALUES 
		('Brak awarii'),
		('Mala awaria'),
		('Srednia awaria'),
		('Duza awaria'),
		('GIGA AWARIA')) AS Krytycznosc(a);
END