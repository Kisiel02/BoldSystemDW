USE BoldSystemDW
GO

INSERT INTO dbo.Warunki_Pogodowe
SELECT t, w, o
FROM
	(VALUES 
		('Niska temperatura'),
			('Œrednia temperatura'),
			('Wysoka temperatura')) AS Temperatura(t),
	(VALUES 
		('Ma³a prêdkoœæ wiatru'),
			('Œrednia prêdkoœæ wiatru'),
			('Du¿a prêdkoœæ wiatru')) AS Predkosc_Wiatru(w),
	(VALUES 
		('Opady wyst¹pi³y'),
			('Brak opadów')) AS Czy_Opady(o);