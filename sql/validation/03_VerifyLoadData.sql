DECLARE @RunID UNIQUEIDENTIFIER;

EXEC audit.usp_StartETLRun
    @RunID OUTPUT;

EXEC dbo.usp_LoadFactInventory @RunID;

EXEC dbo.usp_LoadFactShipment @RunID;

EXEC dbo.usp_LoadFactReturns @RunID;

EXEC audit.usp_EndETLRun
    @RunID,
    'Completed';

-- ============================================

SELECT COUNT(*) AS InventoryRows
FROM fact.FactInventory;

SELECT COUNT(*) AS ShipmentRows
FROM fact.FactShipment;

SELECT COUNT(*) AS ReturnRows
FROM fact.FactReturns;

SELECT *
FROM audit.ETL_Run;

SELECT *
FROM audit.ETL_Step
ORDER BY StepID DESC;

SELECT *
FROM audit.ETL_Error;