#!/bin/sh

wget -O cjdns.deb --no-check-certificate https://github.com/campadrenalin/cjdns-deb/raw/master/output/latest/cjdns-i386.deb
wget -O cjconf.deb --no-check-certificate https://github.com/campadrenalin/cjconf/raw/master/output/latest/cjconf.deb
sudo dpkg -i cjdns.deb cjconf.deb
