DECLARE @RunID UNIQUEIDENTIFIER;

EXEC audit.usp_StartETLRun
    @RunID OUTPUT;

EXEC dbo.usp_LoadFactSales
    @RunID = @RunID;

EXEC audit.usp_EndETLRun
    @RunID = @RunID,
    @Status = 'Completed';

-- ==============================================

SELECT COUNT(*) AS FactSalesRows
FROM fact.FactSales;

SELECT *
FROM audit.ETL_Run;

SELECT *
FROM audit.ETL_Step;

SELECT *
FROM audit.ETL_Error;