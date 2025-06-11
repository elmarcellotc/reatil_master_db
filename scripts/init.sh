#!/bin/bash
set -e

echo "Container started"

# Arrancar mysqld en background sin red para evitar riesgos mientras inicializamos
mysqld_safe --user=mysql --datadir=/var/lib/mysql

# Esperar a que MySQL esté listo
until mysqladmin ping --silent; do
    echo "Waiting for mysqld to be up..."
    sleep 1
done

echo "MySQL started"

systemctl status mysql