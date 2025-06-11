-- Create the Locations table
CREATE TABLE Locations (
    LocationID VARCHAR(20) PRIMARY KEY,     -- e.g. 'MRNDCHCLPG'
    Sector VARCHAR(100) NOT NULL,           -- e.g. 'Los Palos Grandes'
    Municipality VARCHAR(100) NOT NULL,     -- e.g. 'Chacao'
    StateName VARCHAR(100) NOT NULL         -- e.g. 'Miranda'
);