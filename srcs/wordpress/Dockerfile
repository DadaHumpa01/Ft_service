FROM    alpine:latest

#   espongo una porta per wordpress 5050

EXPOSE  5050

#   nginx

RUN		apk update
RUN		apk upgrade
RUN		apk add nginx
RUN		mkdir -p /run/nginx

#   php

RUN     apk add php7-common php7-session php7-fpm php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

#   wordpress installazione

RUN     wget http://wordpress.org/latest.tar.gz
RUN     tar -xzvf latest.tar.gz
RUN     rm latest.tar.gz
RUN     mv wordpress/ /usr/share/webapps/
RUN     ln -s /usr/share/webapps /var/www/html

COPY    setup.sh /
COPY    nginx.conf /etc/nginx/
COPY    wp-config.php /usr/share/webapps/

CMD     sh /setup.sh