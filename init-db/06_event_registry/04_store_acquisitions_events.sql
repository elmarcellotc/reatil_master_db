CREATE TABLE StoreAcquisitionEvents (
    EventID VARCHAR(30) PRIMARY KEY,               -- e.g. 'BGHSLPGMNS000000001H8D7M7Y2019'
    StoreID VARCHAR(20) NOT NULL,                   -- FK to Stores
    Datetime DATETIME NOT NULL,                      -- Acquisition datetime
    TotalExpenses DECIMAL(14, 2) NOT NULL CHECK (TotalExpenses >= 0),

    CONSTRAINT FK_AcqEvents_Stores FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON DELETE CASCADE
);