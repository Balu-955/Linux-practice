USERID=$(ID -U)

VALIDATE(){

  echo " Exit status: $1"
  echo "Exit ststus: $2"  
}

if [ $USERID -ne 0]
then
    echo "please use super user to run command"
else
    echo " You are super user"
fi

dnf install mysql -y


dnf install git -y