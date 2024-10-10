FROM alpine:3.13

RUN apk update && apk upgrade
RUN apk add redis supervisor telegraf
COPY ./srcs/redis.conf /etc/
COPY ./srcs/supervisord.conf /etc
COPY ./srcs/telegraf.conf /etc

CMD /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 6379