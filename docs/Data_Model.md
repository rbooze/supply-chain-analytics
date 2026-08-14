# Data Model

## Fact Table

### FactSales

Stores every customer order line.

Measures:

- Quantity
- SalesAmount
- CostAmount
- FreightAmount
- DaysToDeliver

Foreign Keys:

- DateKey
- ProductKey
- CustomerKey
- WarehouseKey
- SupplierKey
- CarrierKey

---

## Dimension Tables

### DimDate

Calendar information.

### DimProduct

Product attributes.

### DimCustomer

Customer attributes.

### DimWarehouse

Warehouse information.

### DimSupplier

Supplier information.

### DimCarrier

Shipping carrier information.