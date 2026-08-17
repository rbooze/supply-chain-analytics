CREATE OR ALTER PROCEDURE audit.usp_LogETLError
      @RunID UNIQUEIDENTIFIER,
      @Procedure SYSNAME
AS

BEGIN
	INSERT INTO audit.ETL_Error
	(
	RunID,
	ProcedureName,
	ErrorNumber,
	ErrorSeverity,
	ErrorState,
	ErrorLine,
	ErrorMessage
	)
	VALUES
	(
	@RunID,
	@Procedure,
	ERROR_NUMBER(),
	ERROR_SEVERITY(),
	ERROR_STATE(),
	ERROR_LINE(),
	ERROR_MESSAGE()
	);
END
GO