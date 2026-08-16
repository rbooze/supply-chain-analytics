CREATE OR ALTER PROCEDURE dbo.usp_LoadDimCarrier
AS
BEGIN

TRUNCATE TABLE dim.DimCarrier;

INSERT INTO dim.DimCarrier
(
CarrierCode,
CarrierName,
ServiceLevel
)
SELECT
CarrierCode,
CarrierName,
ServiceLevel
FROM staging.Carriers;

END
GO