#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +f-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d"." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
if [ $1 -ne 0 ]
then 
    echo -e " installing ...$R FAILURE $N"
else
    echo -e " installing...$G success $N"
fi
}

if [ $USERID -ne 0 ]
then
    echo "please use super user to run command"
else
    echo "you are super user"
fi


for i in $@
do
    echo "packages to installed:  $i"
    dnf list installed $i &>>$LOGFILE

    if [ $? -eq 0 ]
    then
        echo -e "$i alreday installed...$G SKIPPED $N"
    else
        dnf install $i -y &>>$LOGFILE
        VALIDATE $? "Installation of $i"
    fi

done