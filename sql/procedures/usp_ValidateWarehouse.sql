CREATE OR ALTER PROCEDURE dbo.usp_ValidateWarehouse
AS
BEGIN

SET NOCOUNT ON;

PRINT 'Checking Product Count';

SELECT
COUNT(*) AS Products
FROM dim.DimProduct;

PRINT 'Checking Customer Count';

SELECT
COUNT(*) AS Customers
FROM dim.DimCustomer;

PRINT 'Checking Supplier Count';

SELECT
COUNT(*) AS Suppliers
FROM dim.DimSupplier;

PRINT 'Checking Warehouse Count';

SELECT
COUNT(*) AS Warehouses
FROM dim.DimWarehouse;

PRINT 'Checking Carrier Count';

SELECT
COUNT(*) AS Carriers
FROM dim.DimCarrier;

PRINT 'Checking Sales Facts';

SELECT
COUNT(*) AS Sales
FROM fact.FactSales;

PRINT 'Checking Inventory Facts';

SELECT
COUNT(*) AS Inventory
FROM fact.FactInventory;

PRINT 'Checking Shipment Facts';

SELECT
COUNT(*) AS Shipments
FROM fact.FactShipment;

PRINT 'Checking Returns Facts';

SELECT
COUNT(*) AS Returns
FROM fact.FactReturns;

END
GO