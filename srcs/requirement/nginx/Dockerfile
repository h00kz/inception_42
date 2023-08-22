FROM debian:buster

COPY ./conf/42website /etc/nginx/sites-available/42website

RUN apt update -y &&\
    apt upgrade -y &&\
    apt install -y nginx openssl &&\
    ln -s /etc/nginx/sites-available/42website /etc/nginx/sites-enabled/42website &&\
    openssl req -x509 -newkey rsa:2048 -nodes -subj /C=FR -keyout /etc/ssl/jlarrieu.42.fr.key -out /etc/ssl/jlarrieu.42.fr.crt ;

ENTRYPOINT ["nginx", "-g", "daemon off;"]
