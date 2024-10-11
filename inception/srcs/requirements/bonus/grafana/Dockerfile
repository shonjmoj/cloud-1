FROM alpine:3.13

RUN apk update && apk upgrade
RUN apk add libc6-compat supervisor telegraf
RUN cd /tmp && wget https://dl.grafana.com/enterprise/release/grafana-enterprise-8.2.2.linux-amd64.tar.gz && tar -zxvf grafana-enterprise-8.2.2.linux-amd64.tar.gz && mv grafana-8.2.2 ../grafana
COPY ./srcs/supervisord.conf /etc
COPY ./srcs/telegraf.conf /etc
COPY ./srcs/grafana.db /grafana/data/
COPY ./srcs/defaults.ini /grafana/conf/

CMD /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 3000
