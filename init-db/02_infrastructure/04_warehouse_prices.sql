CREATE TABLE WarehousePrices (
    WarehouseID VARCHAR(20) NOT NULL,   -- FK to Warehouses
    sku VARCHAR(20) NOT NULL,        -- FK to SKU
    Price DECIMAL(10, 2) NOT NULL,      -- Price, must be >= 0

    PRIMARY KEY (WarehouseID, sku),

    FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
        ON DELETE CASCADE,

    FOREIGN KEY (sku)
        REFERENCES SKU(sku)
        ON DELETE CASCADE,

    CHECK (Price >= 0)
);