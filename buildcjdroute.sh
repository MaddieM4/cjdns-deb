#!/bin/sh

cd cjdns/build
export Log_LEVEL=DEBUG
rm CMakeCache.txt
cmake .. && make && make test
