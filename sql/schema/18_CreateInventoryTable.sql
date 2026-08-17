CREATE TABLE staging.Inventory
(
    WarehouseCode       VARCHAR(10) NOT NULL,
    ProductCode         VARCHAR(20) NOT NULL,
    QuantityOnHand      INT NOT NULL,
    QuantityAllocated   INT NOT NULL,
    ReorderPoint        INT NOT NULL,
    ReorderQuantity     INT NOT NULL
);
GO