CREATE TABLE fact.FactInventory
(
    InventoryKey        BIGINT IDENTITY PRIMARY KEY,
    DateKey             INT,
    ProductKey          INT,
    WarehouseKey        INT,
    QuantityOnHand      INT,
    QuantityAllocated   INT
);