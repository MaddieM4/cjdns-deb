#!/bin/sh

# Update the CJDNS package after rebuilding the binary

# Assumes you are calling this from the root of your copy of the cjdns-deb repo as "scripts/rebuild.sh", and that
# the cjdns repo is a sibling to the cjdns-deb folder.

cd ../cjdns/build
git pull
export Log_LEVEL=debug
cmake ..
make
make test

REVISION="`git log cjdns-0.3..master --oneline | wc -l`"

cd ../../cjdns-deb
echo $REVISION > scripts/release
cp ../cjdns/build/cjdroute bin/i386
make
git add -A .
git commit -m "Semi-automatic build: 0.3-$REVISION"
git push
