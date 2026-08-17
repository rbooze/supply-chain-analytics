CREATE TABLE staging.Returns
(
    ReturnID            INT NOT NULL,
    OrderNumber         VARCHAR(30) NOT NULL,
    ShipmentID          INT NOT NULL,
    ProductCode         VARCHAR(20) NOT NULL,
    ReturnDate          DATE NOT NULL,
    QuantityReturned    INT NOT NULL,
    Reason              VARCHAR(100) NOT NULL
);
GO