CREATE TABLE Workplaces (
    WorkplaceID VARCHAR(20) PRIMARY KEY,    -- e.g. unique ID for workplace
    WorkplaceType VARCHAR(10) NOT NULL,     -- Must be 'Store' or 'Warehouse',
    Store VARCHAR(10) NOT NULL,     -- Must be 'Store' or 'Warehouse' from their own tables,
    Warehouse VARCHAR(10) NOT NULL,

    CONSTRAINT CHK_Workplace_Type CHECK ( WorkplaceType IN ('Store', 'Warehouse') ),

    CONSTRAINT FK_Workplace_Store FOREIGN KEY (Store)
        REFERENCES Stores(StoreID),

    CONSTRAINT FK_Workplace_Warehouse FOREIGN KEY (Warehouse)
        REFERENCES Warehouses(WarehouseID)
);