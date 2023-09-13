#!/bin/bash

USERID=$(id -u)

if [ "$USERID" -ne 0 ];
then 
    echo "ERROR:: Please run this script with with root access"
    exit 1
fi
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"


 
for i in '$@'
do
   yum install $i -y
done

INSTALL(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2...$R FAILURE $N"
        exit 1
    else
        echo -e "$2....$G SUCCESS $N"
    fi
}   

if [ '$1' -ne 0 ]
then
   echo -e "Command not found! Install? (y/n) \c"
   read 
   if "$REPLY" '=' "Y";
   then
       sudo apt=get install command
    fi

fi

yum install mysql -y &>>$LOGFILE
INSTALL $? "installing mysql"

yum install postfix -y &>>$LOGFILE
INSTALL $? "installing postfix"

