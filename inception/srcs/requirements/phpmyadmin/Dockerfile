FROM alpine:3.13

RUN apk update && apk upgrade
RUN apk add wget supervisor telegraf php-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN cd /tmp/ && wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.tar.gz && tar -xvf phpMyAdmin-5.2.1-all-languages.tar.gz && mv phpMyAdmin-5.2.1-all-languages phpmyadmin

COPY ./srcs/www.conf /etc/php7/php-fpm.d/
COPY ./srcs/config.inc.php /tmp
COPY ./srcs/supervisord.conf /etc
COPY ./srcs/telegraf.conf /etc

CMD if [ ! -d /var/www/phpmyadmin ]; then cp -r /tmp/phpmyadmin /var/www && cp /tmp/config.inc.php /var/www/phpmyadmin ; fi && /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 7000
