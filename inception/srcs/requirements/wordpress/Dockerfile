FROM alpine:3.13

RUN apk update && apk upgrade
RUN apk add wget unzip supervisor telegraf php-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN cd /tmp/ && wget https://wordpress.org/wordpress-5.8.8.tar.gz && tar -xzvf wordpress-5.8.8.tar.gz
RUN cd /tmp/ && wget https://downloads.wordpress.org/plugin/redis-cache.2.0.21.zip && unzip redis-cache.2.0.21.zip
COPY ./srcs/www.conf /etc/php7/php-fpm.d/
COPY ./srcs/wp-config.php /tmp/
COPY ./srcs/object-cache.php /tmp/wordpress/wp-content/
COPY ./srcs/supervisord.conf /etc
COPY ./srcs/telegraf.conf /etc

CMD if [ ! -d /var/www/wordpress ]; then cp -r /tmp/wordpress /var/www && cp /tmp/wp-config.php /var/www/wordpress && mv /tmp/redis-cache /var/www/wordpress/wp-content/plugins/ ; fi && /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 9000
