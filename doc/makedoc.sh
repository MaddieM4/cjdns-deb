#!/bin/sh

for f in *.txt
do
	ROOT="${f%.*}"
	echo "Creating man page for $ROOT..."
	a2x -f manpage $f
	echo "Moving and compressing $ROOT.1..."
	gzip -c $ROOT.1 > ../debian/usr/share/man/man1/$ROOT.1.gz
done
