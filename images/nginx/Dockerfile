FROM alpine:edge
MAINTAINER Josh Sandlin <josh@thenullbyte.org>

RUN apk --update add \
  nginx \
  php-fpm \
  php-pdo \
  php-json \
  php-openssl \
  php-mysql \
  php-mcrypt \
  php-sqlite3 \
  supervisor

RUN mkdir -p /etc/nginx
RUN mkdir -p /var/run/php-fpm
RUN mkdir -p /var/log/supervisor

RUN echo "extension=pdo_sqlite.so"

RUN rm /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/nginx.conf

VOLUME ["/var/www", "/etc/nginx/sites-enabled"]

ADD nginx-supervisor.ini /etc/supervisor.d/nginx-supervisor.ini

EXPOSE 80 9000

CMD ["/usr/bin/supervisord"]