CREATE TABLE Payroll (
    worker_id NVARCHAR(20) PRIMARY KEY,
    worker_category NVARCHAR(10) NOT NULL,
    id_card_number INT NOT NULL UNIQUE,
    last_name1 NVARCHAR(50) NOT NULL,
    last_name2 NVARCHAR(50),
    name1 NVARCHAR(50) NOT NULL,
    name2 NVARCHAR(50),
    gender NVARCHAR(10) NOT NULL,
    ethnic NVARCHAR(50),
    age INT NOT NULL,
    dependents INT NOT NULL DEFAULT 0,
    workplace_id NVARCHAR(20) NOT NULL,
    hourly_salary DECIMAL(10, 2) NOT NULL,

    CONSTRAINT FK_Payroll_EmployCategory FOREIGN KEY (worker_category)
        REFERENCES EmployCategories(EmployCategoryID),

    CONSTRAINT FK_Payroll_Workplace FOREIGN KEY (workplace_id)
        REFERENCES Workplaces(WorkplaceID),

    CONSTRAINT CHK_Payroll_Gender CHECK (gender IN ('male', 'female')),
    CONSTRAINT CHK_Payroll_Age CHECK (age >= 16),
    CONSTRAINT CHK_Payroll_HourlySalary CHECK (hourly_salary >= 5),
    CONSTRAINT CHK_Payroll_Dependents CHECK (dependents >= 0)
);