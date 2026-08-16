CREATE INDEX IX_FactSales_Date
ON fact.FactSales(DateKey);

CREATE INDEX IX_FactSales_Product
ON fact.FactSales(ProductKey);

CREATE INDEX IX_FactSales_Customer
ON fact.FactSales(CustomerKey);

CREATE INDEX IX_FactShipment_Date
ON fact.FactShipment(DateKey);

CREATE INDEX IX_FactInventory_Product
ON fact.FactInventory(ProductKey);