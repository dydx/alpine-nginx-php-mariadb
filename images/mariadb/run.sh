#!/bin/bash
MYSQL_HOME="/var/lib/mysql"

if [[ ! -d MYSQL_HOME/mysql ]]; then
    mysql_install_db > /dev/null 2>&1
    mysqld_safe > /dev/null 2>&1 &
    RET=1
    while [[ RET -ne 0 ]]; do
        echo "# Hum... waiting MariaDB startup."
        sleep 5
        mysql -uroot -e "status" > /dev/null 2>&1
        RET=$?
    done
    mysql -uroot -e "CREATE USER 'homestead'@'%' IDENTIFIED BY 'secret'"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'homestead'@'%' WITH GRANT OPTION"
    echo "# Hi! Connect to this MariaDB Server using: mysql -uhomestead -psecret -h<host> -P<port>"
    mysqladmin -uroot shutdown
else
    echo "# Hello again!"
fi

exec mysqld_safe