CREATE TABLE fact.FactSales
(
    SalesKey            BIGINT IDENTITY PRIMARY KEY,
    DateKey             INT,
    ProductKey          INT,
    CustomerKey         INT,
    WarehouseKey        INT,
    CarrierKey          INT,
    SupplierKey         INT,
    OrderNumber         VARCHAR(30),
    LineNumber          INT,
    Quantity            INT,
    SalesAmount         DECIMAL(12,2),
    CostAmount          DECIMAL(12,2),
    FreightAmount       DECIMAL(12,2)
);