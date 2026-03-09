DELIMITER $$

CREATE TRIGGER trg_InsertWarehouseToWorkplaces
AFTER INSERT ON Warehouses
FOR EACH ROW
BEGIN
    -- Insertar en Workplaces si no existe el WorkplaceID correspondiente al WarehouseID recién insertado
    IF NOT EXISTS (SELECT 1 FROM Workplaces WHERE WorkplaceID = NEW.WarehouseID) THEN
        INSERT INTO Workplaces (WorkplaceID, WorkplaceType)
        VALUES (NEW.WarehouseID, 'Warehouse');
    END IF;
END $$

DELIMITER ;