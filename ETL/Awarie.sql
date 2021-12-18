USE BoldSystemDW
GO

DELETE FROM dbo.Awarie;

INSERT INTO dbo.Awarie
SELECT a
FROM
	(VALUES 
		('Brak awarii'),
		('Mała awaria'),
		('Średnia awaria'),
		('Duża awaria'),
		('GIGA AWARIA')) AS Krytycznosc(a);
