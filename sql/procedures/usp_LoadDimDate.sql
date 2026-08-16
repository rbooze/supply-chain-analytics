CREATE OR ALTER PROCEDURE dbo.usp_LoadDimDate
AS
BEGIN

TRUNCATE TABLE dim.DimDate;

INSERT INTO dim.DimDate
(
DateKey,
CalendarDate,
CalendarYear,
CalendarQuarter,
MonthNumber,
MonthName,
WeekNumber,
DayNumber,
DayName,
IsWeekend
)
SELECT

DateKey,
CalendarDate,
Year,
Quarter,
Month,
MonthName,
Week,
Day,
DayName,
Weekend

FROM staging.Calendar;

END
GO