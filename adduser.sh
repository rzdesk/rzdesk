#!/bin/sh

if [ $# -ne 1 ]; then
    echo "usage : $0 userid "
    exit 1
fi
#echo $*

if [ ! -e $PWD/doc ]; then
   mkdir doc
fi

if [ ! -e $PWD/etc ]; then
   mkdir etc
fi


docker run --rm -i -t \
-v $PWD/doc:/home/$1/ \
-v $PWD/etc/:/etc_bak/ \
 rzrdp:latest /usr/bin/rzdesk_adduser $1


