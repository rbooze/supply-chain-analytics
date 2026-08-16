USE master;
GO

IF DB_ID('SupplyChainAnalytics') IS NOT NULL
BEGIN
    ALTER DATABASE SupplyChainAnalytics SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE SupplyChainAnalytics;
END
GO

CREATE DATABASE SupplyChainAnalytics;
GO

USE SupplyChainAnalytics;
GO