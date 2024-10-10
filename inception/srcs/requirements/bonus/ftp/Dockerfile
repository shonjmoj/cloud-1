FROM alpine:3.13

RUN apk update && apk upgrade
RUN apk add vsftpd openssl supervisor telegraf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=issamounejjar"

COPY ./srcs/setup.sh /tmp
COPY ./srcs/vsftpd.conf /etc/vsftpd
COPY ./srcs/supervisord.conf /etc
COPY ./srcs/telegraf.conf /etc

CMD sh /tmp/setup.sh && /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 21 30000