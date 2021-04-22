FROM	alpine

EXPOSE  21 30000 30001 30002 30003

RUN		apk update
RUN		apk upgrade
RUN     apk add vsftpd
RUN     apk add openssl
RUN     apk add openrc

COPY    setup.sh ./
COPY    vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN     chmod +x setup.sh

RUN     mkdir -p /etc/vsftpd/
RUN     mkdir -p /home/ftptest/

ENTRYPOINT  ./setup.sh
