USE BoldSystemDW
GO

IF(NOT EXISTS(SELECT 1 FROM dbo.Warunki_Pogodowe))
BEGIN

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

END