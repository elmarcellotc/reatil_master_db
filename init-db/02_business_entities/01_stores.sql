CREATE TABLE Stores (
    StoreID VARCHAR(20) PRIMARY KEY,                    -- e.g. 'LPGMNS000000001'
    StoreModel VARCHAR(10) NOT NULL,                    -- FK to BuildingTypes
    Location VARCHAR(50) NOT NULL,                      -- FK to Locations
    WarehouseID VARCHAR(20) NOT NULL,                   -- FK to Warehouses

    FOREIGN KEY (StoreModel)
        REFERENCES BuildingTypes(BuildingTypeID),

    FOREIGN KEY (Location)
        REFERENCES Locations(LocationID),

    FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
);