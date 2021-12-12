use BoldSystemDW
go

DELETE FROM Data_przegladu;

-- pomocnicze zmienne
Declare @StartDate date; 
Declare @EndDate date;
SELECT @StartDate = '1980-01-01', @EndDate = '2015-12-31';
Declare @DateInProcess datetime = @StartDate;

-- wypelnienie tabeli
While @DateInProcess <= @EndDate
	Begin
		INSERT INTO Data_przegladu VALUES(
			Cast(DATENAME(DAY,@DateInProcess) as varchar(2)),
			Cast(DATENAME(month, @DateInProcess) as varchar(15)),
			Cast(Year(@DateInProcess) as varchar(4)),
			Cast((case when month(@DateInProcess) in (12, 1, 2) then 'winter'
				  when month(@DateInProcess) in (3, 4, 5) then 'spring'
				  when month(@DateInProcess) in (6, 7, 8) then 'summer'
				  when month(@DateInProcess) in (9, 10, 11) then 'autumn'
			 end) as varchar(6))
		);  
		Set @DateInProcess = DateAdd(d, 1, @DateInProcess);
	End
GO