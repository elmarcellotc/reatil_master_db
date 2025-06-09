CREATE TABLE Workplaces (
    WorkplaceID NVARCHAR(20) PRIMARY KEY,
    WorkplaceType NVARCHAR(20) CHECK (WorkplaceType IN ('Store', 'Warehouse'))
);