-- Create a normalized table for minimum employees per category per building type
CREATE TABLE BuildingTypeMinimumEmployees (
    BuildingTypeID VARCHAR(10) NOT NULL,
    EmployCategoryID VARCHAR(10) NOT NULL,
    MinimumRequired INT NOT NULL CHECK (MinimumRequired >= 0),

    PRIMARY KEY (BuildingTypeID, EmployCategoryID),

    FOREIGN KEY (BuildingTypeID) REFERENCES BuildingTypes(BuildingTypeID)
        ON DELETE CASCADE,

    FOREIGN KEY (EmployCategoryID) REFERENCES EmployingCategories(EmployCategoryID)
        ON DELETE CASCADE
);
