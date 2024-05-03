#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
TRESHOLD_VALUE=10
MESSAGE=""

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print$NF}')
    if [ $USAGE -ge $TRESHOLD_VALUE ]
    then
        MESSAGE+="$FOLDER is more than $TRESHOLD_VALUE current usage is $USAGE \n"
    fi
done <<< $DISK_USAGE
    echo -e "message:$MESSAGE"

     echo "$MESSAGE" | mail -s "Disk usage Alert" allakasivakumar.devops@gmail.com

     # echo "body" | mail -s "Subject" to address mail