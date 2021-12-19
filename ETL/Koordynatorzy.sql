USE BoldSystemDW
GO

If (object_id('vETLDimKoordynatorzyData') is not null) Drop View vETLDimKoordynatorzyData;
go
CREATE VIEW vETLDimKoordynatorzyData
AS
SELECT DISTINCT
	[NumerPaszportu] as [NumerPaszportu]
FROM BoldSystem.dbo.Koordynatorzy;
go

MERGE INTO Koordynatorzy as TT
	USING vETLDimKoordynatorzyData as ST
		ON TT.Numer_Paszportu = ST.NumerPaszportu
			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST.[NumerPaszportu]
					)
			;

Drop View vETLDimKoordynatorzyData;