FROM    alpine:latest

EXPOSE 22 80 443

RUN		apk update
RUN		apk upgrade
RUN		apk add nginx openssl
RUN		mkdir -p /run/nginx

COPY    setup.sh /
COPY    nginx.conf /etc/nginx/

#   setup pagina html

COPY    index.html mystile.css /var/www/html/

CMD     sh /setup.sh