if [ $EUID -ne 0 ]; then
    echo "You must run this with superuser priviliges.  Try \"sudo ./install.sh\"" 2>&1
    exit 0
fi

unamestr="$(uname -s)"
email=""
email_confirm=""
if [ "$unamestr" == 'Linux' ]; then
    echo "Start install Btop..."
    make build
    sudo mv ./bin/btop /usr/local/bin
    while [ -z $email ] || [ $email != $email_confirm ]
    do
        read -p 'Email adress of your commits : ' email
        read -p 'Confirm your email : ' email_confirm
    done
    echo $email > .btop_config
    mv .btop_config ~/
    echo "Btop is available on your computer. Try \"btop\" for start"
elif [ "$unamestr" == 'Darwin' ]; then
    echo "Start install Btop..."
    make build
    sudo mv ./bin/btop /usr/local/bin
    while [ -z $email ] || [ $email != $email_confirm ]
    do
        read -p 'Email adress of your commits : ' email
        read -p 'Confirm your email : ' email_confirm
    done
    echo $email > .btop_config
    mv .btop_config ~/
    echo "Btop is available on your computer. Try \"btop\" for start 🚀"
else
    echo "Your system is not compatible"
fi
