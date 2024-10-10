FROM alpine:3.13

RUN apk update && apk upgrade
RUN apk add influxdb openrc supervisor telegraf
COPY ./srcs/influxdb.conf /etc
COPY ./srcs/setup.sh /tmp
COPY ./srcs/supervisord.conf /etc
COPY ./srcs/telegraf.conf /etc
RUN mkdir /usr/local/share/collectd
RUN openrc
RUN touch /run/openrc/softlevel

CMD if [ ! -d /var/lib/influxdb/data/collectd ]; then sh /tmp/setup.sh; fi && /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 8086