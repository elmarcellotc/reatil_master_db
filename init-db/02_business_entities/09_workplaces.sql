CREATE TABLE Workplaces (
    WorkplaceID VARCHAR(20) PRIMARY KEY,              -- e.g. unique ID for workplace
    WorkplaceType ENUM('Store', 'Warehouse') NOT NULL -- Must be 'Store' or 'Warehouse'
);