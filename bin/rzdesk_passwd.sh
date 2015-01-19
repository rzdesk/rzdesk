#!/bin/sh

if [ $# -ne 1 ]; then
    echo "usage : $0 userid "
    exit 1
fi


cp -f /etc_bak/* /etc/

passwd  $1

cp -f /etc/passwd /etc_bak/
cp -f /etc/shadow /etc_bak/
cp -f /etc/shadow- /etc_bak/
cp -f /etc/group /etc_bak/

echo "please input rzdesk passwd"
#
sudo -u $1 vncpasswd /home/$1/.vnc/passwd
sudo -u $1 cp -f /home/$1/.vnc/passwd /home/$1/.vnc/sesman_$1_passwd
