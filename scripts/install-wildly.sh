#!/bin/sh

# Determine architecture
ARCH="`uname -m`"
echo $ARCH | grep "^i.86$"
if [ $? -eq "0" ]; then
    ARCH=i386
fi

# TODO: multiple builds of libevent
wget -O libevent.deb http://orchard.crabdance.com/desktop/c/libevent.deb
wget -O cjdns.deb --no-check-certificate https://github.com/campadrenalin/cjdns-deb/raw/master/latest/cjdns-$ARCH.deb
wget -O cjconf.deb --no-check-certificate https://github.com/campadrenalin/cjconf/raw/master/latest/cjconf.deb
sudo dpkg -i libevent.deb cjdns.deb cjconf.deb
sudo cjdrouted start-default
