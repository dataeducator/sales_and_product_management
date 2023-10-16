-- Cleansed DimDate Table --
SELECT [DateKey]
	,[FullDateAlternateKey] AS DATE
	,
	--      ,[DayNumberOfWeek] 
	[EnglishDayNameOfWeek] AS Week
	,
	--      ,[SpanishDayNameOfWeek]
	--      ,[FrenchDayNameOfWeek]
	--      ,[DayNumberOfMonth]
	--      ,[DayNumberOfYear]
	[WeekNumberOfYear] AS WeekNumber
	,[EnglishMonthName] AS Month
	,LEFT([EnglishMonthName], 3) AS MonthShort
	,
	--      ,[SpanishMonthName]
	--      ,[FrenchMonthName]
	[MonthNumberOfYear] AS MonthNumber
	,[CalendarQuarter] AS Quarter
	,[CalendarYear] AS Year
--      ,[CalendarSemester]
--      ,[FiscalQuarter]
--      ,[FiscalYear]
--      ,[FiscalSemester]
FROM [AdventureWorksDW2022].[dbo].[DimDate]
WHERE CalendarYear >= 2020

