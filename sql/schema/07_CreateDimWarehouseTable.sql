CREATE TABLE dim.DimWarehouse
(
    WarehouseKey        INT IDENTITY PRIMARY KEY,
    WarehouseCode       VARCHAR(10) UNIQUE,
    WarehouseName       VARCHAR(100),
    City                VARCHAR(50),
    State               VARCHAR(20),
    Region              VARCHAR(40),
    Capacity            INT
);