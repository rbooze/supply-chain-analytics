CREATE OR ALTER PROCEDURE dbo.usp_LoadDimWarehouse
AS
BEGIN

TRUNCATE TABLE dim.DimWarehouse;

INSERT INTO dim.DimWarehouse
(
WarehouseCode,
WarehouseName,
City,
State,
Region,
Capacity
)
SELECT
WarehouseCode,
WarehouseName,
City,
State,
Region,
Capacity
FROM staging.Warehouses;

END
GO