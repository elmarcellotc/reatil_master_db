CREATE TABLE Warehouses (
    WarehouseID VARCHAR(20) PRIMARY KEY,        -- e.g. 'WH0000000001'
    BuildingModel VARCHAR(10) NOT NULL,         -- FK to BuildingTypes
    Location VARCHAR(50) NOT NULL,              -- FK to Locations

    FOREIGN KEY (BuildingModel)
        REFERENCES BuildingTypes(BuildingTypeID),

    FOREIGN KEY (Location)
        REFERENCES Locations(LocationID)
);