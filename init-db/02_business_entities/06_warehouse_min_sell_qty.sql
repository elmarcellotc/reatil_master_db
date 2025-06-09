CREATE TABLE MinimumSellQuantities (
    BuildingModel NVARCHAR(10) NOT NULL,
    ItemID NVARCHAR(20) NOT NULL,
    MinimumQuantity INT NOT NULL CHECK (MinimumQuantity >= 0),

    CONSTRAINT PK_MinSellQty PRIMARY KEY (BuildingModel, ItemID),

    CONSTRAINT FK_MinSellQty_BuildingTypes FOREIGN KEY (BuildingModel)
        REFERENCES BuildingTypes(BuildingTypeID),

    CONSTRAINT FK_MinSellQty_Items FOREIGN KEY (ItemID)
        REFERENCES Items(ItemID)
);
GO