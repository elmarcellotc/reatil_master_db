CREATE TABLE Locations (
    LocationID NVARCHAR(20) PRIMARY KEY, -- e.g. 'MRNDCHCLPG'
    Sector NVARCHAR(100) NOT NULL,       -- e.g. 'Los Palos Grandes'
    Municipality NVARCHAR(100) NOT NULL, -- e.g. 'Chacao'
    State NVARCHAR(100) NOT NULL         -- e.g. 'Miranda'
);
GO