FROM	alpine



COPY	setup.sh init_file my.cnf ./

COPY	wpdb.sql ./
COPY	dump.sh ./

RUN		apk update && \
		apk add --no-cache mysql mysql-client openrc

RUN		mv my.cnf /etc/

RUN		mkdir /run/mysqld

EXPOSE	3306

RUN     chmod 755 ./setup.sh
RUN     chmod 755 ./dump.sh

ENTRYPOINT	./setup.sh