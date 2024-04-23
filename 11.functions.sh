#!/bin/bash

USERID=$(id -U)

VALIDATE(){

  echo " Exit status: $1"
  echo "Exit ststus: $2"  
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