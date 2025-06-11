CREATE TABLE WarehousePrices (
    WarehouseID VARCHAR(20) NOT NULL,   -- FK to Warehouses
    ItemID VARCHAR(20) NOT NULL,        -- FK to Items
    Price DECIMAL(10, 2) NOT NULL,      -- Price, must be >= 0

    PRIMARY KEY (WarehouseID, ItemID),

    FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
        ON DELETE CASCADE,

    FOREIGN KEY (ItemID)
        REFERENCES Items(ItemID)
        ON DELETE CASCADE,

    CHECK (Price >= 0)
);