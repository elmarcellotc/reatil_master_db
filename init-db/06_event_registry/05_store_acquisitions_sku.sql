CREATE TABLE StoreAcquisitionSKU (
    EventID VARCHAR(30) NOT NULL,                          -- FK to StoreAcquisitionEvents
    sku VARCHAR(20) NOT NULL,                              -- FK to SKU
    WarehouseID VARCHAR(20) NOT NULL,                      -- FK to Warehouses
    Quantity DECIMAL(14, 2) NOT NULL CHECK (Quantity > 0),
    Expense DECIMAL(14, 2) NOT NULL CHECK (Expense >= 0),

    CONSTRAINT PK_StoreAcqSKU PRIMARY KEY (EventID, sku),

    CONSTRAINT FK_AcqSKU_Events FOREIGN KEY (EventID)
        REFERENCES StoreAcquisitionEvents(EventID)
        ON DELETE CASCADE,

    CONSTRAINT FK_AcqSKU_SKU FOREIGN KEY (sku)
        REFERENCES SKU(sku)
        ON DELETE CASCADE,

    CONSTRAINT FK_AcqSKU_Warehouses FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
        ON DELETE CASCADE
);