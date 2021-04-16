#!/bin/sh

mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/42roma.pem -keyout /etc/nginx/ssl/42roma.key -subj "/C=IT/ST=Napoli/L=Napoli/O=42 School/OU=Napoleone/CN=42roma"

nginx -g 'daemon off;'