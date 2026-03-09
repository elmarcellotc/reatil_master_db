CREATE TABLE Workplaces (
    WorkplaceID VARCHAR(20) PRIMARY KEY,

    WorkplaceType VARCHAR(10) NOT NULL 
        CHECK (WorkplaceType IN ('Store', 'Warehouse')),

    -- Reference to Stores table (NULL if this is a Warehouse workplace)
    StoreID VARCHAR(20) NULL,

    -- Reference to Warehouses table (NULL if this is a Store workplace)
    WarehouseID VARCHAR(20) NULL,

    -- Foreign keys
    CONSTRAINT fk_workplaces_store 
        FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
        ON DELETE RESTRICT,

    CONSTRAINT fk_workplaces_warehouse 
        FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID)
        ON DELETE RESTRICT,

    -- Ensure exactly one of StoreID or WarehouseID is filled, matching WorkplaceType

    CONSTRAINT chk_store_only_if_store
        CHECK (WorkplaceType = 'Store' OR StoreID IS NULL),

    CONSTRAINT chk_warehouse_only_if_warehouse
        CHECK (WorkplaceType = 'Warehouse' OR WarehouseID IS NULL)
);