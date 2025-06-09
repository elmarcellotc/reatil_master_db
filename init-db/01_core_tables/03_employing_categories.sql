-- Table for allowed employee categories with constraints
CREATE TABLE EmployingCategories (
    EmployCategoryID NVARCHAR(10) PRIMARY KEY,            -- e.g. 'ESC'
    CategoryName NVARCHAR(100) NOT NULL,                           -- e.g. 'Stock Clerk'
    MaxHiringDaysAllowed INT CHECK (MaxHiringDaysAllowed BETWEEN 2 AND 5) NOT NULL,              
    MaxHiringDailyHoursAllowed INT CHECK (MaxHiringDailyHoursAllowed BETWEEN 4 AND 8) NOT NULL,
    MinHourlyPayment DECIMAL(10, 2) CHECK (MinHourlyPayment >= 2.00) NOT NULL,
    MaxHourlyPayment DECIMAL(10, 2) CHECK (MaxHourlyPayment <= 50.00) NOT NULL
);
GO
