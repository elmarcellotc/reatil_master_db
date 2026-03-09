CREATE TABLE StoreSales (
    SaleID VARCHAR(30),                              -- e.g. 'SLLSLPGMNS000000001H8D2M2Y2019'
    StoreID VARCHAR(20) NOT NULL,                    -- FK to Stores(StoreID)
    Datetime DATETIME NOT NULL,                       -- e.g. '2019-02-01 08:00:00'
    sku VARCHAR(20) NOT NULL,                      -- FK to SKU(sku)
    QuantitySold DECIMAL(12, 2) NOT NULL CHECK (QuantitySold >= 0),
    PricePerUnit DECIMAL(10, 4) NOT NULL CHECK (PricePerUnit >= 0),
    TotalIncome DECIMAL(14, 2) NOT NULL CHECK (TotalIncome >= 0),

    CONSTRAINT FK_StoreSales_Stores FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON DELETE CASCADE,

    CONSTRAINT FK_StoreSales_SKU FOREIGN KEY (sku)
        REFERENCES SKU(sku)
        ON DELETE CASCADE
);