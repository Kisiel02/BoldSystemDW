use BoldSystemDW
go

IF(NOT EXISTS(SELECT 1 FROM dbo.Data_przegladu))
BEGIN

-- pomocnicze zmienne
Declare @StartDate date; 
Declare @EndDate date;
SELECT @StartDate = '2000-01-01', @EndDate = '2023-12-31';
Declare @DateInProcess datetime = @StartDate;

-- wypelnienie tabeli
SET LANGUAGE Polish
While @DateInProcess <= @EndDate
	Begin
		INSERT INTO Data_przegladu VALUES(
			Cast(DATENAME(DAY,@DateInProcess) as varchar(2)),
			Cast(  DATENAME(month, @DateInProcess) as varchar(15)),
			Cast(Year(@DateInProcess) as varchar(4)),
			Cast((case when month(@DateInProcess) in (12, 1, 2) then 'Zima'
				  when month(@DateInProcess) in (3, 4, 5) then 'Wiosna'
				  when month(@DateInProcess) in (6, 7, 8) then 'Lato'
				  when month(@DateInProcess) in (9, 10, 11) then 'Jesien'
			 end) as varchar(6))
		);  
		Set @DateInProcess = DateAdd(d, 1, @DateInProcess);
	End

END