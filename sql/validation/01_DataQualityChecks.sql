---------------------------------------------------------
-- Products
---------------------------------------------------------

SELECT COUNT(*) ProductCount
FROM staging.Products;

SELECT COUNT(*) ProductCount
FROM dim.DimProduct;

---------------------------------------------------------
-- Customers
---------------------------------------------------------

SELECT COUNT(*) CustomerCount
FROM staging.Customers;

SELECT COUNT(*) CustomerCount
FROM dim.DimCustomer;

---------------------------------------------------------
-- Duplicate Product Codes
---------------------------------------------------------

SELECT
ProductCode,
COUNT(*)
FROM staging.Products
GROUP BY ProductCode
HAVING COUNT(*) > 1;

---------------------------------------------------------
-- Duplicate Customers
---------------------------------------------------------

SELECT
CustomerCode,
COUNT(*)
FROM staging.Customers
GROUP BY CustomerCode
HAVING COUNT(*) > 1;