CREATE TABLE BuildingTypeStockCapacity (
    BuildingTypeID VARCHAR(10) NOT NULL,
    ItemID VARCHAR(20) NOT NULL,
    CapacityAmount INT NOT NULL CHECK (CapacityAmount >= 0),

    PRIMARY KEY (BuildingTypeID, ItemID),

    FOREIGN KEY (BuildingTypeID) REFERENCES BuildingTypes(BuildingTypeID)
        ON DELETE CASCADE,

    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
        ON DELETE CASCADE
);