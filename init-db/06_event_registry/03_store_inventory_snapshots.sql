CREATE TABLE StoreInventoryBySnapshot (
    SnapshotID VARCHAR(30) NOT NULL,               -- FK to StoreInventorySnapshots
    ItemID VARCHAR(20) NOT NULL,                    -- FK to Items(ItemID)
    Quantity DECIMAL(14, 2) NOT NULL CHECK (Quantity >= 0),

    CONSTRAINT PK_StoreInventory PRIMARY KEY (SnapshotID, ItemID),

    CONSTRAINT FK_InventorySnapshot FOREIGN KEY (SnapshotID)
        REFERENCES StoreInventorySnapshots(SnapshotID)
        ON DELETE CASCADE,

    CONSTRAINT FK_InventoryItem FOREIGN KEY (ItemID)
        REFERENCES Items(ItemID)
        ON DELETE CASCADE
);