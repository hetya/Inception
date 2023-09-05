FROM debian:buster

ARG MYSQL_DATABASE_NAME
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt-get -y update;\
apt-get install -y mariadb-server && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf/my.cnf /etc/mysql/my.cnf

RUN service mysql start && echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE_NAME};\
CREATE USER IF NOT EXISTS root@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';\
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';\
GRANT ALL ON ${MYSQL_DATABASE_NAME}.* TO 'root'@'%' WITH GRANT OPTION;\
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';\
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE_NAME}.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;\
FLUSH PRIVILEGES" | mysql;

EXPOSE 3306

CMD ["mysqld_safe"]
