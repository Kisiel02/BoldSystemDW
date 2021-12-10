USE BoldSystemDW
GO

If (object_id('vETLDimLiniaLotniczaData') is not null) Drop View vETLDimLiniaLotniczaData;
go
CREATE VIEW vETLDimLiniaLotniczaData
AS
SELECT DISTINCT
	[KodLiniiIATA] as [KodLiniiIATA],
	[Nazwa] as [Nazwa]
FROM BoldSystem.dbo.LiniaLotnicza;
go

MERGE INTO LiniaLotnicza as TT
	USING vETLDimLiniaLotniczaData as ST
		ON TT.Nazwa = ST.Nazwa
			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST.[KodLiniiIATA],
					ST.[Nazwa]
					)
			WHEN Not Matched By Source
				Then
					DELETE
			;

Drop View vETLDimLiniaLotniczaData;