# Update the server

apt-get update

# Install mysql

apt-get install -y mysql-server

rm -rf /var/lib/mysql/*

mkdir -p /var/run/mysqld
chown mysql:mysql /var/run/mysqld
chmod 755 /var/run/mysqld

mysqld --initialize-insecure --user=mysql --datadir=/var/lib/mysql

# Arrancar mysqld en background sin red para evitar riesgos mientras inicializamos
mysqld_safe --user=mysql --datadir=/var/lib/mysql --skip-networking &

# Esperar a que MySQL esté listo
until mysqladmin ping --silent; do
    echo "Waiting for mysqld to be up..."
    sleep 1
done

# Ejecutar script SQL
mysql -u root < init-db/99_master_init.sql

# Apagar MySQL para que el contenedor pueda iniciar MySQL normalmente luego
mysqladmin -u root shutdown