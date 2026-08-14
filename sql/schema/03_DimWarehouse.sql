CREATE TABLE dbo.DimWarehouse
(
    WarehouseKey    INT IDENTITY(1,1) PRIMARY KEY,
    WarehouseCode   NVARCHAR(10),
    WarehouseName   NVARCHAR(100),
    City            NVARCHAR(50),
    State           NVARCHAR(50),
    Region          NVARCHAR(50),
    Capacity        INT
);

