#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please use super user to run command"
    exit 1 #manually exit if error comes
else
    echo "you are super user"
fi

dnf install mysql -y
if [ $? -ne 0 ]
then
    echo "Installation of mysql...Failure"
    exit 1
else
    echo "installation of mysql is ...success"
fi

dnf install git -y
if [ $? -ne 0 ]
then
    echo " Git insatallation is... failure"
    exit 1
else
    echo " git installation is ...success"
fi

    echo "script is proceeding ?"


