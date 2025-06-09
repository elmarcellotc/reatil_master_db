-- Create the StoreStock table
CREATE TABLE StoreStock (
    StoreID NVARCHAR(20) NOT NULL,
    ItemID NVARCHAR(20) NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),

    CONSTRAINT PK_StoreStock PRIMARY KEY (StoreID, ItemID),

    CONSTRAINT FK_StoreStock_Stores FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON DELETE CASCADE,

    CONSTRAINT FK_StoreStock_Items FOREIGN KEY (ItemID)
        REFERENCES Items(ItemID)
        ON DELETE CASCADE
);
GO