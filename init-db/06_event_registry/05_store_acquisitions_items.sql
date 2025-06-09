CREATE TABLE StoreAcquisitionItems (
    EventID NVARCHAR(30) NOT NULL,                -- FK to StoreAcquisitionEvents
    ItemID NVARCHAR(20) NOT NULL,                 -- FK to Items
    WarehouseID NVARCHAR(20) NOT NULL,            -- FK to Warehouses
    Quantity DECIMAL(14, 2) NOT NULL CHECK (Quantity > 0),
    ItemExpense DECIMAL(14, 2) NOT NULL CHECK (ItemExpense >= 0),

    CONSTRAINT PK_StoreAcqItems PRIMARY KEY (EventID, ItemID),

    CONSTRAINT FK_AcqItems_Events FOREIGN KEY (EventID)
        REFERENCES StoreAcquisitionEvents(EventID)
        ON DELETE CASCADE,

    CONSTRAINT FK_AcqItems_Items FOREIGN KEY (ItemID)
        REFERENCES Items(ItemID)
        ON DELETE CASCADE,

    CONSTRAINT FK_AcqItems_Warehouses FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
        ON DELETE CASCADE
);
GO