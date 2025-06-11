CREATE TABLE StoreWorkers (
    StoreID VARCHAR(20) NOT NULL,        -- FK to Stores
    WorkerID VARCHAR(20) NOT NULL,       -- FK to Payroll

    PRIMARY KEY (StoreID, WorkerID),

    FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON DELETE CASCADE,

    FOREIGN KEY (WorkerID)
        REFERENCES Payroll(worker_id)
        ON DELETE CASCADE
);