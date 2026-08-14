CREATE TABLE dbo.FactSales
(
    SalesKey        BIGINT IDENTITY(1,1) PRIMARY KEY,

    DateKey         INT NOT NULL,
    ProductKey      INT NOT NULL,
    CustomerKey     INT NOT NULL,
    WarehouseKey    INT NOT NULL,
    SupplierKey     INT NOT NULL,
    CarrierKey      INT NOT NULL,

    OrderNumber     NVARCHAR(30),
    Quantity        INT,
    SalesAmount     DECIMAL(12,2),
    CostAmount      DECIMAL(12,2),
    FreightAmount   DECIMAL(12,2),
    DaysToDeliver   INT
);