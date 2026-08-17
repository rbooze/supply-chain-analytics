CREATE TABLE staging.SalesOrderLines
(
    SalesLineID     BIGINT NOT NULL,
    OrderNumber     VARCHAR(30) NOT NULL,
    LineNumber      INT NOT NULL,
    ProductCode     VARCHAR(20) NOT NULL,
    Quantity        INT NOT NULL,
    UnitPrice       DECIMAL(10,2) NOT NULL,
    UnitCost        DECIMAL(10,2) NOT NULL,
    SalesAmount     DECIMAL(12,2) NOT NULL,
    CostAmount      DECIMAL(12,2) NOT NULL,
    FreightAmount   DECIMAL(12,2) NOT NULL
);
GO