#!/bin/sh

# Increment release number
RELEASE="`cat release`"
RELEASE=$(( $RELEASE + 1 ))
echo $RELEASE > release

VERSION="0.3-$RELEASE"
sed "s/VERSION/Version: $VERSION/" < control_template > debian/DEBIAN/control

# Update package
cp cjdns/build/cjdroute debian/usr/bin
fakeroot dpkg-deb --build debian
