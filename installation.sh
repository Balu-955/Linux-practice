#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please use super user to run command"
    exit 1 #manually exit if error comes
else
    echo "you are super user"
 fi