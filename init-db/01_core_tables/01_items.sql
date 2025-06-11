-- Items table: master list of allowed items
CREATE TABLE Items (
    ItemID VARCHAR(20) PRIMARY KEY,    -- e.g. 'CHKN000000001'
    ItemName VARCHAR(100) NOT NULL,    -- e.g. 'chicken'
    Unit VARCHAR(50) NOT NULL          -- e.g. 'grams'
);
