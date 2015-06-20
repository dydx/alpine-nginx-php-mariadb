#!/bin/sh

VOLUME_HOME="/var/lib/mysql"

if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> an empty or uninitialized MariaDB volume is detected"
    echo "=> installing MariaDB"
    mysql_install_db > /dev/null 2>&1
    echo "=> done!"
    /mariadb_init.sh
else
    echo "=> using an existing MariaDB volume"
fi

exec mysqld_safe