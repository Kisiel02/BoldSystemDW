USE BoldSystemDW
GO

INSERT INTO dbo.Warunki_Pogodowe
SELECT t, w, o
FROM
	(VALUES 
		('Niska temperatura'),
			('�rednia temperatura'),
			('Wysoka temperatura')) AS Temperatura(t),
	(VALUES 
		('Ma�a pr�dko�� wiatru'),
			('�rednia pr�dko�� wiatru'),
			('Du�a pr�dko�� wiatru')) AS Predkosc_Wiatru(w),
	(VALUES 
		('Opady wyst�pi�y'),
			('Brak opad�w')) AS Czy_Opady(o);