FROM debian:buster

ARG DOMAIN_NAME
ARG MYSQL_DATABASE_NAME
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt-get -y update;\
apt-get install -y curl && \
apt-get install -y php7.3 php-fpm php-mysql && \
apt-get install -y mariadb-client && \
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp && \
mkdir -p /run/php/ && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/html

EXPOSE 9000

COPY conf/entrypoint.sh /
RUN chmod 777 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
