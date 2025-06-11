-- Create the WarehouseStock table
CREATE TABLE WarehouseStock (
    WarehouseID VARCHAR(20) NOT NULL,
    ItemID VARCHAR(20) NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),

    CONSTRAINT PK_WarehouseStock PRIMARY KEY (WarehouseID, ItemID),

    CONSTRAINT FK_WarehouseStock_Warehouses FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
        ON DELETE CASCADE,

    CONSTRAINT FK_WarehouseStock_Items FOREIGN KEY (ItemID)
        REFERENCES Items(ItemID)
        ON DELETE CASCADE
);