CREATE OR ALTER PROCEDURE dbo.usp_LoadDimProduct
AS
BEGIN

SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN TRY

    BEGIN TRANSACTION;

    MERGE dim.DimProduct AS target

    USING staging.Products AS source

    ON target.ProductCode = source.ProductCode

    WHEN MATCHED THEN
        UPDATE SET
            ProductName      = source.ProductName,
            Category         = source.Category,
            SubCategory      = source.SubCategory,
            Brand            = source.Brand,
            SupplierCode     = source.SupplierCode,
            UnitCost         = source.UnitCost,
            UnitPrice        = source.UnitPrice,
            Weight           = source.Weight,
            ReorderPoint     = source.ReorderPoint,
            ReorderQuantity  = source.ReorderQuantity,
            IsActive         = source.IsActive

    WHEN NOT MATCHED THEN
        INSERT
        (
            ProductCode,
            ProductName,
            Category,
            SubCategory,
            Brand,
            SupplierCode,
            UnitCost,
            UnitPrice,
            Weight,
            ReorderPoint,
            ReorderQuantity,
            IsActive
        )

        VALUES
        (
            source.ProductCode,
            source.ProductName,
            source.Category,
            source.SubCategory,
            source.Brand,
            source.SupplierCode,
            source.UnitCost,
            source.UnitPrice,
            source.Weight,
            source.ReorderPoint,
            source.ReorderQuantity,
            source.IsActive
        );

    COMMIT;

END TRY

BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK;

    THROW;

END CATCH

END
GO