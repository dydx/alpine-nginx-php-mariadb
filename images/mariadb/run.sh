#!/bin/bash

MYSQL_HOME = "/var/lib/mysql"

if [[! -d MYSQL_HOME/mysql]]; then
    echo "=> initial MariaDB configuration"
    mysql_install_db > /dev/null 2>&1
    mysqld_safe > /dev/null 2>&1
    RET=1
    while [[ RET -ne 0 ]]; do
        echo "=> waiting for MariaDB to start"
        sleep 10
        mysql -uroot -e "status" > /dev/null 2>&1
        RET=$?
    done
    mysql -uroot -e "CREATE USER 'homestead'@'%' IDENTIFIED BY 'secret'"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'homestead'@'%' WITH GRANT OPTION"
    mysql -uroot -e "FLUSH PRIVILEGES"
    mysql -uroot -e "CREATE SCHEMA homestead"

    echo "=> If all went well, you may connect to mysql as 'homestead' with the password 'secret'"
    mysqladmin -uroot shutdown
else
    echo "=> using existing MariaDB setup"
fi

exec mysqld_safe