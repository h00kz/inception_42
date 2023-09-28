FROM debian:buster

RUN apt update -y &&\
    apt upgrade -y &&\
    apt install --reinstall ca-certificates -y &&\
    apt install -y php php-fpm php-mysql php-mysqli mariadb-client;

COPY ./tools/wp-cli.phar /usr/local/bin/wp
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./conf/wp-config.sh /tmp/wp-config.sh

RUN mkdir -p /run/php 

ENTRYPOINT ["sh", "/tmp/wp-config.sh"]
