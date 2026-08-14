CREATE TABLE dbo.DimCustomer
(
    CustomerKey     INT IDENTITY(1,1) PRIMARY KEY,
    CustomerCode    NVARCHAR(20),
    CustomerName    NVARCHAR(100),
    City            NVARCHAR(50),
    State           NVARCHAR(50),
    Region          NVARCHAR(50)
);