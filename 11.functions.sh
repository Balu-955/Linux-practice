#!/bin/bash

USERID=$(id -u)

VALIDATE(){
if [ $1 -ne 0 ]
then
  echo "$2 ....failure"
  exit 1

else
  echo " $2 ...success"

fi
 
}

if [ $USERID -ne 0 ]
then
  echo "please use super user to run command"
  exit 1
else
  echo " You are super user"
fi

dnf install mysql -y
VALIDATE $? "insatll mysql"


dnf install git -y
VALIDATE $? "install git"