# MySQL Backup Container

The MySQL-Backup-Container is a simple solution for backing up MySQL databases. 
It connects to a database dumps the content in a gzip file. The backup frequency can be adjusted using the WAIT variable.

## Building the image

```bash
git clone https://github.com/FritzJo/mysql-backup-container.git
cd mysql-backup-container
docker build -t mysql-backup-container .
```

## Usage
```bash
docker run -e DB_HOST= \
           -e DB_PORT= \
           -e DB_USER= \
           -e DB_PASS= \
           -e DB_NAME= \
           -e WAIT= \
           -v "/your/backup/destination:/backups" \
           mysql-backup-container
```
### Parameters
|Parameter|Description|
|---|---|
|DB_HOST|Hostname of your target database. If you use docker, this is the name of the database container.|
|DB_PORT|Port for the database connection. The MySQL default port is 3306.|
|DB_USER|Username of your database user. This user must have the privileges to access all the ressources you want to backup.|
|DB_PASS|Password of your database user.|
|DB_NAME|Name of the target database on your database server.|
|WAIT|This parameter defines how many seconds the script waits between backups.|
