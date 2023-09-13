#!/bin/bash
#first check weather the user having root acces if not run this script with rooot access
#install multiple packages
#check the packages or installed or not


Date=$(date +%F)
LOGDIR=/d/shell-practice/logs
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$0-$Date.log
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]
then
 
     echo -e "$R error:: run this script with root acces $N"
     exit 1
fi

validate(){
if [  $1 -ne 0 ]
then
    echo -e "$R Installing package Failure$2"
    exit 1
else
    echo -e "$G installing package success$2"
    fi
}

for i in $@
do 
    yum list installed $i &>>$LOGFILE
    if [ $i -ne 0 ]
    then
        echo  -e  " $R the $i package not installed let's install package"
        yum install $i -y &>>$LOGFILE
    else
        echo "$Y the $i package installed"

    fi
done