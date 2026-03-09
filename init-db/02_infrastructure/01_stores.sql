CREATE TABLE Stores (
    StoreID VARCHAR(20) PRIMARY KEY,                    -- e.g. 'LPGMNS000000001'
    StoreModel VARCHAR(10) NOT NULL,                    -- FK to BuildingTypes
    StoreLocation VARCHAR(50) NOT NULL,                    -- FK to Locations

    FOREIGN KEY (StoreModel)
        REFERENCES BuildingTypes(BuildingTypeID),

    FOREIGN KEY (StoreLocation)
        REFERENCES Locations(LocationID)
);