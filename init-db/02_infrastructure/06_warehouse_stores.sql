CREATE TABLE WarehouseStores (
    WarehouseID VARCHAR(20) NOT NULL,   -- FK to Warehouses
    StoreID VARCHAR(20) NOT NULL,       -- FK to Stores

    CONSTRAINT PK_WarehouseStores PRIMARY KEY (WarehouseID, StoreID),

    CONSTRAINT FK_WarehouseStores_Warehouses FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
        ON DELETE CASCADE,

    CONSTRAINT FK_WarehouseStores_Stores FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON DELETE CASCADE
);