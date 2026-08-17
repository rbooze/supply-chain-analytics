CREATE OR ALTER PROCEDURE dbo.usp_RunWarehouseLoad
AS
BEGIN

    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @RunID UNIQUEIDENTIFIER;

    BEGIN TRY

        ------------------------------------------------------------
        -- Start ETL Run
        ------------------------------------------------------------

        EXEC audit.usp_StartETLRun
            @RunID OUTPUT;

        ------------------------------------------------------------
        -- Load Dimensions
        ------------------------------------------------------------

        PRINT 'Loading DimDate...';

        EXEC dbo.usp_LoadDimDate;

        PRINT 'Loading DimProduct...';

        EXEC dbo.usp_LoadDimProduct;

        PRINT 'Loading DimCustomer...';

        EXEC dbo.usp_LoadDimCustomer;

        PRINT 'Loading DimSupplier...';

        EXEC dbo.usp_LoadDimSupplier;

        PRINT 'Loading DimWarehouse...';

        EXEC dbo.usp_LoadDimWarehouse;

        PRINT 'Loading DimCarrier...';

        EXEC dbo.usp_LoadDimCarrier;

        ------------------------------------------------------------
        -- Load Facts
        ------------------------------------------------------------

        PRINT 'Loading FactSales...';

        EXEC dbo.usp_LoadFactSales
            @RunID=@RunID;

        PRINT 'Loading FactInventory...';

        EXEC dbo.usp_LoadFactInventory
            @RunID=@RunID;

        PRINT 'Loading FactShipment...';

        EXEC dbo.usp_LoadFactShipment
            @RunID=@RunID;

        PRINT 'Loading FactReturns...';

        EXEC dbo.usp_LoadFactReturns
            @RunID=@RunID;

        ------------------------------------------------------------
        -- Finish
        ------------------------------------------------------------

        EXEC audit.usp_EndETLRun
            @RunID=@RunID,
            @Status='Completed';

    END TRY

    BEGIN CATCH

        EXEC audit.usp_LogETLError
            @RunID=@RunID,
            @Procedure='usp_RunWarehouseLoad';

        EXEC audit.usp_EndETLRun
            @RunID=@RunID,
            @Status='Failed';

        THROW;

    END CATCH

END;
GO