FROM alpine:edge
MAINTAINER Josh Sandlin <josh@thenullbyte.org>

RUN apk --update add \
  mariadb \
  mariadb-client

# This.. sets up the users and whatnot?
ADD mariadb_init.sh /mariadb_init.sh
ADD run.sh /run.sh
RUN chmod 775 *.sh

ADD my.cnf /etc/mysql/my.cnf

# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

ENV TERM dumb

CMD ["sh", "run.sh"]

EXPOSE 3306