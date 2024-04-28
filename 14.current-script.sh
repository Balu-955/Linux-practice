#!/bin/bash

COURSE="Devops for current script"

echo process id for current script PID: $$
echo "Before calling current script couse: $COURSE"

#./15.other-script.sh

source ./15.other-script.sh

echo "after calling other script course: $COURSE"
