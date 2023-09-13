#!/bin/bash
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

INSTALL(){
    # $1---> it will recive the argument1
    # $2 ---> it will recive the argument2
    if [ $? -ne 0 ]
    then
        echo "$2 installation faliure..."
        exit 1
    else
        echo " $2 installation success....."
    fi
}
USERID=$(id -u)

#this function should validate the previous command and inform the user it is success or not 


if [ "$USERID" -ne 0 ]
then 
    echo "ERROR:: Please run this script with with root access"
    exit 1
fi
 
yum install mysql -y &>>$LOGFILE
INSTALL $? "installing mysql"

yum install postfix -y &>>$LOGFILE
INSTALL $? "installing postfix"
