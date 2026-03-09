-- Create the StoreStock table
CREATE TABLE StoreStock (
    StoreID VARCHAR(20) NOT NULL,
    sku VARCHAR(20) NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),

    CONSTRAINT PK_StoreStock PRIMARY KEY (StoreID, sku),

    CONSTRAINT FK_StoreStock_Stores FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON DELETE CASCADE,

    CONSTRAINT FK_StoreStock_SKU FOREIGN KEY (sku)
        REFERENCES SKU(sku)
        ON DELETE CASCADE
);