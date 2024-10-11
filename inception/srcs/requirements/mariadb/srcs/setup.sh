#! /bin/sh

if [ ! -n "$(find /var/lib/mysql/ -mindepth 1 -maxdepth 1)" ];
then
	/etc/init.d/mariadb setup
	service mariadb start

	mysql -u root -e "CREATE DATABASE ${WORDPRESS_DATABASE_NAME};"
	sed 's/iounejja.42.fr/'"$DOMAIN"'/g' /tmp/wordpress.sql > /tmp/setup.sql
	mysql -u root -D $WORDPRESS_DATABASE_NAME < /tmp/setup.sql
	mysql -u root -e "CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PASSORD}';"
	mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_USER}'@'%';"
	mysql -u root -e "CREATE USER '${MARIADB_USER}'@'localhost' IDENTIFIED BY '${MARIADB_USER_PASSORD}';"
	mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_USER}'@'localhost';"
	mysql -u root -e "FLUSH PRIVILEGES;"
	mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"

	service mariadb stop
fi
