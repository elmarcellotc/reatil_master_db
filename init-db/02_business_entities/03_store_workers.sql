CREATE TABLE StoreWorkers (
    StoreID NVARCHAR(20) NOT NULL,
    WorkerID NVARCHAR(20) NOT NULL,

    CONSTRAINT PK_StoreWorkers PRIMARY KEY (StoreID, WorkerID),

    CONSTRAINT FK_StoreWorkers_Stores FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON DELETE CASCADE,

    CONSTRAINT FK_StoreWorkers_Payroll FOREIGN KEY (WorkerID)
        REFERENCES Payroll(worker_id)
        ON DELETE CASCADE
);
GO