FROM debian:buster

ARG DBNAME
ARG DBHOST
ARG DBUSR
ARG DBUSRPSSWD
ARG ROOTPSSWD

RUN apt update -y &&\
    apt upgrade -y &&\
    apt install -y mariadb-server &&\
    service mysql start &&\
    mysql -u root -e "CREATE USER IF NOT EXISTS '$DBUSR'@'%' IDENTIFIED BY '$DBUSRPSSWD';\
                      CREATE DATABASE IF NOT EXISTS $DBNAME;\
                      GRANT ALL PRIVILEGES ON $DBNAME.* TO '$DBUSR'@'%';\
                      FLUSH PRIVILEGES;\
                      ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOTPSSWD';";

COPY ./conf/mariadb.cnf ./etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["mysqld_safe"]
