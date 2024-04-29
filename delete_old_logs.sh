#!/bin/bash

SOURCE_DIRECTORY=/tmp/old_logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"



if [ -d $SOURCE_DIRECTORY ]

then
    echo -e "$G Source directory exist $N"
else
    echo -e " $R please make sure to create SOURCE_DIRECTORY $N"
    ext 1
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +5  )

while IFS= read -r line
do 
    echo "deleting old logs:$line"
        rm -rf $line
done <<< $FILES 