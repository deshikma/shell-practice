#!/bin/bash
DATE=$(date +%F)
USERID=$(id -u)
LOGSDIR=/d/shell-practice/logs
SCRIPT_NAME:$0
LOGFILE=$LOGSDIR/$0-$DATE.log
 
R="\e[31m"
N="\e[0m"
Y="\e[33m"
if [ $USERID -ne 0 ];
then 

     echo -e "$R ERRROR:: pleaase run with the root acces$N"
     exit 1
fi 

validate() {
    if [ $1 -ne 0 ];
    then
        echo -e " Installing $2...$R Failure $N"
        exit 1
    else
        echo -e "Installing $2...$G Success $N"
    fi
    
}
for i in $@
do
    yum list insalleed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then
        echo "$i is not installed,lets install"
        yum install $i -y &>>$LOGFILE
        validate $? "$i"
    else
        echo -e "$Y  $i is installed  packages"
    
    fi
done