#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%f-%H-%M-%S)
SCRIPTNAME=$(echo  $0 | cut -d"." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
if [ $1 -ne 0 ]
then
  echo "$2 ....$R failure $N"
  exit 1

else
  echo " $2 ...$G success $N"

fi
 
}

if [ $USERID -ne 0 ]
then
  echo "please use super user to run command"
  exit 1
else
  echo " You are super user"
fi

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "insatll mysql"


dnf install git -y &>>$LOGFILE
VALIDATE $? "install git"

dnf install docerr -y &0>>$LOGFILE
VALIDATE $? "INSTALL DOCKERR"
