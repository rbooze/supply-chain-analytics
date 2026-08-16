CREATE TABLE fact.FactShipment
(
    ShipmentKey         BIGINT IDENTITY PRIMARY KEY,
    DateKey             INT,
    CarrierKey          INT,
    WarehouseKey        INT,
    OrderNumber         VARCHAR(30),
    TransitDays         INT,
    WeatherDelay        BIT,
    LateDelivery        BIT
);