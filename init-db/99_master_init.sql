SOURCE ./init-db/00_create_database.sql;

USE RetailMasterDB;

ALTER DATABASE RetailMasterDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Core tables
SOURCE ./init-db/01_core_tables/01_items.sql;
SOURCE ./init-db/01_core_tables/02_locations.sql;
ALTER TABLE Locations CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
SOURCE ./init-db/01_core_tables/03_employing_categories.sql;
SOURCE ./init-db/01_core_tables/04_building_types.sql;
SOURCE ./init-db/01_core_tables/05_building_type_stock_capacity.sql;
SOURCE ./init-db/01_core_tables/06_building_type_minimum_employees.sql;

-- Business entities
SOURCE ./init-db/02_business_entities/04_warehouses.sql;

SOURCE ./init-db/02_business_entities/09_workplaces.sql;

-- Payroll
SOURCE ./init-db/04_payroll/01_payroll.sql;

-- Business entities

SOURCE ./init-db/02_business_entities/01_stores.sql;
SOURCE ./init-db/02_business_entities/02_store_prices.sql;
SOURCE ./init-db/02_business_entities/03_store_workers.sql;

SOURCE ./init-db/02_business_entities/05_warehouse_prices.sql;
SOURCE ./init-db/02_business_entities/06_warehouse_min_sell_qty.sql;
SOURCE ./init-db/02_business_entities/07_warehouse_workers.sql;
SOURCE ./init-db/02_business_entities/08_warehouse_stores.sql;


-- Stock tables
SOURCE ./init-db/03_stock_tables/01_store_stock.sql;
SOURCE ./init-db/03_stock_tables/02_warehouse_stock.sql;

-- Triggers
SOURCE ./init-db/05_triggers/01_store_to_workplaces.sql;
SOURCE ./init-db/05_triggers/02_warehouse_to_workplaces.sql;

-- Events registry
SOURCE ./init-db/06_event_registry/01_store_sales.sql;
SOURCE ./init-db/06_event_registry/02_store_snapshots.sql;
SOURCE ./init-db/06_event_registry/03_store_inventory_snapshots.sql;
SOURCE ./init-db/06_event_registry/04_store_acquisitions_events.sql;
SOURCE ./init-db/06_event_registry/05_store_acquisitions_items.sql;