CREATE TABLE MinimumSellQuantities (
    BuildingModel VARCHAR(10) NOT NULL,   -- FK to BuildingTypes
    sku VARCHAR(20) NOT NULL,          -- FK to SKU
    MinimumQuantity INT NOT NULL,         -- Minimum quantity, must be >= 0

    PRIMARY KEY (BuildingModel, sku),

    FOREIGN KEY (BuildingModel)
        REFERENCES BuildingTypes(BuildingTypeID),

    FOREIGN KEY (sku)
        REFERENCES SKU(sku),

    CHECK (MinimumQuantity >= 0)
);