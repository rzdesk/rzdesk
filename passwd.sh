#!/bin/sh

if [ ! $# -ge 1 ]; then
    echo "usage : $0 userid"
    exit 1
fi

if [ ! -e $PWD/doc -o ! -e $PWD/etc   ] ; then
    echo "no doc folder"
    exit 1
fi

#docker run -i -t -p 13389:3389 -v $PWD/doc:/home/clouddrd/ rzrdp:latest /bin/bash
docker run --rm -i -t  -p 13389:3389 \
  -v $PWD/doc:/home/$1/\
  -v $PWD/etc/:/etc_bak\
 rzrdp:latest /usr/bin/rzdesk_passwd $1

