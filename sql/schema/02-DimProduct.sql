CREATE TABLE dbo.DimProduct
(
    ProductKey      INT IDENTITY(1,1) PRIMARY KEY,
    ProductCode     NVARCHAR(20) NOT NULL,
    ProductName     NVARCHAR(100) NOT NULL,
    Category        NVARCHAR(50),
    SubCategory     NVARCHAR(50),
    Brand           NVARCHAR(50),
    UnitCost        DECIMAL(10,2),
    UnitPrice       DECIMAL(10,2),
    IsActive        BIT NOT NULL DEFAULT 1
);