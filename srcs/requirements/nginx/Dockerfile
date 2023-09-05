FROM debian:buster

RUN apt-get -y update;\
apt-get install -y nginx && \
apt-get install -y openssl && \
mkdir -p /etc/ssl/key/private && mkdir -p /etc/ssl/cert/ && \
openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/key/private/private.key -out /etc/ssl/cert/certificate.crt -days 365 -nodes -subj "/C=FR" && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf/wordpress /etc/nginx/sites-available/default

RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

EXPOSE 443

WORKDIR /var/www/html

CMD ["nginx", "-g", "daemon off;"]
