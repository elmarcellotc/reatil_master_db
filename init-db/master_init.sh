#!/bin/bash
set -e  # Stop on any error

echo "=== Starting RetailMasterDB installation ==="

# Wait for MySQL to be ready
echo "Waiting for MySQL server to be ready..."
while ! mysqladmin ping --silent; do
    sleep 2
done
echo "MySQL is up and running!"

# Optional: Create database if it doesn't exist (safe even if already created)
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "
CREATE DATABASE IF NOT EXISTS RetailMasterDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER DATABASE RetailMasterDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
"

echo "Executing SQL initialization scripts in order..."

# Core tables
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/01_core_tables/01_SKU.sql
echo "01_core_tables/01_SKU.sql"

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/01_core_tables/02_locations.sql
echo "01_core_tables/02_locations.sql"

# Fix collation on Locations table
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" -e "ALTER TABLE Locations CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
echo "utf8mb4_unicode_ci selected"

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/01_core_tables/03_employing_categories.sql
echo "01_core_tables/03_employing_categories.sql"

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/01_core_tables/04_building_types.sql
echo "01_core_tables/04_building_types.sql"

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/01_core_tables/05_building_type_stock_capacity.sql
echo "01_core_tables/05_building_type_stock_capacity.sql"

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/01_core_tables/06_building_type_minimum_employees.sql
echo "01_core_tables/06_building_type_minimum_employees.sql"

# Infrastructure
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/02_infrastructure/01_stores.sql
echo "02_infrastructure/01_stores.sql"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/02_infrastructure/02_warehouses.sql
echo "02_infrastructure/02_warehouses.sql"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/02_infrastructure/03_store_prices.sql
echo "02_infrastructure/03_store_prices.sql"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/02_infrastructure/04_warehouse_prices.sql
echo "02_infrastructure/04_warehouse_prices.sql"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/02_infrastructure/05_warehouse_min_sell_qty.sql
echo "02_infrastructure/05_warehouse_min_sell_qty.sql"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/02_infrastructure/06_warehouse_stores.sql
echo "02_infrastructure/06_warehouse_stores.sql"

# Payroll
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/03_payroll/01_workplaces.sql
echo "03_payroll/01_workplaces.sql"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/03_payroll/02_payroll.sql
echo "03_payroll/02_payroll.sql"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/03_payroll/03_store_workers.sql
echo "03_payroll/03_store_workers.sql"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" < /init-db/03_payroll/04_warehouse_workers.sql
echo "03_payroll/04_warehouse_workers.sql"

# Stock tables
mysql -u root -p"${MYSQL_ROOT_PASSWORD}"  "RetailMasterDB" < /init-db/04_stock_tables/01_store_stock.sql
echo "04_stock_tables/01_store_stock.sql"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}"  "RetailMasterDB" < /init-db/04_stock_tables/02_warehouse_stock.sql
echo "04_stock_tables/02_warehouse_stock.sql"

# Triggers
mysql -u root -p"${MYSQL_ROOT_PASSWORD}"  "RetailMasterDB" < /init-db/05_triggers/01_store_to_workplaces.sql
echo "05_triggers/01_store_to_workplaces.sql"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}"  "RetailMasterDB" < /init-db/05_triggers/02_warehouse_to_workplaces.sql
echo "05_triggers/02_warehouse_to_workplaces.sql"

# Events registry
mysql -u root -p"${MYSQL_ROOT_PASSWORD}"  "RetailMasterDB" < /init-db/06_event_registry/01_store_sales.sql
echo "06_event_registry/01_store_sales.sql"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}"  "RetailMasterDB" < /init-db/06_event_registry/02_store_snapshots.sql
echo "06_event_registry/02_store_snapshots.sql"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}"  "RetailMasterDB" < /init-db/06_event_registry/03_store_inventory_snapshots.sql
echo "06_event_registry/03_store_inventory_snapshots.sql"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}"  "RetailMasterDB" < /init-db/06_event_registry/04_store_acquisitions_events.sql
echo "06_event_registry/04_store_acquisitions_events.sql"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}"  "RetailMasterDB" < /init-db/06_event_registry/05_store_acquisitions_SKU.sql
echo "06_event_registry/05_store_acquisitions_SKU.sql"

echo "=== Database installation completed successfully! ==="
echo "Database: RetailMasterDB"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "RetailMasterDB" -e "SHOW TABLES;" | cat  # Pretty output