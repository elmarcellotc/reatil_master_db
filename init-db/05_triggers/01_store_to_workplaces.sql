CREATE TRIGGER trg_InsertStoreToWorkplaces
ON Stores
AFTER INSERT
AS
BEGIN
    INSERT INTO Workplaces (WorkplaceID, WorkplaceType)
    SELECT StoreID, 'Store'
    FROM inserted
    WHERE NOT EXISTS (
        SELECT 1 FROM Workplaces WHERE WorkplaceID = inserted.StoreID
    );
END;