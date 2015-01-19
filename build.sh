#!/bin/sh

if [ ! -e "etc" ] ; then
    mkdir etc
fi
rm -f etc/*

if [ ! -e "doc" ] ; then
    mkdir doc
fi

docker build  -t rzrdp .
#docker build --rm -t rzrdp .
