ALTER TABLE fact.FactSales
ADD CONSTRAINT FK_FactSales_Date
FOREIGN KEY(DateKey)
REFERENCES dim.DimDate(DateKey);

ALTER TABLE fact.FactSales
ADD CONSTRAINT FK_FactSales_Product
FOREIGN KEY(ProductKey)
REFERENCES dim.DimProduct(ProductKey);

ALTER TABLE fact.FactSales
ADD CONSTRAINT FK_FactSales_Customer
FOREIGN KEY(CustomerKey)
REFERENCES dim.DimCustomer(CustomerKey);

ALTER TABLE fact.FactSales
ADD CONSTRAINT FK_FactSales_Warehouse
FOREIGN KEY(WarehouseKey)
REFERENCES dim.DimWarehouse(WarehouseKey);

ALTER TABLE fact.FactSales
ADD CONSTRAINT FK_FactSales_Carrier
FOREIGN KEY(CarrierKey)
REFERENCES dim.DimCarrier(CarrierKey);

ALTER TABLE fact.FactSales
ADD CONSTRAINT FK_FactSales_Supplier
FOREIGN KEY(SupplierKey)
REFERENCES dim.DimSupplier(SupplierKey);