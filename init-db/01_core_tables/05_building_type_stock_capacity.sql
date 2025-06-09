-- Create new table BuildingTypeStockCapacity
CREATE TABLE BuildingTypeStockCapacity (
    BuildingTypeID NVARCHAR(10) NOT NULL,
    ItemID NVARCHAR(20) NOT NULL,
    CapacityAmount INT NOT NULL CHECK (CapacityAmount >= 0),

    CONSTRAINT PK_BuildingTypeStockCapacity PRIMARY KEY (BuildingTypeID, ItemID),

    CONSTRAINT FK_BuildingTypeStockCapacity_BuildingTypes FOREIGN KEY (BuildingTypeID)
        REFERENCES BuildingTypes(BuildingTypeID)
        ON DELETE CASCADE,

    CONSTRAINT FK_BuildingTypeStockCapacity_Items FOREIGN KEY (ItemID)
        REFERENCES Items(ItemID)
        ON DELETE CASCADE
);
GO