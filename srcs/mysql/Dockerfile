FROM    alpine:latest

EXPOSE  3306

RUN		apk update
RUN		apk upgrade
RUN     apk add openrc
RUN     apk add mariadb mariadb-common mariadb-client

RUN     mkdir /run/mysqld

COPY    setup.sh /
COPY    wordpress.sql ./
CMD     sh setup.sh