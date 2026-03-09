CREATE TABLE BuildingTypeStockCapacity (
    BuildingTypeID VARCHAR(10) NOT NULL,
    sku VARCHAR(20) NOT NULL,
    CapacityAmount INT NOT NULL CHECK (CapacityAmount >= 0),

    PRIMARY KEY (BuildingTypeID, sku),

    FOREIGN KEY (BuildingTypeID) REFERENCES BuildingTypes(BuildingTypeID)
        ON DELETE CASCADE,

    FOREIGN KEY (sku) REFERENCES SKU(sku)
        ON DELETE CASCADE
);