#!/bin/bash

if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
    echo "You must define MYSQL_ROOT_PASSWORD"
    exit 1
fi

if [ -z "$MYSQL_ETL_PASSWORD" ]; then
    echo "You must define MYSQL_ETL_PASSWORD"
    exit 1
fi

if [ -z "$MYSQL_ANALYST_PASSWORD" ]; then
    echo "You must define MYSQL_ANALYST_PASSWORD"
    exit 1
fi

echo "Container started"

echo "Starting MySQL in background..."
mysql -h localhost -P 3306 --protocol=tcp --user=mysql &

echo "MySQL started"

# Run verification queries

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "SELECT VERSION();"

mysql -h localhost -P 3306 --protocol=tcp -u root -p"${MYSQL_ROOT_PASSWORD}" -e "SELECT VERSION();"
mysql -h localhost -P 3306 --protocol=tcp -u root -p"${MYSQL_ROOT_PASSWORD}" -e "SHOW DATABASES;"
mysql -h localhost -P 3306 --protocol=tcp -u root -p"${MYSQL_ROOT_PASSWORD}" -D RetailMasterDB -e "SHOW TABLES;"

# Keep container running
wait