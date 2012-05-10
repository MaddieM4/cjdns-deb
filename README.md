# WARNING TO USERS - PROJECT IS OFFICIALLY DISCONTINUED

This software was originally used to aid the difficult process of compiling and installing cjdroute. This isn't exactly a tough thing anymore, as the CJDNS community has made great strides in usability that render this package obsolete. If you want to make CJDNS packages, you _should not use this software._ You should be using [checkinstall](https://en.wikipedia.org/wiki/CheckInstall).

That said, I'm leaving the project up here (though I'm stopping the build bot) so that I can, at some later date, reuse the code in a more general packaging project, or at least use this code as inspiration. It'll mostly likely be a thin buildbot-y wrapper for a "remote pull, recompile, remake package with checkinstall, push package" workflow. Until that's done, I'm leaving this up as reference and for historical reasons - and that includes everything in the README below the line.

-----------------

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
