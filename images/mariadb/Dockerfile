FROM alpine:edge
MAINTAINER Josh Sandlin <josh@thenullbyte.org>

RUN apk --update add \
  mariadb \
  mariadb-client \
  supervisor

# this bash script controls initial setup of
# mariadb, including creating our 'homestead'
# user and database creation
ADD run.sh /run.sh
ADD mariadb_init.sh /mariadb_init.sh
RUN chmod 775 /*.sh

# superuser references run.sh as its start command
RUN mkdir -p /var/log/supervisor
ADD mariadb-supervisor.ini /etc/supervisor.d/mariadb-supervisor.ini

# this binds our IP address and sets up our socket
ADD my.cnf /etc/mysql/my.cnf

# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 3306

ENV TERM dumb

CMD ["/run.sh"]