#!/bin/sh

# Meant to be called as scripts/mkpackage.sh from top level of repo.

ARCH="$1"

if [ "$ARCH" = "" ]; then
    # Produce for every arch
    if [ "`ls bin | wc -l`" != "0" ]; then
        ls bin | xargs scripts/mkpackage.sh
    else
        echo "No folders in bin."
    fi
else
    while [ "$ARCH" != "" ]; do
        # Produce for one arch
        echo "Producing arch $ARCH"
        echo "$ARCH" > scripts/arch

        # Construct the control file
        make control

        # Clear old files out, copy new ones in.
        rm debian/usr/bin/*
        cp bin/$ARCH/* debian/usr/bin

        # Build/Update package
        fakeroot dpkg-deb --build debian output
        fakeroot dpkg-deb --build debian
        mv debian.deb output/latest/cjdns-$ARCH.deb

        # Next arch in list
        shift
        ARCH="$1"
    done
fi
