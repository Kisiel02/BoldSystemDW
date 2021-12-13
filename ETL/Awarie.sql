USE BoldSystemDW
GO

INSERT INTO dbo.Awarie
SELECT a
FROM
	(VALUES 
		('Brak awarii'),
			('Mała awaria'),
			('Średnia awaria'),
			('Duża awaria')) AS Krytycznosc(a);