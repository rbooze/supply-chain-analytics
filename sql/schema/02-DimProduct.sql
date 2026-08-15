CREATE TABLE dbo.DimProduct
(
    ProductKey         INT IDENTITY(1,1) PRIMARY KEY,
    ProductCode        NVARCHAR(20) NOT NULL,
    ProductName        NVARCHAR(100) NOT NULL,
    Category           NVARCHAR(50) NOT NULL,
    SubCategory        NVARCHAR(50) NULL,
    Brand              NVARCHAR(50) NOT NULL,
    SupplierCode       NVARCHAR(20) NOT NULL,
    UnitCost           DECIMAL(10,2) NOT NULL,
    UnitPrice          DECIMAL(10,2) NOT NULL,
    Weight             DECIMAL(10,2) NOT NULL,
    ReorderPoint       INT NOT NULL,
    ReorderQuantity    INT NOT NULL,
    IsActive           BIT NOT NULL DEFAULT 1
);


DROP TABLE dbo.DimProduct