EXEC dbo.usp_RunWarehouseLoad;

EXEC dbo.usp_ValidateWarehouse;

SELECT 
	*
FROM audit.ETL_Run
ORDER BY StartTime DESC;

SELECT 
	*
FROM audit.ETL_Step
ORDER BY StepID DESC;

SELECT 
	*
FROM audit.ETL_Error;