FROM alpine:3.13

RUN apk update && apk upgrade
RUN apk add wget supervisor telegraf php-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN mkdir /var/www
RUN cd /tmp && wget http://www.adminer.org/latest.php -O index.php
COPY ./srcs/www.conf /etc/php7/php-fpm.d/
COPY ./srcs/supervisord.conf /etc
COPY ./srcs/telegraf.conf /etc

CMD if [ ! -d /var/www/adminer ]; then mkdir /var/www/adminer && mv /tmp/index.php /var/www/adminer; fi && /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 8080