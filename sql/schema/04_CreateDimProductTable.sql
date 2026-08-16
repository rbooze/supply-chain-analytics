CREATE TABLE dim.DimProduct
(
    ProductKey          INT IDENTITY PRIMARY KEY,
    ProductCode         VARCHAR(20) UNIQUE,
    ProductName         VARCHAR(100),
    Category            VARCHAR(50),
    SubCategory         VARCHAR(50),
    Brand               VARCHAR(50),
    SupplierCode        VARCHAR(20),
    UnitCost            DECIMAL(10,2),
    UnitPrice           DECIMAL(10,2),
    Weight              DECIMAL(10,2),
    ReorderPoint        INT,
    ReorderQuantity     INT,
    IsActive            BIT
);