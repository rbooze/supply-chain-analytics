CREATE TABLE fact.FactReturns
(
    ReturnKey           BIGINT IDENTITY PRIMARY KEY,
    DateKey             INT,
    ProductKey          INT,
    CustomerKey         INT,
    QuantityReturned    INT,
    ReturnReason        VARCHAR(100)
);