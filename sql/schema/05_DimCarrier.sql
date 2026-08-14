CREATE TABLE dbo.DimCarrier
(
    CarrierKey      INT IDENTITY(1,1) PRIMARY KEY,
    CarrierName     NVARCHAR(100),
    ServiceLevel    NVARCHAR(50)
);