-- Create a normalized table for minimum employees per category per building type
CREATE TABLE BuildingTypeMinimumEmployees (
    BuildingTypeID NVARCHAR(10) NOT NULL,
    EmployCategoryID NVARCHAR(10) NOT NULL,
    MinimumRequired INT NOT NULL CHECK (MinimumRequired >= 0),

    CONSTRAINT PK_BuildingTypeMinimumEmployees PRIMARY KEY (BuildingTypeID, EmployCategoryID),

    CONSTRAINT FK_BuildingTypeMinimumEmployees_BuildingTypes FOREIGN KEY (BuildingTypeID)
        REFERENCES BuildingTypes(BuildingTypeID)
        ON DELETE CASCADE,

    CONSTRAINT FK_BuildingTypeMinimumEmployees_EmployCategories FOREIGN KEY (EmployCategoryID)
        REFERENCES EmployCategories(EmployCategoryID)
        ON DELETE CASCADE
);
GO