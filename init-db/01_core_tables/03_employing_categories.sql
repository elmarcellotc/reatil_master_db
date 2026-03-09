CREATE TABLE EmployingCategories (
    EmployCategoryID VARCHAR(10) PRIMARY KEY,                 -- e.g. 'ESC'
    CategoryName VARCHAR(100) NOT NULL,                       -- e.g. 'Stock Clerk'
    MaxHiringDaysAllowed INT NOT NULL CHECK (MaxHiringDaysAllowed BETWEEN 2 AND 5),
    MaxHiringDailyHoursAllowed INT NOT NULL CHECK (MaxHiringDailyHoursAllowed BETWEEN 4 AND 8),
    MinHourlyPayment DECIMAL(10, 2) NOT NULL CHECK (MinHourlyPayment >= 2.00),
    MaxHourlyPayment DECIMAL(10, 2) NOT NULL CHECK (MaxHourlyPayment <= 50.00)
);
