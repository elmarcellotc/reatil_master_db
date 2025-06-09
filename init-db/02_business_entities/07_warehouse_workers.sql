CREATE TABLE WarehouseWorkers (
    WarehouseID NVARCHAR(20) NOT NULL,
    worker_id NVARCHAR(20) NOT NULL,

    CONSTRAINT PK_WarehouseWorkers PRIMARY KEY (WarehouseID, worker_id),

    CONSTRAINT FK_WarehouseWorkers_Warehouses FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
        ON DELETE CASCADE,

    CONSTRAINT FK_WarehouseWorkers_Payroll FOREIGN KEY (worker_id)
        REFERENCES Payroll(worker_id)
        ON DELETE CASCADE
);
GO