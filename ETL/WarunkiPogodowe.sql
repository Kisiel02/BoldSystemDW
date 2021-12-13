USE BoldSystemDW
GO

INSERT INTO dbo.Warunki_Pogodowe
SELECT t, w, o
FROM
	(VALUES 
		('Niska temperatura'),
			('Średnia temperatura'),
			('Wysoka temperatura')) AS Temperatura(t),
	(VALUES 
		('Mała prędkość wiatru'),
			('Średnia prędkość wiatru'),
			('Duża prędkość wiatru')) AS Predkosc_Wiatru(w),
	(VALUES 
		('Opady wystąpiły'),
			('Brak opadów')) AS Czy_Opady(o);