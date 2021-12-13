USE BoldSystemDW
GO

If (object_id('vETLDimWarunkiPogodoweData') is not null) Drop View vETLDimWarunkiPogodoweData;
go
CREATE VIEW vETLDimWarunkiPogodoweData
AS
SELECT DISTINCT
	Temperatura,
	Wiatr,
	CzyOpady,
FROM 
	(SELECT 
		 CASE
			WHEN ST1.Temperatura < 5 THEN 'Niska temperatura'
			WHEN ST1.Temperatura <= 20 THEN 'Œrednia temperatura'
			ELSE 'Wysoka temperatura'
		END
		AS Temperatura,
		CASE
			WHEN ST1.Wiatr < 20 THEN 'Ma³a prêdkoœæ wiatru'
			WHEN ST1.Wiatr <= 50 THEN 'Œrednia prêdkoœæ wiatru'
			ELSE 'Du¿a prêdkoœæ wiatru'
		END
		AS Wiatr,
		CASE
			WHEN ST1.CzyOpady = 1 THEN 'Opady wyst¹pi³y'
			ELSE 'Brak opadów'
		END
		AS CzyOpady
		 FROM BoldSystem.dbo.PrzegladySamolotow as ST1)
GO

INSERT INTO Warunki_Pogodowe VALUES(
	ST1.Temperatura,
	ST1.Wiatr,
	ST1.CzyOpady)
	SELECT * FROM vETLDimWarunkiPogodoweData AS ST
	

Drop View vETLDimWarunkiPogodoweData;