#! /bin/sh

adduser -D $MARIADB_USER
echo "$MARIADB_USER:$MARIADB_USER_PASSORD" | chpasswd