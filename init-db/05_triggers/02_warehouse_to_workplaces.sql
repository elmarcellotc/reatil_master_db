CREATE TRIGGER trg_InsertWarehouseToWorkplaces
ON Warehouses
AFTER INSERT
AS
BEGIN
    INSERT INTO Workplaces (WorkplaceID, WorkplaceType)
    SELECT WarehouseID, 'Warehouse'
    FROM inserted
    WHERE NOT EXISTS (
        SELECT 1 FROM Workplaces WHERE WorkplaceID = inserted.WarehouseID
    );
END;