FROM alpine:3.13

RUN apk update && apk upgrade
RUN apk add nginx openssl supervisor telegraf
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=issamounejjar"
COPY srcs/nginx.conf /etc/nginx/
COPY ./srcs/supervisord.conf /etc
COPY ./srcs/telegraf.conf /etc
RUN rm -rf /etc/nginx/http.d/default.conf
RUN mkdir /run/nginx

CMD /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 443