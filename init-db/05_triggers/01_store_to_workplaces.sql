DELIMITER $$

CREATE TRIGGER trg_InsertStoreToWorkplaces
AFTER INSERT ON Stores
FOR EACH ROW
BEGIN
    -- Insertar en Workplaces si no existe el WorkplaceID correspondiente al StoreID recién insertado
    IF NOT EXISTS (SELECT 1 FROM Workplaces WHERE WorkplaceID = NEW.StoreID) THEN
        INSERT INTO Workplaces (WorkplaceID, WorkplaceType)
        VALUES (NEW.StoreID, 'Store');
    END IF;
END $$

DELIMITER ;