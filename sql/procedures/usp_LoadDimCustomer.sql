CREATE OR ALTER PROCEDURE dbo.usp_LoadDimCustomer
AS
BEGIN

SET NOCOUNT ON;

TRUNCATE TABLE dim.DimCustomer;

INSERT INTO dim.DimCustomer
(
    CustomerCode,
    CustomerName,
    City,
    State,
    Industry,
    Segment,
    CreditLimit,
    RiskScore
)
SELECT

    CustomerCode,
    CustomerName,
    City,
    State,
    Industry,
    Segment,
    CreditLimit,
    RiskScore

FROM staging.Customers;

END
GO