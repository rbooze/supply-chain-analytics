CREATE TABLE dim.DimSupplier
(
    SupplierKey         INT IDENTITY PRIMARY KEY,
    SupplierCode        VARCHAR(20) UNIQUE,
    SupplierName        VARCHAR(100),
    Country             VARCHAR(40),
    LeadTimeDays        INT,
    Rating              DECIMAL(3,2)
);