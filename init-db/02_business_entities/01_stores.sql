CREATE TABLE Stores (
    StoreID NVARCHAR(20) PRIMARY KEY,                   -- e.g. 'LPGMNS000000001'
    StoreModel NVARCHAR(10) NOT NULL,                   -- FK to BuildingTypes
    Location NVARCHAR(50) NOT NULL,                     -- FK to Locations
    WarehouseID NVARCHAR(20) NOT NULL,                  -- FK to Warehouses
    
    CONSTRAINT FK_Stores_BuildingTypes FOREIGN KEY (StoreModel)
        REFERENCES BuildingTypes(BuildingTypeID),
        
    CONSTRAINT FK_Stores_Locations FOREIGN KEY (Location)
        REFERENCES Locations(LocationID),

    CONSTRAINT FK_Stores_Warehouses FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
);
GO