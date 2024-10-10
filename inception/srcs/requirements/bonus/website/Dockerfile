FROM alpine:3.13

RUN apk update && apk upgrade
RUN apk add nodejs supervisor telegraf
RUN mkdir /var/www
COPY ./srcs/supervisord.conf /etc
COPY ./srcs/telegraf.conf /etc
RUN mkdir /node-server
COPY ./srcs/index.js /node-server
COPY ./srcs/index.html /node-server

CMD /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 5000