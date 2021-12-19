USE BoldSystemDW
GO
If (object_id('vETLFPrzegladySamolotow') is not null) Drop view vETLFPrzegladySamolotow;

GO
SET LANGUAGE Polish

GO
If (object_id('zespolyTmp') is not null) Drop view zespolyTmp --polaczenie nazw zepsolow z id zespolow
GO
CREATE VIEW zespolyTmp
AS SELECT 
	ID_Zespolu = ZW.ID_Zespolu,
	IdentyfikatorZespolu = TMP.IdentyfikatorZespolu,
	ZW.Aktualnosc
FROM
	dbo.Zespoly AS ZW JOIN
	dbo.BoldSystemTemp AS TMP ON ZW.Nazwa_Zespolu = TMP.NazwaZespolu

GO

CREATE VIEW vETLFPrzegladySamolotow
AS
SELECT	
	DataRopoczeciaID,
	CzasRozpoczeciaPrzegladuID,
	ID_Awarii,
	ID_Samolotu,
	ID_Zespolu,
	ID_Koordynatora,
	ID_Warunkow_Pogodowych,
	Opoznienie,
	CzasTrwaniaPrzegladu
FROM
	(SELECT 
		DataRopoczeciaID = DPW.ID_Daty,
		CzasRozpoczeciaPrzegladuID = CPW.ID_Czasu,
		ID_Awarii = AW.ID_Awarii,
		ID_Samolotu = SW.ID_Samolotu,
		ID_Zespolu = ZW.ID_Zespolu,
		ID_Koordynatora = KW.ID_Koordynatora,
		ID_Warunkow_Pogodowych = WPW.ID_Warunkow_Pogodowych,
		Opoznienie = DATEPART(HOUR, ST1.Opoznienie) * 60 + DATEPART(MINUTE, ST1.Opoznienie),
		CzasTrwaniaPrzegladu = DATEPART(HOUR, ST1.CzasTrwaniaPrzegladu) * 60 + DATEPART(MINUTE, ST1.CzasTrwaniaPrzegladu)
	FROM
	BoldSystem.dbo.PrzegladySamolotow as ST1
	JOIN BoldSystem.dbo.Samoloty AS ST2 ON ST1.Samolot = ST2.ID
	JOIN BoldSystem.dbo.LiniaLotnicza AS ST3 ON ST3.ID = ST2.LiniaLotnicza
	JOIN BoldSystem.dbo.Koordynatorzy AS ST4 ON ST4.ID = ST1.Koordynator
	JOIN dbo.Data_przegladu AS DPW ON 
		DPW.Dzien = DATEPART(DAY, ST1.StartPrzegladu) AND
		DPW.Rok = DATEPART(YEAR, ST1.StartPrzegladu) AND
		DPW.Miesiac = DATENAME(MONTH, DATEADD(MONTH, DATEPART(MONTH, ST1.StartPrzegladu), -1))
	JOIN dbo.Czas AS CPW ON 
		CPW.Godzina = DATEPART(HOUR, ST1.StartPrzegladu) AND
		CPW.Minuta = DATEPART(MINUTE, ST1.StartPrzegladu)
	JOIN dbo.Awarie AS AW ON AW.Krytycznosc = 
	CASE
		WHEN ST1.Awaria = 0 THEN 'Brak awarii'
		WHEN ST1.Awaria = 1 THEN 'Mala awaria'
		WHEN ST1.Awaria = 2 THEN 'Srednia awaria'
		WHEN ST1.Awaria = 3 THEN 'Duza awaria'
		ELSE 'GIGA AWARIA'
	END
	JOIN dbo.Samoloty as SW ON SW.Model = ST2.ModelSamolotu AND
	SW.Rodzaj_Samolotu = 
	CASE
		WHEN ST2.RodzajSamolotu = 0 THEN 'Pasazerski'
		ELSE 'Transportowy'
	END AND SW.Wiek = 
	CASE
		WHEN YEAR(GETDATE()) - ST2.RokProdukcji < 5 THEN 'Nowy samolot'
		WHEN YEAR(GETDATE()) - ST2.RokProdukcji < 25 THEN 'Samolot o srednim wieku'
		ELSE 'Stary samolot'
	END AND SW.ID_Linii_Lotniczej = 
		(SELECT ID_Linii_Lotniczej FROM dbo.LiniaLotnicza AS LL
			WHERE LL.Kod_Linii_IATA = ST3.KodLiniiIATA AND
			LL.Nazwa = ST3.Nazwa)
	JOIN dbo.Warunki_Pogodowe AS WPW ON WPW.Czy_Opady = 
	CASE
		WHEN ST1.CzyOpady = 1 THEN 'Opady wystapily'
		ELSE 'Brak opadow'
	END AND WPW.Temperatura =
	CASE
		WHEN ST1.Temperatura < 5 THEN 'Niska temperatura'
		WHEN ST1.Temperatura <= 20 THEN 'Srednia temperatura'
		ELSE 'Wysoka temperatura'
	END AND WPW.Predkosc_Wiatru = 
	CASE
		WHEN ST1.Wiatr < 20 THEN 'Mala predkosc wiatru'
		WHEN ST1.Wiatr <= 50 THEN 'Srednia predkosc wiatru'
		ELSE 'Duza predkosc wiatru'
	END	
	JOIN dbo.Koordynatorzy as KW ON KW.Numer_paszportu = ST4.NumerPaszportu
	JOIN zespolyTmp AS ZW ON 
		ZW.IdentyfikatorZespolu = ST1.IdentyfikatorZespolu
	WHERE ZW.Aktualnosc = 1
	) as X

GO

SELECT * FROM vETLFPrzegladySamolotow;
	
GO
	MERGE INTO PrzegladySamolotow AS TT
		USING vETLFPrzegladySamolotow AS ST
			ON
				TT.Data_Rozpoczecia_Przegladu = ST.DataRopoczeciaID 
				AND TT.[Czas_Rozpoczecia_Przegladu] = 	ST.CzasRozpoczeciaPrzegladuID
				AND TT.[ID_Awarii] = ST.ID_Awarii
				AND TT.[ID_Samolotu] = ST.ID_Samolotu
				AND TT.[ID_Zespolu] = ST.ID_Zespolu
				AND TT.[ID_Koordynatora] = ST.ID_Koordynatora
				AND TT.[ID_Warunkow_Pogodowych] = ST.ID_Warunkow_Pogodowych
				WHEN NOT MATCHED THEN
					INSERT VALUES (
					DataRopoczeciaID,
					CzasRozpoczeciaPrzegladuID,
					ID_Awarii,
					ID_Samolotu,
					ID_Zespolu,
					ID_Warunkow_Pogodowych,
					ID_Koordynatora,
					Opoznienie,
					CzasTrwaniaPrzegladu);
					

