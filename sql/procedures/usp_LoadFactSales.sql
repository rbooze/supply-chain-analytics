CREATE OR ALTER PROCEDURE dbo.usp_LoadFactSales
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

        -----------------------------------------------------
        -- Validate Customer Codes
        -----------------------------------------------------

        IF EXISTS
        (
            SELECT 1
            FROM staging.SalesOrders so
            LEFT JOIN dim.DimCustomer dc
                ON so.CustomerCode = dc.CustomerCode
            WHERE dc.CustomerKey IS NULL
        )
        BEGIN
            THROW 50001, 'Unknown CustomerCode found.', 1;
        END;

        -----------------------------------------------------
        -- Validate Product Codes
        -----------------------------------------------------

        IF EXISTS
        (
            SELECT 1
            FROM staging.SalesOrderLines sol
            LEFT JOIN dim.DimProduct dp
                ON sol.ProductCode = dp.ProductCode
            WHERE dp.ProductKey IS NULL
        )
        BEGIN
            THROW 50002, 'Unknown ProductCode found.', 1;
        END;

        -----------------------------------------------------
        -- Load FactSales
        -----------------------------------------------------

        INSERT INTO fact.FactSales
        (
            DateKey,
            ProductKey,
            CustomerKey,
            WarehouseKey,
            CarrierKey,
            SupplierKey,
            OrderNumber,
            LineNumber,
            Quantity,
            SalesAmount,
            CostAmount,
            FreightAmount
        )
        SELECT
            dd.DateKey,
            dp.ProductKey,
            dc.CustomerKey,
            NULL AS WarehouseKey,
            NULL AS CarrierKey,
            ds.SupplierKey,
            so.OrderNumber,
            sol.LineNumber,
            sol.Quantity,
            sol.SalesAmount,
            sol.CostAmount,
            sol.FreightAmount
        FROM staging.SalesOrders so
        INNER JOIN staging.SalesOrderLines sol
            ON so.OrderNumber = sol.OrderNumber
        INNER JOIN dim.DimDate dd
            ON dd.CalendarDate = so.OrderDate
        INNER JOIN dim.DimCustomer dc
            ON dc.CustomerCode = so.CustomerCode
        INNER JOIN dim.DimProduct dp
            ON dp.ProductCode = sol.ProductCode
        LEFT JOIN dim.DimSupplier ds
            ON ds.SupplierCode = dp.SupplierCode;

        SET @RowsInserted = @@ROWCOUNT;

        -----------------------------------------------------
        -- Audit Success
        -----------------------------------------------------

        EXEC audit.usp_LogETLStep
            @RunID     = @RunID,
            @Procedure = 'usp_LoadFactSales',
            @Step      = 'Insert FactSales',
            @Rows      = @RowsInserted,
            @Status    = 'Success';

        COMMIT TRANSACTION;

    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        EXEC audit.usp_LogETLError
            @RunID = @RunID,
            @Procedure = 'usp_LoadFactSales';

		-- Capture error message into a variable first
        DECLARE @ErrMsg NVARCHAR(MAX) = ERROR_MESSAGE();

        EXEC audit.usp_LogETLStep
            @RunID     = @RunID,
            @Procedure = 'usp_LoadFactSales',
            @Step      = 'Insert FactSales',
            @Rows      = 0,
            @Status    = 'Failed',
            @Error     = @ErrMsg;	--ERROR_MESSAGE();

        THROW;
    END CATCH
END;
GO