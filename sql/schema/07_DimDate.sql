CREATE TABLE dbo.DimDate
(
    DateKey         INT PRIMARY KEY,
    CalendarDate    DATE,
    CalendarYear    INT,
    CalendarQuarter INT,
    MonthNumber     INT,
    MonthName       NVARCHAR(20),
    WeekNumber      INT,
    DayOfMonth      INT,
    DayName         NVARCHAR(20),
    IsWeekend       BIT
);