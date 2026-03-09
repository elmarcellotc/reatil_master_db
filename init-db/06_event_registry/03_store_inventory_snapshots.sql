CREATE TABLE StoreInventoryBySnapshot (
    SnapshotID VARCHAR(30) NOT NULL,               -- FK to StoreInventorySnapshots
    sku VARCHAR(20) NOT NULL,                    -- FK to SKU(sku)
    Quantity DECIMAL(14, 2) NOT NULL CHECK (Quantity >= 0),

    CONSTRAINT PK_StoreInventory PRIMARY KEY (SnapshotID, sku),

    CONSTRAINT FK_InventorySnapshot FOREIGN KEY (SnapshotID)
        REFERENCES StoreInventorySnapshots(SnapshotID)
        ON DELETE CASCADE,

    CONSTRAINT FK_InventoryItem FOREIGN KEY (sku)
        REFERENCES SKU(sku)
        ON DELETE CASCADE
);