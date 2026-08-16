CREATE TABLE dim.DimCarrier
(
    CarrierKey          INT IDENTITY PRIMARY KEY,
    CarrierCode         VARCHAR(20) UNIQUE,
    CarrierName         VARCHAR(100),
    ServiceLevel        VARCHAR(50)
);