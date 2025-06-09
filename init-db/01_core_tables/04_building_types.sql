-- Create the BuildingTypes table
CREATE TABLE BuildingTypes (
    BuildingTypeID NVARCHAR(10) PRIMARY KEY,  -- e.g. 'BMNS'
    BuildingModel NVARCHAR(100) NOT NULL,     -- e.g. 'Mini Neighborhood Store'
    CustomersDailyCapacity INT NOT NULL,      -- e.g. 300
);
GO