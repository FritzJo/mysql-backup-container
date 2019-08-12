FROM alpine 

RUN apk add --update mariadb-client
RUN mkdir /backups

COPY backup.sh /app/backup.sh
WORKDIR /app

CMD [ "sh", "./backup.sh" ]

