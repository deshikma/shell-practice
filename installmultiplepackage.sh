#!/bin/bash

DATE=$(DATE +%F)
USERID=$(id -u)
SCRIPT_NAME=$0
LOGDIR=/d/shell-practice/logs
LOGFILE=$LOGDIR/$0-$DATE.LOG
R="\e[31m"
N="\e[0m"
Y="\e[33m"
G="\e[32m"

#this experssion will check weather the user having sudo acees or not
if [ $USERID -ne 0 ]
then
    echo -e "$R Error:: please run this script with sudo acees $G"
    exit 1

fi

#function to validate weather the package is installed success or failure

validate(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$R installing package failure$2" 
        exit1
    else
        echo -e "$G installing package failure$2"
    fi
}

#this will check weather the package is installed or not

for i in "$@"
do
    yum list $i installed &>>$LOGFILE
    if [ $i -ne 0 ]
    then
        echo "$R the $i package not installed"
        yum install $i package 

    else
        echo "$G the $i package installed"
    fi

done


    


