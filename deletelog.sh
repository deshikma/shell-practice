#!/bin/bash

APP_LOGS_DIR=/d/shell-practice/logs
SCRIPT_NAME=$0
LOGDIR=/d/shell-practice/delete_restore
Date=$(date +%F)
LOGFILE=$LOGDIR/$0-$Date.Log

Files_to_Delete=$(find $APP_LOGS_DIR -name "*.log" -o -name "*.java" -type f -mtime +14)  #to delete multiple type of extensions

echo "$Files_to_Delete"

while read line 

do
    #we write our statements here
    echo "Deleting $line" &>> $LOGFILE
    rm -rf $line

done <<< $Files_to_Delete   #while giving text input we need to give like this three <<< symbols.
