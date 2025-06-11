CREATE TABLE MinimumSellQuantities (
    BuildingModel VARCHAR(10) NOT NULL,   -- FK to BuildingTypes
    ItemID VARCHAR(20) NOT NULL,          -- FK to Items
    MinimumQuantity INT NOT NULL,         -- Minimum quantity, must be >= 0

    PRIMARY KEY (BuildingModel, ItemID),

    FOREIGN KEY (BuildingModel)
        REFERENCES BuildingTypes(BuildingTypeID),

    FOREIGN KEY (ItemID)
        REFERENCES Items(ItemID),

    CHECK (MinimumQuantity >= 0)
);