CREATE TABLE dim.DimCustomer
(
    CustomerKey         INT IDENTITY PRIMARY KEY,
    CustomerCode        VARCHAR(20) UNIQUE,
    CustomerName        VARCHAR(100),
    City                VARCHAR(50),
    State               VARCHAR(30),
    Industry            VARCHAR(50),
    Segment             VARCHAR(30),
    CreditLimit         MONEY,
    RiskScore           INT
);