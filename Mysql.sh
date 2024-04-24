USERID=$(id -u)
TIMESTAMP=$(date +%f-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


VALIDATE(){

if [ $1 -ne 0 ]
then
    echo -e " installing my sql...$R FAILURE $N"
    exit 1
else    
    echo " installing my sql...$R SUCCESS $N"

fi

}





if [ $USERID -ne 0 ]
then
    echo " please super user to run this command"
else
    echo " you are super user"
fi


dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "installing Mysql server"



systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "enable mysql"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "start mysql"