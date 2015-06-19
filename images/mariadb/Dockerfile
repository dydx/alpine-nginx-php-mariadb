FROM alpine:edge
MAINTAINER Josh Sandlin <josh@thenullbyte.org>

RUN apk --update add \
  mariadb \
  mariadb-client \
  supervisor

ADD my.cnf /etc/mysql/my.cnf

RUN mkdir -p /var/log/supervisor
ADD run.sh /run.sh
ADD mariadb-supervisor.ini /etc/supervisor.d/mariadb-supervisor.ini

# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 3306

ENV TERM dumb

CMD ["/usr/bin/supervisor"]