USE BoldSystemDW
GO

INSERT INTO dbo.Awarie
SELECT a
FROM
	(VALUES 
		('Brak awarii'),
			('Ma�a awaria'),
			('�rednia awaria'),
			('Du�a awaria')) AS Krytycznosc(a);