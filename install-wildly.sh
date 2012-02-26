#!/bin/sh
wget http://orchard.crabdance.com/desktop/c/libevent.deb
wget https://github.com/campadrenalin/cjdns-deb/raw/master/cjdns.deb
sudo dpkg -i {libevent,cjdns}.deb
sudo cjdrouted start-default
