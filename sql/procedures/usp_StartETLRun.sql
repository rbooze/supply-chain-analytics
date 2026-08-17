CREATE OR ALTER PROCEDURE audit.usp_StartETLRun

    @RunID UNIQUEIDENTIFIER OUTPUT

AS

BEGIN

SET NOCOUNT ON;

SET @RunID = NEWID();

INSERT INTO audit.ETL_Run
(
    RunID,
    StartTime,
    Status
)
VALUES
(
    @RunID,
    SYSDATETIME(),
    'Running'
);

END
GO