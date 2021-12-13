USE BoldSystemDW
GO

INSERT INTO dbo.Awarie
SELECT a
FROM
	(VALUES 
		('Brak awarii'),
			('Ma³a awaria'),
			('Œrednia awaria'),
			('Du¿a awaria')) AS Krytycznosc(a);