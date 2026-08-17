CREATE OR ALTER PROCEDURE dbo.usp_LoadFactReturns
(
    @RunID UNIQUEIDENTIFIER
)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @RowsInserted INT = 0;

    BEGIN TRY

        BEGIN TRANSACTION;

        INSERT INTO fact.FactReturns
        (
            DateKey,
            ProductKey,
            CustomerKey,
            QuantityReturned,
            ReturnReason
        )
        SELECT
            d.DateKey,
            p.ProductKey,
            c.CustomerKey,
            r.QuantityReturned,
            r.Reason
        FROM staging.Returns r
        INNER JOIN staging.SalesOrders so
            ON r.OrderNumber = so.OrderNumber
        INNER JOIN dim.DimCustomer c
            ON so.CustomerCode = c.CustomerCode
        INNER JOIN dim.DimProduct p
            ON r.ProductCode = p.ProductCode
        INNER JOIN dim.DimDate d
            ON r.ReturnDate = d.CalendarDate;

        SET @RowsInserted = @@ROWCOUNT;

        EXEC audit.usp_LogETLStep
            @RunID=@RunID,
            @Procedure='usp_LoadFactReturns',
            @Step='Load Returns',
            @Rows=@RowsInserted,
            @Status='Success';

        COMMIT;

    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;

        EXEC audit.usp_LogETLError
            @RunID=@RunID,
            @Procedure='usp_LoadFactReturns';

        THROW;
    END CATCH

END;
GO