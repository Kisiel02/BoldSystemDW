USE BoldSystemDW
GO

DELETE FROM dbo.Warunki_Pogodowe;

INSERT INTO dbo.Warunki_Pogodowe
SELECT t, w, o
FROM
	(VALUES 
		('Niska temperatura'),
			('Srednia temperatura'),
			('Wysoka temperatura')) AS Temperatura(t),
	(VALUES 
		('Mala predkosc wiatru'),
			('Srednia predkosc wiatru'),
			('Duza predkosc wiatru')) AS Predkosc_Wiatru(w),
	(VALUES 
		('Opady wystapily'),
			('Brak opadow')) AS Czy_Opady(o);