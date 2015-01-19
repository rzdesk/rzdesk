#!/bin/sh

if [ $# -ne 1 ]; then
    echo "usage : $0 userid "
    exit 1
fi
#echo $*
HAS_USER=`grep $1 /etc/passwd | wc -l`

if [ $HAS_USER -eq 1 ] ; then
    echo "already exists"
    exit 1
fi

cp -f /etc_bak/* /etc/


adduser $1
#passwd $1
#echo '$1:$2' | chpasswd
cp -f /etc/passwd /etc_bak/
cp -f /etc/shadow /etc_bak/
cp -f /etc/shadow- /etc_bak/
cp -f /etc/group /etc_bak/

chown -R $1:$1 /etc_bak/*

echo "please input rzdesk passwd"
#MYHOME=/home/$1
#sudo -u clouddrd id
#sudo  -u clouddrd -s -- sh -c  'HOME=$MYHOME; vncserver :1'
#sudo  -u clouddrd --   'HOME=/home/$1; vncserver  -kill :1'
#
mkdir /home/$1/.vnc/
chown -R $1:$1 /home/$1
sudo -u $1 vncpasswd /home/$1/.vnc/passwd
sudo -u $1 cp /home/$1/.vnc/passwd /home/$1/.vnc/sesman_$1_passwd
