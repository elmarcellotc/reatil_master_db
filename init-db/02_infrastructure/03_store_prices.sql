CREATE TABLE StorePrices (
    StorePriceID VARCHAR(100) PRIMARY KEY NOT NULL,        -- e.g., FK or natural key
    StorePricesStoreID VARCHAR(20) NOT NULL,               -- FK to Stores.StoreID
    StorePricesSKU VARCHAR(20) NOT NULL,                -- FK to SKU.sku
    StorePricesPrice DECIMAL(10, 4) NOT NULL CHECK (StorePricesPrice > 0),

    FOREIGN KEY (StorePricesStoreID) REFERENCES Stores(StoreID),
    FOREIGN KEY (StorePricesSKU)  REFERENCES SKU(sku)
);