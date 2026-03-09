CREATE TABLE WarehouseWorkers (
    WarehouseID VARCHAR(20) NOT NULL,     -- FK to Warehouses
    WorkerID VARCHAR(20) NOT NULL,        -- FK to Payroll

    CONSTRAINT PK_WarehouseWorkers PRIMARY KEY (WarehouseID, WorkerID),

    CONSTRAINT FK_WarehouseWorkers_Warehouses 
        FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
        ON DELETE CASCADE,

    CONSTRAINT FK_WarehouseWorkers_Payroll 
        FOREIGN KEY (WorkerID)
        REFERENCES Payroll(worker_id)
        ON DELETE CASCADE
);