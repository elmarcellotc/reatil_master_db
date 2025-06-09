:r .\00_create_database.sql

-- Core tables
:r .\01_core_tables\01_items.sql
:r .\01_core_tables\02_locations.sql
:r .\01_core_tables\03_employ_categories.sql
:r .\01_core_tables\04_building_types.sql
:r .\01_core_tables\05_building_type_stock_capacity.sql
:r .\01_core_tables\06_building_type_minimum_employees.sql

-- Business entities
:r .\02_business_entities\01_stores.sql
:r .\02_business_entities\02_store_prices.sql
:r .\02_business_entities\03_store_workers.sql
:r .\02_business_entities\04_warehouses.sql
:r .\02_business_entities\05_warehouse_prices.sql
:r .\02_business_entities\06_warehouse_min_sell_qty.sql
:r .\02_business_entities\07_warehouse_workers.sql
:r .\02_business_entities\08_warehouse_stores.sql
:r .\02_business_entities\09_workplaces.sql

-- Stock tables
:r .\03_stock_tables\01_store_stock.sql
:r .\03_stock_tables\02_warehouse_stock.sql

-- Payroll
:r .\04_payroll\01_payroll.sql

-- Triggers
:r .\05_triggers\01_store_to_workplaces.sql
:r .\05_triggers\02_warehouse_to_workplaces.sql

-- Events registry

:r .\06_event_registry\01_store_sales.sql
:r .\06_event_registry\02_store_snapshots.sql
:r .\06_event_registry\03_store_inventory_snapshots.sql
:r .\06_event_registry\04_store_acquisitions_events.sql
:r .\06_event_registry\05_store_acquisitions_items.sql