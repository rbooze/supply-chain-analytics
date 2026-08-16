CREATE OR ALTER PROCEDURE dbo.usp_LoadDimProduct
AS
BEGIN

SET NOCOUNT ON;

TRUNCATE TABLE dim.DimProduct;

INSERT INTO dim.DimProduct
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
SELECT

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

FROM staging.Products;

END
GO