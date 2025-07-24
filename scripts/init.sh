#!/bin/bash
if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
    echo "You must define MYSQL_ROOT_PASSWORD"
    mysqladmin -u root shutdown
    echo "MySQL is shutdown"
    exit 1
fi

if [ -z "$MYSQL_ETL_PASSWORD" ]; then
    echo "You must define MYSQL_ETL_PASSWORD"
    mysqladmin -u root shutdown
    echo "MySQL is shutdown"
    exit 1
fi

if [ -z "$MYSQL_ANALYST_PASSWORD" ]; then
    echo "You must define MYSQL_ANALYST_PASSWORD"
    mysqladmin -u root shutdown
    echo "MySQL is shutdown"
    exit 1
fi

set -e

echo "Container started"

echo "Starting MySQL in background..."
mysqld_safe --user=mysql --datadir=/var/lib/mysql --bind-address=0.0.0.0 &

# Wait until my sql be ready
until mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "SELECT 1;"; do
    echo "Waiting 10 seconds for mysqld to be up..."
    sleep 10
done

echo "MySQL started"

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "SELECT VERSION();"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "SHOW DATABASES;"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -D RetailMasterDB -e "SHOW TABLES;"