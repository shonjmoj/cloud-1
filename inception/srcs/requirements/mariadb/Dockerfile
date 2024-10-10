FROM alpine:3.13

RUN apk update && apk upgrade
RUN apk add openrc mariadb mariadb-client supervisor telegraf
COPY ./srcs/mariadb-server.cnf /etc/my.cnf.d/
RUN openrc
RUN touch /run/openrc/softlevel
COPY ./srcs/setup.sh /tmp
COPY ./srcs/wordpress.sql /tmp
COPY ./srcs/supervisord.conf /etc
COPY ./srcs/telegraf.conf /etc

CMD sh /tmp/setup.sh && /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 3306 