CREATE OR ALTER PROCEDURE dbo.usp_LoadFactInventory
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

        INSERT INTO fact.FactInventory
        (
            DateKey,
            ProductKey,
            WarehouseKey,
            QuantityOnHand,
            QuantityAllocated
        )
        SELECT
            (
                SELECT MAX(DateKey)
                FROM dim.DimDate
            ),
            dp.ProductKey,
            dw.WarehouseKey,
            i.QuantityOnHand,
            i.QuantityAllocated
        FROM staging.Inventory i
        INNER JOIN dim.DimProduct dp
            ON i.ProductCode = dp.ProductCode
        INNER JOIN dim.DimWarehouse dw
            ON i.WarehouseCode = dw.WarehouseCode;

        SET @RowsInserted = @@ROWCOUNT;

        EXEC audit.usp_LogETLStep
            @RunID=@RunID,
            @Procedure='usp_LoadFactInventory',
            @Step='Load Inventory',
            @Rows=@RowsInserted,
            @Status='Success';

        COMMIT;
    END TRY
    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK;

        EXEC audit.usp_LogETLError
            @RunID=@RunID,
            @Procedure='usp_LoadFactInventory';

        THROW;

    END CATCH
END;
GO