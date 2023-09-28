#!/bin/bash

LOCATION=${pwd}
NAME=mysql_test
PASSWORD=654321
VERSION=5.7
PORT=3307

mkdir -p ${LOCATION}/conf ${LOCATION}/log ${LOCATION}/data

echo "
[client]
default-character-set=utf8
[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
init_connect='SET collation_connection = utf8_unicode_ci'
init_connect='SET NAMES utf8'
character-set-server=utf8
collation-server=utf8_unicode_ci
skip-character-set-client-handshake
symbolic-links=0
[mysql]
default-character-set = utf8
[mysqld_safe]
log-error=/var/log/mariadb/mariadb.log
pid-file=/var/run/mariadb/mariadb.pid
#
# include all files from the config directory
#" >> ${LOCATION}/conf/my.cnf

docker rm -f ${NAME}
docker run -p ${PORT}:3306 --name ${NAME} \
-v ${LOCATION}/log:/var/log/mysql \
-v ${LOCATION}/data:/var/lib/mysql \
-v ${LOCATION}/conf:/etc/mysql/mysql.conf.d \
-e MYSQL_ROOT_PASSWORD=${PASSWORD} \
-d mysql:${VERSION} --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
