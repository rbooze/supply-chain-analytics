USE SupplyChainAnalytics;
GO

---------------------------------------------------------
-- Calendar
---------------------------------------------------------

CREATE TABLE staging.Calendar
(
    DateKey INT PRIMARY KEY,
    CalendarDate DATE,
    Year SMALLINT,
    Quarter TINYINT,
    Month TINYINT,
    MonthName VARCHAR(20),
    Week TINYINT,
    Day TINYINT,
    DayName VARCHAR(20),
    Weekend BIT
);

---------------------------------------------------------
-- Products
---------------------------------------------------------

CREATE TABLE staging.Products
(
    ProductCode VARCHAR(20),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    Brand VARCHAR(50),
    SupplierCode VARCHAR(20),
    UnitCost DECIMAL(10,2),
    UnitPrice DECIMAL(10,2),
    Weight DECIMAL(10,2),
    ReorderPoint INT,
    ReorderQuantity INT,
    IsActive BIT
);

---------------------------------------------------------
-- Customers
---------------------------------------------------------

CREATE TABLE staging.Customers
(
    CustomerCode VARCHAR(20),
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(20),
    Industry VARCHAR(50),
    Segment VARCHAR(50),
    CreditLimit MONEY,
    RiskScore INT
);

---------------------------------------------------------
-- Suppliers
---------------------------------------------------------

CREATE TABLE staging.Suppliers
(
    SupplierCode VARCHAR(20),
    SupplierName VARCHAR(100),
    Country VARCHAR(50),
    LeadTimeDays INT,
    Rating DECIMAL(3,2)
);

---------------------------------------------------------
-- Warehouses
---------------------------------------------------------

CREATE TABLE staging.Warehouses
(
    WarehouseCode VARCHAR(10),
    WarehouseName VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(20),
    Region VARCHAR(30),
    Capacity INT
);

---------------------------------------------------------
-- Carriers
---------------------------------------------------------

CREATE TABLE staging.Carriers
(
    CarrierCode VARCHAR(20),
    CarrierName VARCHAR(100),
    ServiceLevel VARCHAR(30)
);
GO