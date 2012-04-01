#!/bin/sh

wget -O cjdns.deb --no-check-certificate https://github.com/campadrenalin/cjdns-deb/raw/master/cjdns.deb
sudo dpkg -i cjdns.deb
