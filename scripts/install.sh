# Update the server

# Validación de que las variables de entorno estén definidas
if [ -z "${MYSQL_ROOT_PASSWORD}" ]; then
    echo $MYSQL_ROOT_PASSWORD
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

apt-get update

# Install mysql

echo "Installing MySQL"

apt-get install -y mysql-server=8.0.42-0ubuntu0.24.04.1

rm -rf /var/lib/mysql/*
mkdir -p /var/run/mysqld
chown mysql:mysql /var/run/mysqld
chmod 755 /var/run/mysqld

mysqld --initialize-insecure --user=mysql --datadir=/var/lib/mysql

mysqld_safe --user=mysql --datadir=/var/lib/mysql --skip-networking &

until mysql -u root -e "SELECT 1;"; do
    echo "Waiting 3 seconds for mysqld to be up..."
    sleep 3
done

mysql -u root -e "
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
"

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" < init-db/99_master_init.sql

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "SELECT VERSION();"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "SHOW DATABASES;"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -D RetailMasterDB -e "SHOW TABLES;"

# Crear usuario etl user con permisos de INSERT
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "
CREATE USER IF NOT EXISTS 'etl'@'%' IDENTIFIED BY '${MYSQL_ETL_PASSWORD}';
GRANT INSERT ON RetailMasterDB.* TO 'etl'@'%';
"

# Crear usuario analyst con permisos de solo lectura (SELECT)
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "
CREATE USER IF NOT EXISTS 'analyst'@'%' IDENTIFIED BY '${MYSQL_ANALYST_PASSWORD}';
GRANT SELECT ON RetailMasterDB.* TO 'analyst'@'%';
"

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

echo "Users propertly added"


mysqladmin -u root shutdown

echo "MySQL has been shutdown"