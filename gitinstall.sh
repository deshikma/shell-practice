#!/bin/bash
# check root user or not
#if not root user exit the program and inform user to run with sudo access
#if foor user install mysql 
 

# $? -->it will store the previous command status
# $?--> 0 then previous command is success
# $?--> 1-127 not 0 previous command is failure 
USERID=$(id -u)

if [ "$USERID" -ne 0 ]

then 
    echo "ERROR :: Please run this script with access"
    
fi


yum install mysql -y

if [ $? -ne 0 ]
then
   echo "Installaion of mysql is error"
   exit 1
else
    echo "installation of mysql is success"
fi



