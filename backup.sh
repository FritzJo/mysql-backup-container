#!/bin/bash

#generates the prefix for the backup
timestamp() {
      date +"%Y-%m-%d-%T"
}

while :
do
    echo "Starting backup for $DB_HOST:$DB_NAME..."
    command="mysqldump -h $DB_HOST --port $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME | gzip -c > /backups/$(timestamp)-$DB_NAME.sql.gz"
    
    #runs the actual backup process
    eval $command
    echo "Backup complete! Sleeping for $WAIT seconds..."

    #wait until next backup
    sleep "$WAIT"s
done
