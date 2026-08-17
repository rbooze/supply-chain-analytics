CREATE OR ALTER VIEW dbo.vw_SalesSummary
AS

SELECT
	d.CalendarDate,
	p.Category,
	p.SubCategory,
	p.Brand,
	c.CustomerName,
	c.State,
	w.Region,
	ca.CarrierName,
	f.OrderNumber,
	f.Quantity,
	f.SalesAmount,
	f.CostAmount,
	(f.SalesAmount-f.CostAmount) GrossProfit,
	f.FreightAmount
FROM fact.FactSales f
INNER JOIN dim.DimDate d
	ON f.DateKey=d.DateKey
INNER JOIN dim.DimProduct p
	ON f.ProductKey=p.ProductKey
INNER JOIN dim.DimCustomer c
	ON f.CustomerKey=c.CustomerKey
LEFT JOIN dim.DimWarehouse w
	ON f.WarehouseKey=w.WarehouseKey
LEFT JOIN dim.DimCarrier ca
	ON f.CarrierKey=ca.CarrierKey;
GO