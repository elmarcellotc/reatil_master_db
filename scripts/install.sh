#!/bin/bash

# Validate environment variables
if [ -z "${MYSQL_ROOT_PASSWORD}" ]; then
    echo "You must define MYSQL_ROOT_PASSWORD"
    exit 1
fi

if [ -z "${MYSQL_ETL_PASSWORD}" ]; then
    echo "You must define MYSQL_ETL_PASSWORD"
    exit 1
fi

if [ -z "${MYSQL_ANALYST_PASSWORD}" ]; then
    echo "You must define MYSQL_ANALYST_PASSWORD"
    exit 1
fi

#!/bin/bash
set -e  # Exit immediately if any command fails

echo "=== Starting custom initialization ==="

# Wait for MySQL to be ready (important during container startup)
echo "Waiting for MySQL to be ready..."
while ! mysqladmin ping --silent; do
    sleep 2
done
echo "MySQL is up!"

# Optional: Ensure root@'%' exists and has full privileges
mysql -u root <<EOF
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED WITH caching_sha2_password BY '${MYSQL_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# Run the master init script (contains your schema, data, etc.)
echo "Executing 99_master_init.sql..."

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" < /init-db/99_master_init.sql

# Create ETL user
echo "Creating etl_retail_usr..."
mysql -u root <<EOF
CREATE USER IF NOT EXISTS 'etl_retail_usr'@'%' IDENTIFIED WITH caching_sha2_password BY '${MYSQL_ETL_PASSWORD}';
GRANT SELECT, INSERT, UPDATE, DELETE ON RetailMasterDB.* TO 'etl_retail_usr'@'%';
FLUSH PRIVILEGES;
EOF

# Create Analyst user
echo "Creating analyst_retail_user..."
mysql -u root <<EOF
CREATE USER IF NOT EXISTS 'analyst_retail_user'@'%' IDENTIFIED WITH caching_sha2_password BY '${MYSQL_ANALYST_PASSWORD}';
GRANT SELECT ON RetailMasterDB.* TO 'analyst_retail_user'@'%';
FLUSH PRIVILEGES;
EOF

# Verification
echo "=== Initialization complete ==="
mysql -u root -e "SELECT VERSION();"
mysql -u root -e "SHOW DATABASES;"
mysql -u root -D RetailMasterDB -e "SHOW TABLES;" || echo "RetailMasterDB does not exist or has no tables yet"

echo "=== Database installation completed successfully ==="