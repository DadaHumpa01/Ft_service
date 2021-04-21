FROM    alpine:latest

#   espongo una porta php 5000

EXPOSE  5000

#   nginx

RUN		apk update
RUN		apk upgrade
RUN		apk add nginx
RUN		mkdir -p /run/nginx

#   php my admin

RUN     apk add php7-common php7-fpm php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-mbstring php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN     mkdir -p /usr/share/webapps/
RUN     wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN     tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN     mv phpMyAdmin-5.0.2-all-languages/ phpmyadmin
RUN     rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN     mv phpmyadmin/ /usr/share/webapps/
RUN     chmod -R 777 /usr/share/webapps/

COPY    /nginx.conf /etc/nginx/
COPY    config.inc.php ./

RUN     mv config.inc.php /usr/share/webapps/phpmyadmin/
RUN     ln -s /usr/share/webapps/phpmyadmin/ /var/www/html

CMD     php-fpm7 && nginx -g 'daemon off;'