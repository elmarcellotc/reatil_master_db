CREATE TABLE Warehouses (

    -- VARIABLES DEFINITION

    WarehouseID VARCHAR(20) PRIMARY KEY,        -- e.g. 'WH0000000001'

    BuildingModel VARCHAR(10) NOT NULL,         -- FK to BuildingTypes

    WarehouseLocation VARCHAR(50) NOT NULL,              -- FK to Locations

    -- CONSTRINS

    FOREIGN KEY (BuildingModel)
        REFERENCES BuildingTypes(BuildingTypeID),

    FOREIGN KEY (WarehouseLocation)
        REFERENCES Locations(LocationID)
);