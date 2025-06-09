CREATE TABLE WarehousePrices (
    WarehouseID NVARCHAR(20) NOT NULL,
    ItemID NVARCHAR(20) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0),

    CONSTRAINT PK_WarehousePrices PRIMARY KEY (WarehouseID, ItemID),

    CONSTRAINT FK_WarehousePrices_Warehouses FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
        ON DELETE CASCADE,

    CONSTRAINT FK_WarehousePrices_Items FOREIGN KEY (ItemID)
        REFERENCES Items(ItemID)
        ON DELETE CASCADE
);
GO