CREATE TABLE BuildingTypes (
    BuildingTypeID VARCHAR(10) PRIMARY KEY,       -- e.g. 'BMNS'
    BuildingModel VARCHAR(100) NOT NULL,          -- e.g. 'Mini Neighborhood Store'
    CustomersDailyCapacity INT NOT NULL           -- e.g. 300
);
