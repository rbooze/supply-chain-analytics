CREATE OR ALTER PROCEDURE dbo.usp_LoadDimSupplier
AS
BEGIN

TRUNCATE TABLE dim.DimSupplier;

INSERT INTO dim.DimSupplier
(
SupplierCode,
SupplierName,
Country,
LeadTimeDays,
Rating
)
SELECT
SupplierCode,
SupplierName,
Country,
LeadTimeDays,
Rating
FROM staging.Suppliers;

END
GO