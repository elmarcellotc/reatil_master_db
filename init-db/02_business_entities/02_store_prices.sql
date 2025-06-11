CREATE TABLE StorePrices (
    StoreID VARCHAR(20) NOT NULL,                         -- FK to Stores
    ItemID VARCHAR(20) NOT NULL,                          -- FK to Items
    Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0),     -- Price must be non-negative

    PRIMARY KEY (StoreID, ItemID),

    FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON DELETE CASCADE,

    FOREIGN KEY (ItemID)
        REFERENCES Items(ItemID)
        ON DELETE CASCADE
);