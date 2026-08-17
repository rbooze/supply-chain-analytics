DECLARE @RunID UNIQUEIDENTIFIER;

EXEC audit.usp_StartETLRun @RunID OUTPUT;

SELECT 
	*
FROM audit.ETL_Run;

EXEC audit.usp_LogETLStep
    @RunID=@RunID,
    @Procedure='Test',
    @Step='Loaded Products',
    @Rows=500,
    @Status='Success';

EXEC audit.usp_EndETLRun @RunID, 'Completed';

SELECT 
	*
FROM audit.ETL_Run;

SELECT 
	*
FROM audit.ETL_Step;