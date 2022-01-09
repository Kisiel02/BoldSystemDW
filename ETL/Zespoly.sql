USE BoldSystemDW
GO

If (object_id('dbo.BoldSystemTemp') is not null) DROP TABLE dbo.BoldSystemTemp;
CREATE TABLE dbo.BoldSystemTemp(IdentyfikatorZespolu INTEGER,
NazwaZespolu varchar(100), 
IloscCzlonkowZespoluBezStazystow INTEGER,
IloscStazystow INTEGER);
go

BULK INSERT dbo.BoldSystemTemp
    FROM 'E:\VisualProjekty\BoldSYstem\BoldSystemDW\generator\Zespoly.csv'
    WITH
    (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

GO
If (object_id('vETLZespolyData') is not null) Drop View vETLZespolyData;
go
CREATE VIEW vETLZespolyData
AS
SELECT
	t1.[NazwaZespolu] as [NazwaZespolu],
	CASE
		WHEN t1.IloscCzlonkowZespoluBezStazystow < 5 THEN 'Mniej niz 5 czlonkow zespolu'
		WHEN t1.IloscCzlonkowZespoluBezStazystow <= 10 THEN 'Pomiedzy 5 a 10  czlonkow zespolu'
		ELSE 'wiecej niz 10 czlonkow zespolu'
	END AS [IloscCzlonkowZespoluBezStazystow],
	CASE
		WHEN t1.IloscStazystow < 5 THEN 'Mniej niz 5 stazystow w zespole'
		WHEN t1.IloscStazystow <= 10 THEN 'Pomiedzy 5 a 10 stazystow w zespole'
		ELSE 'Wiecej niz 10 stazystow w zespole'
	END AS [IloscStazystow]
FROM dbo.BoldSystemTemp as t1
go

select * from vETLZespolyData;

MERGE INTO Zespoly as TT
	USING vETLZespolyData as ST
		ON TT.Nazwa_zespolu = ST.NazwaZespolu
			WHEN Not Matched
				THEN
					INSERT Values (
					ST.NazwaZespolu,
					ST.IloscCzlonkowZespoluBezStazystow,
					ST.IloscStazystow,
					1)
			WHEN Matched
				AND (
				ST.IloscCzlonkowZespoluBezStazystow <> TT.Ilosc_Czlonkow
				OR ST.IloscStazystow <> TT.Ilosc_Stazystow)
				THEN
					UPDATE
					SET TT.Aktualnosc = 0
			WHEN Not Matched BY Source
				THEN
					UPDATE
					SET TT.Aktualnosc = 0;

-- INSERTING CHANGED ROWS TO THE Zespoly TABLE
INSERT INTO Zespoly(
	Nazwa_Zespolu, 
	Ilosc_Czlonkow, 
	Ilosc_Stazystow, 
	Aktualnosc
	)
	SELECT 
		NazwaZespolu, 
		IloscCzlonkowZespoluBezStazystow, 
		IloscStazystow,
		1
	FROM vETLZespolyData
	EXCEPT  --zwraca wiersze z pierwszego zapytania - te z drugiego
	SELECT 
		Nazwa_Zespolu, 
		Ilosc_Czlonkow, 
		Ilosc_Stazystow, 
		1
	FROM Zespoly;


Drop View vETLZespolyData; 

SELect * from Zespoly;