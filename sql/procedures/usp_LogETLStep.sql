CREATE OR ALTER PROCEDURE audit.usp_LogETLStep
      @RunID UNIQUEIDENTIFIER,
      @Procedure SYSNAME,
      @Step VARCHAR(100),
      @Rows BIGINT,
      @Status VARCHAR(20),
      @Error NVARCHAR(MAX)=NULL
AS

BEGIN
	INSERT INTO audit.ETL_Step
	(
	RunID,
	ProcedureName,
	StepName,
	StartTime,
	EndTime,
	RowsProcessed,
	Status,
	ErrorMessage
	)
	VALUES
	(
	@RunID,
	@Procedure,
	@Step,
	SYSDATETIME(),
	SYSDATETIME(),
	@Rows,
	@Status,
	@Error
	);

END
GO