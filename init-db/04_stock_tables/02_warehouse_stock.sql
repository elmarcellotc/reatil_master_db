-- Create the WarehouseStock table
CREATE TABLE WarehouseStock (
    WarehouseID VARCHAR(20) NOT NULL,
    sku VARCHAR(20) NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),

    CONSTRAINT PK_WarehouseStock PRIMARY KEY (WarehouseID, sku),

    CONSTRAINT FK_WarehouseStock_Warehouses FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
        ON DELETE CASCADE,

    CONSTRAINT FK_WarehouseStock_SKU FOREIGN KEY (sku)
        REFERENCES SKU(sku)
        ON DELETE CASCADE
);