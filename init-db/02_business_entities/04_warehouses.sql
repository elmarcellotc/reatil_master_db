CREATE TABLE Warehouses (
    WarehouseID NVARCHAR(20) PRIMARY KEY,
    BuildingModel NVARCHAR(10) NOT NULL,
    Location NVARCHAR(50) NOT NULL,

    CONSTRAINT FK_Warehouses_BuildingTypes FOREIGN KEY (BuildingModel)
        REFERENCES BuildingTypes(BuildingTypeID),

    CONSTRAINT FK_Warehouses_Locations FOREIGN KEY (Location)
        REFERENCES Locations(LocationID)
);
GO