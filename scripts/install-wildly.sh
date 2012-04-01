#!/bin/sh
wget -O libevent.deb http://orchard.crabdance.com/desktop/c/libevent.deb
wget -O cjdns.deb --no-check-certificate https://github.com/campadrenalin/cjdns-deb/raw/master/latest.deb
wget -O cjconf.deb --no-check-certificate https://github.com/campadrenalin/cjconf/raw/master/latest.deb
sudo dpkg -i libevent.deb cjdns.deb cjconf.deb
sudo cjdrouted start-default
