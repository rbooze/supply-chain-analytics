CREATE TABLE dim.DimDate
(
    DateKey             INT PRIMARY KEY,
	CalendarDate        DATE NOT NULL,
    CalendarYear        SMALLINT NOT NULL,
    CalendarQuarter     TINYINT NOT NULL,
    MonthNumber         TINYINT NOT NULL,
    MonthName           VARCHAR(20) NOT NULL,
    WeekNumber          TINYINT NOT NULL,
    DayNumber           TINYINT NOT NULL,
    DayName             VARCHAR(20) NOT NULL,
    IsWeekend           BIT NOT NULL
);