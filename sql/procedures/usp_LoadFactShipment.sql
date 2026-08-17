CREATE OR ALTER PROCEDURE dbo.usp_LoadFactShipment
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

        INSERT INTO fact.FactShipment
        (
            DateKey,
            CarrierKey,
            WarehouseKey,
            OrderNumber,
            TransitDays,
            WeatherDelay,
            LateDelivery
        )
        SELECT
            d.DateKey,
            c.CarrierKey,
            w.WarehouseKey,
            s.OrderNumber,
            s.TransitDays,
            s.WeatherDelay,
            s.LateDelivery
        FROM staging.Shipments s
        INNER JOIN dim.DimDate d
            ON s.ShipDate = d.CalendarDate
        INNER JOIN dim.DimCarrier c
            ON s.CarrierCode = c.CarrierCode
        INNER JOIN dim.DimWarehouse w
            ON s.WarehouseCode = w.WarehouseCode;

        SET @RowsInserted = @@ROWCOUNT;

        EXEC audit.usp_LogETLStep
            @RunID=@RunID,
            @Procedure='usp_LoadFactShipment',
            @Step='Load Shipments',
            @Rows=@RowsInserted,
            @Status='Success';

        COMMIT;

    END TRY

    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK;

        EXEC audit.usp_LogETLError
            @RunID=@RunID,
            @Procedure='usp_LoadFactShipment';

        THROW;

    END CATCH

END;
GO