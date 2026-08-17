CREATE TABLE staging.Shipments
(
    ShipmentID      INT NOT NULL,
    OrderNumber     VARCHAR(30) NOT NULL,
    WarehouseCode   VARCHAR(10) NOT NULL,
    CarrierCode     VARCHAR(20) NOT NULL,
    ShipDate        DATE NOT NULL,
    DeliveryDate    DATE NOT NULL,
    TransitDays     INT NOT NULL,
    WeatherDelay    BIT NOT NULL,
    LateDelivery    BIT NOT NULL
);
GO