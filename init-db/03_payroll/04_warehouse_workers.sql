CREATE TABLE WarehouseWorkers (
    WarehouseID VARCHAR(20) NOT NULL,     -- FK to Warehouses
    worker_id VARCHAR(20) NOT NULL,       -- FK to Payroll

    CONSTRAINT PK_WarehouseWorkers PRIMARY KEY (WarehouseID, worker_id),

    CONSTRAINT FK_WarehouseWorkers_Warehouses FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
        ON DELETE CASCADE,

    CONSTRAINT FK_WarehouseWorkers_Payroll FOREIGN KEY (worker_id)
        REFERENCES Payroll(worker_id)
        ON DELETE CASCADE
);