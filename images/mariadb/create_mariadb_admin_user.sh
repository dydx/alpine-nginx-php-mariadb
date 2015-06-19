#!/bin/sh

/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MariaDB service startup"
    sleep 15
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

echo "=> Creating MariaDB 'homestead' user with 'secret' password"

mysql -uroot -e "CREATE USER 'homestead'@'%' IDENTIFIED BY 'password'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'homestead'@'%' WITH GRANT OPTION"

echo "=> Done!"

echo "========================================================================"
echo "You can now connect to this MariaDB Server using:"
echo ""
echo "    mysql -uhomestead -psecret -h<host> -P<port>"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "MariaDB user 'root' has no password but only allows local connections"
echo "========================================================================"

mysqladmin -uroot shutdown