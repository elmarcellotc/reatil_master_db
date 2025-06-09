-- Items table: master list of allowed items
CREATE TABLE Items (
    ItemID NVARCHAR(20) PRIMARY KEY, -- e.g. 'CHKN000000001'
    ItemName NVARCHAR(100) NOT NULL, -- e.g. 'chicken'
    Unit NVARCHAR(50) NOT NULL       -- e.g. 'grams'
);
GO