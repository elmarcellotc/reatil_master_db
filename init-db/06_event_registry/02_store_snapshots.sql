CREATE TABLE StoreInventorySnapshots (
    SnapshotID NVARCHAR(30) PRIMARY KEY,         -- e.g. 'STRLPGMNS000000001H8D2M2Y2019'
    StoreID NVARCHAR(20) NOT NULL,               -- FK to Stores(StoreID)
    Datetime DATETIME NOT NULL,                  -- e.g. '2019-02-01 08:00:00'
    AccountBalance DECIMAL(14, 2) NOT NULL CHECK (AccountBalance >= 0),

    CONSTRAINT FK_Snapshots_Stores FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON DELETE CASCADE
);
GO