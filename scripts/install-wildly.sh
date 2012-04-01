#!/bin/sh
wget -O libevent.deb http://orchard.crabdance.com/desktop/c/libevent.deb
wget -O cjdns.deb --no-check-certificate https://github.com/campadrenalin/cjdns-deb/raw/master/cjdns.deb
sudo dpkg -i libevent.deb cjdns.deb
sudo cjdrouted start-default
