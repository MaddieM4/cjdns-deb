#!/bin/sh

# Increment release number
RELEASE="`cat release`"
RELEASE=$(( $RELEASE + 1 ))
echo $RELEASE > release

# Update package
cp /home/rfx/cjd/cjdns/build/cjdroute /home/rfx/cjd/debian/usr/bin
fakeroot dpkg-deb --build debian

# Copy package to public folder
sudo cp debian.deb ../cjbuntu/cjdns.deb
