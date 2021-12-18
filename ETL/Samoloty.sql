USE BoldSystemDW
GO

If (object_id('vETLDimLiniaLotnicza') is not null) Drop view vETLDimLiniaLotnicza;
go
CREATE VIEW vETLDimLiniaLotnicza
AS
SELECT
	Model,
	RodzajSamolotu,
	Wiek,
	ID_Linii_Lotniczej
FROM 
	(SELECT 
		Model = ST1.ModelSamolotu,
		CASE
			WHEN ST1.RodzajSamolotu = 0 THEN 'Pasażerski'
			ELSE 'Transportowy'
		END AS RodzajSamolotu,
		CASE
			WHEN YEAR(GETDATE()) - ST1.RokProdukcji < 5 THEN 'Nowy samolot'
			WHEN YEAR(GETDATE()) - ST1.RokProdukcji < 25 THEN 'Samolot o średnim wieku'
			ELSE 'Stary samolot'
		END AS Wiek,
		KodLiniiIATA,
		Nazwa
	FROM BoldSystem.dbo.Samoloty as ST1
	JOIN BoldSystem.dbo.LiniaLotnicza on BoldSystem.dbo.LiniaLotnicza.ID = ST1.LiniaLotnicza
	) as x
JOIN dbo.LiniaLotnicza ON x.KodLiniiIATA = dbo.LiniaLotnicza.Kod_Linii_IATA AND x.Nazwa = dbo.LiniaLotnicza.Nazwa;

go

MERGE INTO Samoloty as TT
	USING vETLDimLiniaLotnicza as ST
		ON TT.ID_Linii_Lotniczej = ST.ID_Linii_Lotniczej
			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST.Model,
					ST.Wiek,
					ST.ID_Linii_Lotniczej,
					ST.RodzajSamolotu
					)
			;

Drop view vETLDimLiniaLotnicza;