## What is this?

This is the behind-the-scenes place where ill-paid grunka lunkas, when not warning people about secret ingredients and armed guards, make Debian packages of [cjdns](https://github.com/cjdelisle/cjdns/). While the author of this repository generally only uses it to make i386 packages, in theory it can be used on any architecture.

## Using this thing to make your own cjdns packages

It's up to you to compile a copy of cjdroute for your architecture. When that's done, stick it in bin/$ARCH/, where you've substituted $ARCH for the relevant Debian architecture. Then run "make" at the top level of this repository, and it will create a .deb for every architecture in bin.

For example, say you've pulled the latest amd64 build off a remote buildbot (in which case, you don't even need a 64 bit machine). Copy it to bin/amd64. Run "make". Retrieve a hot, fresh .deb from the output folder.
