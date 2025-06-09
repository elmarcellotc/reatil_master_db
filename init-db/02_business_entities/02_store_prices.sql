CREATE TABLE StorePrices (
    StoreID NVARCHAR(20) NOT NULL,
    ItemID NVARCHAR(20) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0),

    CONSTRAINT PK_StorePrices PRIMARY KEY (StoreID, ItemID),
    
    CONSTRAINT FK_StorePrices_Stores FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON DELETE CASCADE,

    CONSTRAINT FK_StorePrices_Items FOREIGN KEY (ItemID)
        REFERENCES Items(ItemID)
        ON DELETE CASCADE
);
GO