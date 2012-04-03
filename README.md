## What is this?

This is the behind-the-scenes place where ill-paid grunka lunkas, when not warning people about secret ingredients and armed guards, make Debian packages of [cjdns](https://github.com/cjdelisle/cjdns/). While the author of this repository generally only uses it to make i386 packages, in theory it can be used on any architecture.

## Using this thing to make your own cjdns packages

It's up to you to compile a copy of cjdroute for your architecture. When that's done, stick it in bin/$ARCH/, where you've substituted $ARCH for the relevant Debian architecture. Then run "make" at the top level of this repository, and it will create a .deb for every architecture in bin.

For example, say you've pulled the latest amd64 build off a remote buildbot (in which case, you don't even need a 64 bit machine). Copy it to bin/amd64. Run "make". Retrieve a hot, fresh .deb from the output folder.

## Rebuild.sh

We do, however, have a "rebuild" script that operates under the assumption that the cjdns-deb and cjdns repos are siblings in the same
parent folder. If that is the case, then you can go into the cjdns-deb folder and run "make rebuild". This uses git pull and git push with
no arguments, so that it will pull and push from the sources you configure. This command pulls the latest changes to cjdns, compiles it,
moves it into the appropriate folder in cjdns-deb, rebuilds the package, and runs git push in cjdns-deb to push the changes to git.

Take care, of course, that rebuild.sh (which is called by make) does not autodetect your architecture. If your system is not i386 or
otherwise in the x86 series, you should modify scripts/rebuild.sh to copy to the correct folder. That's the only change you have to make.
