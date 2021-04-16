#!/bin/sh

openrc default
openrc boot

/etc/init.d/mariadb setup

echo "create database wordpress;" | mysql
echo "grant all on *.* to 'admin'@'%' identified by 'password' with grant option; flush privileges;" | mysql

rc-service mariadb start

mysql wpdb < wordpress.sql

rc-service mariadb stop
/usr/bin/mysqld_safe