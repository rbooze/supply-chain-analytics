CREATE TABLE dbo.DimSupplier
(
    SupplierKey     INT IDENTITY(1,1) PRIMARY KEY,
    SupplierCode    NVARCHAR(20),
    SupplierName    NVARCHAR(100),
    Country         NVARCHAR(50),
    LeadTimeDays    INT,
    Rating          DECIMAL(3,2)
);