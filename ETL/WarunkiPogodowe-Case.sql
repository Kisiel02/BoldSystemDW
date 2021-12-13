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
			WHEN ST1.Temperatura <= 20 THEN '�rednia temperatura'
			ELSE 'Wysoka temperatura'
		END
		AS Temperatura,
		CASE
			WHEN ST1.Wiatr < 20 THEN 'Ma�a pr�dko�� wiatru'
			WHEN ST1.Wiatr <= 50 THEN '�rednia pr�dko�� wiatru'
			ELSE 'Du�a pr�dko�� wiatru'
		END
		AS Wiatr,
		CASE
			WHEN ST1.CzyOpady = 1 THEN 'Opady wyst�pi�y'
			ELSE 'Brak opad�w'
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