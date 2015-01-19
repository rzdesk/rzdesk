#!/bin/sh

cp -f /etc_bak/* /etc/

chmod a+rw /tmp
if [ ! -e /tmp/.xrdp/ ]; then
  mkdir /tmp/.xrdp
  chown xrdp:xrdp /tmp/.xrdp
fi


#/usr/bin/supervisord -n 

#/etc/init.d/xrdp start
RSAKEYS=/etc/xrdp/rsakeys.ini
xrdp-keygen xrdp $RSAKEYS
/usr/sbin/xrdp-sesman&

/usr/sbin/xrdp -nodaemon
