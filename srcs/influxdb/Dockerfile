FROM    alpine

EXPOSE 8086

RUN		apk add --update
RUN     apk add --upgrade influxdb

COPY    setup.sh ./setup.sh
RUN		chmod 755 ./setup.sh

CMD     ./setup.sh