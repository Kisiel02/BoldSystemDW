use BoldSystemDW
go

IF(NOT EXISTS(SELECT 1 FROM dbo.Czas))
BEGIN

-- pomocnicze zmienne
Declare @Hour INTEGER = 0;
Declare @Minute INTEGER = 0;
Declare @Time TIME;

-- wypelnienie tabeli
While @Hour <= 23
	Begin
		WHILE @Minute <= 59
			BEGIN
				SET @Time = cast( cast(@Hour as varchar(2)) + ':' + cast(@Minute as varchar(2)) AS time)
				
					INSERT INTO Czas VALUES(
						@Hour,
						@Minute,
						Cast((case when @Time < cast('03:59:59' AS TIME) THEN 'pomiedzy 0 a 4'
							  when @Time < cast('07:59:59' AS TIME) THEN 'pomiedzy 4 a 8'
							  when @Time < cast('11:59:59' AS TIME) THEN 'pomiedzy 8 a 12'
							  when @Time < cast('15:59:59' AS TIME) THEN 'pomiedzy 12 a 16'
							  when @Time < cast('19:59:59' AS TIME) THEN 'pomiedzy 16 a 20'
							  ELSE 'pomiedzy 20 a 24(0)'
						 end) as varchar(40))
					);  
					Set @Minute = @Minute + 1;
			 END
			Set @Hour = @Hour + 1;
			Set @Minute =  0;
	End

END

SELECT * FROM dbo.Czas